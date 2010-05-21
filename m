Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFYso-0001AS-8d
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 22:31:52 +0200
Received: by iwn2 with SMTP id 2so1438430iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u3lmTqPkxMuavTRH+3nE7CNWLp20LJ/fg4FGqAn121g=;
	b=ft1uI/XG8ogsLWovJNJ9C5X1fx+yKQDi5JE7GKVGZB8V9lGMjp28YKRZq1uNmzcudD
	wSKJ05geX7rzEbnXRha5oW5pg3IZkNaK+tovGeUO+3ljEf0vS5+8G16NOrsjibHhKZjq
	I8Q/A37ABqRDzB73hgFZHHMBSV5x//pdqLJD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jFeGypvX5SrA3E6SbyHlYMzINgF8nUW5O5N7j2wo0H6MlWvC8D+VP+IsNEIpdGl7+U
	tcnY4qWpmJ4JMVnpdurIvbjSfeIUWLLDSEnyKY22HZPHgqEGcFkxrGqH9x/tJZ+fnoaz
	gkfiMayL8r2nmRAs+znGfNPIEHcJyEPsNpz90=
MIME-Version: 1.0
Received: by 10.231.168.200 with SMTP id v8mr1907158iby.33.1274473668229; Fri, 
	21 May 2010 13:27:48 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Fri, 21 May 2010 13:27:48 -0700 (PDT)
In-Reply-To: <4BF69D04.5060506@mlbassoc.com>
References: <4BF69D04.5060506@mlbassoc.com>
Date: Fri, 21 May 2010 13:27:48 -0700
Message-ID: <AANLkTik1pMbRIMYx01oR0eA4xwruqMaSI8qoggbgPHwd@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging problem
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
X-List-Received-Date: Fri, 21 May 2010 20:31:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2010 at 7:47 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Trying a clean build
> =A0MACHINE=3D"beagleboard"
> =A0DISTRO=3D"angstrom-2008.1"
> =A0org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740
>
> I get failures like this (in many packages):
> =A0/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/regex.h:138:
> error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 're_void=
'
> =A0/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/regex.h:298:
> error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'int'
> =A0/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/regex.h:307:
> error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'int'
> =A0/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/regex.h:309:
> error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 're_void=
'
> =A0/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/regex.h:310:
> error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'size_t'
>
> The problem is that the compiler include file <regex.h> is
> not the standard/default one, rather the file from tcl!
> I replaced the bogus regex.h file with the correct one and
> my build completes & runs.

its tcl dev package bug it should have installed its version into
/usr/include/tcl<ver> instead of overwriting the existing version in sysroo=
t.

I can see the problem in the recipes if you are using 8.5.8 then
try this untested patch and let me know if it helps

diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
index 220e858..dd5c810 100644
--- a/recipes/tcltk/tcl_8.5.8.bb
+++ b/recipes/tcltk/tcl_8.5.8.bb
@@ -33,7 +33,8 @@ BINCONFIG_GLOB =3D "*Config.sh"
 do_install() {
        autotools_do_install
        # Stage a few extra headers to make tk happy
-       install -m 0644 ../generic/*.h ${D}${includedir}
+       install -d ${D}${includedir}/tcl8.5/generic/
+       install -m 0644 ../generic/*.h ${D}${includedir}/tcl8.5/generic/
        install -m 0644 *.h ${D}${includedir}
        ln -sf tclsh8.5 ${D}${bindir}/tclsh
 }




>
> * Any ideas how/why this happens? =A0I'm sure it has to do with
> =A0the recent RP changes.
>
> --
> ------------------------------------------------------------
> Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the
> MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


