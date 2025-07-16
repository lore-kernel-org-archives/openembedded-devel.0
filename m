Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E937FC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:13:54 +0000 (UTC)
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
 by mx.groups.io with SMTP id smtpd.web10.17930.1752656909220140622
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=OAbEOI8H;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.18, mailfrom: jeroen@myspectrum.nl)
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4bhqwV211qzkQMbm;
	Wed, 16 Jul 2025 11:08:26 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission5.mail.transip.nl (Postfix) with ESMTPSA id 4bhqwR08JQz34SDnm;
	Wed, 16 Jul 2025 11:08:23 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id D887C2011B;
	Wed, 16 Jul 2025 09:08:20 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 16 Jul 2025 11:08:19 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Jeroen Hofstee <jhofstee@victronenergy.com>,
	Mark Bath <mark@baggywrinkle.co.uk>
Subject: [oe] [meta-networking][PATCH v2] tailscale: add initial recipe for v1.84.3
Date: Wed, 16 Jul 2025 11:07:50 +0200
Message-ID: <20250716090751.2360610-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1752656903; h=from:subject:to:cc:date:
 mime-version; bh=EkV+reNbf3zY6l0DD5ZmqVceNyUGA8/PD/IazjTzseQ=;
 b=OAbEOI8HbriAnT5KYKyQdIm//duGb417r+gZhiPVyi/kTOP0qpf6tDuAiwcpQ6zuYmqHqg
 L8TA1Yq8zJ1CdRjyhp9VMSMhqgS8dtsN2H1CE+qjts6ldh4+mTEI53Ckr4FDaWvf/VmYqU
 ZzqM+unKoYpmOlAryyYkVkDRr1gizRuKqgO/FRVab397wXa7/S7aCUwm1RqRUbSYnKH+kX
 t4X/irBtdDJrT3KRHvgV78MAYnZK84JfK1A7psf63+e8O8AWHa+qDlseZeI8mYNjReYugm
 zLBzPnnpvPzah9u8AzM27qVjoAAroyK+Wn56n7JgfxMVBn9Tmlwse8eLRGlnQQ==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 09:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118592

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Tailscale is a mesh VPN built on the WireGuard protocol.
On the client side, it includes a node agent (tailscaled)
and a client application for configuration (tailscale).
These components can be bundled into a single binary for
a more smaller total size, which is done in this recipe.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Mark Bath <mark@baggywrinkle.co.uk>
---

First of all, I am not familiar with go. This is the first time we intend
to use it. Since there wasn't a go-mods generator only a GO_IMPORT, at le=
ast
that I could find, I wrote a script / bbclass to generate them as well, l=
ike
the go-mod-update-modules.bbclass which is now in openembeddded-core. Unl=
ike
the `go list` I use `go compile`, since the former seems to report far mo=
re
modules then needed to just install for tailscale. For testing / comparin=
g I
put that code at [1]. The format should be compatible though with the
go-mod-update-modules.bbclass, it will just add more modules, which don't
seem to be needed for tailscale.

[1] https://github.com/jhofstee/meta-jhofstee

v2:

Explicitly enable PACKAGECONFIG options. The recipe assumed tailscale wou=
ld
be build with all options by defaults, and only added e.g. ts_omit_aws et=
c.
This turnes out to not always be the case, so add ts_aws etc as well to
explicitly included them. This also make sure the dependencies aren't
ommitted in the modules file.

Replace ${GOOS}_${GOARCH} with ${GO_BUILD_BINDIR},

Reorder variables to according to the "Recipe Style Guide".

Add a default file so tailscaled arguments can be provided.
---
 .../tailscale/files/default                   |  2 +
 .../tailscale/files/tailscaled.init           | 68 +++++++++++++++
 .../tailscale/tailscale-go-mods.inc           | 83 ++++++++++++++++++
 .../tailscale/tailscale-licenses.inc          | 85 +++++++++++++++++++
 .../tailscale/tailscale_1.84.3.bb             | 70 +++++++++++++++
 5 files changed, 308 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/tailscale/files/=
default
 create mode 100644 meta-networking/recipes-connectivity/tailscale/files/=
tailscaled.init
 create mode 100644 meta-networking/recipes-connectivity/tailscale/tailsc=
ale-go-mods.inc
 create mode 100644 meta-networking/recipes-connectivity/tailscale/tailsc=
ale-licenses.inc
 create mode 100644 meta-networking/recipes-connectivity/tailscale/tailsc=
ale_1.84.3.bb

diff --git a/meta-networking/recipes-connectivity/tailscale/files/default=
 b/meta-networking/recipes-connectivity/tailscale/files/default
new file mode 100644
index 0000000000..0ce8b92e52
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tailscale/files/default
@@ -0,0 +1,2 @@
+# tailscaled arguments, e.g. use "-statedir /data/.." to point to persis=
tent storage
+ARGS=3D""
diff --git a/meta-networking/recipes-connectivity/tailscale/files/tailsca=
led.init b/meta-networking/recipes-connectivity/tailscale/files/tailscale=
d.init
new file mode 100644
index 0000000000..8b7552543c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tailscale/files/tailscaled.ini=
t
@@ -0,0 +1,68 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          tailscaled
+# Required-Start:    $network $local_fs
+# Required-Stop:     $network $local_fs
+# Default-Start:     3 4 5
+# Default-Stop:      0 1 2 6
+# Short-Description: Tailscale node agent
+# Description:       Start the Tailscale daemon.
+### END INIT INFO
+
+PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
+DAEMON=3D/usr/sbin/tailscaled
+PIDFILE=3D/var/run/tailscaled.pid
+NAME=3Dtailscaled
+DESC=3D"Tailscale node agent"
+
+test -x $DAEMON || exit 0
+
+set -e
+
+. /etc/init.d/functions
+
+if [ -f /etc/default/tailscaled ] ; then
+    . /etc/default/tailscaled
+fi
+
+delay_stop() {
+    count=3D0
+    while [ $count -lt 9 ] ; do
+        if pidof $DAEMON >/dev/null; then
+            sleep 1
+        else
+            return 0
+        fi
+        count=3D$(expr $count + 1)
+    done
+    echo "Failed to stop $DESC."
+    return 1
+}
+
+case "$1" in
+    start)
+        echo -n "starting $DESC: $NAME... "
+        start-stop-daemon --start --background --make-pidfile --pidfile =
$PIDFILE \
+                --exec $DAEMON -- $ARGS
+        echo "done."
+        ;;
+    stop)
+        echo -n "stopping $DESC: $NAME... "
+        start-stop-daemon --stop --pidfile $PIDFILE
+        echo "done."
+        ;;
+    restart)
+        $0 stop
+        delay_stop && $0 start
+        ;;
+    status)
+        status $DAEMON
+        exit $?
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|status}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-go-=
mods.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mo=
ds.inc
new file mode 100644
index 0000000000..3cfea84a55
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.in=
c
@@ -0,0 +1,83 @@
+SRC_URI +=3D " \
+    gomod://filippo.io/edwards25519;version=3Dv1.1.0;sha256sum=3D9ac43a6=
86d06fdebd719f7af3866c87eb069302272dfb131007adf471c308b65 \
+    gomod://github.com/anmitsu/go-shlex;version=3Dv0.0.0-20200514113438-=
38f4b401e2be;sha256sum=3D2a5cf7c9a2709f649fd508cbacb2be96e4fba4d534a28a12=
2ee4d7574af40b5e \
+    gomod://github.com/aws/aws-sdk-go-v2;version=3Dv1.36.0;sha256sum=3De=
c276e274bbe39c35d3c2c8c1ec5cba494d6449cd8166d741676cdf0a9d1697b \
+    gomod://github.com/aws/aws-sdk-go-v2/config;version=3Dv1.29.5;sha256=
sum=3Dce165d37c7b1dfee2047137f1176c197dc397a5553ef6fc0dba799b21908475b \
+    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=3Dv1.17.58;=
sha256sum=3D238cc4a98dde7bc3e94dc0f0005c4d988a244daaa9fe4fda706a781ec62bf=
7e2 \
+    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=3Dv1.1=
6.27;sha256sum=3D408958244a10036461c3a3b27fcdaf20efa3af19168bd527b6617319=
a754309c \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=3D=
v1.3.31;sha256sum=3D7929b44beec37b00c9ee5269b0f109d7ccc2bb26a8528ab14e0f1=
72076a41205 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=3D=
v2.6.31;sha256sum=3D6ae31e302c828ecf80310e85059c49ce44668b8c62aa52fa964b0=
d745a6f62b1 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/ini;version=3Dv1.8.2;s=
ha256sum=3D53d1a9a401283711118c91e6e9fdb8193ce6430ca4bbe6b5454bcaaa51e81d=
e0 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encodin=
g;version=3Dv1.12.2;sha256sum=3D6ab252b3b962a6b34f0107583f6ff8e4a68e02dcd=
8df9573e895e5ca60ff139c \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;=
version=3Dv1.12.12;sha256sum=3Da92f4383630fa976eeb484b051a6224a8d1d277c4b=
3ca93a40cce57d06cbbec2 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssm;version=3Dv1.44.7;s=
ha256sum=3De09b97aa37ffd7c003a8a2e7574668e92eabd267d2a78d22fb440bcd93a61e=
46 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=3Dv1.24.14;=
sha256sum=3D9196a430068584c9d1e621aff0a45b32adaf190b4363dddda8b341901e188=
f51 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=3Dv1.28=
.13;sha256sum=3Dacaeca3476410d64512a4d9feefd6c8d16effa76718f72db4ba7b786c=
7fcc398 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=3Dv1.33.13;=
sha256sum=3D1800e76ad35287ca7067374b7489ebd7f1d25426c93ae9e40fd73e2a78f29=
e75 \
+    gomod://github.com/aws/smithy-go;version=3Dv1.22.2;sha256sum=3De5701=
b5798a3ff01b7139ec07e5bc2010f76cab82523e8989602003d61d82324 \
+    gomod://github.com/coder/websocket;version=3Dv1.8.12;sha256sum=3Dad8=
d323970c04679f4566ee7db98946508c37cdd21a46a875d5257d631a9e990 \
+    gomod://github.com/coreos/go-iptables;version=3Dv0.7.1-0.20240112124=
308-65c67c9f46e6;sha256sum=3D6d0ae6344f1d355f72e6aaba583ce73822861511337c=
a92cc1c4727fc8ba66dd \
+    gomod://github.com/creack/pty;version=3Dv1.1.23;sha256sum=3D2151b712=
1020954864de83eacf854634866cca0a3bfe33a2ebffa2edebc25df3 \
+    gomod://github.com/digitalocean/go-smbios;version=3Dv0.0.0-201809071=
43718-390a4f403a8e;sha256sum=3D2bc498a09aa55b3417bebacce448b2d2ab757981e5=
9b6b016d08cf97e4a7bdde \
+    gomod://github.com/djherbis/times;version=3Dv1.6.0;sha256sum=3D21d69=
060967bc03ea3c39ff8c0b1a95511e96eccd3749a2daef1a02af1bc0a85 \
+    gomod://github.com/fxamacker/cbor/v2;version=3Dv2.7.0;sha256sum=3Db4=
8771460405bab6896c85e21ebc5ff287d4018c6db5c8d822c55769c80dde03 \
+    gomod://github.com/gaissmai/bart;version=3Dv0.18.0;sha256sum=3D566f2=
401988b2536055d87f6851ea596518377ee4592176375b84a5ca791fc77 \
+    gomod://github.com/go-json-experiment/json;version=3Dv0.0.0-20250223=
041408-d3c622f1b874;sha256sum=3D96edf3942a5665ff2b27f0da4586e2602fe4816dc=
31e184d3bcd6fbf4cdb13e4 \
+    gomod://github.com/godbus/dbus/v5;version=3Dv5.1.1-0.20230522191255-=
76236955d466;sha256sum=3D262f43ec87570238a0e770e7fa656dda70fe6050a7edf5ad=
dc30287cb64b21a6 \
+    gomod://github.com/golang/groupcache;version=3Dv0.0.0-20210331224755=
-41bb18bfe9da;sha256sum=3Db27034e8fc013627543e1ad098cfc65329f2896df3da5cf=
3266cc9166f93f3a5 \
+    gomod://github.com/google/btree;version=3Dv1.1.2;sha256sum=3Dfaee855=
0c5fffb4ae1dadde5ccaccb13298726f9fad226bb4eed0c03c90a481d \
+    gomod://github.com/google/go-tpm;version=3Dv0.9.4;sha256sum=3Da8a5e5=
04fbd78284a50e6ab625f6248cfbb89421fafdfee71d66abc6e1dfc192 \
+    gomod://github.com/google/nftables;version=3Dv0.2.1-0.20240414091927=
-5e242ec57806;sha256sum=3Dceb96b39a6f9004d8c217a6ae61b91a69c250bc30fbf3a0=
4cd87cbbfddea73c8 \
+    gomod://github.com/gorilla/csrf;version=3Dv1.7.3;sha256sum=3D39923b0=
dde0b8be30d3572589a8cc2ea515ca36a3e542269645db36aff7d6842 \
+    gomod://github.com/gorilla/securecookie;version=3Dv1.1.2;sha256sum=3D=
fd7c0de7000c2e6a123d73e1249e1dce892ba29d2d03b00dc81d5fcee41d5895 \
+    gomod://github.com/hdevalence/ed25519consensus;version=3Dv0.2.0;sha2=
56sum=3D111cafade3ba9c7c3adf66b6a424386e30829c46c60b80dabe288e1837d30e33 =
\
+    gomod://github.com/illarion/gonotify/v3;version=3Dv3.0.2;sha256sum=3D=
fef3e17f676c8ce98b60f0e2180fc4e3331e6e1604eaf96ab8791e073f96a7af \
+    gomod://github.com/insomniacslk/dhcp;version=3Dv0.0.0-20231206064809=
-8c70d406f6d2;sha256sum=3Dbe28971fb642a9c4cf9f16e07332310af05c291584b6440=
b32849ca058dd345d \
+    gomod://github.com/jellydator/ttlcache/v3;version=3Dv3.1.0;sha256sum=
=3D278dfc9b4882eaeb9b56e925b574028f3e9cc4436645b93f56ccb69de134a898 \
+    gomod://github.com/jmespath/go-jmespath;version=3Dv0.4.0;sha256sum=3D=
d1f77b6790d7c4321a74260f3675683d3ac06b0a614b5f83e870beae0a8b2867 \
+    gomod://github.com/jsimonetti/rtnetlink;version=3Dv1.4.0;sha256sum=3D=
81625291f4d0a08718dfd2170873d1adfd8fc2248657584f520c4de6de9e2e4d \
+    gomod://github.com/kballard/go-shellquote;version=3Dv0.0.0-201804280=
30007-95032a82bc51;sha256sum=3Dae4cb7b097dc4eb0c248dff00ed3bbf0f36984c416=
2ad1d615266084e58bd6cc \
+    gomod://github.com/klauspost/compress;version=3Dv1.17.11;sha256sum=3D=
88dea800cc6a11ccb9dd2f0dd487f30e8701870abdfc11245e41dcfc9f3d428e \
+    gomod://github.com/kortschak/wol;version=3Dv0.0.0-20200729010619-da4=
82cc4850a;sha256sum=3D09c15500a0ef54af0796f37282dd5377d2b866e4c36c87dcb6b=
2894cf3114dc5 \
+    gomod://github.com/kr/fs;version=3Dv0.1.0;sha256sum=3Dd376bd98e81aea=
34585fc3b04bab76363e9e87cde69383964e57e9779f2af81e \
+    gomod://github.com/mattn/go-colorable;version=3Dv0.1.13;sha256sum=3D=
08be322dcc584a9fcfde5caf0cf878b4e11cd98f252e32bc704e92c5a4ba9d15 \
+    gomod://github.com/mattn/go-isatty;version=3Dv0.0.20;sha256sum=3Df2d=
5f89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc \
+    gomod://github.com/mdlayher/genetlink;version=3Dv1.3.2;sha256sum=3D0=
924e7da370fdb2e7bea20fdde519ae37377db35500cd0aaf09769eddb314e19 \
+    gomod://github.com/mdlayher/netlink;version=3Dv1.7.3-0.2025011317195=
7-fbb4dce95f42;sha256sum=3Db427c8c746e87c2f8033678fb87cdcf5cefb21ce16f359=
30eff91683661395f0 \
+    gomod://github.com/mdlayher/sdnotify;version=3Dv1.0.0;sha256sum=3D26=
f4efbcba73eaec323973c8ae335bad430e5d6947097976cfbe7c9547f68c90 \
+    gomod://github.com/mdlayher/socket;version=3Dv0.5.0;sha256sum=3D9316=
26341956178fe6015b128fdda22283480d05dc964675307eb61ed39c29fe \
+    gomod://github.com/miekg/dns;version=3Dv1.1.58;sha256sum=3D179bd419d=
011fd90802355756f59fff70ddf9a5886a4db6336a6d05783552b16 \
+    gomod://github.com/mitchellh/go-ps;version=3Dv1.0.0;sha256sum=3Df2f0=
400b1d5e136419daed275c27a930b0f5447ac12bb8acd3ddbe39547b2834 \
+    gomod://github.com/peterbourgon/ff/v3;version=3Dv3.4.0;sha256sum=3Db=
49537268ce67eb755d773fdd2a3e1c9c6dec0731993a4f742080416eb9b12a6 \
+    gomod://github.com/pierrec/lz4/v4;version=3Dv4.1.21;sha256sum=3Dbd2e=
8ef13800ca42205b0d4085a927a6d012b82cfa831769be4830036e953bec \
+    gomod://github.com/pkg/sftp;version=3Dv1.13.6;sha256sum=3D0cdf6bd0ed=
ef9db8137ce398c9bbe514713e42cf2d4d415b5025f4a3c33f249d \
+    gomod://github.com/safchain/ethtool;version=3Dv0.3.0;sha256sum=3Dbfa=
1a3fe314a3f2ac4c4385a6c4694708e4881bfd86c34668eca92656e398590 \
+    gomod://github.com/skip2/go-qrcode;version=3Dv0.0.0-20200617195104-d=
a1b6568686e;sha256sum=3D3fc1c4d11c79001d1cc2df0de87493b324b9af141cc59ae8c=
212612dd2c90e90 \
+    gomod://github.com/tailscale/goupnp;version=3Dv1.0.1-0.2021080401121=
1-c64d0f06ea05;sha256sum=3D1c7ed6ecc16b6f402c225bae88a067a8bc1574cded8946=
38b820c5da751823cc \
+    gomod://github.com/tailscale/hujson;version=3Dv0.0.0-20221223112325-=
20486734a56a;sha256sum=3D8e65bacebfc0a1edc067fd97f839fcfeb93c1e7b8cc0186d=
1773cff4e125d9d5 \
+    gomod://github.com/tailscale/netlink;version=3Dv1.1.1-0.202408222030=
06-4d49adab4de7;sha256sum=3Da5195ef600f8d9a0fb8501eea85e4fe0321a74bd57dec=
88f07b8569d0ee4f55e \
+    gomod://github.com/tailscale/peercred;version=3Dv0.0.0-2025010714373=
7-35a0c7bd7edc;sha256sum=3D87d0f4f3b1d59ea45c9a87b775b615bebd721a5870dafe=
dc63cc860ec4aac281 \
+    gomod://github.com/tailscale/web-client-prebuilt;version=3Dv0.0.0-20=
250124233751-d4cd19a26976;sha256sum=3D1d02f0804bb41e0743b7d889b8e2dbd8466=
a89793f03997f4c1fd10f9e8974c3 \
+    gomod://github.com/tailscale/wireguard-go;version=3Dv0.0.0-202503040=
00100-91a0587fb251;sha256sum=3D7b82eb990f2f3686d335cdff5e988f8d4e27e031d5=
63fb0e37bce1a3b0c5a83f \
+    gomod://github.com/tailscale/xnet;version=3Dv0.0.0-20240729143630-84=
97ac4dab2e;sha256sum=3D438abf28ce5fb03adf529c2cb57a451f9b243c4a2a181d9d06=
cdb61bb10960e7 \
+    gomod://github.com/toqueteos/webbrowser;version=3Dv1.2.0;sha256sum=3D=
1227d3ebeab16d8232a304a10b087984a96ad30f7439b6687bab2f5747d308cf \
+    gomod://github.com/u-root/u-root;version=3Dv0.14.0;sha256sum=3Da65c0=
a06236b10a0cea50e603fef0ced0c7e343a66ef957a45ebcd51f304d286 \
+    gomod://github.com/u-root/uio;version=3Dv0.0.0-20240224005618-d2acac=
8f3701;sha256sum=3Df6e8f912e968744999d508c3df54f0308aaf337052a8d0bd3edd72=
583adfd9cd \
+    gomod://github.com/vishvananda/netns;version=3Dv0.0.4;sha256sum=3Dcd=
aebcd80614800a74537e59855730d42393ffc109ebd47e5b8437dcc4d7f429 \
+    gomod://github.com/x448/float16;version=3Dv0.8.4;sha256sum=3D73b24a4=
1037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500 \
+    gomod://go4.org/mem;version=3Dv0.0.0-20240501181205-ae6ca9944745;sha=
256sum=3D9b5037a57122457fdc5c2c0a31e3996b44cf9dfcdee5c53ed72adfd88d077795=
 \
+    gomod://go4.org/netipx;version=3Dv0.0.0-20231129151722-fdeea329fbba;=
sha256sum=3De15f57de368c92b826010181906f26112ba3a0d7fde7d94c8a8c60c525dc4=
044 \
+    gomod://golang.org/x/crypto;version=3Dv0.37.0;sha256sum=3D7ce6b2be21=
be1ce9e04dc784830e08931f09b5903596b8017839322c9e828667 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20250210185358-939b2ce775a=
c;sha256sum=3Dde413a97994a7b97541cb1f867439fa20b60361d79dc35e8e2faf847a2a=
188df \
+    gomod://golang.org/x/net;version=3Dv0.36.0;sha256sum=3De823a351657b3=
49cd8a705079778769534d90a5c3a6c7caed174a79608257d12 \
+    gomod://golang.org/x/oauth2;version=3Dv0.26.0;sha256sum=3Dd4c1bfc661=
b8ff3ccb3d5d30babf5f67798b59e2bfa932b6f1f739e67e45dcda \
+    gomod://golang.org/x/sync;version=3Dv0.13.0;sha256sum=3D4bdaaffe69cc=
7c997cff97cd81dc9c6777777bd311175f100f76b049bbbe7ed9 \
+    gomod://golang.org/x/sys;version=3Dv0.32.0;sha256sum=3D85d47075d21fd=
7ef35d9a47fc73f2356fb3cd2e7fab7f45c874b814bf312127d \
+    gomod://golang.org/x/term;version=3Dv0.31.0;sha256sum=3Dbdeda753791b=
44f6815ccf3367ff57ffaca9bb100bfe8ebe112c8da133e78aec \
+    gomod://golang.org/x/text;version=3Dv0.24.0;sha256sum=3Df585335a57a6=
fa5fa0c0bf319b45f0909e5ff1aba91e8567187ba8e423084c00 \
+    gomod://golang.org/x/time;version=3Dv0.10.0;sha256sum=3D7420a12017bb=
47bd85ccab81f9d1f7a3ff6daf8da768256292bc1dbb3bf9ba63 \
+    gomod://gvisor.dev/gvisor;version=3Dv0.0.0-20250205023644-9414b50a56=
33;sha256sum=3Db373e677e77f28c095b43ed976f5d9ca885d3b1b5407a71a5691e4a47e=
813bd0 \
+    gomod://k8s.io/client-go;version=3Dv0.32.0;sha256sum=3D74ee50d42da26=
3c0743212c17a12f16d8a3283f31f7c9209c6327b6656ac1550 \
+    gomod://sigs.k8s.io/yaml;version=3Dv1.4.0;sha256sum=3Def031ff78ff9b7=
036e174eef49dfbd77468dc4f0afb73a639b61f8ab3a1cc425 \
+    gomod://software.sslmate.com/src/go-pkcs12;version=3Dv0.4.0;sha256su=
m=3D55019a391e5302a51ba62e98909e006224b81207866da90beaf582ec0dee036f \
+"
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-lic=
enses.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-lice=
nses.inc
new file mode 100644
index 0000000000..53d46dd45c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.i=
nc
@@ -0,0 +1,85 @@
+LIC_FILES_CHKSUM +=3D " \
+    file://pkg/mod/filippo.io/edwards25519@v1.1.0/LICENSE;md5=3D5d4950ec=
b7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/anmitsu/go-shlex@v0.0.0-20200514113438-38f=
4b401e2be/LICENSE;md5=3D45a47c50f5b33ff9ab3347c7db1bfb6a;spdx=3DMIT \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.36.0/LICENSE.txt;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.29.5/LICENSE.t=
xt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.17.58/LIC=
ENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.16.2=
7/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v=
1.3.31/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2=
.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2=
.6.31/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.=
0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/ini@v1.8.2/LICE=
NSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-=
encoding@v1.12.2/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presign=
ed-url@v1.12.12/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3D=
Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssm@v1.44.7/LICE=
NSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.24.14/LIC=
ENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.28.13=
/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.33.13/LIC=
ENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/aws/smithy-go@v1.22.2/LICENSE;md5=3D34400b=
68072d710fecd0a2940a0d1658;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/coder/websocket@v1.8.12/LICENSE.txt;md5=3D=
bc0b6f68116166556efe7184edfda3e9;spdx=3DISC \
+    file://pkg/mod/github.com/coreos/go-iptables@v0.7.1-0.20240112124308=
-65c67c9f46e6/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;spdx=3DApach=
e-2.0 \
+    file://pkg/mod/github.com/creack/pty@v1.1.23/LICENSE;md5=3D939580708=
63d769117fa33b129020050;spdx=3DMIT \
+    file://pkg/mod/github.com/digitalocean/go-smbios@v0.0.0-201809071437=
18-390a4f403a8e/LICENSE.md;md5=3Dc1653934903ab2785c09c2bdd7344526;spdx=3D=
Apache-2.0 \
+    file://pkg/mod/github.com/djherbis/times@v1.6.0/LICENSE;md5=3D3cafd1=
41825e7a44b1c6a047b2320012;spdx=3DMIT \
+    file://pkg/mod/github.com/fxamacker/cbor/v2@v2.7.0/LICENSE;md5=3D827=
f5a2fa861382d35a3943adf9ebb86;spdx=3DMIT \
+    file://pkg/mod/github.com/gaissmai/bart@v0.18.0/LICENSE;md5=3D05779e=
437ec35570aca43cc66a95e056;spdx=3DMIT \
+    file://pkg/mod/github.com/go-json-experiment/json@v0.0.0-20250223041=
408-d3c622f1b874/LICENSE;md5=3D9d210c7471ce08e3db5261f33bf8fce6;spdx=3DBS=
D-3-Clause \
+    file://pkg/mod/github.com/godbus/dbus/v5@v5.1.1-0.20230522191255-762=
36955d466/LICENSE;md5=3D09042bd5c6c96a2b9e45ddf1bc517eed;spdx=3DBSD-2-Cla=
use \
+    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20210331224755-41=
bb18bfe9da/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;spdx=3DApache-2=
.0 \
+    file://pkg/mod/github.com/google/btree@v1.1.2/LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/google/go-tpm@v0.9.4/LICENSE;md5=3D3b83ef9=
6387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/google/nftables@v0.2.1-0.20240414091927-5e=
242ec57806/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2=
.0 \
+    file://pkg/mod/github.com/gorilla/csrf@v1.7.3/LICENSE;md5=3Dc30eee78=
985cf2584cded5f89ba3d787;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/gorilla/securecookie@v1.1.2/LICENSE;md5=3D=
c30eee78985cf2584cded5f89ba3d787;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/hdevalence/ed25519consensus@v0.2.0/LICENSE=
;md5=3D4041895a1f717acb5be52e24edb19917;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/illarion/gonotify/v3@v3.0.2/LICENSE;md5=3D=
6b631a3123c7c679195702a8a35c9f21;spdx=3DMIT \
+    file://pkg/mod/github.com/insomniacslk/dhcp@v0.0.0-20231206064809-8c=
70d406f6d2/LICENSE;md5=3Dceaf33b8b657b2d342dbd3bb59578d8a;spdx=3DBSD-3-Cl=
ause \
+    file://pkg/mod/github.com/jellydator/ttlcache/v3@v3.1.0/LICENSE;md5=3D=
4cea77626c625d583c98a85a8658f9d2;spdx=3DMIT \
+    file://pkg/mod/github.com/jmespath/go-jmespath@v0.4.0/LICENSE;md5=3D=
9abfa8353fce3f2cb28364e1e9016852;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/jsimonetti/rtnetlink@v1.4.0/LICENSE.md;md5=
=3D75a8090d4c02945ad9d61c7cce77ed48;spdx=3DMIT \
+    file://pkg/mod/github.com/kballard/go-shellquote@v0.0.0-201804280300=
07-95032a82bc51/LICENSE;md5=3D9d95d1ad917c814c23909addb8692eeb;spdx=3DMIT=
 \
+    file://pkg/mod/github.com/klauspost/compress@v1.17.11/LICENSE;md5=3D=
d0fd9ebda39468b51ff4539c9fbb13a8;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/kortschak/wol@v0.0.0-20200729010619-da482c=
c4850a/LICENSE;md5=3D5a0acdb344844a21e2df8bc2e1fe5f2d;spdx=3DBSD-3-Clause=
 \
+    file://pkg/mod/github.com/kr/fs@v0.1.0/LICENSE;md5=3D591778525c869cd=
de0ab5a1bf283cd81;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/mattn/go-colorable@v0.1.13/LICENSE;md5=3D2=
4ce168f90aec2456a73de1839037245;spdx=3DMIT \
+    file://pkg/mod/github.com/mattn/go-isatty@v0.0.20/LICENSE;md5=3Df509=
beadd5a11227c27b5d2ad6c9f2c6;spdx=3DMIT \
+    file://pkg/mod/github.com/mdlayher/genetlink@v1.3.2/LICENSE.md;md5=3D=
e08504321a9b3e86ee07433c231b33f1;spdx=3DMIT \
+    file://pkg/mod/github.com/mdlayher/netlink@v1.7.3-0.20250113171957-f=
bb4dce95f42/LICENSE.md;md5=3De08504321a9b3e86ee07433c231b33f1;spdx=3DMIT =
\
+    file://pkg/mod/github.com/mdlayher/sdnotify@v1.0.0/LICENSE.md;md5=3D=
a57b2e272a0c75c413c784bb877cda50;spdx=3DMIT \
+    file://pkg/mod/github.com/mdlayher/socket@v0.5.0/LICENSE.md;md5=3Dbd=
cb2fcb7aea8a34d189ef572a59ff88;spdx=3DMIT \
+    file://pkg/mod/github.com/miekg/dns@v1.1.58/LICENSE;md5=3Db5215dfec2=
c591290f399a181669bef7;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/mitchellh/go-ps@v1.0.0/LICENSE.md;md5=3D56=
da355a12d4821cda57b8f23ec34bc4;spdx=3DMIT \
+    file://pkg/mod/github.com/peterbourgon/ff/v3@v3.4.0/LICENSE;md5=3De3=
fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.21/LICENSE;md5=3D09ece=
85f3c312a63b522bfc6ebd44943;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/pkg/sftp@v1.13.6/LICENSE;md5=3D452fc5cc5a9=
127a0e828d73423d45035;spdx=3DBSD-2-Clause \
+    file://pkg/mod/github.com/safchain/ethtool@v0.3.0/LICENSE;md5=3Dfa81=
8a259cbed7ce8bc2a22d35a464fc;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/skip2/go-qrcode@v0.0.0-20200617195104-da1b=
6568686e/LICENSE;md5=3D515c25e1450ede2834397875c18439d4;spdx=3DMIT \
+    file://pkg/mod/github.com/tailscale/goupnp@v1.0.1-0.20210804011211-c=
64d0f06ea05/LICENSE;md5=3D3d7eee8afacfccb446c1ac30289c965d;spdx=3DBSD-2-C=
lause \
+    file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20221223112325-204=
86734a56a/LICENSE;md5=3D073f7ac93b9172ac4e1d258584fc0271;spdx=3DBSD-3-Cla=
use \
+    file://pkg/mod/github.com/tailscale/netlink@v1.1.1-0.20240822203006-=
4d49adab4de7/LICENSE;md5=3D2ade771c7d7211af507864e8dd520529;spdx=3DApache=
-2.0 \
+    file://pkg/mod/github.com/tailscale/peercred@v0.0.0-20250107143737-3=
5a0c7bd7edc/LICENSE;md5=3D94eaeed21686fd9816f57f86b9914071;spdx=3DBSD-3-C=
lause \
+    file://pkg/mod/github.com/tailscale/web-client-prebuilt@v0.0.0-20250=
124233751-d4cd19a26976/LICENSE;md5=3Da672713a9eb730050e491c92edf7984d;spd=
x=3DBSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-202503040001=
00-91a0587fb251/LICENSE;md5=3D995598bc9de2b4c987c2cb87fc24f341;spdx=3DMIT=
 \
+    file://pkg/mod/github.com/tailscale/xnet@v0.0.0-20240729143630-8497a=
c4dab2e/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Claus=
e \
+    file://pkg/mod/github.com/toqueteos/webbrowser@v1.2.0/LICENSE.md;md5=
=3D6072d29ffa4b14338ff8fd68f17f6851;spdx=3DMIT \
+    file://pkg/mod/github.com/u-root/u-root@v0.14.0/LICENSE;md5=3Dbf431b=
f303eaf01f17bef6624d9f2208;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/u-root/uio@v0.0.0-20240224005618-d2acac8f3=
701/LICENSE;md5=3D52bf39fc1e426b6459f5c9a142e5bfbd;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/vishvananda/netns@v0.0.4/LICENSE;md5=3D2ad=
e771c7d7211af507864e8dd520529;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/x448/float16@v0.8.4/LICENSE;md5=3Dde8f8e02=
5d57fe7ee0b67f30d571323b;spdx=3DMIT \
+    file://pkg/mod/go4.org/mem@v0.0.0-20240501181205-ae6ca9944745/LICENS=
E;md5=3Dfa818a259cbed7ce8bc2a22d35a464fc;spdx=3DApache-2.0 \
+    file://pkg/mod/go4.org/netipx@v0.0.0-20231129151722-fdeea329fbba/LIC=
ENSE;md5=3D628df198dc9e033b86b8eedff039ff86;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.37.0/LICENSE;md5=3D7998cb338f8=
2d15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/exp@v0.0.0-20250210185358-939b2ce775ac/L=
ICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.36.0/LICENSE;md5=3D7998cb338f82d1=
5c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.26.0/LICENSE;md5=3D7998cb338f8=
2d15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.13.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.32.0/LICENSE;md5=3D7998cb338f82d1=
5c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.31.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.24.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.10.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DBSD-3-Clause \
+    file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20250205023644-9414b50a5633/=
LICENSE;md5=3Dfbbaf7613c100c84b8f20701859dee2d;spdx=3DMIT+%26+Apache-2.0 =
\
+    file://pkg/mod/k8s.io/client-go@v0.32.0/LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/sigs.k8s.io/yaml@v1.4.0/LICENSE;md5=3Db5d30dd5bc47d1b=
56b678ac06dead1c7;spdx=3DMIT+%26+Apache-2.0+%26+BSD-3-Clause \
+    file://pkg/mod/software.sslmate.com/src/go-pkcs12@v0.4.0/LICENSE;md5=
=3D259f3802525423b1a33efb1b85f64e18;spdx=3DBSD-3-Clause \
+"
+
+LICENSE +=3D " & Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT"
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.8=
4.3.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.84.3.=
bb
new file mode 100644
index 0000000000..25b54ae93a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.84.3.bb
@@ -0,0 +1,70 @@
+SUMMARY =3D "Tailscale client and daemon"
+DESCRIPTION =3D "The easiest, most secure way to use WireGuard and 2FA."
+HOMEPAGE =3D "https://github.com/tailscale/tailscale"
+SECTION =3D "networking"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Da672713a9eb7=
30050e491c92edf7984d"
+require ${BPN}-licenses.inc
+
+MAJOR_MINOR =3D "${@oe.utils.trim_version('${PV}', 2)}"
+SRC_URI =3D "git://github.com/tailscale/tailscale.git;protocol=3Dhttps;b=
ranch=3Drelease-branch/${MAJOR_MINOR};destsuffix=3D${GO_SRCURI_DESTSUFFIX=
} \
+           file://default \
+           file://tailscaled.init \
+           "
+SRCREV =3D "7648989bc54738b1e40dde74fa822984a63cbc05"
+SRCREV_SHORT =3D "${@d.getVar('SRCREV')[:8]}"
+require ${BPN}-go-mods.inc
+
+GO_IMPORT =3D "tailscale.com"
+GO_INSTALL =3D "${GO_IMPORT}/cmd/tailscaled"
+GO_LINKSHARED =3D ""
+GOBUILDFLAGS:prepend =3D "-tags=3D${@','.join(d.getVar('PACKAGECONFIG_CO=
NFARGS').split())} "
+GO_EXTRA_LDFLAGS =3D "-X tailscale.com/version.longStamp=3D${PV}-${SRCRE=
V_SHORT} -X tailscale.com/version.shortStamp=3D${PV}"
+
+inherit go-mod update-rc.d
+
+PACKAGECONFIG ??=3D "aws bird capture cli kube ssh tap wakeonlan"
+PACKAGECONFIG[aws] =3D "ts_aws,ts_omit_aws"
+PACKAGECONFIG[bird] =3D "ts_bird,ts_omit_bird"
+PACKAGECONFIG[capture] =3D "ts_capture,ts_omit_capture"
+PACKAGECONFIG[cli] =3D "ts_include_cli,ts_omit_include_cli"
+PACKAGECONFIG[completion] =3D "ts_completion,ts_omit_completion"
+PACKAGECONFIG[kube] =3D "ts_kube,ts_omit_kube"
+PACKAGECONFIG[ssh] =3D "ts_ssh,ts_omit_ssh"
+PACKAGECONFIG[tap] =3D "ts_tap,ts_omit_tap"
+PACKAGECONFIG[wakeonlan] =3D "ts_wakeonlan,ts_omit_wakeonlan"
+
+INITSCRIPT_PACKAGES =3D "${PN}d"
+INITSCRIPT_NAME:${PN}d =3D "tailscaled"
+INITSCRIPT_PARAMS:${PN}d =3D "defaults 91 9"
+
+# override do_install, since it installs in bin instead of sbin
+do_install() {
+    install -d ${D}/${sbindir}
+    install -m 0755 ${B}/${GO_BUILD_BINDIR}/tailscaled ${D}/${sbindir}/t=
ailscaled
+
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'cli', 'true', 'false', =
d)}" =3D 'true' ]; then
+        install -d ${D}/${bindir}
+        ln -sr ${D}${sbindir}/tailscaled ${D}${bindir}/tailscale
+    fi
+
+    install -d ${D}${sysconfdir}/default
+    install -m 644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/${BPN}=
d
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${UNPACKDIR}/tailscaled.init ${D}${sysconfdir}/i=
nit.d/tailscaled
+    fi
+}
+
+PACKAGES =3D+ "${PN}d"
+
+# mark these as src, since there are bash script etc in there and QA wil=
l complain otherwise
+FILES:${PN}-src +=3D "${libdir}/go/src"
+FILES:${PN}d =3D "${sysconfdir}"
+
+RDEPENDS:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'completion', =
'bash-completion', '', d)}"
+RDEPENDS:${PN}d =3D "iptables"
+
+RRECOMMENDS:${PN}d =3D "kernel-module-wireguard"
--=20
2.43.0


