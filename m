Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PnEcU-0006xJ-SV
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 19:18:26 +0100
Received: by fxm17 with SMTP id 17so475810fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 10:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=PDcu50fXHs3CN3PG1mdWq3KT+ahQG4JsqW1bWCxQ55I=;
	b=tRv6/hNIAsSjIx1tTp0bNMK0PK8WrZQj6sN/eNxKT+PN91WeRl2slKlys2MDmBiX76
	CbL2cvVpqN3GeOKG7sPE0E1FKjSi62bPFVnCNbmxxSMW6ze0TfNuDvW6VvoP7HXys4ki
	RTTaOjI304sBnkiE1zfCgFRrtIeEYiZzt9WPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=CZJavY+AWnyoz9A5DAmUugbgQk58QOottDstjuHWiO5oRE1tyZmc0K5XabtQzeNJl2
	wDRFY19G6+ojYir+WMFdf6SWCoQYF5Qz1Fw9v89a+Px7TqRi0FdGB0ZySIrNIV2uZsln
	2FTng5R+V3bAqAgfNtmA5qkNA5iVrhz75lhhY=
Received: by 10.223.101.206 with SMTP id d14mr2277176fao.134.1297275443456;
	Wed, 09 Feb 2011 10:17:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.114.73 with HTTP; Wed, 9 Feb 2011 10:17:02 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 9 Feb 2011 11:17:02 -0700
Message-ID: <AANLkTikX=pzTPrtHcekt_R=Xd9s16yiA0=5FqNQ6TPTs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Ack or Nak? [was] [PATCH v4] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Wed, 09 Feb 2011 18:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

I didn't get an ACK or NAK on this, but it has been removed from patchwork
and I don't see it in org.openembedded.dev.

Clarification please.

AJ ONeal


On Tue, Feb 8, 2011 at 10:58 AM, AJ ONeal <coolaj86@gmail.com> wrote:

> * added version number to patches
> * libev-cross-cc_0.2.6.patch - turns off execution so that cross-compile
> succeeds
> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86,
> x86_64, arm, and mips
>
> Signed-off-by: AJ ONeal <coolaj86@gmail.com>
> ---
>  recipes/nodejs/files/libev-cross-cc.patch       |   18 ------------
>  recipes/nodejs/files/libev-cross-cc_0.2.6.patch |   13 +++++++++
>  recipes/nodejs/files/node-cross-cc.patch        |   14 ---------
>  recipes/nodejs/files/node-cross-cc_0.2.6.patch  |   19 +++++++++++++
>  recipes/nodejs/nodejs_0.2.1.bb                  |   34
> -----------------------
>  recipes/nodejs/nodejs_0.2.6.bb                  |   32
> +++++++++++++++++++++
>  6 files changed, 64 insertions(+), 66 deletions(-)
>  delete mode 100644 recipes/nodejs/files/libev-cross-cc.patch
>  create mode 100644 recipes/nodejs/files/libev-cross-cc_0.2.6.patch
>  delete mode 100644 recipes/nodejs/files/node-cross-cc.patch
>  create mode 100644 recipes/nodejs/files/node-cross-cc_0.2.6.patch
>  delete mode 100644 recipes/nodejs/nodejs_0.2.1.bb
>  create mode 100644 recipes/nodejs/nodejs_0.2.6.bb
>
> diff --git a/recipes/nodejs/files/libev-cross-cc.patch
> b/recipes/nodejs/files/libev-cross-cc.patch
> deleted file mode 100644
> index 4dd34f4..0000000
> --- a/recipes/nodejs/files/libev-cross-cc.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -diff --git node-v0.2.1/deps/libev/wscript.orig
> node-v0.2.1/deps/libev/wscript
> -index 19e7bb2..f0a3d3b 100644
> ---- node-v0.2.1/deps/libev/wscript.orig
> -+++ node-v0.2.1/deps/libev/wscript
> -@@ -52,7 +52,12 @@ def configure(conf):
> -           return 0;
> -       }
> -   """
> --  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> execute=True,
> -+  # TODO determine this dynamically
> -+  CROSS = True
> -+  execute = True
> -+  if CROSS:
> -+    execute = False
> -+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> execute=execute,
> -                 msg="Checking for SYS_clock_gettime")
> -
> -   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
> b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
> new file mode 100644
> index 0000000..13ce4d8
> --- /dev/null
> +++ b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
> @@ -0,0 +1,13 @@
> +diff --git node-v0.2.6/deps/libev/wscript.orig
> node-v0.2.6/deps/libev/wscript
> +index 19e7bb2..5ec9143 100644
> +--- node-v0.2.6/deps/libev/wscript.orig
> ++++ node-v0.2.6/deps/libev/wscript
> +@@ -52,7 +52,7 @@ def configure(conf):
> +           return 0;
> +       }
> +   """
> +-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> execute=True,
> ++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> execute=False,
> +                 msg="Checking for SYS_clock_gettime")
> +
> +   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/recipes/nodejs/files/node-cross-cc.patch
> b/recipes/nodejs/files/node-cross-cc.patch
> deleted file mode 100644
> index 0d15afc..0000000
> --- a/recipes/nodejs/files/node-cross-cc.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -diff --git node-v0.2.1/wscript.orig node-v0.2.1/wscript
> -index 9c4243c..3cf6689 100644
> ---- node-v0.2.1/wscript.orig
> -+++ node-v0.2.1/wscript
> -@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
> -   arch = ""
> -   if bld.env['DEST_CPU'] == 'x86_64':
> -     arch = "arch=x64"
> -+  # XXX Better support cross-compilation
> -+  else:
> -+    arch = "arch=" + bld.env['DEST_CPU']
> -
> -   if variant == "default":
> -     mode = "release"
> diff --git a/recipes/nodejs/files/node-cross-cc_0.2.6.patch
> b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
> new file mode 100644
> index 0000000..1087ce2
> --- /dev/null
> +++ b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
> @@ -0,0 +1,19 @@
> +diff --git node-v0.2.6/wscript.orig node-v0.2.6/wscript
> +index a6bade2..566bf5e 100644
> +--- node-v0.2.6/wscript.orig
> ++++ node-v0.2.6/wscript
> +@@ -338,6 +338,14 @@ def v8_cmd(bld, variant):
> +   arch = ""
> +   if bld.env['DEST_CPU'] == 'x86_64':
> +     arch = "arch=x64"
> ++  elif bld.env['DEST_CPU'] == 'x86':
> ++    arch = "arch=x86"
> ++  elif bld.env['DEST_CPU'] == 'arm':
> ++    arch = "arch=arm"
> ++  elif bld.env['DEST_CPU'] == 'mips':
> ++    arch = "arch=mips"
> ++  else:
> ++    raise Exception(bld.env['DEST_CPU'], "is not one of these supported
> architectures: x86, x86_64, arm, mips")
> +
> +   if variant == "default":
> +     mode = "release"
> diff --git a/recipes/nodejs/nodejs_0.2.1.bb b/recipes/nodejs/
> nodejs_0.2.1.bb
> deleted file mode 100644
> index c2e9c41..0000000
> --- a/recipes/nodejs/nodejs_0.2.1.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> -HOMEPAGE = "http://nodejs.org"
> -LICENSE = "MIT"
> -
> -PR = "r1"
> -
> -DEPENDS = "openssl"
> -
> -SRC_URI = " \
> -  http://nodejs.org/dist/node-v${PV}.tar.gz \
> -  file://libev-cross-cc.patch \
> -  file://node-cross-cc.patch \
> -"
> -SRC_URI[md5sum] = "c6051dd216817bf0f95bea80c42cf262"
> -SRC_URI[sha256sum] =
> "5bb7d084b2138ce43fcb34739ed894379c450a1dd569a1c710405bc39d2861c2"
> -
> -S = "${WORKDIR}/node-v${PV}"
> -
> -# v8 errors out if you have set CCACHE
> -CCACHE = ""
> -
> -do_configure () {
> -  ./configure --prefix=${prefix} --without-snapshot
> -}
> -
> -do_compile () {
> -  make
> -}
> -
> -do_install () {
> -  DESTDIR=${D} oe_runmake install
> -}
> -
> -BBCLASSEXTEND = "native"
> diff --git a/recipes/nodejs/nodejs_0.2.6.bb b/recipes/nodejs/
> nodejs_0.2.6.bb
> new file mode 100644
> index 0000000..560adc6
> --- /dev/null
> +++ b/recipes/nodejs/nodejs_0.2.6.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE = "http://nodejs.org"
> +LICENSE = "MIT"
> +
> +DEPENDS = "openssl"
> +
> +SRC_URI = " \
> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> +  file://libev-cross-cc-v${PV}.patch \
> +  file://node-cross-cc-v${PV}.patch \
> +"
> +SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
> +SRC_URI[sha256sum] =
> "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
> +
> +S = "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE = ""
> +
> +do_configure () {
> +  ./configure --prefix=${prefix} --without-snapshot
> +}
> +
> +do_compile () {
> +  make
> +}
> +
> +do_install () {
> +  DESTDIR=${D} oe_runmake install
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 1.7.0.4
>
>

