Return-Path: <philip.balister@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE71871B9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 20:13:31 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id b2so1302683yba.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=6n19D72NtL3+tff9KpCmC+zVHU0k4XrgBemrYNiP6+0=;
	b=rQZnxD8h5pAQjf92AtcYgNhEZVSFtT6Azc/Sy5zGAo3H2x/CyXYyIBMrsWjIFfIh3U
	jHh5CW1/bcRrujUttYWSUU6+HpQz3S5REKNciHciJuSJHZ/fT5nuJxlL68ucJ18gPGJc
	HL6EJ1I4rk2AEVPoQUmQ86+CaOIO47qyVMmObBwYQbXNRHG5hSUndZvXLcyaX50AA7t2
	qnXYs2fdgtCjecsJVtOdlZBG/q83DgXg+COCyS0eyBoKNSV5rBgM1Vauk+pRWShxwm4G
	sXV1gTPBzgQbeeRxVcVjTVRwLjcIwVc4vG1iBx7Lqekja+DYpk7RY2NTuI/0rkyq1J02
	fygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=6n19D72NtL3+tff9KpCmC+zVHU0k4XrgBemrYNiP6+0=;
	b=VCpp30UyKr6DRRP5QuD7tdYwFVJKmty1MsAuYG9iJYKjdz9sJdAQkcht104S2KIxDh
	Jxj8uSRETJUezKj9Q9D8+kg0pivlGEzzD63Ogpm7bP3mf9PxJTGJRqc9PL6GjhwDDFd3
	yHmdmsVF3ya/6K/JbhcvMOkR+jR4XCjAPv23mTz7UtBz3vYJOs5FJDd/vX4Xyr4ZohMB
	gr20+hsUDoSKbXbl5PuaU0f9A1oQykrx801GJm/DynEyZ5dLBRWqUVZ4mrU28YFo/1G7
	pjBQkrC2yN9kJaBzZXyLz9uV9pMjwVaxEJXMqchlSEe0Gf43aHIS9oF2LFG1pffyn5W4
	RVTw==
X-Gm-Message-State: AODbwcD3jyZg0MXaRgWUChgbeohasFXzuyD0cDtfLv7vpxF14Bi3E6eh
	d1N/PdY+nOeXkg==
X-Received: by 10.37.5.209 with SMTP id 200mr272557ybf.139.1494533612611;
	Thu, 11 May 2017 13:13:32 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-165.ronkva.east.verizon.net.
	[71.171.14.165]) by smtp.gmail.com with ESMTPSA id
	q129sm198986ywb.53.2017.05.11.13.13.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 13:13:31 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 16:13:15 -0400
Message-Id: <1494533595-30956-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] sip: update recipe to 4.19.2.
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
X-List-Received-Date: Thu, 11 May 2017 20:13:32 -0000

 * Needed for PyQt-5.8.2, a recipe I am looking at again.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/sip/{sip_4.19.bb => sip_4.19.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_4.19.bb => sip_4.19.2.bb} (92%)

diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.bb b/meta-oe/recipes-devtools/sip/sip_4.19.2.bb
similarity index 92%
rename from meta-oe/recipes-devtools/sip/sip_4.19.bb
rename to meta-oe/recipes-devtools/sip/sip_4.19.2.bb
index 82feebb..1d837c5 100644
--- a/meta-oe/recipes-devtools/sip/sip_4.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.2.bb
@@ -9,8 +9,8 @@ inherit python-dir
 DEPENDS = "python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "be51a05065c9323b98a2ec2966c64e6a"
-SRC_URI[sha256sum] = "014bf55f653e0d8bcc582705ef4fbd61e0859a36e959ab46d8fa060cdf0b5e27"
+SRC_URI[md5sum] = "4f48e212890ebe584e8d804cfbcfc61e"
+SRC_URI[sha256sum] = "432b4aad25254e6997913e33b1ca3cf5fd21d5729a50a3ce2edccbea82c80533"
 
 BBCLASSEXTEND = "native"
 
-- 
2.7.4


