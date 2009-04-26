Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1LxtvR-0003kN-PT
	for openembedded-devel@openembedded.org; Sun, 26 Apr 2009 04:17:02 +0200
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id A514624066; Sun, 26 Apr 2009 12:12:06 +1000 (EST)
Date: Sun, 26 Apr 2009 11:53:00 +1000
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20090426115300.0d2df2b2.raster@rasterman.com>
In-Reply-To: <gsst4a$cvj$1@ger.gmane.org>
References: <gsst4a$cvj$1@ger.gmane.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.5.0 (GTK+ 2.14.4; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Sun, 26 Apr 2009 02:17:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Apr 2009 19:32:57 +0200 Koen Kooi <k.kooi@student.utwente.nl> said:

here's my take - koen's original change was pretty much good - it just adapted
to the naming scheme packaging the right stuff in the right place. linbker and
ld.so seem to happily cope with the naming scheme and for us it means less
"breakage" as we have very explicit namings of .so's between snapshots - on oe
and purely package managed distros this doesn't matter that much but for a lot
of people who compile AND install from source (from tarballs or svn) it will
mean much more stability as things link with what they were meant to link with
and not "whatever is there at the time".

this is meant to bring more stability during development as we break api's and
so on. a simple adapting to it with FILES_* = ... stuff works just fine and
probably is a good way to go.

> Hi,
> 
> Recently the e17 people made a change to how libtool names their 
> libraries by poking in some magic string (ver-pre-svn-00) into SONAME. 
> This has some implications for OE, namely that you get the old *and* new 
> lib in your rootfs. There was one bug that killed everything at runtime:
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=1496aea759adb716453d0fbf85795a5a6e914484
> 
> So after that cset you'd get a completely working rootfs again with e17 
> stuff.
> 
> Today a few csets have been pushed that break things horribly:
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=6898f8ca089d35109b3652d640ebb907d8115736
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=8101ad8e1229b3b9f8aa0be0fdc262b5283034d0
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=80c85e0af3865710a189ba536022d326fa996d26
> 
> Let's take a look at the generated packages:
> 
> before: libecore-evas-ver-pre-svn-00-0_0.9.9.050+svnr40247-r3.1_armv7a.ipk
> after: libecore-ver-pre-svn-00-lib-evas_0.9.9.060+svnr40247-r3.1_armv7a.ipk
> 
> So suddenly the library packages (or plugin packages, but no difference 
> in this case) have a new name, but don't set RPROVIDES or RREPLACES to 
> the old packages containing *the same files*. This means that 'opkg 
> install <foo>' or 'opkg upgrade' doesn't work anymore. It will abort 
> saying to package <foo> wants to overwrite files belonging to <bar>. 
> Depending on the way you build your images in OE, your build will break.
> 
> My position is that breaking upgrade patch unacceptable without prior 
> notice and that the above 3 csets get reverted ASAP.
> The changes in question are not intrinsically bad, and the autosplitting 
> is way better than manually poking at FILES_foo, but right now they 
> break way too much at runtime.
> 
> regards,
> 
> Koen
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



