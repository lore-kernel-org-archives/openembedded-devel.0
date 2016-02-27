Return-Path: <net147@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 70D5A774A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 02:27:11 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id e127so61742103pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oodnSCRcPbqCeaRHw+0GR+VrWVbKtxlroM0ZufPqoGo=;
	b=Dj/WcoVMgxF3l5RTVr7lTrX82p0zlhloolwqQRaRWgJX/tWVCJndX53SFGHcgayvl4
	y6wOPGypccQH0e6Oz4nHOV+x1vmLXMDCAvfPSdG7ZhD+5UY+A66qVMgKsW9NAslPsAlm
	ROL2FFyf1HsXvhqVvW91WtKdHhrxaqoNu26yVpZC9xcokjUvpLR86zmA8B03KaR7IcNn
	UO37YsuGeqSrQ/TA1CPbBJMMEVit1YAaSCzTS/P2Bwn0yL1A5nf8DbmjL29vkWtc0sel
	Uz+TxjFDFHKRVIQ3sPSPZObNm1fLTy0ajXyPJuywUyKRtOHvBCgvAONmExiITHw9b92z
	9GVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oodnSCRcPbqCeaRHw+0GR+VrWVbKtxlroM0ZufPqoGo=;
	b=edJ14pVVJseuMvcR7fUMZFY+K99Olzb3ALcUGJr0r8hSrOUZ1pWOc83DKTqn1lM+BO
	QvdlLACKMsqpxrprEwLAr7xnvIvPCPo/yfKg/5MRzzwk/IXCFidXKHK+FB7hhirVMS/p
	DxttFSIrWn0PXslDm0DGwPjFZAGGQNbTQT11uJYO71PAZy0SI1J1OpAGDRERImHFIfNn
	AyhF0rns97Nnj3MjUqt7mQHhjXeuV75L/1udlHZTf4ToyLGXQocFIN/h2BZJrBDm+pb4
	gOLFgzXDTSjlMBFJWqCSZ2UiL5N9dAVwGMcGFpGKK7YGO+hCsMFxMo2Vdxt2491woUC3
	2y+g==
X-Gm-Message-State: AD7BkJL0CgupfVwjsLXcm2kKdKsnKYKhrX57B/scKIL3PHQJ6sXEm7jOaM1AqgD45+93Cw==
X-Received: by 10.98.65.14 with SMTP id o14mr6529072pfa.151.1456540032594;
	Fri, 26 Feb 2016 18:27:12 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	p9sm22117170pfa.11.2016.02.26.18.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 18:27:10 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2016 13:27:14 +1100
Message-Id: <1456540034-11301-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-qt5][PATCH] libconnman-qt5: update to 1.0.98
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
X-List-Received-Date: Sat, 27 Feb 2016 02:27:12 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 0fc4bc0..c9a8140 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://git.merproject.org/mer-core/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.0.97+git${SRCPV}"
+PV = "1.0.98+git${SRCPV}"
 
-SRCREV = "4cca434935fa4d70d6841a2c20717eecb0beafa8"
+SRCREV = "8d4580a55ca02b84fc3db374c6530e39c94e0d92"
 SRC_URI = "git://git.merproject.org/mer-core/libconnman-qt.git;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.7.1


