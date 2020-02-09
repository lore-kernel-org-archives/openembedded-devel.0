Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 072BA60CD0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 18:47:02 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z12so2662025pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 10:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UADXoI29lj569ov+j97D3sq4LSdv81YTa3of3r/Fnb8=;
	b=lQFmRbXVMHY/XB/wfNiOSMIEVIBepfqNMNwKU1SydT1AwucUBODB3dU/DrLT+alY1U
	oi7x/987xHl5t4vCp6i/qLXQNXqD4ila2MC6otoaRgtKsDMdPMTVQnp9XMavc00okOlz
	Dx22t38JEC9BfwzMMGEUPMRj+IGgz/41vnfSmHZrGRv8P+I8Es8yx9ZuD45qsXrj+pwi
	KLMbJpemDv81Co+koq7LEf/LXMQqqPpKlvwEZdSNGkSOLOttHaX0TFgS/Z9FS335CF+l
	M5n0PP3uzf7hTZDHQ67m3xXE8FzTg2pACAcuiWiIKzrzEcmok22j6DrvqS4KALeeIfxD
	4kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UADXoI29lj569ov+j97D3sq4LSdv81YTa3of3r/Fnb8=;
	b=iVAo7H9RwQ3vvzztmKEH3KDCuY524/qE1U9acn0hTk1gLQmXs/aVC5EkUJYSX5C8As
	OEI3PfsGG2ds8kB3zMouD6mKVG2OwDLkN1FCnQvVTDYHN0IeZ3gMlkA2ovB5TQ05yosp
	+bbA6yftG5D+2XSr36nP0/F5d5KUuwnUM98fZQo6nni2j5p2DEw73H7Wqa/LADu4z8YD
	fPjZndzWu93PbhybYXrQuIrF2Z9WkMGsPQ/f5HqvGoTrMNYA0BhaaOewCa9vIX9RRnVE
	58CbpGofLBHOnfKbz+zjVy0eBMtrHnOAmo8uW85OAN3WZzmldGxcUtq8Bt+t8PcFkF6z
	kTXQ==
X-Gm-Message-State: APjAAAVpdz8Z9JN3om5t7ubdj6rFQp/C48TjTTcW7mpz2Jw5BZYD/D7W
	sxNLASB09GbqK1XYZ2A5q2gbBz3nPCw=
X-Google-Smtp-Source: APXvYqxLP4TZSsqV1+iDKiLPOBjOKRMf8fa70kBkHKavcicQM6C0HHUKzO9Z5OwLsP+nyGstk6INKA==
X-Received: by 2002:a65:6384:: with SMTP id h4mr10114778pgv.75.1581274023560; 
	Sun, 09 Feb 2020 10:47:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	c11sm9758371pfo.170.2020.02.09.10.47.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 10:47:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 10:47:06 -0800
Message-Id: <20200209184706.3574596-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] tigervnc: Do not depend on chkconfig
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
X-List-Received-Date: Sun, 09 Feb 2020 18:47:03 -0000
Content-Transfer-Encoding: 8bit

This recipe is gone from core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
index 16937792eb..f97c2b2d6c 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPLv2+"
 SECTION = "x11/utils"
 DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
-RDEPENDS_${PN} = "chkconfig coreutils hicolor-icon-theme perl"
+RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
-- 
2.25.0


