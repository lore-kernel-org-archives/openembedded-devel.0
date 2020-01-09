Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B1C3A7FE3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t2so8985701wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=id4f0g7+SZysBO7hrVcuhjqw0Ok2UkClJ+GUK29ECWM=;
	b=U17C5NHOuP4vElzFOTKODffGr2F8lrfBujkw+QEbeAgcJg7W4qG98dk2RQRFt28gQJ
	IPt8gh/mOxOIhx4ejiv3+SD0iSpjdSz+8gPuGjm1vdgBZbYmiI3CkTJzO0+E/RCg1yqQ
	Q9PVHb5tYyxrjaBQJ85En/LDg3e5OeU57f/HQXh+YHM024mp7HNyanTC5ZfeTsXQTf1u
	HpI2tA2H/+F4BSnrM4oSrrPAdkeT2HP1cB1AzS51LsC1HDT0YS4lGMxkeShWT2ks70eG
	TifHscWOzsbCe0TuCq54PoXAQrki+phYUvFPPU2FAJoKyMn7YfdqqtTDt61SfEpaw/QH
	ojYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=id4f0g7+SZysBO7hrVcuhjqw0Ok2UkClJ+GUK29ECWM=;
	b=OlpgQFUF0MY2qZOVkjjFS53deBeTQutlw+kHETyWK6YEEMEDvWzUg7553ooW1XzvTF
	3yXy5MmPfip8eS49ulVh/+HNU0LjnZxY+d33G4kBY9ga+FcqAOXI6fWeaEXp0XDHGRZN
	oaScC74ua/tp7a1NzmLVpLnK1g6p/tc3Pr+dlV2k6FLNJOOv4oEnsFylWMzHKgwRhOYu
	aF8sTym7aAA0pFNB+ep1WUEriiVPQPRzFTwUY3Q/Bfl6ImwE1MZFK7QHZjdu1VUoVu8K
	pWRg03uU7xraE8vp9fBbbYKDEAsJEBriamSXsuAIYDmr7NZEysvZx7+n0lSmPRebwxpe
	MvvA==
X-Gm-Message-State: APjAAAVoTy2o+votB0mHkzYd14wW99YvkvtlUNUKYfGH0d1IQ7DMBhtg
	weCrMXJBxEukx1MQvFnJR5G7ExwaTs0=
X-Google-Smtp-Source: APXvYqy5Aa4W0sCvACjtNEv27RlE6ZSHzONc/CYkPBn47HA5GNJzfTcxtapOMWdKY8CY9p95krWuTQ==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr12112229wrm.338.1578603933214;
	Thu, 09 Jan 2020 13:05:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:18 +0100
Message-Id: <20200109210518.22451-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] libsigc++-3: let meson build
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
index 0acdb3e98..26bd02c7b 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "4b77676de1e74774ec456bcc6ac6f04a2791a12cc1fe07f8305d4c3c86
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-inherit autotools
+inherit setuptools3 meson
 
 FILES_${PN}-dev += "${libdir}/sigc++-*/"
 FILES_${PN}-doc += "${datadir}/devhelp"
-- 
2.21.0


