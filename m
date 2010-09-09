Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robewil1@gmail.com>) id 1OtqTg-0006oA-VA
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 01:24:27 +0200
Received: by qyk31 with SMTP id 31so7052485qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 16:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=zL+OnxsjyRZfbOYKMTvgInnIOKL1GdzTISu/qftvN+8=;
	b=hWMXZdyLde8Ritlrcclg5wwEESzyxlz1/TegkzTRMaf+wI0hjmEudsfQx3r7Sj7vXA
	h6jgK4izvdk9FKVA87hvHyIQkdsOtLp6EkGCcwKZDUpkcdyqSro7dz+H4x+51zZTt7tM
	KhMVcVk++EkrCwkAtUQdSGzOtmyCFdQeA+H1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dgYeRgDVv8Se1QbDms1N4CBtpU+33XgxAlDIUQfwDEA/tENYxC0BZLnE4tDnv75B3h
	AfYRnhIbCuP+ukRdB4b8rXzHIXicMN6PIJhMOXATGPe2lo0R9U/qUAEfgGvLYVqEkCbp
	MwJZTqXEPk2iYftSQIdlSoKJ+rWXcL+Zjxd2s=
MIME-Version: 1.0
Received: by 10.224.54.69 with SMTP id p5mr394064qag.123.1284074617691; Thu,
	09 Sep 2010 16:23:37 -0700 (PDT)
Received: by 10.229.18.12 with HTTP; Thu, 9 Sep 2010 16:23:37 -0700 (PDT)
Date: Thu, 9 Sep 2010 19:23:37 -0400
Message-ID: <AANLkTi=cSKF3AwffdKmZcLW=0eRji4U4Y_2cLFRYSh1S@mail.gmail.com>
From: Bill Roberts <robewil1@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: robewil1@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gettext-native build troubles
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
X-List-Received-Date: Thu, 09 Sep 2010 23:24:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,
I've been trying to make a build from the .dev branch, but I cannot seem to
get past building gettext-native (version 0.18).  It seems to be a similar
error to one from a past post, where libxml2 from the host was used, but
libz from the staging.

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg03981.html

However, it seems that the fix in that case is in the gettext recipe.  In
the log it looked like the link was trying to use my host libxml2, and the
libxml2-native package in OE, but I'm not really sure.

I'm wondering if anyone could offer some advice for how to get around or fix
this error.
Thanks,
Bill

-- a snippet from log.do_compile --

i686-linux-libtool: link: gcc -std=gnu99
-isystem/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/include
 -O2 -g -Wl,-rpath-link
-Wl,/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/lib

-Wl,-rpath
-Wl,/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/lib

-Wl,-O1
-o .libs/msgcmp msgcmp-msgcmp.o msgcmp-msgl-fsearch.o
-L/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/lib

./.libs/libgettextsrc.so
/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/work/i686-linux/gettext-native-0.18-r2/gettext-0.18/gettext-tools/gnulib-lib/.libs/libgettextlib.so

/usr/lib/libacl.so
/usr/lib/libattr.so
/usr/lib/libcroco-0.6.so
/usr/lib/libxml2.so
/usr/lib/libglib-2.0.so
/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/lib/libxml2.so

-ldl
/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/lib/libz.so

-lncurses -lc -lm -Wl,-rpath
-Wl,/home/bill/SoftwareDevel/projects/Webdt_embedded/OE_toolchain/angstrom-dev/sysroots/i686-linux/usr/lib

/usr/lib/libxml2.so: undefined reference to `gzdirect@ZLIB_1.2.2.3'
/usr/lib/libxml2.so: undefined reference to `gzopen64@ZLIB_1.2.3.3'
collect2: ld returned 1 exit status

