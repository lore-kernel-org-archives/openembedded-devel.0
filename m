Return-Path: <ashcharles@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 93394706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 16:40:53 +0000 (UTC)
Received: by pdno5 with SMTP id o5so26582051pdn.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 08:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5RMl2r7U9tj4uYDRuKw8TtLUZJvqSRVK9kfFVmtUwVM=;
	b=BttTjup65tjJNQ7Axim5nv0cQPePVCnQ32a+hR5hfjFCSuKieX3JoD+IBAd+Mu834u
	6YHnjek+IuCAJBhY+RtMZnG2/nJDc6jUxkBVFAo7Kf4iQ9bSHf6eLoivnqW3Z4DU5Awq
	3QggWSeQ9cYkAvukn3zyGtZl2n9Wdk6NS3gAp7511x35VIsvhi46J+uK3xI9ov6Ef0QJ
	FwWuBID8VXtETz1qmEgzWlWFp5qANoW/r/AYXVHpjt7s0HmNfTfPMFzlHw0xSaaBlqO7
	3UDQCDyWmqjzENW2AiA/RvwqG/gQRhNoZ7W1vCx3gO7VeddnsuwdY6Dm8upXYiG0G1cx
	Hu5Q==
X-Received: by 10.68.242.229 with SMTP id wt5mr20623521pbc.25.1424709654504;
	Mon, 23 Feb 2015 08:40:54 -0800 (PST)
Received: from gumstux.bc.hsia.telus.net (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by mx.google.com with ESMTPSA id x1sm8570245pdl.51.2015.02.23.08.40.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Feb 2015 08:40:54 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Feb 2015 08:40:53 -0800
Message-Id: <1424709653-10906-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] xfce4-session: Remove unneeded pkg_postinst
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Feb 2015 16:40:56 -0000

The pkg_postinst inherited from previous versions of this recipe no
longer seems necessary; no error message seen at runtime in a quick
test.  As it made the generated packages unnecessarily
machine-specific, remove this post-install step. Based on the ensuring
discussion, this supersedes the original patch [1].

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-February/100454.html

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
index 74289fb..aa82a7c 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
@@ -17,11 +17,6 @@ ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
 ALTERNATIVE_PRIORITY_${PN} = "100"
 
-# protect from frightening message that xfce might not work correctly
-pkg_postinst_${PN} () {
-    echo 127.0.0.1    ${MACHINE} >> /etc/hosts
-}
-
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
 PACKAGECONFIG[systemd] = "--enable-systemd, --disable-systemd, polkit, systemd"
 PACKAGECONFIG[consolekit] = ",,,consolekit"
-- 
2.1.0


