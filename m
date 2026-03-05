Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26140EF8FF2
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:23:02 +0000 (UTC)
Received: from smtp1.taitradio.net (smtp1.taitradio.net [202.37.96.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37325.1772685235096187994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 20:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: taitcommunications.com, ip: 202.37.96.23, mailfrom: douglas.royds@taitcommunications.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 3D70640430;
	Thu,  5 Mar 2026 16:55:00 +1300 (NZDT)
From: "Douglas Royds" <douglas.royds@taitcommunications.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stanley Stanton <stanley.stanton@taitcommunications.com>,
	Douglas Royds <douglas.royds@taitcommunications.com>
Subject: [meta-java][PATCH] java-library.bbclass: resolve do_deletebinaries race condition
Date: Thu,  5 Mar 2026 16:54:58 +1300
Message-ID: <20260305035459.3561243-1-douglas.royds@taitcommunications.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 09:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124864

From: Stanley Stanton <stanley.stanton@taitcommunications.com>

The do_deletebinaries task is attempting to delete directories created
and destroyed by other bitbake classes such as sstate.bbclass and
create-spdx-2.2.bbclass. If these classes remove their directories
before do_deletebinaries has a chance to delete them, but after they are
found, the following types of errors occur:

Log data follows:
| DEBUG: Executing shell function do_deletebinaries
| find: =E2=80=98/build/tmp/work/x86_64-linux/junit-native/3.8.2/sstate-b=
uild-create_spdx=E2=80=99: No such file or directory
| WARNING: exit code 1 from a shell command.

Rewrite do_deletebinaries such that it is explicitly not looking through
directories that are managed by other bitbake classes, to avoid this
race condition.

Suggested-by:  Douglas Royds <douglas.royds@taitcommunications.com>
Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
---
 classes/java-library.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 67541d2..033d6d4 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -55,10 +55,9 @@ ALTJARFILENAMES =3D "${BPN}.jar"
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
 do_deletebinaries() {
-  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROO=
T_NATIVE}/*" \
-                  -name "*.jar" -exec rm {} \;
-  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROO=
T_NATIVE}/*" \
-                  -name "*.class" -exec rm {} \;
+  dirs_to_search=3D"$(find ${WORKDIR}/* -maxdepth 0 -type d | grep -Ev "=
recipe-sysroot|sstate|spdx")"
+  find $dirs_to_search -name "*.jar" -exec rm {} \;
+  find $dirs_to_search -name "*.class" -exec rm {} \;
 }
=20
 addtask deletebinaries after do_unpack before do_patch
--=20
2.43.0


