Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B324C77DCA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:11 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p52so19902837wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Z7td9ZKxNr9GY9oTo2k8X/DgiK+4vteUsfV1cwysgI=;
	b=QECjoLz02j3DICIdUYj9pG9OCpdAb04E3FspI+PLfg4IvY0t4I4w3PiLkphcdgj4ML
	7fSuIMe+mnim9RRiPHbxiP7I0HA5OicY/T1GzmCyJO5PAh9xfQYOoUPRsA6eo3e54alj
	6yRev6w+El2NOkqaA/f3NCmpWgg/Do4+Es83GdYq27RIPJw6IzRCBnAZH/qyzApbwqgN
	WGy9fA69O79eHI0ZvEWKdcHobSJKsPPJ6y1XLTmq85Qj0DdN2ZOebYH0RJKxkZ4PQG6q
	GPpEjuPjGINNOOfhP0Y1+AFbJsKrltf4MLj/8T4PFFgY53F0tmV2MR+Uvw+XSLSgUpvA
	Wj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Z7td9ZKxNr9GY9oTo2k8X/DgiK+4vteUsfV1cwysgI=;
	b=Ly41tfwMYN+YaztEqKlKLXBNvz6nFVfvmvmr25AnlHtUJreB24MoDlV2IP0nzyyTxp
	EGa3Sx/P6ZAtUcn3uIKH61bPhiBemGhZNKlvzMTwW8HeccUbt436KiKlTXTUDPH6m3DB
	MfA6xtT+PL+p+NxGqScgQvvyIELVfecgucQLme6D0Ye/VMP6NdJeSfrJohKctgxX+tR8
	T91C1XwXA4TKXyTDkRf0p7Qiufk6Ch5zkLuUBspWmTo3jWVgxQTyzCqNyGMu/Bw/sXPG
	oMSRp5nHAL9RHxEAB1jS1UDnN4uGSR2EEK3mIphFU/5sMTpItCXRwNdxIn4SWyV1OLq5
	h4qw==
X-Gm-Message-State: AFeK/H3spoxzGD3bLv+FTNUQgsF8HHbixRmtSFcwGSJkHF9TI5EMBPIgjsumIu/7gFTheg==
X-Received: by 10.28.15.69 with SMTP id 66mr2930352wmp.105.1490960292355;
	Fri, 31 Mar 2017 04:38:12 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h187sm2558879wma.32.2017.03.31.04.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:38:00 +0200
Message-Id: <20170331113803.31535-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][morty 4/7] ttf-liberation-sans-narrow: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:12 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index f36cf4b18..5b406bc65 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
+SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-0-liberation-sans-narrow.conf \
 "
 
-- 
2.12.2


