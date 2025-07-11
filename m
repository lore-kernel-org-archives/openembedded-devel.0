Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA5FC83F21
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 13:38:58 +0000 (UTC)
Received: from 6.mo550.mail-out.ovh.net (6.mo550.mail-out.ovh.net [46.105.43.205])
 by mx.groups.io with SMTP id smtpd.web11.14004.1752241068967605243
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 06:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: non.se.com, ip: 46.105.43.205, mailfrom: louis.rannou@non.se.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.110.54.226])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bdt7b2jhXz6Mgc
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:37:47 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6xttd (unknown [10.111.182.110])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9CF0280275;
	Fri, 11 Jul 2025 13:37:46 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-5b5ff79f4f-6xttd with ESMTPSA
	id s0eDDakTcWhF9gAAXrHVog:T2
	(envelope-from <louis.rannou@non.se.com>); Fri, 11 Jul 2025 13:37:46 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002a2b992ed-b859-428d-9293-3ea301577e60,
                    DDE15C1AE4D89EF56E8A045C747050460A524665) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: "Louis Rannou" <louis.rannou@non.se.com>
To: openembedded-devel@lists.openembedded.org
Cc: pascal.eberhard@se.com,
	louis.rannou@non.se.com
Subject: [meta-networking][PATCH 1/1] mosquitto: bump to 2.0.21
Date: Fri, 11 Jul 2025 15:37:33 +0200
Message-ID: <20250711133735.211734-2-louis.rannou@non.se.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711133735.211734-1-louis.rannou@non.se.com>
References: <20250711133735.211734-1-louis.rannou@non.se.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1417226511747924289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehnohhnrdhsvgdrtghomheqnecuggftrfgrthhtvghrnhepudetfffhgeffkeejvddtjeeftdeuveevleelteeggfdvjeegteetueevgfdtuefhnecuffhomhgrihhnpedvtddrsggspddvuddrsggspdhgihhthhhusgdrtghomhdpmhhoshhquhhithhtohdrohhrghenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehlohhuihhsrdhrrghnnhhouhesnhhonhdrshgvrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118452

Upgrade to mosquitto 2.0.21. Update the patch status for issue 2895 and c=
reate a
new patch for an issue introduced in 2.0.19 which causes connections to g=
et down
when the clock is changed.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 .../mosquitto/files/2895.patch                |  2 +-
 .../mosquitto/files/3238.patch                | 25 +++++++++++++++++++
 ...osquitto_2.0.20.bb =3D> mosquitto_2.0.21.bb} |  3 ++-
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/=
3238.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.=
bb =3D> mosquitto_2.0.21.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.pa=
tch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
index 853f881754..4c39a290b0 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Mosquitto now waits for network-online w=
hen starting
=20
 See: https://github.com/eclipse/mosquitto/issues/2878
 ---
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/eclipse-mosquitto/mosquit=
to/pull/2895]
=20
  service/systemd/mosquitto.service.simple | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/3238.pa=
tch b/meta-networking/recipes-connectivity/mosquitto/files/3238.patch
new file mode 100644
index 0000000000..89795f4cd9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/3238.patch
@@ -0,0 +1,25 @@
+From 2cb8129793b54de7c68efe1a4a8e91c788077a8e Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Thu, 1 May 2025 11:58:23 +0100
+Subject: [PATCH] Fix incorrect reference clock being selected on startup=
 on
+ Linux.
+
+Closes #3238. Thanks to Eric Guin and karlri.
+Closes #3168.
+---
+Upstream-Status: Backport 2.0.22
+ src/mosquitto.c | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/mosquitto.c b/src/mosquitto.c
+index ff83ef3da..2aea55237 100644
+--- a/src/mosquitto.c
++++ b/src/mosquitto.c
+@@ -465,6 +465,7 @@ int main(int argc, char *argv[])
+ #endif
+ 	struct mosquitto *ctxt, *ctxt_tmp;
+=20
++	mosquitto_time_init();
+ #if defined(WIN32) || defined(__CYGWIN__)
+ 	if(argc =3D=3D 2){
+ 		if(!strcmp(argv[1], "run")){
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0=
.20.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.=
bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.=
20.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21=
.bb
index 75aaf7cf38..dcbcbadd59 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
@@ -17,9 +17,10 @@ DEPENDS =3D "uthash cjson"
 SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
            file://2895.patch \
+           file://3238.patch \
 "
=20
-SRC_URI[sha256sum] =3D "ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a781=
2e19f068f2759de8"
+SRC_URI[sha256sum] =3D "7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f6=
88ba33db857b899d"
=20
 inherit systemd update-rc.d useradd cmake pkgconfig
=20
--=20
2.50.0


