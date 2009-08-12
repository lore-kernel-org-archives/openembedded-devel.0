Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MbDWc-0008TW-Q2
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 15:05:55 +0200
Received: by qyk35 with SMTP id 35so3865320qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=NBOyXAzNkTu9uTdJQEK1yxpjtMLOEBGKMbSCefOUmQw=;
	b=YRKZWK/deiKPP60MvjOa284rhu+cyX9WCgvanh+CTMPB3J6EcGC3mASzccdVExE7Bt
	myjbTvljmc6g6nca52SfhZNYKxUHWZECtAKvNeRCQBFRDsd6AWiTGbDWTvP3DCZ7p7YZ
	Mzq9/uNidXL3vmNVNzTFLTnI7p5mzB2M0J6wc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=e50mieJYxOYJrU+Yzfu6rRZPo4fjomtG4cAnHfyUzG/XOldZqesoBPZ2sJrCwnszcv
	O46rgFOYF/ag5zT/QalUJ+g/w8krW9E/w9YZLbTn+2ABRoA6oa+KPJuQXcpjQge5p2AQ
	7Kp+/H1V6h+6MG1RL/J8FNHOU/Qel6Ad7T4SM=
MIME-Version: 1.0
Received: by 10.229.15.75 with SMTP id j11mr19817qca.69.1250081368271; Wed, 12 
	Aug 2009 05:49:28 -0700 (PDT)
Date: Wed, 12 Aug 2009 14:49:28 +0200
Message-ID: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Wed, 12 Aug 2009 13:05:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to build 'gstreamer-ti' for the dm6446-evm machine, using
the org.openembedded.dev branch (pulled yesterday). The build fails
with having undefined references to cairo_*. I tried building 'cairo'
and then 'gstreamer-ti' once more, but it did not help. However,
'bitbake gstreamer' works, so it puzzles me that the build fails
during gst-plugins-good_0.10.15..bb, which seems, AFAIK, unrelated to
the TI specific gstreamer plugin. Below is my build log:

bjornfor@bjornfor-desktop:~/dev/oe-stuff/build$ time bitbake gstreamer-ti
[...snip...]
NOTE: Running task 1323 of 1911 (ID: 271,
/home/bjornfor/dev/oe-stuff/openembedded/recipes/gstreamer/gst-plugins-good=
_0.10.15.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/bjornfor/dev/oe-stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/=
gst-plugins-good-0.10.15-r3/temp/log.do_compile.12696)
[...snip...]
| Making all in jpeg
| Making all in libpng
| Making all in tests
| Making all in icles
|   LINK  gdkpixbufsink-test
| /home/bjornfor/dev/oe-stuff/build/tmp/staging/armv5te-angstrom-linux-gnue=
abi/usr/lib/libgdk-x11-2.0.so:
undefined reference to `cairo_xlib_surface_create_for_bitmap'
| /home/bjornfor/dev/oe-stuff/build/tmp/staging/armv5te-angstrom-linux-gnue=
abi/usr/lib/libgdk-x11-2.0.so:
undefined reference to `cairo_xlib_surface_set_size'
| /home/bjornfor/dev/oe-stuff/build/tmp/staging/armv5te-angstrom-linux-gnue=
abi/usr/lib/libpangocairo-1.0.so:
undefined reference to `cairo_show_text_glyphs'
| /home/bjornfor/dev/oe-stuff/build/tmp/staging/armv5te-angstrom-linux-gnue=
abi/usr/lib/libgdk-x11-2.0.so:
undefined reference to `cairo_xlib_surface_create'
| /home/bjornfor/dev/oe-stuff/build/tmp/staging/armv5te-angstrom-linux-gnue=
abi/usr/lib/libpangocairo-1.0.so:
undefined reference to `cairo_surface_has_show_text_glyphs'
| collect2: ld returned 1 exit status
| make[3]: *** [gdkpixbufsink-test] Error 1
| make[2]: *** [all-recursive] Error 1
| make[1]: *** [all-recursive] Error 1
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/bjornfor/dev/oe-stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/g=
st-plugins-good-0.10.15-r3/temp/log.do_compile.12696
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/bjornfor/dev/oe-stuff/openembedded/recipes/gstreamer/gst-plugins-good=
_0.10.15.bb
do_compile failed
ERROR: Task 271
(/home/bjornfor/dev/oe-stuff/openembedded/recipes/gstreamer/gst-plugins-goo=
d_0.10.15.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1322 tasks of which 1322 didn't need to
be rerun and 1 failed.
ERROR: '/home/bjornfor/dev/oe-stuff/openembedded/recipes/gstreamer/gst-plug=
ins-good_0.10.15.bb'
failed


Has gstreamer-ti for dm6446-evm been built successfully in OE before?
Any suggestions for a fix?

Best regards,
Bj=C3=B8rn Forsman


