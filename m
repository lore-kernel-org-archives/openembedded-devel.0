Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 61EC765C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:45 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so125433035wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=lgHyGci5L+dFcUakScRRst7esJ3Vq8UPj6yREz0J+1I=;
	b=ra6IT1RRYBZ9QO3e8hhveO5NScQ6+5WoTloV7jIIMrnMEjK9dhc16sJzTb88Y0nLbO
	tkohNzcXDO8lb/XBRu3b96mrr4Akin12OmyJPDMnyV9U9IIzpA+/dOTQOCtIejnaP0rJ
	s2is3v3mbVYc98vGgUGDWlB4+amIhbwSCYpZryjqUoDwIAxQ9/JWf8Z0IxR+dMQFbmXk
	YCN0r14vuaVEUChmhuUk3T3goDf7GKd6465Zj+B4bTyL5340uFRJxGR+AqgfBy5QVjY8
	Ex/fCNio0O+Apr23rwq8pPzipcU8NKX7dBGddh1cYRXLzDSOC+cXHmr8t7qfS5SKPamL
	zhbA==
X-Received: by 10.180.20.177 with SMTP id o17mr44927549wie.93.1441727024719;
	Tue, 08 Sep 2015 08:43:44 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:58 +0200
Message-Id: <1441726980-32656-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] meta-xfce/README: mention meta-gnome in layers required
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

form a quick glance meta-xfce at least requires libwnck and gvfs to
build an run properly.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/README b/meta-xfce/README
index e346888..33ef509 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -7,7 +7,7 @@ revision: HEAD
 URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
-meta-xfce depends on meta-oe and meta-multimedia in this repository.
+meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
 To avoid dependencies on meta-multimedia you need to mask recipes by adding
 this to local.conf:
-- 
2.1.0


