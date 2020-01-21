Return-Path: <guillaume.burel@stormshield.eu>
Received: from work.stormshield.eu (gwlille.netasq.com [91.212.116.1])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2EE7FD78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 11:02:23 +0000 (UTC)
Received: from work.stormshield.eu (localhost.localdomain [127.0.0.1])
	by work.stormshield.eu (Postfix) with ESMTPS id 8524D3CAF36E;
	Tue, 21 Jan 2020 12:02:14 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by work.stormshield.eu (Postfix) with ESMTP id 65CF73CAF371;
	Tue, 21 Jan 2020 12:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 work.stormshield.eu 65CF73CAF371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stormshield.eu;
	s=BBC9ECEA-016A-11EA-9CC1-8A393C11FBBB; t=1579604534;
	bh=PE20P6mdt0XmLY0hb0p8ZVd6OhSL9RYC7++WO6eclPo=;
	h=To:From:Message-ID:Date:MIME-Version;
	b=koHucmOs5g+8rxbeEPrYT6lFBEhkI8EVMPs9P/tQPPuDjKpxGoKfCFiprUM7rtIsP
	ir9y5+ZtutxhEcANT9+VU9HR11PVxzvUKL/StnwdHv+U27h2Xhs3b2C39xXvrA2Dcr
	0lyradrKsUPQDw8wK4nOij7BWvGkYzcSJByWewIoZoonJpvKrAW063PbClB7kU0+LJ
	tI0WD/e6BdVzPNX6VEAAwHVfmjpQSUuNrAeAq/B9iNSYwDir+INfVQAY1WyGODc/1O
	vjWQ2/eF9b6rdTBXYrZBv+G2To3+bO18d9eQErY52zVWe7SdAkiR2X1Yl7xky55WcM
	l+wHxFq62BwRA==
Received: from work.stormshield.eu ([127.0.0.1])
	by localhost (work.stormshield.eu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tl9gjKR3HmuX; Tue, 21 Jan 2020 12:02:14 +0100 (CET)
Received: from [172.16.3.6] (unknown [192.168.100.253])
	by work.stormshield.eu (Postfix) with ESMTPSA id 22F4C3CAF36E;
	Tue, 21 Jan 2020 12:02:14 +0100 (CET)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200120170426.15131-1-guillaume.burel@stormshield.eu>
	<CA+chaQc-rJqr-q8MvpyJbYnwn_URHs8iM1Q2RNaR2erSrGiBmA@mail.gmail.com>
From: Guillaume Burel <guillaume.burel@stormshield.eu>
Message-ID: <f6ffda47-cfab-2efa-fa98-6d92765989ce@stormshield.eu>
Date: Tue, 21 Jan 2020 12:02:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc-rJqr-q8MvpyJbYnwn_URHs8iM1Q2RNaR2erSrGiBmA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: 10.17.0 -> 12.14.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2020 11:02:24 -0000
X-Groupsio-MsgNum: 82308
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms080603090204030001090707"

--------------ms080603090204030001090707
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Node.js v12.x uses python2 as part of its build process. Starting from=20
Node v13.x, python3 might be enough.
Perhaps should we discard the patch or backport it to zeus, and switch=20
to Node v13.x on master ?

AFAIK, npm does not require python anymore.

On 1/20/20 6:17 PM, Martin Jansa wrote:
> Does npm still depend on python2 in this release? python2 was removed=20
> from oe-core yesterday, so nodejs doesn't build anymore in meta-oe.
>
> Please describe in commit message what changed in license (to explain=20
> LIC_FILES_CHKSUM change).
>
> On Mon, Jan 20, 2020 at 6:12 PM Guillaume Burel=20
> <guillaume.burel@stormshield.eu=20
> <mailto:guillaume.burel@stormshield.eu>> wrote:
>
>     - update Node.js to active 12.x LTS release 12.14.0.
>     - remove compatibility with gcc 4.8 (has been removed upstream)
>
>     Signed-off-by: Guillaume Burel <guillaume.burel@stormshield.eu
>     <mailto:guillaume.burel@stormshield.eu>>
>     ---
>     =C2=A0...e-running-gyp-files-for-bundled-deps.patch | 25 ++++---
>     =C2=A0.../nodejs/0002-Using-native-binaries.patch=C2=A0 =C2=A0| 71
>     +++++++++++++++++++
>     =C2=A0.../nodejs/0002-Using-native-torque.patch=C2=A0 =C2=A0 =C2=A0=
| 36 ----------
>     =C2=A0...Install-both-binaries-and-use-libdir.patch | 17 +++--
>     =C2=A0...0004-Make-compatibility-with-gcc-4.8.patch | 69 ----------=
--------
>     =C2=A0...> 0004-v8-don-t-override-ARM-CFLAGS.patch} | 16 ++---
>     =C2=A0.../nodejs/0005-Link-atomic-library.patch=C2=A0 =C2=A0 =C2=A0=
| 20 ------
>     =C2=A0.../{nodejs_10.17.0.bb <http://nodejs_10.17.0.bb> =3D>
>     nodejs_12.14.0.bb <http://nodejs_12.14.0.bb>} | 18 ++---
>     =C2=A08 files changed, 109 insertions(+), 163 deletions(-)
>     =C2=A0create mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.p=
atch
>     =C2=A0delete mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.pat=
ch
>     =C2=A0delete mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with=
-gcc-4.8.patch
>     =C2=A0rename
>     meta-oe/recipes-devtools/nodejs/nodejs/{0007-v8-don-t-override-ARM-=
CFLAGS.patch
>     =3D> 0004-v8-don-t-override-ARM-CFLAGS.patch} (92%)
>     =C2=A0delete mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.pat=
ch
>     =C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs_10.17.0.bb
>     <http://nodejs_10.17.0.bb> =3D> nodejs_12.14.0.bb
>     <http://nodejs_12.14.0.bb>} (87%)
>
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
>     index 5d0dc03b6..4dd121f48 100644
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
>     @@ -4,23 +4,22 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
>     =C2=A0Subject: [PATCH] Disable running gyp on shared deps
>
>     =C2=A0---
>     - Makefile | 4 ++--
>     - 1 file changed, 2 insertions(+), 2 deletions(-)
>     + Makefile | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>     =C2=A0diff --git a/Makefile b/Makefile
>     -index a98772f..f5663e2 100644
>     +index 0947300f24..6c98691984 100644
>     =C2=A0--- a/Makefile
>     =C2=A0+++ b/Makefile
>     -@@ -123,8 +123,8 @@ with-code-cache:
>     - test-code-cache: with-code-cache
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) tools/test.py $(PARALLEL_ARGS=
)
>     --mode=3D$(BUILDTYPE_LOWER) code-cache
>     +@@ -141,7 +141,7 @@ test-code-cache: with-code-cache
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo "'test-code-cache' target is a noo=
p"
>
>     --out/Makefile: common.gypi deps/uv/uv.gyp
>     deps/http_parser/http_parser.gyp \
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps/zlib/zlib.g=
yp deps/v8/gypfiles/toolchain.gypi \
>     -+out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps/v8/gypfiles=
/toolchain.gypi \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps/v8/gyp=
files/features.gypi
>     deps/v8/gypfiles/v8.gyp node.gyp \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config.gypi=

>     + out/Makefile: config.gypi common.gypi node.gyp \
>     +-=C2=A0 =C2=A0 =C2=A0 deps/uv/uv.gyp deps/http_parser/http_parser.=
gyp
>     deps/zlib/zlib.gyp \
>     ++=C2=A0 =C2=A0 =C2=A0 deps/http_parser/http_parser.gyp \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0tools/v8_gypfiles/toolchain.gypi
>     tools/v8_gypfiles/features.gypi \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0tools/v8_gypfiles/inspector.gypi tools/=
v8_gypfiles/v8.gyp
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON) tools/gyp_node.py -f make
>     =C2=A0--
>     -2.19.2
>     +2.20.1
>     +
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
=2Epatch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
=2Epatch
>     new file mode 100644
>     index 000000000..b5142dc9c
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
=2Epatch
>     @@ -0,0 +1,71 @@
>     +From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00
>     2001
>     +From: Guillaume Burel <guillaume.burel@stormshield.eu
>     <mailto:guillaume.burel@stormshield.eu>>
>     +Date: Fri, 3 Jan 2020 11:25:54 +0100
>     +Subject: [PATCH] Using native binaries
>     +
>     +---
>     + node.gyp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--
>     + tools/v8_gypfiles/v8.gyp | 11 ++++-------
>     + 2 files changed, 6 insertions(+), 9 deletions(-)
>     +
>     +diff --git a/node.gyp b/node.gyp
>     +index 8f4dc518..d9389190 100644
>     +--- a/node.gyp
>     ++++ b/node.gyp
>     +@@ -446,7 +446,7 @@
>     + =C2=A0'<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action': [=

>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(_inpu=
ts)',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'mkcodeca=
che',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<@(=
_outputs)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +@@ -471,7 +471,7 @@
>     + =C2=A0'<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action': [=

>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(_inpu=
ts)',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'node_mks=
napshot',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<@(=
_outputs)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
>     +index a506a67d..c91f7dde 100644
>     +--- a/tools/v8_gypfiles/v8.gyp
>     ++++ b/tools/v8_gypfiles/v8.gyp
>     +@@ -140,7 +140,8 @@
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<@(torque_outputs=
)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action': [
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(_inputs)',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'torque',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(torque_files)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'-o', '<(torque_ou=
tput_root)/torque-generated',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'-v8-root', '<(V8_=
ROOT)'
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +@@ -247,9 +248,7 @@
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<(generate_byteco=
de_builtins_list_output)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action': [
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'python',
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(V8_ROOT)/tools/run.p=
y',
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(_inputs)',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'bytecode_builtins_list=
_generator',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<@(_outputs)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +@@ -1396,9 +1395,7 @@
>     + =C2=A0'<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action': [
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'python',
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(V8_ROOT)/tools/run.p=
y',
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(_inputs)',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'gen-regexp-special-cas=
e',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<@(_outputs)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +--
>     +2.20.1
>     +
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.p=
atch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.p=
atch
>     deleted file mode 100644
>     index e9035f9eb..000000000
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.p=
atch
>     +++ /dev/null
>     @@ -1,36 +0,0 @@
>     -From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00
>     2001
>     -From: "Winker Matthias (TT-CA/ENG1)"
>     <Matthias.Winker@de.bosch.com <mailto:Matthias.Winker@de.bosch.com>=
>
>     -Date: Tue, 11 Dec 2018 10:44:29 +0100
>     -Subject: [PATCH] Using native torque
>     -
>     ----
>     - deps/v8/gypfiles/v8.gyp | 6 ++++--
>     - 1 file changed, 4 insertions(+), 2 deletions(-)
>     -
>     -diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
>     -index 8c78f02255..434168844e 100644
>     ---- a/deps/v8/gypfiles/v8.gyp
>     -+++ b/deps/v8/gypfiles/v8.gyp
>     -@@ -2831,7 +2831,6 @@
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action_name': 'run_torqu=
e',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'inputs': [=C2=A0 # Order=
 matters.
>     -- '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',=

>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'../src/builtins/b=
ase.tq',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'../src/builtins/a=
rray.tq',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'../src/builtins/t=
yped-array.tq',
>     -@@ -2845,7 +2844,10 @@
>     -
>     =C2=A0'<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-a=
rray-from-dsl-gen.cc',
>     -
>     =C2=A0'<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-a=
rray-from-dsl-gen.h',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'action': ['<@(_inputs)', '-o'=
,
>     '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'action': [
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'torque',
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(_inputs)',
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '-o', '<(SHARED_INTERME=
DIATE_DIR)/torque-generated'],
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     -=C2=A0 =C2=A0 =C2=A0}, # torque
>     ---
>     -2.19.2
>     -
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
>     index 7aa70fec9..599f742b2 100644
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
>     @@ -15,17 +15,16 @@ Stolen from [1]
>     =C2=A0Upstream-Status: Pending
>
>     =C2=A0Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com
>     <mailto:schnitzeltony@gmail.com>>
>     -
>     =C2=A0---
>     =C2=A0 configure.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++
>     =C2=A0 tools/install.py | 31 ++++++++++++++-----------------
>     =C2=A0 2 files changed, 21 insertions(+), 17 deletions(-)
>
>     =C2=A0diff --git a/configure.py b/configure.py
>     -index cfd4207..eb26f7d 100755
>     +index 20cce214db..e2d78a2a51 100755
>     =C2=A0--- a/configure.py
>     =C2=A0+++ b/configure.py
>     -@@ -552,6 +552,12 @@ parser.add_option('--shared',
>     +@@ -559,6 +559,12 @@ parser.add_option('--shared',
>     =C2=A0 =C2=A0 =C2=A0 help=3D'compile shared library for embedding n=
ode in another
>     project. ' +
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'(This mode is not officia=
lly supported for regular
>     applications)')
>
>     @@ -38,19 +37,19 @@ index cfd4207..eb26f7d 100755
>     =C2=A0 parser.add_option('--without-v8-platform',
>     =C2=A0 =C2=A0 =C2=A0 action=3D'store_true',
>     =C2=A0 =C2=A0 =C2=A0 dest=3D'without_v8_platform',
>     -@@ -1095,6 +1101,7 @@ def configure_node(o):
>     -=C2=A0 =C2=A0if options.code_cache_path:
>     -=C2=A0 =C2=A0 =C2=A0o['variables']['node_code_cache_path'] =3D opt=
ions.code_cache_path
>     +@@ -1103,6 +1109,7 @@ def configure_node(o):
>     +=C2=A0 =C2=A0if o['variables']['want_separate_host_toolset'] =3D=3D=
 0:
>     +=C2=A0 =C2=A0 =C2=A0o['variables']['node_code_cache'] =3D 'yes' # =
For testing
>     =C2=A0 =C2=A0 o['variables']['node_shared'] =3D b(options.shared)
>     =C2=A0+=C2=A0 o['variables']['libdir'] =3D options.libdir
>     =C2=A0 =C2=A0 node_module_version =3D getmoduleversion.get_version(=
)
>
>     =C2=A0 =C2=A0 if sys.platform =3D=3D 'darwin':
>     =C2=A0diff --git a/tools/install.py b/tools/install.py
>     -index 028c32e..bf443c4 100755
>     +index 655802980a..fe4723bf15 100755
>     =C2=A0--- a/tools/install.py
>     =C2=A0+++ b/tools/install.py
>     -@@ -117,26 +117,23 @@ def subdir_files(path, dest, action):
>     +@@ -121,26 +121,23 @@ def subdir_files(path, dest, action):
>
>     =C2=A0 def files(action):
>     =C2=A0 =C2=A0 is_windows =3D sys.platform =3D=3D 'win32'
>     @@ -92,5 +91,5 @@ index 028c32e..bf443c4 100755
>     =C2=A0 =C2=A0 if 'true' =3D=3D variables.get('node_use_dtrace'):
>     =C2=A0 =C2=A0 =C2=A0 action(['out/Release/node.d'], 'lib/dtrace/nod=
e.d')
>     =C2=A0--
>     -2.23.0
>     +2.20.1
>
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-wi=
th-gcc-4.8.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-wi=
th-gcc-4.8.patch
>     deleted file mode 100644
>     index 925c085e9..000000000
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-wi=
th-gcc-4.8.patch
>     +++ /dev/null
>     @@ -1,69 +0,0 @@
>     -Implement function as wrapper for std::make_unique
>     -method to be compatible with gcc < 4.9 .
>     -"error::make_unique is not a member of 'std'"
>     -
>     -Signed-off-by: Andrej Valek <andrej.valek@siemens.com
>     <mailto:andrej.valek@siemens.com>>
>     -Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com
>     <mailto:bradleyb@fuzziesquirrel.com>>
>     -
>     -diff -Naur node-v10.15.1/src/cares_wrap.cc
>     node-v10.15.1/src/cares_wrap.cc
>     ---- node-v10.15.1/src/cares_wrap.cc=C2=A0 =C2=A0 2019-01-29
>     08:20:50.000000000 +0100
>     -+++ node-v10.15.1/src/cares_wrap.cc=C2=A0 =C2=A0 2019-02-21
>     16:22:25.489131665 +0100
>     -@@ -52,6 +52,16 @@
>     - # define AI_V4MAPPED 0
>     - #endif
>     -
>     -+#ifndef __cpp_lib_make_unique
>     -+namespace std {
>     -+=C2=A0 /// make_unique implementation
>     -+=C2=A0 template<typename T, typename... Args>
>     -+=C2=A0 std::unique_ptr<T> make_unique(Args&&... args) {
>     -+=C2=A0 =C2=A0 return std::unique_ptr<T>(new T(std::forward<Args>(=
args)...));
>     -+=C2=A0 }
>     -+}
>     -+#endif
>     -+
>     - namespace node {
>     - namespace cares_wrap {
>     -
>     -diff -Naur node-v10.15.1/src/inspector_agent.cc
>     node-v10.15.1/src/inspector_agent.cc
>     ---- node-v10.15.1/src/inspector_agent.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
2019-01-29
>     08:20:50.000000000 +0100
>     -+++ node-v10.15.1/src/inspector_agent.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
2019-02-21
>     16:22:09.000185992 +0100
>     -@@ -24,6 +24,16 @@
>     - #include <pthread.h>
>     - #endif=C2=A0 // __POSIX__
>     -
>     -+#ifndef __cpp_lib_make_unique
>     -+namespace std {
>     -+=C2=A0 /// make_unique implementation
>     -+=C2=A0 template<typename T, typename... Args>
>     -+=C2=A0 std::unique_ptr<T> make_unique(Args&&... args) {
>     -+=C2=A0 =C2=A0 return std::unique_ptr<T>(new T(std::forward<Args>(=
args)...));
>     -+=C2=A0 }
>     -+}
>     -+#endif
>     -+
>     - namespace node {
>     - namespace inspector {
>     - namespace {
>     -
>     -diff --git a/src/inspector/main_thread_interface.cc
>     b/src/inspector/main_thread_interface.cc
>     -index e374c0fd70..05d7d8c60f 100644
>     ---- a/src/inspector/main_thread_interface.cc
>     -+++ b/src/inspector/main_thread_interface.cc
>     -@@ -6,6 +6,16 @@
>     - #include <functional>
>     - #include <unicode/unistr.h>
>     -
>     -+#ifndef __cpp_lib_make_unique
>     -+namespace std {
>     -+=C2=A0 /// make_unique implementation
>     -+=C2=A0 template<typename T, typename... Args>
>     -+=C2=A0 std::unique_ptr<T> make_unique(Args&&... args) {
>     -+=C2=A0 =C2=A0 return std::unique_ptr<T>(new T(std::forward<Args>(=
args)...));
>     -+=C2=A0 }
>     -+}
>     -+#endif
>     -+
>     - namespace node {
>     - namespace inspector {
>     - namespace {
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM=
-CFLAGS.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM=
-CFLAGS.patch
>     similarity index 92%
>     rename from
>     meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-C=
FLAGS.patch
>     rename to
>     meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-C=
FLAGS.patch
>     index eb2cbfb8b..97ed972ce 100644
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM=
-CFLAGS.patch
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM=
-CFLAGS.patch
>     @@ -24,14 +24,14 @@ problems have been noted during compilation or
>     runtime.
>     =C2=A0Upstream-Status: Inappropriate [oe-specific]
>     =C2=A0Signed-off-by: Andr=C3=A9 Draszik <git@andred.net <mailto:git=
@andred.net>>
>     =C2=A0---
>     - deps/v8/gypfiles/toolchain.gypi | 52
>     ++-------------------------------
>     + tools/v8_gypfiles/toolchain.gypi | 52
>     ++------------------------------
>     =C2=A0 1 file changed, 2 insertions(+), 50 deletions(-)
>
>     -diff --git a/deps/v8/gypfiles/toolchain.gypi
>     b/deps/v8/gypfiles/toolchain.gypi
>     -index 910a212..1390b15 100644
>     ---- a/deps/v8/gypfiles/toolchain.gypi
>     -+++ b/deps/v8/gypfiles/toolchain.gypi
>     -@@ -199,31 +199,7 @@
>     +diff --git a/tools/v8_gypfiles/toolchain.gypi
>     b/tools/v8_gypfiles/toolchain.gypi
>     +index 264b3e478e..0b41848145 100644
>     +--- a/tools/v8_gypfiles/toolchain.gypi
>     ++++ b/tools/v8_gypfiles/toolchain.gypi
>     +@@ -211,31 +211,7 @@
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'target_conditions': [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ['_toolset=3D=3D"host"', =
{
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'conditions': [
>     @@ -64,7 +64,7 @@ index 910a212..1390b15 100644
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ho=
st not built with an Arm CXX compiler
>     (simulator build).
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'con=
ditions': [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 [ 'arm_float_abi=3D=3D"hard"', {
>     -@@ -242,31 +218,7 @@
>     +@@ -254,31 +230,7 @@
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }],=C2=A0 # _toolset=3D=3D=
"host"
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ['_toolset=3D=3D"target"'=
, {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'conditions': [
>     @@ -98,5 +98,5 @@ index 910a212..1390b15 100644
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'con=
ditions': [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 [ 'arm_float_abi=3D=3D"hard"', {
>     =C2=A0--
>     -2.23.0.rc1
>     +2.20.1
>
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.p=
atch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.p=
atch
>     deleted file mode 100644
>     index 66ff18b4a..000000000
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.p=
atch
>     +++ /dev/null
>     @@ -1,20 +0,0 @@
>     -Link atomic library to fix missing undefined referrences
>     -like "undefined reference to `__atomic_fetch_add_8'"
>     -
>     -Signed-off-by: Andrej Valek <andrej.valek@siemens.com
>     <mailto:andrej.valek@siemens.com>>
>     -
>     -diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp
>     node-v10.15.1/deps/v8/gypfiles/v8.gyp
>     ---- node-v10.15.1/deps/v8/gypfiles/v8.gyp=C2=A0 =C2=A0 =C2=A0 2019=
-02-13
>     09:02:21.000000000 +0100
>     -+++ node-v10.15.1/deps/v8/gypfiles/v8.gyp=C2=A0 =C2=A0 =C2=A0 2019=
-02-15
>     21:27:11.755679660 +0100
>     -@@ -452,6 +452,11 @@
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<(DEPTH)',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<(SHARED_INTERMEDIATE_DIR)'
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     -+=C2=A0 =C2=A0 =C2=A0 'link_settings': {
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 'libraries': [
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '-latomic'
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     -+=C2=A0 =C2=A0 =C2=A0 },
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0'sources': [
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<@(inspector_all_sources)',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'../include//v8-inspector-protoc=
ol.h',
>     diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
>     <http://nodejs_10.17.0.bb>
>     b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
>     <http://nodejs_12.14.0.bb>
>     similarity index 87%
>     rename from meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
>     <http://nodejs_10.17.0.bb>
>     rename to meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
>     <http://nodejs_12.14.0.bb>
>     index 71a47636b..abe4be632 100644
>     --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
>     <http://nodejs_10.17.0.bb>
>     +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
>     <http://nodejs_12.14.0.bb>
>     @@ -1,7 +1,7 @@
>     =C2=A0DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>     =C2=A0HOMEPAGE =3D "http://nodejs.org"
>     =C2=A0LICENSE =3D "MIT & BSD & Artistic-2.0"
>     -LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3Dbe980eb7ccafe287cb438076a65e888c"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3Dbe4d5107c64dc3d7c57e3797e1a0674b"
>
>     =C2=A0DEPENDS =3D "openssl"
>     =C2=A0DEPENDS_append_class-target =3D " nodejs-native"
>     @@ -18,16 +18,14 @@ COMPATIBLE_HOST_riscv32 =3D "null"
>     =C2=A0SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz=

>     <http://nodejs.org/dist/v$%7BPV%7D/node-v$%7BPV%7D.tar.xz> \
>     file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
>     file://0003-Install-both-binaries-and-use-libdir.patch \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Make-compatib=
ility-with-gcc-4.8.patch \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-v8-don-t-over=
ride-ARM-CFLAGS.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-v8-don-t-over=
ride-ARM-CFLAGS.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     =C2=A0SRC_URI_append_class-target =3D " \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Using-native-=
torque.patch \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Link-atomic-l=
ibrary.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Using-native-=
binaries.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     -SRC_URI[md5sum] =3D "d5a56d0abf764a91f627f0690cd4b9f3"
>     -SRC_URI[sha256sum] =3D
>     "412667d76bd5273c07cb69c215998109fd5bb35c874654f93e6a0132d666c58e"
>     +SRC_URI[md5sum] =3D "6762f5629f6f68fb9bdf83a741cba038"
>     +SRC_URI[sha256sum] =3D
>     "088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71"
>
>     =C2=A0S =3D "${WORKDIR}/node-v${PV}"
>
>     @@ -129,9 +127,13 @@ do_install_append_class-native() {
>     =C2=A0 =C2=A0 =C2=A0# npm-cli.js continues to use old shebang
>     =C2=A0 =C2=A0 =C2=A0sed "1s^.*^#\!/usr/bin/env node^g" -i
>     ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
>
>     -=C2=A0 =C2=A0 # Install the native torque to provide it within sys=
root for
>     the target compilation
>     +=C2=A0 =C2=A0 # Install the native binaries to provide it within s=
ysroot
>     for the target compilation
>     =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}
>     =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/out/Release/torque ${D}${b=
indir}/torque
>     +=C2=A0 =C2=A0 install -m 0755
>     ${S}/out/Release/bytecode_builtins_list_generator
>     ${D}${bindir}/bytecode_builtins_list_generator
>     +=C2=A0 =C2=A0 install -m 0755 ${S}/out/Release/gen-regexp-special-=
case
>     ${D}${bindir}/gen-regexp-special-case
>     +=C2=A0 =C2=A0 install -m 0755 ${S}/out/Release/mkcodecache
>     ${D}${bindir}/mkcodecache
>     +=C2=A0 =C2=A0 install -m 0755 ${S}/out/Release/node_mksnapshot
>     ${D}${bindir}/node_mksnapshot
>     =C2=A0}
>
>     =C2=A0do_install_append_class-target() {
>     --=20
>     2.20.1
>
>     --=20
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


--------------ms080603090204030001090707
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCCN8w
ggRRMIIDOaADAgECAgUAhSjNXzANBgkqhkiG9w0BAQsFADBJMQswCQYDVQQGEwJGUjEUMBIGA1UE
CgwLU1RPUk1TSElFTEQxJDAiBgNVBAMMG1N0b3Jtc2hpZWxkIFVzZXJzIEF1dGhvcml0eTAeFw0x
OTAyMTMxMDU5MzdaFw0yMDAyMTMxMDU5MzdaMGwxCzAJBgNVBAYTAkZSMRQwEgYDVQQKDAtTVE9S
TVNISUVMRDEYMBYGA1UEAwwPR3VpbGxhdW1lIEJVUkVMMS0wKwYJKoZIhvcNAQkBFh5ndWlsbGF1
bWUuYnVyZWxAc3Rvcm1zaGllbGQuZXUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC1
7PELOFVAK/oOfoI0VT8UgGMO6/qZOj+7W6wWTzeLcwWVd7k8rBcKFNIbz104ssftXDUksEqWzmRq
5f9ZbiBxCYWZjz5NM/jpdSbD9UH2gnjUIUXrN3vX6hQoiedc16RZO23wibrjCMG0C7Jk7/GYYjvX
V0tCwnN1huT1pBz0OSbXds5EifTsQloVujRuLphYhZf0xEW25lLGsOQcZMu8SXgxAvsgQu/DftSn
pshK6oxl+7YLfermoUiEXrI6t9W1SrSNZ1aDHBcV/qgDpOSnetOtDJ3gsnJS0DjJd3p7Mr1+3oat
W0kV1GDJiSa4/Q80+5ztIPhVwpmMv0TBk5T5AgMBAAGjggEbMIIBFzAdBgNVHQ4EFgQULuK76AKT
oZWT37xSGps4a5xhwbEwHwYDVR0jBBgwFoAUoW2EbKKAhQV8fHV1gDTBE1uX14EwCQYDVR0TBAIw
ADAOBgNVHQ8BAf8EBAMCA+gwEQYJYIZIAYb4QgEBBAQDAgSwMB0GA1UdJQQWMBQGCCsGAQUFBwME
BggrBgEFBQcDAjBKBgNVHR8EQzBBMD+gPaA7hjlodHRwczovL3BraS5uZXRhc3EuY29tL2F1dGgv
Y2VydGlmaWNhdGVyZXZvY2F0aW9ubGlzdC5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMCkGA1UdEQQi
MCCBHmd1aWxsYXVtZS5idXJlbEBzdG9ybXNoaWVsZC5ldTANBgkqhkiG9w0BAQsFAAOCAQEAO18T
Sm7VJOmO7gm5tjiuIye3ZLTBD9wN579+cjf1TUowthF0M+OYoKXY3HA/i5rNttNru1L/+Faw0cVS
tQVXs2QeoOzHxqF7YbDvPQOB5f0CyeO78HQEWr7020V0FVK/PJSvkVbNlrbSaf+RAM5VgguGxZrW
qzwclNIhgBVxKcJrUiBE0eJ62zwflrnfnhUbfCuKwlK3C1LM9rkFduFQGihW7uNEY6ycLnldKt7Q
rfwflMwLZqnPm5pI8Kg4tTe496Us1ewL33AKY5kJAPZpH573U2rfMhBorsXvZ5tggKZCQ+UGClAU
VpSDYefKXshPB4INQKZIXHojf/S4USPrpDCCBIYwggJuoAMCAQICBQDbzPDtMA0GCSqGSIb3DQEB
CwUAMEgxCzAJBgNVBAYTAkZSMRQwEgYDVQQKDAtTVE9STVNISUVMRDEjMCEGA1UEAwwaU3Rvcm1z
aGllbGQgUm9vdCBBdXRob3JpdHkwHhcNMTQwOTA0MTUwNzEwWhcNMjQwOTAxMTUwNzEwWjBJMQsw
CQYDVQQGEwJGUjEUMBIGA1UECgwLU1RPUk1TSElFTEQxJDAiBgNVBAMMG1N0b3Jtc2hpZWxkIFVz
ZXJzIEF1dGhvcml0eTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMKHBaAL/pVYovuO
BYjd4DaxW9F07C4dxexEABdVZ2UwLTKCDu7jkTvwaECel2XxBsi7vH9DbM6roq22ynAMQiOSgwtN
meAsuUaNglk9+5KgLqGX1Hu9F3l/wWG7e/TFD/u/MpjPgLzfogYKuTfWCas87QfR/GTLEIx+GhNP
O57ehdbUiyZDAKs4867ZjzZAA0OFuJ9YuMhYl62ePnxhEpHzYoGzcWVurG2nSaL34izAy8IJFKhP
45EHvcKXpRG3tCbsFwP6qeQn27CVQL3h0iVPaFfjJtj/D+ywDXsTDjXx+DJEJZBfOCNmBn9dRzDZ
Y/10iCADs+D5z/F5E4kfXO8CAwEAAaN2MHQwHQYDVR0OBBYEFKFthGyigIUFfHx1dYA0wRNbl9eB
MB8GA1UdIwQYMBaAFLhCqfpnRPB/02GM7KXHUK60veyjMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0P
AQH/BAQDAgEGMBEGCWCGSAGG+EIBAQQEAwIBBjANBgkqhkiG9w0BAQsFAAOCAgEAToL3OS3Ynp0+
bYotvNFLqsEhhk0WLRfn2Dd6RDZJzhRayr4HcvzqPnGdBJGcgz8MpXX5DZQdtT+qyHhy2jZ/BNXp
X5onTtW79skTWsA3gAjhXbrK1/tWgFwGNVkmrykc4yn8bZ5AfsXXGrOaXrwOkqS7rppRqWRwL0gz
zabsBbdgDK8OhgQByG/irIvyqFUsunos2u7xk6EwQuFktaXi6XD9IUMyFwFLojjALqJyPvUwsZKu
vrW8yS0x3BD4IYVDnPkltrEzrVWDMprLz6CXD7FNumeK2sN+GTMezZ93A466ve+02c2yt0FaJg+x
4naThUYPui/mQhNBlySZnIX9X4iv/9qAlAZW7CENkJeBc6+uN74Utinu1D2mBK8tuW6HUD7LB/Ie
cUjifq1nL1IPcwgOBZHgrAUszVCa3c1Bvfa2Sr1WbSNRxBcV9udYosD2SvDebw2YKqEvk/Ol856B
g5zRAlZ8xBqbF5bFcwuTq4qKxL//5Wp+kJrknHne370Oag3X6hviM6ms9pfq18EGvl2NqHbLM8aM
cQHnZWBZfEgX2UIzbPtDD7MVvY8h015KMiQ0QWD/WisoABrmBBcBDKc3YnsT5ot/ZcuEdxLS/73K
iKw8TD35NvkXW5CH6DNgPklRRhxhadydfyA/yTpf4XmZD/zUig0v8h6PEmDL8ugxggMgMIIDHAIB
ATBSMEkxCzAJBgNVBAYTAkZSMRQwEgYDVQQKDAtTVE9STVNISUVMRDEkMCIGA1UEAwwbU3Rvcm1z
aGllbGQgVXNlcnMgQXV0aG9yaXR5AgUAhSjNXzANBglghkgBZQMEAgEFAKCCAZ8wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwMTIxMTEwMjEzWjAvBgkqhkiG9w0B
CQQxIgQgjUK7bO0lXmk9ljaZtzG/wus0usthDTQTXWthuxoI21cwYQYJKwYBBAGCNxAEMVQwUjBJ
MQswCQYDVQQGEwJGUjEUMBIGA1UECgwLU1RPUk1TSElFTEQxJDAiBgNVBAMMG1N0b3Jtc2hpZWxk
IFVzZXJzIEF1dGhvcml0eQIFAIUozV8wYwYLKoZIhvcNAQkQAgsxVKBSMEkxCzAJBgNVBAYTAkZS
MRQwEgYDVQQKDAtTVE9STVNISUVMRDEkMCIGA1UEAwwbU3Rvcm1zaGllbGQgVXNlcnMgQXV0aG9y
aXR5AgUAhSjNXzBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAEMwNQdEGAf5iNe/LntRduBX4KBdHzuRGxe7rm+DWqOm
yMw5M9MYN670+qpMausIZTB8iUW5Pd4feO7ijUIDHskxUav5Q1G3RHhhlJjc19p2aJSIO+K13ohM
06qCoDrAeA/TCANOjRWar5YhtJTZLgrUWicusQINhcFzUHtvK0OoOa9n4dUbolUr7ZQzi6qnhahU
5FA4gtTrrYqE3UleHA8p02+y+fFzAzmoLhgT+e7m1IWMcqrvoatk4cT+pIHLiLqcsfyylTuBxIte
Nc78xEXAqc+E+X3ioz5ZLsFRk8HuRbONTVTe+uckLMN9f1i9QjMK50TLaO/wXi/EKX4bBkkAAAAA
AAA=

--------------ms080603090204030001090707--
