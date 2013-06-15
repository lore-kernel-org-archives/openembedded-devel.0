Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 89C8F6AB83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2013 00:19:29 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id 14so1040622pdj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=szZMHwktNJuYF6cq/MrmP7sCh8QCZ2r4uQdRxPPvotc=;
	b=UbBsRjMuNE2Ge9+ymNmG5g0sT6SrJ4t74mpyg1UDMM5AwX1R2iJZqqOcCguCqv4J4M
	HAxZXxUy5DOZGM6g0jCIRKWgxxtJ8M07x2HqxII7f8qIFGfZPkLlhTriHphwCZJr96EV
	lU54hcuBIFmfS/vHt4DKpgK6adcYwSmSQPQ19pe5kkXxhTu2vxoXa7dityICAzuybajB
	0x4SD/nSbxy0NUiCLls6jI+xXusbh9dgFjwA9fsAnVoPA2YWmRqav8n5zRAfl2bPVdH1
	Mp9Q/KVaSrlAVqTYroEkUgt4f3A0OV0e8vfMQjHhJb8aygD/l7wyiFk+314ZnZvS5RWf
	9fgA==
X-Received: by 10.68.245.170 with SMTP id xp10mr4642089pbc.41.1371255570904;
	Fri, 14 Jun 2013 17:19:30 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xd2sm4193117pac.15.2013.06.14.17.19.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 17:19:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2013 17:17:09 -0700
Message-Id: <1371255429-32747-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1371255429-32747-1-git-send-email-raj.khem@gmail.com>
References: <1371255429-32747-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH 3/3] nspr: Match the bbappend to OE-Core
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
X-List-Received-Date: Sat, 15 Jun 2013 00:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove PRINC not needed with PR server

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC:Eric Bénard <eric@eukrea.com>
CC:Denis Carikli <denis@eukrea.com>
CC:Otavio Salvador <otavio@ossystems.com.br>
---
 .../{nspr_4.9.6.bbappend => nspr_4.10.bbappend}    |    2 --
 1 file changed, 2 deletions(-)
 rename recipes-support/nspr/{nspr_4.9.6.bbappend => nspr_4.10.bbappend} (93%)

diff --git a/recipes-support/nspr/nspr_4.9.6.bbappend b/recipes-support/nspr/nspr_4.10.bbappend
similarity index 93%
rename from recipes-support/nspr/nspr_4.9.6.bbappend
rename to recipes-support/nspr/nspr_4.10.bbappend
index 3153bf3..3296e91 100644
--- a/recipes-support/nspr/nspr_4.9.6.bbappend
+++ b/recipes-support/nspr/nspr_4.10.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 1}"
-
 # nspr-native is needed by nss
 BBCLASSEXTEND = "native"
 
-- 
1.7.9.5


