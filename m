Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OngMe-0000Mf-VL
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 01:25:05 +0200
Received: by fxm6 with SMTP id 6so3695190fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 16:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=B72FkvvHeDKYMLs1DB/KIbNMVu5TiJ3hoc4USsfEEG8=;
	b=duhf/xAhnktr9XKE9okIsd7ViMHYm+h70muuxz1aTZ/G5yGfcRKMqR9/ItY0NCYWJi
	eNU4khsPF4ea9+fUZSo/KNMTOvWGjeu9+doXEJ4E4t95Uk6ziSl5IvRZXggMzHyMxD2a
	w1kR3j0iAcB9m7F7HWbhyYASBwObpuBlYtvBU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=HNz68GC1ylGf4DtROyTWAt5oZOrHQHeo1TVHCmkr9GUkOHuMB+jO4D86rydpLHYarc
	oJTEXRgWhdU4sykeJ00xzqNIKaptmCU5vZDFxurwLKiH4EJvmaU0nVGtI6CPrJmq0fvJ
	++y0gT4wyrdVhIcrRNXdwJTfpzfanH70KfAyg=
Received: by 10.223.126.14 with SMTP id a14mr5195115fas.44.1282605796179; Mon,
	23 Aug 2010 16:23:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Mon, 23 Aug 2010 16:22:56 -0700 (PDT)
In-Reply-To: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
References: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 17:22:56 -0600
Message-ID: <AANLkTinbVA1Cj2arRmrANWQH_VFMnhZ2x7i=LHdnNWp7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] [v2] added recipe for nodejs
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
X-List-Received-Date: Mon, 23 Aug 2010 23:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

bump

AJ ONeal

On Sat, Aug 21, 2010 at 9:28 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> ---
>  recipes/nodejs/files/libev-cross-cc.patch          |   18 ++++++++++++
>  recipes/nodejs/files/node-cross-cc.patch           |   14 ++++++++++
>  .../node-dont-include-hosts-usr-include.patch      |   22 +++++++++++++++
>  recipes/nodejs/nodejs_0.2.0.bb                     |   28
> ++++++++++++++++++++
>  4 files changed, 82 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/nodejs/files/libev-cross-cc.patch
>  create mode 100644 recipes/nodejs/files/node-cross-cc.patch
>  create mode 100644
> recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
>  create mode 100644 recipes/nodejs/nodejs_0.2.0.bb
>
> diff --git a/recipes/nodejs/files/libev-cross-cc.patch
> b/recipes/nodejs/files/libev-cross-cc.patch
> new file mode 100644
> index 0000000..446015b
> --- /dev/null
> +++ b/recipes/nodejs/files/libev-cross-cc.patch
> @@ -0,0 +1,18 @@
> +diff --git node-v0.2.0/deps/libev/wscript.orig
> node-v0.2.0/deps/libev/wscript
> +index 19e7bb2..f0a3d3b 100644
> +--- node-v0.2.0/deps/libev/wscript.orig
> ++++ node-v0.2.0/deps/libev/wscript
> +@@ -52,7 +52,12 @@ def configure(conf):
> +           return 0;
> +       }
> +   """
> +-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> execute=True,
> ++  # TODO determine this dynamically
> ++  CROSS = True
> ++  execute = True
> ++  if CROSS:
> ++    execute = False
> ++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL",
> execute=execute,
> +                 msg="Checking for SYS_clock_gettime")
> +
> +   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/recipes/nodejs/files/node-cross-cc.patch
> b/recipes/nodejs/files/node-cross-cc.patch
> new file mode 100644
> index 0000000..48a6226
> --- /dev/null
> +++ b/recipes/nodejs/files/node-cross-cc.patch
> @@ -0,0 +1,14 @@
> +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> +index df9ef53..a55d464 100644
> +--- node-v0.2.0/wscript.orig
> ++++ node-v0.2.0/wscript
> +@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
> +   arch = ""
> +   if bld.env['DEST_CPU'] == 'x86_64':
> +     arch = "arch=x64"
> ++  # XXX Better support cross-compilation
> ++  else:
> ++    arch = "arch=" + bld.env['DEST_CPU']
> +
> +   if variant == "default":
> +     mode = "release"
> diff --git a/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> new file mode 100644
> index 0000000..edbf7c4
> --- /dev/null
> +++ b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> @@ -0,0 +1,22 @@
> +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> +index 3c5ebc5..905bd58 100644
> +--- node-v0.2.0/wscript.orig
> ++++ node-v0.2.0/wscript
> +@@ -162,11 +162,12 @@ def configure(conf):
> +   if Options.options.efence:
> +     conf.check(lib='efence', libpath=['/usr/lib', '/usr/local/lib'],
> uselib_store='EFENCE')
> +
> +-  if not conf.check(lib="execinfo", includes=['/usr/include',
> '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'],
> uselib_store="EXECINFO"):
> +-    # Note on Darwin/OS X: This will fail, but will still be used as the
> +-    # execinfo stuff are part of the standard library.
> +-    if sys.platform.startswith("freebsd"):
> +-      conf.fatal("Install the libexecinfo port from
> /usr/ports/devel/libexecinfo.")
> ++  # OpenEmbedded doesn't like us checking here
> ++  #if not conf.check(lib="execinfo", includes=['/usr/include',
> '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'],
> uselib_store="EXECINFO"):
> ++  #  # Note on Darwin/OS X: This will fail, but will still be used as the
> ++  #  # execinfo stuff are part of the standard library.
> ++  #  if sys.platform.startswith("freebsd"):
> ++  #    conf.fatal("Install the libexecinfo port from
> /usr/ports/devel/libexecinfo.")
> +
> +   if not Options.options.without_ssl:
> +     if conf.check_cfg(package='openssl',
> diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/
> nodejs_0.2.0.bb
> new file mode 100644
> index 0000000..83bfa2e
> --- /dev/null
> +++ b/recipes/nodejs/nodejs_0.2.0.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE = "http://nodejs.org"
> +LICENSE = "MIT"
> +DEPENDS = "openssl"
> +SRC_URI = " \
> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> +  file://node-cross-cc.patch \
> +  file://libev-cross-cc.patch \
> +  file://node-dont-include-hosts-usr-include.patch \
> +"
> +#file://libev-arm-cross.patch \
> +SRC_URI[md5sum] = "99a6dacc44b3f9c6ec376ccb446dd0b8"
> +SRC_URI[sha256sum] =
> "3d3eff9287c9917af4044f3cef99ae5b17946710a71e83039de4fcb4b0a26631"
> +S = "${WORKDIR}/node-v${PV}"
> +do_configure () {
> +  ./configure --prefix=${D} --without-snapshot
> +}
> +do_compile () {
> +  make
> +}
> +do_install () {
> +  #oe_runmake install # doesn't install to correct location
> +
> +  # This works
> +  install -d ${D}${bindir}/
> +  install -m 0755 ${S}/node ${D}${bindir}/
> +}
> +FILES_${PN} = "${bindir}/node"
> --
> 1.6.0.4
>
>

