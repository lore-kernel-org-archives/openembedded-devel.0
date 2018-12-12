Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF56D6093A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 12:56:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a62so5664440wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 04:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WlD4XiI+d+Psdtm/k18ae/s4+RFpCcOAiSvE0pcCUHo=;
	b=EXvKeheUJ6IkmpM2dNF7Arj4riXZI9K7o0R6fvCFBTEoMOz8BX/X+dVCvilgVmrrtf
	jZt1sMsz4hc0pFA6XHf1T2BVarxRfqHVyS01dSPNCH5CuA9M2pBwrwsgi/rVW89P1dQp
	9VT0qJJGVEnq4aFjkOURWdNRDE1xhNXf9vbTqCVA9YRN/A9GkQcQAT87ZqoA6SqyyxIS
	8NBthGAVJyGpT7uAPKscAMoG7si0vhC1tPHFjcWsCYdToySRZGUv0XOrsLk7TXygV8jQ
	8ri5ZiGZana/UaAI6wgBqrqpXFEbiP+guH8eMZ/y+zLFoVlYOxtVfrdioBU5TYb3wF3y
	1ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WlD4XiI+d+Psdtm/k18ae/s4+RFpCcOAiSvE0pcCUHo=;
	b=TFp447sJMfZ73sIzXIafBkW0ah4QaX7PMTiQFOBaj+eCnXcsmqomHd4nj0MlLURTwO
	sVJH7OGQySGGRTMz3j3OjA5cH6NUyaLZ69C0l7a66kI5/Cl12rJlf1eVtXx3MU+zHtWi
	khbBtpDGPCnGSlJPbQqe7ggvz9URSckGKhdOu+15PkkLS9ymG4Ol01QK/Vizb/EpRrhC
	jMRztegxZBAPO7ARAzYFCI6qI2LbjhveZXiCCUJvCPKGM0b183y/X+NzoWehE+JTtl6T
	sPSZBMgTQ1PQVUO3IrkK/2HX++pQd6guJtfPrIhIh8gjA7xiNL/7xi1UJt+rDqwM3H/S
	QusQ==
X-Gm-Message-State: AA+aEWaTPMn74/oEIwOUK+Q1Ri8+pcc3rfbyV2uC9S0g2z4oStfKTiB0
	+F9tWDTst+vR/0V7NYYcNg6DjIdO
X-Google-Smtp-Source: AFSGD/W7BImYEvX3kiwpy9ZFMNevWTzarGbkLa6sBzzxeGGlKwaoB3ncpHD55zKWRMkn8n2IZcaTEg==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr6276793wmi.101.1544619379007; 
	Wed, 12 Dec 2018 04:56:19 -0800 (PST)
Received: from Unimatrix04-Bionic.ivecoeurope.ivecogroup.iveco.com
	([5.170.17.183]) by smtp.gmail.com with ESMTPSA id
	v6sm17095849wro.57.2018.12.12.04.56.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 04:56:18 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2018 13:56:15 +0100
Message-Id: <20181212125615.3370-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: inherit pkg-config to find brotli library
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
X-List-Received-Date: Wed, 12 Dec 2018 12:56:19 -0000

---
 meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
index c94038f8f..b4b1c81e8 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
@@ -18,4 +18,4 @@ SRCREV= "204a52610234ac5180e80a6883b62c0ad085f51e"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
-- 
2.17.1


