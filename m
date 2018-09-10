Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id B5F4C744DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:38 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id j8-v6so9147803pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VSdFrNy7TLBc5OYVvHFPrskF1FGNWezOzqlkS5w5dnk=;
	b=Dx+mYOLQmRFPFWPE0O+ThtsJf1Tws66Gt/J72yZJYMOJmlOQLNEsTu3hE9cq5YgAVy
	4NVilw42OTySEDyBbSp40orRIsy0s9ii32qtiFKGjy+pLGUtykTELFD7gzfNKxm15Qai
	Q1fhBwTn+yq+PKuhIKeX6M0bgkJPvTXIxF+s4PGyz6d+R/iGduGBnAXBBqk0/wfZfVLC
	4MZ1MgbBRHdcVkCMge5TXvoP0/XrgeogdU9oTg13AKve+oPvX46rHxqY/UGep1IrEXKC
	anO0xcK8ruxpfLkly7/96sV9myVf5U32kZuoIYqaNsKhcSk8zHx7CgNXWBlATcu87Tou
	47Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VSdFrNy7TLBc5OYVvHFPrskF1FGNWezOzqlkS5w5dnk=;
	b=DgfQvxXGVRmNXu9HbvHgj01nmK8xEWTlqpoqDdgcTnFhNz5iFta79iJFJIVepmALwj
	jDJxN76quRFySw3F3mfAeXjAbLTScmXqJXHWWZRpl3IqOxZCUGGc2DzWKouZg/k6rEo9
	ouWPfJfFqRJKIEMLnyVAKFU7AsUFwwm80/N1Y8JDWu5iXR0cWQ5Ua0e3hzRFfW7HqCrG
	Pe+AJGPU5eHa/1ftFaC9TW3FuO86o5d0rSm3MMZlg8FEzMCV+f8Ct/oq+wdU87xk3Jzr
	/YSH5qIazsyFgwlcu20Lfbngs9bgKASPLiT2vQXS8oNjpyQm9j5ABZxL792SOhSGQNX2
	at7g==
X-Gm-Message-State: APzg51AWa/8uznokwINOVsLP6ZU8oxbB793W61VhUCtPJRfz1yj2h7mz
	D7f/38iMhIHJOU8f/uYTX+UZCELY
X-Google-Smtp-Source: ANB0VdbtCRVQLHw2V0mXfmIh0CeVV+fjnEye8CsLNiiXUa7mMNuWgOQZHIFNZodnH8oP3NvGWLeI0g==
X-Received: by 2002:a17:902:8506:: with SMTP id
	bj6-v6mr19563558plb.210.1536555999022; 
	Sun, 09 Sep 2018 22:06:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:20 -0700
Message-Id: <20180910050629.16170-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-xfce][PATCH 01/10] xfce4-vala: Build for vala 0.42 to match oe-core
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 388659f20b..97007bec4c 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.40"
+EXTRA_OECONF = "-with-vala-api=0.42"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.18.0


