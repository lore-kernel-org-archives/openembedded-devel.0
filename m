Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Om0jU-00034X-MJ for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 10:44:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Om0jC-0003CD-Ef for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 10:44:02 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 10:44:02 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 10:44:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 19 Aug 2010 10:43:52 +0200
Message-ID: <i4iqs8$kpd$1@dough.gmane.org>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Thu, 19 Aug 2010 08:44:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

And the PN should be nodejs


On 19-08-10 08:07, AJ ONeal wrote:
> ---
>  recipes/node/files/libev-arm-cross.patch |   45 ++++++++++++++++++++++++++++++
>  recipes/node/files/node-arm-cross.patch  |   31 ++++++++++++++++++++
>  recipes/node/node_0.1.104.bb             |   28 ++++++++++++++++++
>  recipes/node/node_v0.1.104.bb            |   23 +++++++++++++++
>  4 files changed, 127 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/node/files/libev-arm-cross.patch
>  create mode 100644 recipes/node/files/node-arm-cross.patch
>  create mode 100644 recipes/node/node_0.1.104.bb
>  create mode 100644 recipes/node/node_v0.1.104.bb
> 
> diff --git a/recipes/node/files/libev-arm-cross.patch b/recipes/node/files/libev-arm-cross.patch
> new file mode 100644
> index 0000000..340dd98
> --- /dev/null
> +++ b/recipes/node/files/libev-arm-cross.patch
> @@ -0,0 +1,45 @@
> +diff --git node-v0.1.104/deps/libev/wscript.orig node-v0.1.104/deps/libev/wscript
> +index 19e7bb2..a62f418 100644
> +--- node-v0.1.104/deps/libev/wscript.orig
> ++++ node-v0.1.104/deps/libev/wscript
> +@@ -40,20 +40,27 @@ def configure(conf):
> +   if conf.check_cc(header_name="sys/eventfd.h"):
> +     conf.check_cc(header_name="sys/eventfd.h", function_name="eventfd")
> + 
> ++  # TODO find a way to determine this from the environment
> ++  CROSS = True
> ++  TARGET_OS = "linux"
> + 
> +-  code = """
> +-      #include <syscall.h>
> +-      #include <time.h>
> +-      #include <stdio.h>
> +-
> +-      int main() {
> +-          struct timespec ts; 
> +-          int status = syscall(SYS_clock_gettime, CLOCK_REALTIME, &ts);
> +-          return 0;
> +-      }
> +-  """
> +-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
> +-                msg="Checking for SYS_clock_gettime")
> ++  if CROSS:
> ++    if TARGET_OS == 'linux':
> ++      conf.define("HAVE_CLOCK_SYSCALL", 1)
> ++  else:
> ++    code = """
> ++        #include <syscall.h>
> ++        #include <time.h>
> ++        #include <stdio.h>
> ++
> ++        int main() {
> ++            struct timespec ts; 
> ++            int status = syscall(SYS_clock_gettime, CLOCK_REALTIME, &ts);
> ++            return 0;
> ++        }
> ++    """
> ++    conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
> ++                  msg="Checking for SYS_clock_gettime")
> + 
> +   have_librt = conf.check(lib='rt', uselib_store='RT')
> +   if have_librt:
> diff --git a/recipes/node/files/node-arm-cross.patch b/recipes/node/files/node-arm-cross.patch
> new file mode 100644
> index 0000000..8ee6c18
> --- /dev/null
> +++ b/recipes/node/files/node-arm-cross.patch
> @@ -0,0 +1,31 @@
> +diff --git node-v0.1.104/wscript.orig node-v0.1.104/wscript
> +index ba60514..d6a54fe 100644
> +--- node-v0.1.104/wscript.orig
> ++++ node-v0.1.104/wscript
> +@@ -313,17 +313,25 @@ def v8_cmd(bld, variant):
> +   # cannot see symbols in the executable which are hidden, even if the
> +   # executable is statically linked together...
> + 
> ++  HOST_CPU = 'not-arm' # TODO probe for this
> ++  snapshot = 'snapshot=on'
> ++
> +   # XXX Remove this when v8 defaults x86_64 to native builds
> +   arch = ""
> +   if bld.env['DEST_CPU'] == 'x86_64':
> +     arch = "arch=x64"
> ++  elif bld.env['DEST_CPU'] == 'arm':
> ++    arch = "arch=arm"
> ++
> ++  if bld.env['DEST_CPU'] != HOST_CPU:
> ++    snapshot = ""
> + 
> +   if variant == "default":
> +     mode = "release"
> +   else:
> +     mode = "debug"
> + 
> +-  cmd_R = 'python "%s" -j %d -C "%s" -Y "%s" visibility=default mode=%s %s library=static snapshot=on'
> ++  cmd_R = 'python "%s" -j %d -C "%s" -Y "%s" visibility=default mode=%s %s library=static ' + snapshot
> + 
> +   cmd = cmd_R % ( scons
> +                 , Options.options.jobs
> diff --git a/recipes/node/node_0.1.104.bb b/recipes/node/node_0.1.104.bb
> new file mode 100644
> index 0000000..a99eaff
> --- /dev/null
> +++ b/recipes/node/node_0.1.104.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> +PR = "r0"
> +DEPENDS = "openssl"
> +SRC_URI = " \
> +http://nodejs.org/dist/node-v${PV}.tar.gz \
> +file://libev-arm-cross.patch;apply=yes \
> +file://node-arm-cross.patch;apply=yes \
> +"
> +SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
> +SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
> +S = "${WORKDIR}/node-v${PV}"
> +do_configure () {
> +export DEST_CPU=arm
> +./configure
> +# skip complaints about 'config.log'
> +cat /dev/null > ${S}/build/config.log
> +}
> +do_qa_configure () {
> +}
> +do_compile () {
> +export DEST_CPU=arm
> +make
> +}
> +do_install () {
> +install -d ${D}${bindir}/
> +install -m 0755 ${S}/node ${D}${bindir}/
> +}
> +FILES_${PN} = "${bindir}/node"
> diff --git a/recipes/node/node_v0.1.104.bb b/recipes/node/node_v0.1.104.bb
> new file mode 100644
> index 0000000..368b8fb
> --- /dev/null
> +++ b/recipes/node/node_v0.1.104.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> +PR = "r0"
> +DEPENDS = "openssl"
> +SRC_URI = " \
> +http://nodejs.org/dist/node-v${PV}.tar.gz \
> +"
> +#libev-cross.patch
> +#node-cross.patch
> +SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
> +SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
> +S = "${WORKDIR}/node-v${PV}"
> +do_configure () {
> +./configure
> +}
> +do_compile () {
> +export DEST_CPU=arm
> +make
> +}
> +do_install () {
> +install -d ${D}${bindir}/
> +install -m 0755 ${S}/node ${D}${bindir}/
> +}
> +FILES_${PN} = "${bindir}/node"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMbO7IMkyGM64RGpERAutSAJ4rEznKqUERzRw63i45U5HKZDzn8wCfWwbp
GrHdH6tC0/HZ6/kCY+wxExQ=
=GrlM
-----END PGP SIGNATURE-----



