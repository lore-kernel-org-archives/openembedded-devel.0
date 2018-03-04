Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5FE78A95
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h11so5941951pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KeQCL46gPz7Edq+MjYYASiEBRv30AbZjwOy7yjGPQUs=;
	b=XF78UDOlDHUcqi+0lFzc+6yPCdAsKZt0X4EsHbAOB1mq3u8H4/D+eaTlOZg2gwWHTN
	dQXaUw8vqb7RXpDeO5DOjfx8+WxUAZmSLKKnvHFTtA7vVW1P4WxMjMkALaCKk4JgSWmo
	m4oh0lZzf1glKk1d7ViqULwepaqWaQoV74H+xuFdOEtCZGpvXP9YNcpQyhccDtsGkdgG
	tJlHmq6HJJSnwXZ20gy448Vyjzn72lQawF/Z0lZt9E7n5FGzShKZcUi/ivtHNavUwwhC
	pzlYyZVH2FR1kX+n0mPikBVR3WmY/N8V1MBh65n1Gho5t9FjTJca79GEYX8BS8HZjDOa
	V/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KeQCL46gPz7Edq+MjYYASiEBRv30AbZjwOy7yjGPQUs=;
	b=ANeJtxJKdJOJazkgHaFvUPaSMucwnfFP3FYpdyYL+drNXZ6r6RIUivkhVG8+z6/lga
	hUpruF/lAl+yx3Q979hS66QBPkiJftPPXYXu/kAFOrM1yviQR44L0Vr7cZOZeVAPJ4RM
	xoI+5n2/EM10bX5FpCbAEk4AgYNHEjIMzq1646QreMNfthv5tnQTY0fH4lKXrgWk3xhR
	NuxHU7t3BA65x/fGJC9YaNOcq9OjeOoK4eutg01r/w9YAsYG/8Wmg2DsWeFIspL8QPOw
	u5hIUTOTKuL0WSNyN6r2BJISzapEHEkOYXLazv1AZeP5qxoHztMTvmhNQF8E8nOaemeo
	cDRQ==
X-Gm-Message-State: APf1xPD8WjiBq8BkkVC4r7gmugOTbCOOPbw3E8Eq8qsasKO45nGFbwyv
	xdFBlu2X2J68CeTGad9DNc2RJg==
X-Google-Smtp-Source: AG47ELuDZkkwJRlByR0FxusjOzj6Iu0Phr4MYkmYdLhE7DEorAU1wzCswhJF5yh7taQ0lV51El9Ylw==
X-Received: by 10.98.10.219 with SMTP id 88mr13006576pfk.202.1520196106473;
	Sun, 04 Mar 2018 12:41:46 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:27 -0800
Message-Id: <20180304204130.23962-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304204130.23962-1-raj.khem@gmail.com>
References: <20180304204130.23962-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/7] keepalived: Upgrade from 1.3.5 -> 1.4.2
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../keepalived/{keepalived_1.3.5.bb => keepalived_1.4.2.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_1.3.5.bb => keepalived_1.4.2.bb} (92%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb b/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
similarity index 92%
rename from meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
index 5e7e6e49f..36417b72a 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
@@ -11,9 +11,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "9964d295ec9d34ed3408b57d28847b68"
-SRC_URI[sha256sum] = "c0114d86ea4c896557beb0d9367819a423ffba772bc5d7c548dc455e6b3bd048"
+SRC_URI[md5sum] = "610af6e04071f02d3469191de7499f4e"
+SRC_URI[sha256sum] = "4e2d7cc01a6ee29a3955f5c622d47704ba7d9dd758189f15e9def016a2d1faa3"
 
 DEPENDS = "libnfnetlink openssl"
 
-- 
2.16.2


