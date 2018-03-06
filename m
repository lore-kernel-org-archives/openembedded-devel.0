Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1F078A6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:18:12 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w12-v6so289056plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gDqFtBVtqa/lBo+8Z+7NEGzMChHMK95CYLEDW/VTLZo=;
	b=m+1ZtuDcZ4eLdqCszigf3dLQ3vxhjzqKmOIUz/7Ma3NAsSIvTYFhqgtSPSkOxZPtUt
	lNrBC7RRLY7DpcwXSyl9/qM8C9vYTy6man36pDM+l0SqG9JDkzyWBzKEVC4tRPWW37Pe
	rh/1cS5FaR0u5tybSCqxPzeyXCRS9anmVGS5R7If9nM8mhOujAHAt8LTmj0s3s6EBewv
	QiTEPNGXiBPkwBc5DbruAEaL4MWDiNO+XVcrzN4HHWfGr5v3caOhXanbPe5HZGzoUeeq
	pxj3ACltmQX7cxxFY4m1sLKb8qR+jIrqr+YZJJ/6BUysP9dqU+uIEXa3CACAcX6mN3NQ
	9GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gDqFtBVtqa/lBo+8Z+7NEGzMChHMK95CYLEDW/VTLZo=;
	b=dXBOzGGiJJ5ApP5Q19n888YmtGcDqj1stWb5P8OvPSfp2SUHUOXVHC5AfPOVguL4Bs
	fnXbXyXXqirQiLQn43fm5XD8/CoFrA/54KjRxO5mZyCjlvU2AaIQ273e7RL41Ba6aS47
	/17MS+G5LX78tc5wAgiV1OBLL49Up/2Ehl5PVageI5onJUL+2bkynC6gfegMI2D55ltv
	dEW3uyUf1XVoOfpCMGs/zEyLIk5R4q4+cr8A7qy4JnleDf+7nwBz0BdCqPk06Gi9bwVs
	IIkUapUNDMlE+SLoZSbTRCucHDEQndadd6upj3RUsooDJfgnaFPuY8Q7mx7GyVBR9FlF
	2r+g==
X-Gm-Message-State: APf1xPCsC4SalzOfWz56wF/6PTc41DrdNO6bUhB3hgyPJhu2pwRJVF+0
	s+/zm5WAR1/RoeOEfrzSQPpPDQ==
X-Google-Smtp-Source: AG47ELtjTgNHhLEEH30Nf5KGPE8O9F7vNIAQV/Z3fDDQHNKcKZcgbT0/Rdq4FAbU9mh/a/dI+VsNKA==
X-Received: by 2002:a17:902:7045:: with SMTP id
	h5-v6mr17283767plt.217.1520349493713; 
	Tue, 06 Mar 2018 07:18:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:19f8:73b2:93e:af3a])
	by smtp.gmail.com with ESMTPSA id z4sm23817068pgb.4.2018.03.06.07.18.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 07:18:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 07:18:09 -0800
Message-Id: <1520349489-9063-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520349489-9063-1-git-send-email-akuster808@gmail.com>
References: <1520349489-9063-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/3] usermode: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Mar 2018 15:18:12 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/usermode/usermode_1.111.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
index c2d7328..0f88040 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.111.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
@@ -23,7 +23,8 @@ SRC_URI[sha256sum] = "3dd0b9639b5bd396b7ea5fada6aaa694dbfdaa3ad06eb95a6eabcdfd02
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-inherit autotools gettext pkgconfig
+inherit distro_features_check autotools gettext pkgconfig
 
 EXTRA_OEMAKE += "INSTALL='install -p'"
 
+REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.7.4


