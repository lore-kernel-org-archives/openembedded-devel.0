Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12020.1795085361577336590
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=vaMo5W9V;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout06.t-online.de (Postfix) with SMTP id 0EEC9136D
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:49:19 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzhd-4JwVdp0; Thu, 19 Nov 2026 11:49:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] tree-sitter: add grammar recipes for 18 languages
Date: Thu, 19 Nov 2026 11:47:46 +0100
Message-ID: <20261119104903.176376-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119104903.176376-1-f_l_k@t-online.de>
References: <20261119104903.176376-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795085357-01FF89BF-BF5E9A50/0/0 CLEAN NORMAL
X-TOI-MSGID: 7813b648-6f3c-414a-83bf-f020a4f11b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795085358; i=f_l_k@t-online.de;
	bh=KOEXxTTwpubKqejpyKsE1PNwjuh77zLXTrqBE0MtVLY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vaMo5W9VrRuyG495cujP18J6VUutBXXoYyl0FS0BVcqEPKLJpU1iLRW7Er7d7Okom
	 QmE3tGk8SFlVVE211mLVoG6AUD6yx+p07pgkKkN0u/6TXABd65Ln95xdCWBKK23iSx
	 PjIVEzb1sYRVXjZEbSVbnNUXWAw7n/ZHfNDWn7acHHv9T+AE4fNK84xSZK1eTSb7wt
	 Q1hKwblbl6sknt7w33yWRIhrdnlwgOERKxJF+kEZh+AE+85Jzrq0WJd7n7ewMZ0giM
	 0z+tLAnHcZztUvqQDLxFJRiscwuCxfmeFadYdR4lMfjQYhcaCFbXdEtx+UskU/RrKW
	 sIpa1iGcV0OEQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132678
Content-Type: text/plain; charset="utf-8"

Add grammars for bash, bitbake, c, cmake, cpp, diff, json, lua, make,
markdown, meson, python, query, rust, toml, vim, vimdoc and yaml, built
with a shared tree-sitter-grammar.inc. The include compiles the
generated parser sources of each grammar directly, so the Rust
tree-sitter CLI is not needed, and installs:

- ${libdir}/libtree-sitter-<lang>.so, the name Emacs and other users
  dlopen
- ${libdir}/nvim/parser/<lang>.so, a link to it for neovim
- the grammar's queries in ${datadir}/tree-sitter/queries/<lang>

The parsers are loadable modules, not link libraries, so the
unversioned .so and the neovim link stay in the main package and
dev-so is skipped.

Tested on intel-corei7-64: Emacs 30.2 loads all 19 parsers, neovim
0.12.6 loads them and parses every shipped query without errors.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tree-sitter/tree-sitter-bash_0.25.1.bb    |  7 +++
 .../tree-sitter/tree-sitter-bitbake_1.1.0.bb  |  7 +++
 .../tree-sitter/tree-sitter-c_0.24.2.bb       |  7 +++
 .../tree-sitter/tree-sitter-cmake_0.7.6.bb    |  7 +++
 .../tree-sitter/tree-sitter-cpp_0.23.4.bb     |  7 +++
 .../tree-sitter/tree-sitter-diff_0.2.0.bb     |  7 +++
 .../tree-sitter/tree-sitter-grammar.inc       | 44 +++++++++++++++++++
 .../tree-sitter/tree-sitter-json_0.24.8.bb    |  7 +++
 .../tree-sitter/tree-sitter-lua_0.5.0.bb      |  7 +++
 .../tree-sitter/tree-sitter-make_1.1.1.bb     |  7 +++
 .../tree-sitter/tree-sitter-markdown_0.5.4.bb |  9 ++++
 .../tree-sitter/tree-sitter-meson_1.3.0.bb    |  7 +++
 .../tree-sitter/tree-sitter-python_0.25.0.bb  |  7 +++
 .../tree-sitter/tree-sitter-query_0.8.0.bb    |  7 +++
 .../tree-sitter/tree-sitter-rust_0.24.2.bb    |  7 +++
 .../tree-sitter/tree-sitter-toml_0.7.0.bb     |  7 +++
 .../tree-sitter/tree-sitter-vim_0.8.1.bb      |  7 +++
 .../tree-sitter/tree-sitter-vimdoc_4.3.0.bb   |  7 +++
 .../tree-sitter/tree-sitter-yaml_0.7.2.bb     |  7 +++
 19 files changed, 172 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-bash=
_0.25.1.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-bitb=
ake_1.1.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-c_0.=
24.2.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-cmak=
e_0.7.6.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-cpp_=
0.23.4.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-diff=
_0.2.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-gram=
mar.inc
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-json=
_0.24.8.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-lua_=
0.5.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-make=
_1.1.1.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-mark=
down_0.5.4.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-meso=
n_1.3.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-pyth=
on_0.25.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-quer=
y_0.8.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-rust=
_0.24.2.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-toml=
_0.7.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-vim_=
0.8.1.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-vimd=
oc_4.3.0.bb
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/tree-sitter-yaml=
_0.7.2.bb

diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-bash_0.25.1=
.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-bash_0.25.1.bb
new file mode 100644
index 0000000000..ead1e3162e
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-bash_0.25.1.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2220463fa5825d0a3935ade6f38bd=
d69"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter-bash.git;protocol=3D=
https;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "a06c2e4415e9bc0346c6b86d401879ffb44058f7"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-bitbake_1.1=
.0.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-bitbake_1.1.0.bb
new file mode 100644
index 0000000000..34b86f8116
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-bitbake_1.1.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7dcf1d5ba61a94226e43f0705d73c=
97d"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-bitbake.g=
it;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "10bacac929ff36a1e8f4056503fe4f8717b21b94"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-c_0.24.2.bb=
 b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-c_0.24.2.bb
new file mode 100644
index 0000000000..4a6ecde3fc
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-c_0.24.2.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52adf5c4bb8fe6703ee211cd5415e=
4f6"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter-c.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "b780e47fc780ddc8da13afa35a3f4ed5c157823d"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-cmake_0.7.6=
.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-cmake_0.7.6.bb
new file mode 100644
index 0000000000..5bd346007d
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-cmake_0.7.6.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D890ca54f377bbd88baa2280077889=
dae"
+
+SRC_URI =3D "git://github.com/uyha/tree-sitter-cmake.git;protocol=3Dhttp=
s;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "a3ec2b2144daf7132e7ee824d8cab9610523d10f"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-cpp_0.23.4.=
bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-cpp_0.23.4.bb
new file mode 100644
index 0000000000..7f87430e7e
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-cpp_0.23.4.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52adf5c4bb8fe6703ee211cd5415e=
4f6"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter-cpp.git;protocol=3D=
https;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "f41e1a044c8a84ea9fa8577fdd2eab92ec96de02"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-diff_0.2.0.=
bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-diff_0.2.0.bb
new file mode 100644
index 0000000000..4c6378910c
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-diff_0.2.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4f8e906e7514a0d414eec27d5ecb4=
6ed"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-diff.git;=
protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "ada384ac7bfc1307f32de474620120add29998fb"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-grammar.inc=
 b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-grammar.inc
new file mode 100644
index 0000000000..bed10934f4
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-grammar.inc
@@ -0,0 +1,44 @@
+SUMMARY ?=3D "Tree-sitter grammar for ${TS_LANG}"
+HOMEPAGE ?=3D "https://tree-sitter.github.io/tree-sitter/"
+SECTION =3D "devel"
+
+TS_LANG ?=3D "${@d.getVar('BPN').replace('tree-sitter-', '', 1)}"
+TS_PARSERS ?=3D "${TS_LANG}:."
+
+DEPENDS =3D "libtreesitter"
+
+do_configure[noexec] =3D "1"
+
+do_compile() {
+    for entry in ${TS_PARSERS}; do
+        lang=3D${entry%%:*}
+        dir=3D${S}/${entry#*:}
+        ${CC} ${CFLAGS} -std=3Dgnu11 -fPIC -I${dir}/src ${LDFLAGS} -shar=
ed \
+            -Wl,-soname,libtree-sitter-${lang}.so \
+            -o ${B}/libtree-sitter-${lang}.so ${dir}/src/*.c
+    done
+}
+
+do_install() {
+    install -d ${D}${libdir}/nvim/parser
+    for entry in ${TS_PARSERS}; do
+        lang=3D${entry%%:*}
+        dir=3D${S}/${entry#*:}
+        install -m 0755 ${B}/libtree-sitter-${lang}.so ${D}${libdir}/
+        ln -sf ../../libtree-sitter-${lang}.so ${D}${libdir}/nvim/parser=
/${lang}.so
+        queries=3D${dir}/queries
+        [ ! -d ${queries}/${lang} ] || queries=3D${queries}/${lang}
+        if [ -d ${queries} ]; then
+            install -d ${D}${datadir}/tree-sitter/queries/${lang}
+            install -m 0644 ${queries}/*.scm ${D}${datadir}/tree-sitter/=
queries/${lang}/
+        fi
+    done
+}
+
+FILES_SOLIBSDEV =3D ""
+FILES:${PN} =3D " \
+    ${libdir}/libtree-sitter-*.so \
+    ${libdir}/nvim/parser \
+    ${datadir}/tree-sitter \
+"
+INSANE_SKIP:${PN} =3D "dev-so"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-json_0.24.8=
.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-json_0.24.8.bb
new file mode 100644
index 0000000000..731a6de7d9
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-json_0.24.8.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52adf5c4bb8fe6703ee211cd5415e=
4f6"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter-json.git;protocol=3D=
https;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "ee35a6ebefcef0c5c416c0d1ccec7370cfca5a24"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-lua_0.5.0.b=
b b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-lua_0.5.0.bb
new file mode 100644
index 0000000000..eff5973f73
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-lua_0.5.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Daab6641082436ddc4655e6b43d=
c9fe98"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-lua.git;p=
rotocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "10fe0054734eec83049514ea2e718b2a56acd0c9"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-make_1.1.1.=
bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-make_1.1.1.bb
new file mode 100644
index 0000000000..527a72bec8
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-make_1.1.1.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1519ffdf2ebaba430e2c4f27f95ab=
17c"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-make.git;=
protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "5e9e8f8ff3387b0edcaa90f46ddf3629f4cfeb1d"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-markdown_0.=
5.4.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-markdown_0.5.4.=
bb
new file mode 100644
index 0000000000..705a1a8a98
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-markdown_0.5.4.bb
@@ -0,0 +1,9 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df7314d574b0c64fe08b05298f291b=
604"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-markdown.=
git;protocol=3Dhttps;branch=3Dsplit_parser;tag=3Dv${PV}"
+SRCREV =3D "41ff24a6c775492c543b09228aeb98d1cd2b3a0f"
+
+TS_PARSERS =3D "markdown:tree-sitter-markdown markdown_inline:tree-sitte=
r-markdown-inline"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-meson_1.3.0=
.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-meson_1.3.0.bb
new file mode 100644
index 0000000000..33806238b3
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-meson_1.3.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2375704453b348c6c8b93af2d6f83=
ef8"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-meson.git=
;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "12edaf0dfef0a43bc74336a4432b2db1c65788d6"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-python_0.25=
.0.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-python_0.25.0.bb
new file mode 100644
index 0000000000..f2bfdb6320
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-python_0.25.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc191fd97f3c9e58e623af9aa4cf29=
98c"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter-python.git;protoco=
l=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "293fdc02038ee2bf0e2e206711b69c90ac0d413f"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-query_0.8.0=
.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-query_0.8.0.bb
new file mode 100644
index 0000000000..4e42bf04f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-query_0.8.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-query.git=
;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "a225e21d81201be77da58de614e2b7851735677a"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-rust_0.24.2=
.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-rust_0.24.2.bb
new file mode 100644
index 0000000000..b0b180ca28
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-rust_0.24.2.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dac1623bd8a20876e47103c894fd88=
08a"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter-rust.git;protocol=3D=
https;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "77a3747266f4d621d0757825e6b11edcbf991ca5"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-toml_0.7.0.=
bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-toml_0.7.0.bb
new file mode 100644
index 0000000000..5c0097db96
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-toml_0.7.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc925cbf1bb87ecaeedbcdc573fc7=
651"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-toml.git;=
protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "64b56832c2cffe41758f28e05c756a3a98d16f41"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-vim_0.8.1.b=
b b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-vim_0.8.1.bb
new file mode 100644
index 0000000000..b0286be035
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-vim_0.8.1.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D46ca08e8c14dc63f12300d0de6919=
80b"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-vim.git;p=
rotocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "3092fcd99eb87bbd0fc434aa03650ba58bd5b43b"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-vimdoc_4.3.=
0.bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-vimdoc_4.3.0.bb
new file mode 100644
index 0000000000..980d30dcfd
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-vimdoc_4.3.0.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
+
+SRC_URI =3D "git://github.com/neovim/tree-sitter-vimdoc.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "13add92d357b69646c080a8028b82ffb106faf7a"
diff --git a/meta-oe/recipes-devtools/tree-sitter/tree-sitter-yaml_0.7.2.=
bb b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-yaml_0.7.2.bb
new file mode 100644
index 0000000000..b23932e8e4
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/tree-sitter-yaml_0.7.2.bb
@@ -0,0 +1,7 @@
+require tree-sitter-grammar.inc
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92d9c25147972986a42a9bdc18867=
46c"
+
+SRC_URI =3D "git://github.com/tree-sitter-grammars/tree-sitter-yaml.git;=
protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "7708026449bed86239b1cd5bce6e3c34dbca6415"
--=20
2.56.0

