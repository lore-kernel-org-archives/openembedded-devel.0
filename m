Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 964C27342E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:36 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so7581928wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ImVw25tz480zbxLV8l/Yk0VvROB+TEKBV6u2VS3frKs=;
	b=kl+HZS1mQGHvqGrsZQGiyHkSEnJMOkDkE6j36Kik1d/yeR2+vtcnz+TLovRLpcmLvx
	rlKbaP2MR8XWaMSUcA68LnvRrJN17wIgo4vjfZ0RHdwqrvhQQq6zlEmFI0D2zcNN7AA9
	wKVAyWWj6K9nbz6FqYZSIbpde/QZ71423db6uLV0iRJWUcLVZQ7yFFoI8ZeaurcWGCez
	5wB0mBJWqs+om3t8ZidtRlwJeu7BfqyOrZ4Piu66d/kELehT3dlZ/Td2585UdKZXPeE3
	c0vkWdFoeeHOKB+bgpCMm3CloeEgtf+LvR8t2arkDEJT5QzASStHekMYwIFhpBwsAmxt
	W69w==
X-Received: by 10.194.8.2 with SMTP id n2mr11869617wja.46.1423776157638;
	Thu, 12 Feb 2015 13:22:37 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:57 +0100
Message-Id: <1423776119-14981-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 17/19] packagegroup-xfce-extended: add xfce4-timer-plugin
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 3df7440..28e452a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -31,6 +31,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-places-plugin \
     xfce4-systemload-plugin \
     xfce4-time-out-plugin \
+    xfce4-timer-plugin \
     xfce4-embed-plugin \
     xfce4-weather-plugin \
     xfce4-fsguard-plugin \
-- 
1.9.3


