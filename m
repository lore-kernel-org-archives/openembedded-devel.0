Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91133771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y144so16735822wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VS26SplZCOyS1BFfksZAa9w32a0wm50V1QcLizpnNRk=;
	b=NeMYaZsMZTZwHHliC2gKwuOVf5XGZbICYN0aGU1XasdpGqmNeXVPB/rWOp6OfzaBgU
	Fz4bxZAtzPIsXaSckS8KOptnpv8o5tpiFMxOCTT3aWdDBbBfFDpE7aDRcfk66FNPJ8Vx
	OBUZZg7zbas9MhbO260b3RjnEYnOH5sY1Ty5mwEVbLaZA0/WBRYGe1HFVpRUQGfaVw4E
	5P9+333qwAUhng8eRAK3VeV8ieXaN8jYo0mTcd9ci+lL9krQWqpHLKLZm1dtfP4Huflf
	DGHy54eO0EcXsVgcxQnsn4gjXXzJzyP4jLkgbvQsVtDrpxvNmSCkK9rS/RtSyWy1oHq5
	+vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VS26SplZCOyS1BFfksZAa9w32a0wm50V1QcLizpnNRk=;
	b=Qn2fHg99azqN6kQwCIEyXL0/sbn2lS8N5ATxc5+NiHL5/SvBfvzJYOK0CLAa8sbCR9
	vW4sZ/Hrwyu76E2kxl6HW/FUYFAeODhwrqj0zRc6rJc1iPP64VAlEObLvy1WqllZoDj9
	QHluGlrJGKlHTk1UaDAEf3kSjTskw4SZKY0DAQwRFvjWHV/iwVoBh7xLgC+vmGmA+GIy
	nRH5OdhpfI9Slloqq70Xptl8VgWAr4qrvqxAryfoNAE1JPUDxEJnDzO5wtwXNWrFABIl
	94PHa3qFjQJSlNCzLy1FvSlHzQo1sUbFsyd1gxMdlbbmlYZ4aswapC/uwrCDslXaPcqa
	ZWNQ==
X-Gm-Message-State: AD7BkJLydo3/kOtnhmIwQJKaaZvfju/xVr7b6GwZN02HfTpzAeUt5k8P/EFDE8smX2aMNA==
X-Received: by 10.194.78.83 with SMTP id z19mr19748820wjw.5.1460317323227;
	Sun, 10 Apr 2016 12:42:03 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:20 +0200
Message-Id: <1460317290-4787-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 21/31] qtgraphicaleffects: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index c35cc80..7d9636c 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "24f3fd69a2e953619c48b4a632262ce8419fee40"
+SRCREV = "4b8e9a348ca379b203c26ff14dd236267dd60646"
-- 
2.5.5


