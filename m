Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pnzn2-00022Y-PN
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 21:40:29 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pnzly-0002kx-If from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 12:39:22 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 12:39:21 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Feb 2011 13:39:21 -0700
Message-ID: <4D559E72.4000601@mentor.com>
Date: Fri, 11 Feb 2011 13:39:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297450895-15614-1-git-send-email-coolaj86@gmail.com>
In-Reply-To: <1297450895-15614-1-git-send-email-coolaj86@gmail.com>
X-OriginalArrivalTime: 11 Feb 2011 20:39:21.0455 (UTC)
	FILETIME=[C3060FF0:01CBCA2B]
Subject: Re: [PATCH v5] nodejs: updated to 0.2.6
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
X-List-Received-Date: Fri, 11 Feb 2011 20:40:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2011 12:01 PM, AJ ONeal wrote:
> * added version number to patches
> * libev-cross-cc_0.2.6.patch - turns off execution so that cross-compile succeeds
> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86, x86_64, arm, and mips
>
> Signed-off-by: AJ ONeal<coolaj86@gmail.com>

Applied, thanks for re-working it as needed!

> ---
>   recipes/nodejs/files/libev-cross-cc.patch       |   18 ------------
>   recipes/nodejs/files/libev-cross-cc_0.2.6.patch |   13 +++++++++
>   recipes/nodejs/files/node-cross-cc.patch        |   14 ---------
>   recipes/nodejs/files/node-cross-cc_0.2.6.patch  |   19 +++++++++++++
>   recipes/nodejs/nodejs_0.2.1.bb                  |   34 -----------------------
>   recipes/nodejs/nodejs_0.2.6.bb                  |   32 +++++++++++++++++++++
>   6 files changed, 64 insertions(+), 66 deletions(-)
>   delete mode 100644 recipes/nodejs/files/libev-cross-cc.patch
>   create mode 100644 recipes/nodejs/files/libev-cross-cc_0.2.6.patch
>   delete mode 100644 recipes/nodejs/files/node-cross-cc.patch
>   create mode 100644 recipes/nodejs/files/node-cross-cc_0.2.6.patch
>   delete mode 100644 recipes/nodejs/nodejs_0.2.1.bb
>   create mode 100644 recipes/nodejs/nodejs_0.2.6.bb
>
> diff --git a/recipes/nodejs/files/libev-cross-cc.patch b/recipes/nodejs/files/libev-cross-cc.patch
> deleted file mode 100644
> index 4dd34f4..0000000
> --- a/recipes/nodejs/files/libev-cross-cc.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -diff --git node-v0.2.1/deps/libev/wscript.orig node-v0.2.1/deps/libev/wscript
> -index 19e7bb2..f0a3d3b 100644
> ---- node-v0.2.1/deps/libev/wscript.orig
> -+++ node-v0.2.1/deps/libev/wscript
> -@@ -52,7 +52,12 @@ def configure(conf):
> -           return 0;
> -       }
> -   """
> --  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
> -+  # TODO determine this dynamically
> -+  CROSS = True
> -+  execute = True
> -+  if CROSS:
> -+    execute = False
> -+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=execute,
> -                 msg="Checking for SYS_clock_gettime")
> -
> -   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/recipes/nodejs/files/libev-cross-cc_0.2.6.patch b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
> new file mode 100644
> index 0000000..13ce4d8
> --- /dev/null
> +++ b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
> @@ -0,0 +1,13 @@
> +diff --git node-v0.2.6/deps/libev/wscript.orig node-v0.2.6/deps/libev/wscript
> +index 19e7bb2..5ec9143 100644
> +--- node-v0.2.6/deps/libev/wscript.orig
> ++++ node-v0.2.6/deps/libev/wscript
> +@@ -52,7 +52,7 @@ def configure(conf):
> +           return 0;
> +       }
> +   """
> +-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
> ++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
> +                 msg="Checking for SYS_clock_gettime")
> +
> +   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/recipes/nodejs/files/node-cross-cc.patch b/recipes/nodejs/files/node-cross-cc.patch
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
> diff --git a/recipes/nodejs/files/node-cross-cc_0.2.6.patch b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
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
> ++    raise Exception(bld.env['DEST_CPU'], "is not one of these supported architectures: x86, x86_64, arm, mips")
> +
> +   if variant == "default":
> +     mode = "release"
> diff --git a/recipes/nodejs/nodejs_0.2.1.bb b/recipes/nodejs/nodejs_0.2.1.bb
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
> -SRC_URI[sha256sum] = "5bb7d084b2138ce43fcb34739ed894379c450a1dd569a1c710405bc39d2861c2"
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
> diff --git a/recipes/nodejs/nodejs_0.2.6.bb b/recipes/nodejs/nodejs_0.2.6.bb
> new file mode 100644
> index 0000000..76ad993
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
> +  file://libev-cross-cc_${PV}.patch \
> +  file://node-cross-cc_${PV}.patch \
> +"
> +SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
> +SRC_URI[sha256sum] = "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
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


-- 
Tom Rini
Mentor Graphics Corporation


