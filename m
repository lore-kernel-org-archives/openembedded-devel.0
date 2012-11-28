Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TdnZK-0001lq-Gx
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:14 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so11938285obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=McJAUj3O8OAF5hxKwlc5YzYFf9hPdoZfRJkRfXX5xWs=;
	b=mmB8kN3B1VyJQlw8Cll6HlDJNxGqc3RotH1pIQqCPIG2wuh7o2F7EhRV4LoHn4cjej
	enOKI0T+3z5rtlU7fWjCzmqe/lt2zD4ggY2Pt7g7sPPJpEP+Tx6r46rKLC0n8q2l92gv
	UOmhbW3s0mQhKLN2lJbFkh4HWZYS3y69rU6czZaB3zLKR2CPQyTnUTEBHNJHhArW3Hxd
	VQR2+5EKuY1oP60Niw13q3Q88dIraaFYTa2m4VAzBSeklkfSJBfsdb3CoHjH5vSiK+C6
	iSZikMjRvD5HUZFPfr66oye5ziMGRuOJEzUJoRMbCyxvGs0sqdmnA64eGNyEaN+f5GRz
	HgIg==
Received: by 10.182.95.133 with SMTP id dk5mr5371397obb.14.1354131058518;
	Wed, 28 Nov 2012 11:30:58 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h2sm19267644obn.11.2012.11.28.11.30.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 11:30:57 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:30:36 -0200
Message-Id: <1354131040-9077-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 2/6] freerdp: update to the latest commit (2012-11-20) in the stable-1.0 branch
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:14 -0000

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



