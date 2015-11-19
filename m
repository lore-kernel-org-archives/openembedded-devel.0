Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 83C5A6057A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:15:11 +0000 (UTC)
Received: by wmec201 with SMTP id c201so117255397wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=/RDbjXZnMBCU660LlTmPLS/NXNvTAODnVOjpEy++HFw=;
	b=H17Mc20hsPO5zBcZSnN2tpMHUBfKsSzy1KPtvgLuSVF6fKfMYuhxc+Trd79dCxnpEa
	bJOK0F5OQ4duMVqnkH4lFHMDRP4foCydpsy1QT+NAbm/JPdmuOoy7WKAH88Vm3Qk7Tul
	XS/3m1qogv50AOBTx/Ke6wvqJRkW45uaWgbo0xy6BBJzxQTTWNJ82Pt2fCjLETWjKd42
	zrVljR2etpsgXT2Dr2ABponMvcSkoYqHhsxck8OiQuymNT1CiD95kmYBDhTCjoALKRYU
	RZBW4/XmTf/HRYhBBE8HOKk34uNbFBqGrEaxjZ6+rAuAeI8KEDmSPp9PZTeVqLey/7JU
	4o5Q==
X-Received: by 10.28.11.71 with SMTP id 68mr11133260wml.77.1447938911708;
	Thu, 19 Nov 2015 05:15:11 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	m135sm3169617wmb.0.2015.11.19.05.15.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 05:15:10 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:14:57 +0100
Message-Id: <1447938897-26171-6-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1447938897-26171-1-git-send-email-funman@videolan.org>
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 6/6] VLC: do not use --with-contrib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 13:15:12 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 99a6c66..ce3601d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 ARM_INSTRUCTION_SET = "arm"
 
 EXTRA_OECONF = "\
-    --with-contrib \
     --enable-run-as-root \
     --enable-xvideo \ 
     --disable-screen --disable-caca \
-- 
2.5.0


