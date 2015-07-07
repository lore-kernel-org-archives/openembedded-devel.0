Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 102236E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 19:45:22 +0000 (UTC)
Received: by iggp10 with SMTP id p10so5559645igg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 12:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B8iK8c925hOI/G/oCanLuZNNJFVTPCUfadWr1TBDnOM=;
	b=GMm/WLCEXVSav1KWYFqRcudu6a9WjvOEd79Lwv9DMnEB9+6OHOBjr5dm/HN9qIAW2H
	vl0O8Socr9jYH4lPU7H5M9uY0e7SV+VpXfFUoqZhLss9qvVsyHKQ9FeDKE0PKiH8Ykcr
	BEhfyu4tIKXsbeUFRiS/lw5T/FV90MorLaYd4otQorxA6X3VrEmc6xSOgK06p95BOD8S
	7R3ga9ONt9gM8rfR9cydqdju1NqRixjhoHYNMdQhXWpaoAjadZE780sFpKVlJxRoX2a4
	vkG9JZjn79m27G2AAmj+x2icdCEqqovOE7usrxdWtiNKfqGmWZg6m2/+R77r4ZQwK4V2
	I7Kw==
X-Received: by 10.107.162.147 with SMTP id l141mr9719246ioe.77.1436298322972; 
	Tue, 07 Jul 2015 12:45:22 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id h7sm12506352igt.3.2015.07.07.12.45.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Jul 2015 12:45:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jul 2015 12:45:07 -0700
Message-Id: <1436298307-1194-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436298307-1194-1-git-send-email-armccurdy@gmail.com>
References: <1436298307-1194-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-browser][PATCH 2/2] cef3: use x86 over-ride instead of i586
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
X-List-Received-Date: Tue, 07 Jul 2015 19:45:24 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-browser/chromium/cef3_280796.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 9a9efe5..ddb6a77 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/chromium_rev_${PV}"
 
 do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl SRCREV_tools"
 
+GYP_ARCH_DEFINES_x86 = " target_arch=ia32"
 GYP_ARCH_DEFINES_armv7a = " target_arch=arm arm_float_abi=hard"
-GYP_ARCH_DEFINES_i586 = " target_arch=ia32"
 
 export GYP_GENERATORS="ninja"
 export BUILD_TARGET_ARCH="${TARGET_ARCH}"
-- 
1.9.1


