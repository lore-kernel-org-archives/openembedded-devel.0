Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id DC2E96FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:01 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u57so2083214wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fdsukBVey7xkyokA5gd7Vmk5Jcbn6+fhvJ71noS999Q=;
	b=E9Q6JHonW2sF9wHIkHeyrKGRLEvwggeXv0F8SECxIhLQh/xAUVsPg/RSjH+wXeEExL
	+Z1EswOPMsVbloVpVAkfb2XMNWmqvdto8D1N3sjq3oQfl3rHRrGJdtKtaRNPdpeqeUw4
	JoAlKP6hfWTc+Z23IfyHSByGQy0xK9pTVBY5NEd6HoFrBLvTRtKNdkzj7cYSKCLPSkSn
	elnZcWpShZKaD5Df/RWB0A+2MEDlT4X4eBT4iJn+NjqBkFcgm2dPl0EteaWHj3UOxMkG
	HfnV6q8Xt6p91aUk5jH+18s7pgPhJ5ZIVfzuC+FTEgkiNWmYFQ/dyd6EP6xc1pUH1KBQ
	iZCA==
X-Received: by 10.194.6.166 with SMTP id c6mr3982036wja.64.1403172001939;
	Thu, 19 Jun 2014 03:00:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gp15sm7683946wjc.10.2014.06.19.03.00.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:35 +0200
Message-Id: <1403171993-26208-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 07/25] vala-terminal: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 447381a..6e102c3 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -8,6 +8,8 @@ PV = "1.3+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
+PNBLACKLIST[vala-terminal] = "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
+
 inherit autotools perlnative vala
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"
-- 
2.0.0


