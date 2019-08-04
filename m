Return-Path: <scottellis.developer@gmail.com>
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
	[209.85.219.180])
	by mail.openembedded.org (Postfix) with ESMTP id 70D597CE79
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2019 14:52:47 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id d9so21984688ybf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2019 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=opfFkqbm8kptGZ4VeVOJowE57azVFas5UnLdFJVe4Zg=;
	b=RPZGccekPIqaUPr7sRSQq7qJFa0mKvlPvK+CYGxqaIMuHAdtebQ4QC/1bTpUx8ZaMR
	ZUvwpQGwG/CgRf7ZkNzBwcoTaRNLn+lLIwGTV5nBzi3FZiTvttkQngj2KGgI+S+zGTgW
	vYbaJZVBNTVWcNHbRFHXX0Wd62A/EsRlkPfsFfYR0VBgTOsdnW4dFN5xfF05YiSLqAiE
	sKtgxbGrYR6JP2V/zNLvkytjUSfzjUMSV1ZzcxIJnc7EcMMAaODKqtKPYnquaDwr48HX
	/VlAxWf7ry5jB1UIkuwLFbYE5cczOvtEu4McIt6drwxcIT263+cG9SnC/5sza2hagn+/
	/snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=opfFkqbm8kptGZ4VeVOJowE57azVFas5UnLdFJVe4Zg=;
	b=Q2Jjk1FLSw39wLvurNmMkeQLw2i/2h9/9UYWfooYA7gvrX1zpnm30RWXRpmvB/tcxy
	kPM/0DAHAeFXD+J0xd/6wCXA7KEasGmLxGSaFBoBwW3/aLz9BU4i1FI7HjpijJIw8A09
	jL/EdO+Lg5kQ1VDo9rpgJgtSwq4zaRwuEki1n7cDPXEYuIJ9BnSzJEhHpuzhqElNxzKq
	bHQGYhzehTxii1/TpQxVYKRVZm9OZYfsO9CQ1g076eOrMynlLMZrVnViE7DrdxW4jeUV
	wHuhz+dzNavHX0XOewZFyRzG5MzVRzuYY5YZJ9kamYK35S+/lyf3Zm5BsgPcqY09pvPd
	be+g==
X-Gm-Message-State: APjAAAV29ryqhaVMVLqxMIkte+DV76y1D27Uv7vtyK+IoLo++gQ1nCPB
	xn02Ggv6dmqpPZxrICiPAPrAhBzR
X-Google-Smtp-Source: APXvYqzwXkyDionW3HoUxMFK0cSz+G0I7uysNdQ3hclbGytmDK2CidN+BZRizFp1Qtpiysm2SXpAqQ==
X-Received: by 2002:a25:7109:: with SMTP id m9mr52263788ybc.454.1564930368099; 
	Sun, 04 Aug 2019 07:52:48 -0700 (PDT)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	d124sm19283898ywc.100.2019.08.04.07.52.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 Aug 2019 07:52:47 -0700 (PDT)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2019 10:52:43 -0400
Message-Id: <1564930363-7169-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireguard: Upgrade 20190406 to 20190702
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
X-List-Received-Date: Sun, 04 Aug 2019 14:52:47 -0000

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 ...eguard-module_0.0.20190406.bb => wireguard-module_0.0.20190702.bb} | 0
 ...ireguard-tools_0.0.20190406.bb => wireguard-tools_0.0.20190702.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190406.bb => wireguard-module_0.0.20190702.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190406.bb => wireguard-tools_0.0.20190702.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190702.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190702.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190702.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190702.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 5cf745e..12dd9c8 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
-SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
+SRC_URI[md5sum] = "7410a52bacc5eb85e1634a20c07d3bed"
+SRC_URI[sha256sum] = "1a1311bc71abd47a72c47d918be3bacc486b3de90734661858af75cc990dbaac"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


