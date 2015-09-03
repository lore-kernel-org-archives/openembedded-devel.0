Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6663377002
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 09:30:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZXQqF-0002FN-6b for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2015 11:29:59 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:29:58 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:29:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 3 Sep 2015 11:29:44 +0200
Message-ID: <ms93u8$45f$1@ger.gmane.org>
References: <1441192259-20483-1-git-send-email-ml@communistcode.co.uk>
	<20150902132330.GC2470@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
X-Enigmail-Draft-Status: N1110
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
In-Reply-To: <20150902132330.GC2470@jama>
Subject: Re: [PATCH] libjpeg-turbo: fix libturbojpeg packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Sep 2015 09:30:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-09-15 om 15:23 schreef Martin Jansa:
> On Wed, Sep 02, 2015 at 12:10:59PM +0100, ml@communistcode.co.uk wrote:
>> From: Jack Mitchell <jack@embed.me.uk>
>> 
>> put libjpegturbo library files and headers into correct packages
>> rather than them being in the main libjpeg-turbo package.
>> 
>> remove INSANE_SKIP[dev-so] move .so, .a into -dev package move .la into
>> -staticdev move .so.* into main library package
>> 
>> Signed-off-by: Jack Mitchell <jack@embed.me.uk> --- 
>> meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb | 7 ++++--- 1 file
>> changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
>> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb index
>> 8e214c9..16f62c5 100644 ---
>> a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb +++
>> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb @@ -25,13 +25,14
>> @@ inherit autotools pkgconfig
>> 
>> EXTRA_OECONF = "--with-jpeg8 "
>> 
>> -PACKAGES =+ "jpeg-tools libturbojpeg" +PACKAGES =+ "jpeg-tools
>> libturbojpeg libturbojpeg-staticdev libturbojpeg-dev"
>> 
>> DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client
>> programs to access libjpeg functionality.  These tools allow for the
>> compression, decompression, transformation and display of JPEG files
>> and benchmarking of the libjpeg library." FILES_jpeg-tools =
>> "${bindir}/*"
>> 
>> -FILES_libturbojpeg = "${libdir}/libturbojpeg.so" 
>> -INSANE_SKIP_libturbojpeg = "dev-so" +FILES_libturbojpeg =
>> "${libdir}/libturbojpeg.so.*"
> 
> You can use libturbojpeg*${SOLIBS}
> 
>> +FILES_libturbojpeg-staticdev = "${libdir}/libturbojpeg.a" 
>> +FILES_libturbojpeg-dev = "${libdir}/libturbojpeg.la
>> ${incdir}/turbojpeg.h ${libdir}/libturbojpeg.so"
> 
> libturbojpeg.so -> lib*${SOLIBSDEV} and we should use only one 
> -dev/-staticdev package for recipe (people who need to install 
> -dev/-staticdef package to rootfs usually don't mind getting few more 
> files installed as well).

The "one -dev package to rule them all" lead to the "why does my rootfs
suddenly have systemd?!?!" earlier on. I advocate doing the proper splitting
like Jack does above, but with a small change: RDEPENDS_${PN}-dev +=
libturbojpeg-dev.
I admit that I don't have a strong opinion on the split in this specific
case, though.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFV6BMIMkyGM64RGpERAlZ3AJ9VqAy7Y+dNKcouMHPdUoh/9YqjbgCfVhAz
3vd4pqQozNXCBvm7ULIyMcI=
=UfL0
-----END PGP SIGNATURE-----


