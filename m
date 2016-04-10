Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5680C771FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y144so16735307wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XjexMH9S+9UZgwWNFDEed+D/Ak2rlh3klAn44hBsO7k=;
	b=SiHya0BXDRetctiKRzuPgAt7JV2uiwoLDU359fGOoKVhRcR5beY0pIBUhc1QutL1I0
	7p5noVUWBCSuJWMnWH/dxG6vJQUmteSUiH8VVkh19WGab/roINAmBtkTeBJVNWa/v02J
	oVVSGtz+ZPqbtOLKxRSSw0rH2aJ6xFDU4xWcRSsDKKcIt0LHA7lcSCGjkrZUypbgkj79
	yE9xnheCHgBUrVycHVx4Z0ciMCcFoA+F2AHru4OhDOpaypNYxLtfTj5Gkx7fXt2kuY4K
	8Ba7cE6ov0cRtsJrjFkoozHbfles8SHY3tzPp8f33JuDSYbU3FOVLm4o+hRhc9n7Z7SM
	n1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XjexMH9S+9UZgwWNFDEed+D/Ak2rlh3klAn44hBsO7k=;
	b=UHpTv44R84SYeU12KIRDaBmJfqninodUVJOFrqagxT5xQPeFC2dSxKQYURBhhXeZQA
	Bs7ClmiFaQ4QWM5W//s0YPH4mHvOlDU5AJcmx7s/pzZaCmnuzcsHMKa1GJCDGZUakK7u
	8YwiNB5KJIpemTPGmg4ZydDyxSz1epBBiGKG0Z8+ZitC3EmKa3WoS8a6+OUHJjyqG9Sm
	ynYvrC+S4COoHhh2eRyU0TMkzYX7phyc/MYOpzVX8rL77+gd3X2HUkRYXB7smq9MGoia
	vPRDJVDkuyMNXab9Qr016yv13ZQiONbVmcBhDk7hHpMfR+c5H+gxnzIXTAg4uUWCvUEG
	oGXg==
X-Gm-Message-State: AOPr4FVI57GNZ3t28pJIQyW8DP/xkXw4DJBgm66V+BpujYq8gx429fCaUdMXDCWNskaTyQ==
X-Received: by 10.28.18.10 with SMTP id 10mr9575714wms.0.1460317314924;
	Sun, 10 Apr 2016 12:41:54 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:09 +0200
Message-Id: <1460317290-4787-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 10/31] qtlocation: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtlocation_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 5072903..2ee747f 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "03163a3c9129b7f982b690e750056506c3d06b41"
+SRCREV = "ca4bce553d03a64fa119650990083267ea9c8d31"
-- 
2.5.5


