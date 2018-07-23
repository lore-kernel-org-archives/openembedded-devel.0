Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B47674F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:49:51 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id z7-v6so254171plo.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=62pM6EOarPtUMOAlkSkIkdO0Y5MIIuLuaShYIsyeD6Y=;
	b=MmlLIJM+5voYQEG760+WC/kTlHYi4c3CPfIWUte3wpqxpElqhx+EvhLmVyxjzmq0Qs
	k1Pld5B5Uy9/i42VhXScfk3fHyaSoW/9fOYTyL0+/8R6hti0fCfiXvJ+nTMmtXoWCh/2
	3ne7PDOqaEI8tGycmrJt5eR1D+3CEvIxp2wkAuKA/2NIm4uDTrxKmvcaJhcgpsiKh+ec
	KldOoQhXu++EhMih5Ld9Dg2YO4s+jdiwHqb726SjgEb58TaqamIUso73Z+S6XQF7OV9t
	T984emuLXCbc/L53AMRKJmM3L3eVCfJHytuw5WhkG251a3drQYa+fb7aCOiesx7lOsTg
	Y+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=62pM6EOarPtUMOAlkSkIkdO0Y5MIIuLuaShYIsyeD6Y=;
	b=c4pzWJVWfbj2nQv4D1QN35xiRyoy4XPFFG4jtDlWs4i2yFGwDz6M6OBLo2dfPj1O5H
	dEgOZSyfyX7mkvqke4SILe/eP2z6vDm6sVC2YV6pFNjOaTt339oiA9XkExryMZWUOo3Q
	47dyXTcIT4bkMjiQ0U8lT10/rVuwGi5eWE8OyDSZCEy6709ciGQvID1kj5p4L7MlSP+t
	9DTDFQYPydLo5lvV9jhXxi6dlu3Mz+DWG2G4LK7fd4/BIRq59ahFeAv0+0k9/H3UVW0F
	Qx0M2P+f71cYXQVV/LhcIu5s/ONqDkVsn+TnUlzRmnQ9nlhYA32a9sqKpgBSBZpfIytQ
	zmFw==
X-Gm-Message-State: AOUpUlEYROMA2owVGp/drZSAKAXlybd961nqUdhAj6nCPXUH6zLsA9j/
	Q/fur14Zp1b7ZDHrH8nMI1dpnDxMOU6S
X-Google-Smtp-Source: AAOMgpfaLpGSPKBPuINK9whGxPf2Sn9dqvzW52JJG+cNSkkjtaUrlCAUJqHofPvmGafzwpLiT9OhcQ==
X-Received: by 2002:a17:902:70cc:: with SMTP id
	l12-v6mr13041178plt.132.1532353792173; 
	Mon, 23 Jul 2018 06:49:52 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm4182356pfm.80.2018.07.23.06.49.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:49:51 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:29:48 +0800
Message-Id: <20180723132950.4543-5-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723132950.4543-1-freebendy@gmail.com>
References: <20180723132950.4543-1-freebendy@gmail.com>
Subject: [meta-oe] [PATCH 5/7] python-pyflakes: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:49:51 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
index 244485965..a16a880db 100644
--- a/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-prettytable \
     ${PYTHON_PN}-cmd2 \
     ${PYTHON_PN}-pyparsing"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


