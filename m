Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5CE771B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:55:11 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id y7so3625467paa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=L75VRYYnyotR4mbL+BBZNp/pAd87M3rBK50HZVoNnpE=;
	b=HZTbWqGqyHigeTSZKwMROFo/BNihF/fWSuERMAN287Qr4fZjAx41BkO81X1Wn9CmUR
	29Knxi++jp1CRJB8dG8iyu2Atkl+JXTpjBlyQb74xV9O194uhpswzlotCB5fpVqAWlvy
	QUaTsWRvnw/FE+oX+SBr+stccwJKI66yJSA7tesAxyBzp8oSO2VVRKcnKieMEkBdf6L8
	5t4A4Fl197dVAmSW/EwoFYDZ+46NyDt2E/3nY9qnGlXU55hV+qxGtfqCnZPXfSRDWIN2
	pTamfurlx12iznu21yMT/7dxEkin8ofGtgI8L00wdvEiI/jZFMJx6fjNrxdjc2wGR1rK
	d8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=L75VRYYnyotR4mbL+BBZNp/pAd87M3rBK50HZVoNnpE=;
	b=Yx47FQUDOa9QK3k/Zna1Jl0sbe0ZcZ372eMglky1iLoiwao3SQmRBpr2wbnzLFKxri
	oklogXbMIVHB0tY4eta8J2JTECyPZAb1WXWlzNiDnKTuxTH7phG4D4FEa4xqCFDCNCKv
	XHaPDYVlnMwBWpRfzr9ILqk++CdJ9AoSOUn/6l2a2LMXNIW4swsah9lcyPP/FYyAP1nq
	GrGdb6sI30G33Sre+AdxcudBwdUSdewD7k9nwOi134DeJa/yiYx1sSYcCD/hTNqfhzj0
	oTwfeBXSMaCrEswl1MNQ9n/yGYOK1mjezgswow9gTYp2JIgX74wchoOXHGW2G8K/S5ON
	IhFA==
X-Gm-Message-State: AG10YOSKuZwdD2/oTJzCaj6KjG4iKx6bZ1WWpQKzR0kblQdBWdryRtE1xB7HXKrKIchDww==
X-Received: by 10.66.66.198 with SMTP id h6mr4110828pat.112.1456448112579;
	Thu, 25 Feb 2016 16:55:12 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	ko9sm14769286pab.37.2016.02.25.16.55.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 16:55:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:55:07 -0800
Message-Id: <1456448109-11375-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH 1/3] acpitool;: Add package
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
X-List-Received-Date: Fri, 26 Feb 2016 00:55:13 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb

diff --git a/meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb b/meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb
new file mode 100644
index 0000000..bc9669d
--- /dev/null
+++ b/meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Acpitool is a Linux ACPI client. It simply reads /proc/acpi or /sys/class entries \
+and presents the output in a meaningfull, human-readable format."
+HOMEPAGE = "http://freeunix.dyndns.org:8088/site2/acpitool.shtml"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.bz2 \
+    "
+
+inherit autotools
+
+SRC_URI[md5sum] = "9e4ec55201be0be71ffbc56d38b42b57"
+SRC_URI[sha256sum] = "004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f"
-- 
2.3.5


