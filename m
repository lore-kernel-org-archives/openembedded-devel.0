Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC8B965E1A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:11:35 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id y13so15105219pdi.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=th4xjcQ3uhn4xnkx1JCP/CXf7x1+SEcY4ai8LPhAayI=;
	b=ZDYeeEPpE3Wh26fNU8bwKumlBtTOS/VoYLfxFFPa8V9iA39YNgPRBmj0Q7BtCNTz1e
	7vig5hMdyxR0XFRcQmRQ0ONHooNR8gyOknjumFVkdmT3CfTPUyy2ztUoS/GxSHWnaW/i
	SFelNHo8Q3LEJ3Tyr7M0RetkzRW2ZZAelHhC4LNGSi9IEOAX6jfIlI36XNyjuEVo/IvY
	lYD+s4LmxfqV+yevAyjX1g3cDBldMy19qkPz2H2QkOmErkDIWqArhfQJUguVhuHhBZ5v
	MpsP8n7VOFSYjpqlehmToVV6C8JAZJzUQORWIy4CyOtikLr597bS8Gr5g4fuFMBRl+Xx
	GhJg==
X-Received: by 10.66.191.230 with SMTP id hb6mr44428261pac.72.1411845095966;
	Sat, 27 Sep 2014 12:11:35 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id d5sm8158858pbu.45.2014.09.27.12.11.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Sep 2014 12:11:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Sep 2014 12:15:27 -0700
Message-Id: <1411845327-16713-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1411845327-16713-1-git-send-email-raj.khem@gmail.com>
References: <1411845327-16713-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gumstix] x-load: Define FILESEXTRAPATHS properly
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
X-List-Received-Date: Sat, 27 Sep 2014 19:11:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/x-load/x-load_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/x-load/x-load_git.bbappend b/recipes-bsp/x-load/x-load_git.bbappend
index 1065e1c..4bb69a8 100644
--- a/recipes-bsp/x-load/x-load_git.bbappend
+++ b/recipes-bsp/x-load/x-load_git.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS := "${THISDIR}/files"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRCREV_overo = "04b1732220078d47c18a84cbafc52e45db71f13d"
 PV_overo = "1.5.0+git${SRCREV}"
-- 
2.1.1


