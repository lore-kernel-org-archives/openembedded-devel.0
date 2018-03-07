Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE48B78A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:34 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w22-v6so1865225pll.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AlCcBXxPO6ovcg7/E34MaYOMzvjWZEsIobskWl8CNfw=;
	b=jBvatL+13eFQdBLGbtFlqxs2wQCHBeMvRa4M6JpQ+SWi/8L3s7HlfLUyEyDwmf5e+l
	+HtvuhmI5QLoZrqpfLEwN9Ylv7vXLW3SVLX7HpYvoTD3XedxT94W/yVNdtHjklwfjc09
	J/qTWRKr2/Id87mLiafMUgAoEM6ymz77PQEK86gXYzvdfzpB+mOmX4zCrY3XRb0gY0Uh
	cWRFsl0z5AB8RkVrf4fWAm3dMeSbSkBzmF6DzRtHlWFP+O8G3AGCcvLMBSMBrvR5mCaG
	jjwZUnxeHl9Cgf1lBLvCprYHeYAqKg+M2k5feYJC5TzY8IoOumsAcrHoQX3Y1lqTvqYv
	UEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AlCcBXxPO6ovcg7/E34MaYOMzvjWZEsIobskWl8CNfw=;
	b=YO7aTHnwxGD/8zC5LGvgPb5Obmqno/zuJsZ7a7SMVTh7eKHR3j5fB+JIIU0Mqqrv1O
	IMtz17P/CjeizJk3tvSFIvkYgUgKl2nacJyLcx1I5HBrG/iGUV2TVL/VF/LIUpieXCjE
	KAXme3OH/N4pCXCf26vLrxYwhslfKLiZg++RQiwdwxogdbXpcIOgc04BpdZZnAjvs9/q
	e8PFWx9F5F7JUzbukC9TaxvxuyaAMzm4sPmRWpDoLhkI7puu/VhOPpRQLDRQoXHF6N4X
	3lsaVk02AKto56EeW0N8we4PhGiBKSvoO53KBaF8Is9uf2dWUNDy8LBATVBn5o3b16lW
	4Elg==
X-Gm-Message-State: APf1xPAt4e2SFzhA63uNkPs3BDlf4Ka0f4a2c46QsqOra3vg0z8x7GOf
	0L1PSmYjFkRthb3jin1i5lrO0Q==
X-Google-Smtp-Source: AG47ELvqp0Q+x5e+WQ5xMk4LzCvMYoxJwGrclNfvuTCUWan66owTvwpmM6UppRgy6rRrqpK4d58kLg==
X-Received: by 2002:a17:902:5797:: with SMTP id
	l23-v6mr21019753pli.56.1520449295963; 
	Wed, 07 Mar 2018 11:01:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:06 -0800
Message-Id: <1520449275-29492-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 14/23] gparted: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
index cea0e3a..cdc882a 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://gparted.org/index.php"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools pkgconfig gtk-icon-cache
+inherit distro_features_check autotools pkgconfig gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
-- 
2.7.4


