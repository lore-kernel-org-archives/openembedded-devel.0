Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 91D9271A7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 144so452229pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EFfDJg+amLZpCu9OuKOQxE0DuQNQ0Z4P63z4FSBJ/aI=;
	b=N+Pa4bLP13a33P90Uyyid0XGc3LnC1dHTbtrInW8bhwVq4LchFF8LjED4Igj39azcj
	OlZRyVK1A9Lc4EUETCZ0oes79qmg68ntyY8uBCTbxNvHYDnZ6SyK2t9Axen7m8iy5H5a
	+UJy3SIqfeyQMPAOf2+Qu3PF1eJoWtq5ERT1MCSuEWv0kFH3Q9TCwh+1PPKUlItq1lhg
	pzmZL3/JvkomgbwHBQn+7aZsDN13TzLZvP7ct4UMXpx9l9rgPPXpotHrNTyifMa+gEie
	31eixIF/Q4gVnx+XMf8zuQ9MczPCKQA1f/Es35kcO4yQEmv7B3L8ALFCh7iSqqYIOb20
	f7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EFfDJg+amLZpCu9OuKOQxE0DuQNQ0Z4P63z4FSBJ/aI=;
	b=BJb497ZObnTAt/yFxsZfrgTCANdPuTLt7oLVNu22eX49dvqVXJObzajPzLmmjEE77H
	oalmUSI1sGbdruxVRiMbebN6k7V4V1w01uEqWUi8vtksROPh8TRrUzEmtvC9ukxML0tc
	ZApXtmRkAtsuE6aYAlRiYPH/2tkJfhSsozcdB9AImJMVHJlVdvBEqsDr4fKM2pcbMeWE
	2FT7ScD+3TvZqDS8fYTqyPVdzcaeAjO3rLPkNjrt03JqTPuVHOKtoQJLPEVxWjz/eXC+
	qqbsI1ILTr3dmO0hZrsPpJeBQq/zCQPuESVj50LR5Dd9AhZuBsCraAa1Ez5ydqdjtPo8
	cNpQ==
X-Gm-Message-State: AKaTC01/zXTawcdysSd5or35On3MkanyZJav3ORmmjSJFRFcie3c+uH7nQd3MqSG7qP41w==
X-Received: by 10.99.127.16 with SMTP id a16mr3535469pgd.27.1479892958174;
	Wed, 23 Nov 2016 01:22:38 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:48 -0800
Message-Id: <20161123092209.23699-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 28/49] openldap: Fix Build error due to missing -fPIC
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:36 -0000

Fixes errors e.g.

relocation R_AARCH64_ADR_PREL_PG_HI21 against external symbol `stderr@@GLIBC_2.17' can not be us
ed when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 4e95a77..05ffc5c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -148,7 +148,7 @@ PACKAGES += "${PN}-overlay-proxycache"
 # Append URANDOM_DEVICE='/dev/urandom' to CPPFLAGS:
 # This allows tls to obtain random bits from /dev/urandom, by default
 # it was disabled for cross-compiling.
-CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
+CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\' -fPIC"
 
 LDFLAGS += "-pthread"
 
-- 
2.10.2


