Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0051A7F89E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so24036842wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IOddD+/XiMlKZt64BBDT06yUSgxmB6Dss1y+C6mGbIU=;
	b=r04kr89XNFNINAipI8r2li451bLkHuNvFS+0JnlX4cnxyW0pTwLL28WXBplrPTNRuu
	HKC811cCAP09VGizr4x2pEqXN79Q6Ru0hAudtyUjh6U5JxtIxqNq398xQObPMPd9moOo
	Ti9+AdMpsXwhz+6WkP3m8VvZyzPqc0Fx6q5lCFHVCZEw6uSWHRTHlwOZbsmEwuWXE4Dr
	ghBj3GIou/9+JYqT0BhbzGGkglGSAT60gqUteuKzPJEvuQxsaky7Uf++NFqiI/rheZZI
	vfoNbWfaI5WLb52j/3mu4DGwdeuwXBwFF2QCnbHl0in2PwTgwfWqjg44h6C7l2e98RkS
	7P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IOddD+/XiMlKZt64BBDT06yUSgxmB6Dss1y+C6mGbIU=;
	b=uW9tNn1JHEhu38hoWQ8vZUZK3w+kOcXHSMlvcf4TB78BSDD1CzDFPyN3u6hY7xPeh5
	/tGDknV/JWDxbm7ka0kS3piuIDrQjnKh06JopbeIBsEmLiwz2GpIuYlMYRk4Q0lQfvJb
	LiYAIzdr/4U9YdZZKbH3OCAeDseHfAYuoCGoXc6+WdBXkD5KarOrjNzJVE3Afsnc292z
	ArCLlThkE1Ljf3NVmcS7dZ5YQSPQfP4sSAIRsfIPKo4BFflzF5G3ZFXH/tJojBbf77SE
	jXuMYkrh4IT/qfMwBX57rBFrMBamCGhVf2j3QpqRzRh7sVzoP46fyC9cNImjYWPF8TEX
	Reww==
X-Gm-Message-State: APjAAAUl3rtXGL0ExW49n/+6lxn+lrm2CDUdszlgRK3c6eugGYiyv+aQ
	45WK/RGL5Roz+S6Z1u2WMx4=
X-Google-Smtp-Source: APXvYqy+Cr6+insIvKfCj0lInznA9Zqg+s5yejpupuPNisX3xL2WnrUNNA9dUAoJYCR44zQh+EtsyQ==
X-Received: by 2002:adf:e984:: with SMTP id h4mr5238406wrm.275.1579296391606; 
	Fri, 17 Jan 2020 13:26:31 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:06 +0100
Message-Id: <20200117212615.32526-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/5] xfce4-panel-profiles: upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.0.10
========================
New Features:
- Add openSUSE profile
- Add new error for invalid configuration files (Xfce #15983)
- 'Current Configuration' now pulls the current panel state instead of
the state cached when the program starts (Xfce #16114)
- A cancellable warning is now displayed when applying configurations
(Xfce #14559)

Updated Translations:
English (United Kingdom), Galician, Hindi, Slovenian, Thai

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...panel-profiles_1.0.9.bb => xfce4-panel-profiles_1.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.9.bb => xfce4-panel-profiles_1.0.10.bb} (82%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
similarity index 82%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
index 9c9ae94fc..5b5a286a4 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
@@ -10,8 +10,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
-SRC_URI[md5sum] = "bee3e251e45ade0ea349366461d6e200"
-SRC_URI[sha256sum] = "a8c00af838e85d00600dbf442c8741aa21a332fbceba849e0820560630a6e0ce"
+SRC_URI[md5sum] = "6190678bc701c197babcb2389ba46182"
+SRC_URI[sha256sum] = "a84d5e748d53bc5da269954cc3ad7f5ac0c4f5813acfd3892ea6f9064f17fb68"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.21.0


