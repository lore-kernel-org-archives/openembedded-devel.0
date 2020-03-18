Return-Path: <SRS0=VQHR=5D=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A078C60AD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 18:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48jK022ngsz2J
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 19:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584557522;
	bh=E1TUxHZ5HtGilp+pYB+We0v5dp647LwzM/mm3ecZWQk=;
	h=From:To:Subject:Date:From;
	b=sxwkeegDLtGCC2YkuKCjR9nJeR5hhPVtMRZpiVJFMEYkn2uyjNMWDpGfgJ601GDJm
	X8Ae5U3MnYpD6W1I1pPFmTJNEqPcTpSA4zB50RTS1GNg0Nm19XzF2v+l9rMWQSB4Pz
	1AUGpSnDIYb0T5UjOz5AQF3sUq480a6t/glIMk6eeNWmcEipaSZDtQsT0ctRXnEyDq
	9njsIl5onE/vhwFun/awNQw4msxXOhmFjk7AQID2EmU17MmRW6AXZ1WSH4Jw1ZhWKh
	KyNYoyzOva50kFj+npgsmAIghA4gyaRTqJeisogiQC0guaqzFgOLN/tP/yFfJeGHAG
	ZF29QSOmlHM+7l+o8aSsetECK9GVgVYVJZ3X+BRNMAxtolSp3zZr0OvgBPfeMIhsbW
	w3NR14ewRffwgnMhCRSVvgicL1LzGzX+URWuQV+JcUv8iX6o0u3NpHx7bwgen5TZeE
	RgoT9m7ECT6ykTFNHARGbQl4FRrCcDvkV4MEGFEP0MFgCLBiYqHo1BfEp/pgo2IsL7
	kIQV1gTECOpwZFYosWsaiLRK84G0x2suTzi7byuFDWCdQIkQXuu53LiNo1vg2gbPaj
	BHq5HN4prMFkdXXmmbqSvt+fMc4JQINUtJ84lQzdRzI1bVAYwPY1htitS0a1QHKO4k
	jZzgkemgMI1ZBViwFoHbM0IM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 20:51:59 +0200
Message-Id: <20200318185200.28166-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libqmi: Upgrade 1.24.6 -> 1.24.8
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
X-List-Received-Date: Wed, 18 Mar 2020 18:52:05 -0000

Bugfix release on the 1.24 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/{libqmi_1.24.6.bb => libqmi_1.24.8.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.6.bb => libqmi_1.24.8.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.6.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.6.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
index a86215aa3..124b0f1b0 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.6.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
@@ -14,8 +14,7 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "5d50233394a33e43dee3e70e197323e5"
-SRC_URI[sha256sum] = "1325257bc16de7b2b443fa689826c993474bdbd6e78c7a1e60e527269b44d8c9"
+SRC_URI[sha256sum] = "c793db2c91d7928160341b357b26315d9c879ecb36699cb7a6b36054cba60893"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


