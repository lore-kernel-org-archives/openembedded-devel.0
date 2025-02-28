Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C084BC282C6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 02:25:04 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.16958.1740753475266009959
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Feb 2025 06:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=yjCzOLJq;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E0BE59C8950
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 09:37:53 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id cfh-rJiAewnQ; Fri, 28 Feb 2025 09:37:53 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 90D8D9C89DC;
	Fri, 28 Feb 2025 09:37:53 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 90D8D9C89DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1740753473; bh=wpI/qhYMSaJBSzm96FGE36PWk4I6PPKJeoXBSAYo28c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=yjCzOLJqFKL5iRZJPL15f8S7qZirLO7keE2vhWYsemywkCiefFlJUfFt9IVvBk3wC
	 3020lDzmOG9YEhUkKwRHK4l8giqtAU5bOPwRowO51u/9nS7Xwt7rJY6cAaGQQpIiXp
	 TgvRepEerO3CL/179hsdKlclBgO3EW4LnTrLIDTgO+eHJMZCIaR+pB7R4YgH2yFjou
	 mn3fTT4iT4+yt0CDH9H8qdCKIr3XEP4aBq+D/MNvps20r3RliDKGMkbV58sI+WAE1c
	 V6Ou5KZIwHHjE/mNYxkQMDzSo4ay/tqYjbkt5T0rVLi+OPH+3J7oxwOzgmBbGDsDJK
	 vGz6sdjSp8DPg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id zJAgrgheBEc9; Fri, 28 Feb 2025 09:37:53 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 27A569C8950;
	Fri, 28 Feb 2025 09:37:53 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-oe][PATCH] phoronix-test-suite: add missing font
Date: Fri, 28 Feb 2025 15:37:26 +0100
Message-Id: <20250228143726.69944-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 02:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115715

The `ttf-dejavu-sans` font is needed by SVG charts rendered in
phoronix-test-suite PDF reports.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-=
suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-=
test-suite_10.8.4.bb
index 8de3314b3c..7ca80c02af 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_1=
0.8.4.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_1=
0.8.4.bb
@@ -25,6 +25,9 @@ do_install() {
     fi
 }

+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[pdf] =3D ",,,ttf-dejavu-sans"
+
 # It is not advisable to enable these services by default since they can=
 cause
 # continual target reboots if they encounter network problems.
 #
--
2.34.1

