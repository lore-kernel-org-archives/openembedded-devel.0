Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 772146F580
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 19:42:54 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so3241006ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 11:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c0TpUtIjxMzylgYsFsy/AaxZNjcvLayAH96p8vwaSTg=;
	b=dJNdF2Qbi7o6DLSGoMohnzpj1BSOGzp+/ae/sW/sJ5ZiFplnXDd+ZJcI1044Rs1Yjj
	mi7BrIPAp4O4H1reOIk/Xw4lI6AEDXVcWv0jfwWq4zdT28NkDWQeOa4xKR3pd6zecUTU
	oSjyT/Tefl82sw8gWZ22AKZqFHMxHvIWmFvyrRs/XJVEzxBGF8wP3g60Q8vwpaTI4e06
	wPISh7hVo9zXRZM7e3f2soJogcJi+S0xPkaO4MCxTah2m2uP/Htq0JYjZIxnSRtwOTIX
	zfakdly7kCxt4vRf+7yO9X/JykCiIVBMHu3P2E4GjdTNuc+2EWooVDNfcnHlMnUOWOAF
	UB/A==
X-Received: by 10.14.199.137 with SMTP id x9mr41126212een.3.1393875775618;
	Mon, 03 Mar 2014 11:42:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm53818257eep.11.2014.03.03.11.42.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 11:42:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Mar 2014 20:42:55 +0100
Message-Id: <1393875775-29375-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393875775-29375-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393875775-29375-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/2] wpa-supplicant: Rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2014 19:42:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{wpa-supplicant_2.0.bbappend => wpa-supplicant_2.1.bbappend}        | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.0.bbappend => wpa-supplicant_2.1.bbappend} (77%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bbappend
similarity index 77%
rename from meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bbappend
index cffb898..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 4}"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.9.0


