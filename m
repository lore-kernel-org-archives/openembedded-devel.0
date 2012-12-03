Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfYif-0006mv-VI
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:18:10 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so2539248obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=GchcEkYhsWh+gBrrm20uGwYE1U2E55zQQhr+zVQC33I=;
	b=MHyayOfnDO2ZT9mW4AUUu4c/5ZWs/6qH8kVrgo+DKeBkYHHdtXwDGcyAvd6izx1sQt
	WyHfmLnkdCr8/EZdhEWYy7ulgBpCEuUCoI8IqAjJwLSNjBLpTEHry4MSY+9jAhYBcWGV
	2EBsd2L5tksdsDxvNNGjrKJcf82JNmqXgDy0tpLP1HqUnSJpRuQPM3Ff9PWYcaBtRabs
	q5fenszOJjzEoAoDmAmasm0Dzc51z+kXvtz/boaHlt8I6Iupn212WYMcwEPo6gkdMtLA
	h0lsSr/vYnzMrjqj7lfqpxEISy5WDfy13WqxBXOjcnFq7e0Vq8o2fCSl5VNb8hJoptxX
	e4gA==
Received: by 10.60.6.227 with SMTP id e3mr8756600oea.22.1354550629814;
	Mon, 03 Dec 2012 08:03:49 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id el2sm13739774obc.9.2012.12.03.08.03.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:03:49 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:03:22 -0200
Message-Id: <1354550606-10377-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
References: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCHv2 2/6] freerdp: update to the latest commit (2012-11-20) in the stable-1.0 branch
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
X-List-Received-Date: Mon, 03 Dec 2012 16:18:10 -0000

Change-Id: I9b872c1aa9a17e6ef9dc0fd4b18dfe9f354f62a6
Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 099a80e..434e89a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -7,11 +7,11 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
 
-SRCREV = "e0f2b3ccc986a165d9c289a569b60eab66153792"
+SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



