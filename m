Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1GFx-0003M7-PM for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:16:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1GEs-0004Jj-4P
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:15:14 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 11:15:14 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 11:15:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Oct 2009 11:14:48 +0200
Message-ID: <hbrs68$gbd$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<200910230930.00314.holger+oe@freyther.de>
	<hbrnn4$1kd$1@ger.gmane.org>	<200910231023.43911.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256286976.4529.117.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2009 09:16:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-09 10:36, Phil Blundell wrote:
> On Fri, 2009-10-23 at 10:23 +0200, Holger Hans Peter Freyther wrote:
>> One thing that pops back into my mind is to move .a files into a -static
>> package? People that want to link statically can pick their .a files.
>
> Yes, I think someone else proposed this a few weeks ago but it doesn't
> seem to have happened.  Given that static linking is pretty much a
> minority pursuit nowadays (excepting libc_noshared.a) this sounds like a
> fine idea.
>
> Stripping .a files with the default options will effectively destroy
> them so the current state of affairs is definitely silly.  If you are
> going to do that then you might as well just delete the files: they are
> no use for anything after stripping.
>
> An alternative (or an addition) to the -static packaging would be to
> arrange for .a files (and .o files, I guess) to be stripped with "strip
> --strip-debug" (or perhaps --strip-unneeded).  This should leave enough
> symbol data in the files for them to remain usable.

Something like this (but without the mailer induced linewrapping)?

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 046351a..2bf55e3 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -183,6 +183,9 @@ def runstrip(file, d):
          extraflags = "--remove-section=.comment --remove-section=.note 
--strip-unneeded"
      elif "shared" in result or "executable" in result:
          extraflags = "--remove-section=.comment --remove-section=.note"
+       elif file.endswith(".a")::
+                extraflags = "--remove-section=.comment --strip-debug"
+

      bb.mkdirhier(os.path.join(os.path.dirname(file), ".debug"))
      debugfile=os.path.join(os.path.dirname(file), ".debug", 
os.path.basename(file))
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 7426095..6c1cc06 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -207,7 +207,7 @@ SOLIBSDEV_darwin = ".dylib"
  SOLIBSDEV_darwin8 = ".dylib"
  SOLIBSDEV_darwin9 = ".dylib"

-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-static ${PN}-dev ${PN}-locale"
  #enable this when bitbake is upgraded to cope with ++ values in the field
  PACKAGES_DYNAMIC = "${PN}-locale-*"
  FILES = ""
@@ -225,9 +225,11 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} 
${datadir}/gtk-doc \
              ${datadir}/gnome/help"
  SECTION_${PN}-doc = "doc"

+FILES_${PN}-static = "${libdir}/*.a ${base_libdir}/*.a"
+
  FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} 
${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-                ${base_libdir}/*.a ${base_libdir}/*.o 
${datadir}/aclocal ${datadir}/pkgconfig"
+                ${libdir}/*.o ${libdir}/pkgconfig \
+                ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig"
  SECTION_${PN}-dev = "devel"
  ALLOW_EMPTY_${PN}-dev = "1"
  RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPV})"


regards,

Koen



