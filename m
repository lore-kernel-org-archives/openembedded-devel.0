Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 06A0765D50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:27:55 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so7117279wid.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=t8qn2vWpan9PjKs+4fOE7dczPZWtmbDpiplTkuDAvbc=;
	b=U5FqA8tdP6+QFMccL6AxiJo1nph/Z6enmhSn7qYdBYMu5dzBHY8OmCCY8RbHfCcoMc
	YdYcF+rwtZ/GNYhO/Rcv6B2b3v3QrIzr+/e7irVLOmmcPZgl6ojskEFRDi9+Zea3o1gL
	raz4qpqEUT8dctlY6/U0jgsPkckv2sfHp/VK4/7pr+aICvEYGDbFY+86JirlaQdm0jG1
	YA5UjdVtJJQ8qM99JdnZXJsrNSBsmsyVjPd8AYRBzEKe4802tiwu31VofGTEVSNO3U1H
	1olayVLm8VbNTXQTfUr2cqcCgcOJjiGoDLg+BK7qR8tphZwgb1rAf2p3+QhPnro1cZy9
	b0Jg==
X-Received: by 10.180.85.102 with SMTP id g6mr20574631wiz.54.1413811676009;
	Mon, 20 Oct 2014 06:27:56 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	fm10sm9621757wib.21.2014.10.20.06.27.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 06:27:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 15:27:44 +0200
Message-Id: <1413811666-20325-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] packagegroup-xfce-extended: replace xfce4-brightness-plugin by xfce4-powermanager-plugin
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
X-List-Received-Date: Mon, 20 Oct 2014 13:28:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index f32ef46..af8977d 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -36,7 +36,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-fsguard-plugin \
     xfce4-battery-plugin \
     xfce4-mount-plugin \
-    xfce4-brightness-plugin \
+    xfce4-powermanager-plugin \
     xfce4-closebutton-plugin \
     xfce4-equake-plugin \
     xfce4-notes-plugin \
-- 
1.8.3.1


