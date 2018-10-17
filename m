Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 70E2778F72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 20:57:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g15-v6so31209045wru.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RmT+GVpifij+KzNb/IFxln/hVMqx/O2VgMmmlq4s/ik=;
	b=oreZbTesR7RnSmnojG8loa6i/lc7CG26XEydRznzu3hwqYeskAsbpKSAiZ+moHWYvh
	GIAz7syUZKNzGMP6yj/DPcXypZLyVXI5YXR+T2zeahU8PAYq0aBMXE1DtIcgwfv0ISxn
	hficvYtvJXbNuCFkrjROyw5wTg6ZmT/+/XoEPKEDwuBhmgl1rx8rOKZ7Tz+vPlCi0Rdh
	pA0U4amUvRLGCSa45RYmz3kTgPUFOZRpkP2sBSTBrNcFE/oFQCfHJOXR0bu7Qi3b48NP
	YdTK0sw9MufdDLzb4OKiXgbKNuc93xA8WM5uG5QWbJl17DpPS/3oy42EKpW8H2GtGqaY
	XtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RmT+GVpifij+KzNb/IFxln/hVMqx/O2VgMmmlq4s/ik=;
	b=eIVRcoWkjNiOyVG/KBOw5D+RRsPT1zVQeXFN0JLPeEpci/mvFqDQPPweJqNmo7mJpE
	jQv8dosdN2nPV/IbusOlAARk62RDxoIM4QLKg462OccHtZ+E5yZzl7l+96jtd3X/w9ss
	kAkng+AcrXIVoLh7WDOZho7zXVxZ/GbK5XTNgeuKLe1TbSd3t8lw7jM+gzMdREmtb78Z
	x+PTD6N2sgdAI0AxPrrYWsA46IgPa78EoIVvUwV+YpRD8Fk3X7qBIQ3sEicWUCrZJDAg
	tS2Lf19/TJ0lP8D2EX1zfzO8yacO3FFGAljTm/Kf9z33u4U9ATjyOhhuOWaMP/DlkBcw
	IZ2g==
X-Gm-Message-State: ABuFfogj9OglSAoVM4LK/bVw/7/PEm4nIfy+3Ot+0fPq6JBwx3DgNt/c
	PmiMLGqlPhJtpnV/9K+/W4blHOjUz/RzvQ==
X-Google-Smtp-Source: ACcGV62XvtmS5XYHZ/5LgDtTM7zf9h1djb83x6ILZIU/2eujYxtWxwFMeOlFkW6ClqzPvl2+x96l0Q==
X-Received: by 2002:adf:a29d:: with SMTP id
	s29-v6mr25680780wra.100.1539809833779; 
	Wed, 17 Oct 2018 13:57:13 -0700 (PDT)
Received: from yantop.local (lfbn-1-515-227.w86-245.abo.wanadoo.fr.
	[86.245.217.227]) by smtp.gmail.com with ESMTPSA id
	143-v6sm4852248wmv.6.2018.10.17.13.57.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 13:57:12 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2018 22:56:47 +0200
Message-Id: <20181017205647.25447-1-yann@blade-group.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v3] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 20:57:13 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Otherwise the build fails with:

  NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['${RDEPENDS_}']

This restores some truth in the "Otherwise install nothing" comment in the recipe.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb            | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 0ede5e57b..207c7c1ae 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -34,4 +34,7 @@ RDEPENDS_bluez5 = " \
 
 # Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
 # Otherwise install nothing.
-RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
+RDEPENDS_${PN} = " \
+    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) == 'bluez5' else ''} \
+    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) == 'bluez4' else ''} \
+"
-- 
2.19.1


