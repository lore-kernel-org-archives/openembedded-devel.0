Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B16A372F69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 134so2212424wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rNDh6OiK++UzHdfLH+UETft4orqeT0ay0ZLOqI9S/dY=;
	b=A6Cz7NC+dyJSlTAIr3HuvJRNE1zs6C2LLHq5ARFrnyFKBOFE/QYJV/kelHHIbLNJzQ
	sApYcV75EbYUxTSkx5w0TuRHTU8XIXkZMTYj6kly4/0LTQNlTuecc4/TRlvMIhnpF0m1
	r9DiZ17R6EgIcy/1ogMemINmDqqVVyj2Ui44iysnhUkd09whF49kuL4MFy0rq8Adwfcf
	dOmpIR86/PfWvH9tmeu7s3b5a6zE6AStkuDsD//jXX0hacBDOwo50bk2VBV0qf7rmJDU
	pNSexTSgGxTBNzwqFZSDBLfeE9vdPOmIcV9kQmtutzZIimXZGMpYP6CB31IwTeds1spK
	rhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rNDh6OiK++UzHdfLH+UETft4orqeT0ay0ZLOqI9S/dY=;
	b=hhtitkmY/ESKUy6H6LGPDarMS+LHqDbgW7IwV2B6irFW9OOFu3WiPgc9Al43QTIEDu
	WbYAsEA3gJWTCrEoYEe8k4PQSPN48ohDXraG9MwzQlwPkw5s2C35Yqvf193Mvj9PSRe0
	/SudCjWnfZcv409zAmPjCVYyuBElEh6Xu+YJV9ySWAwNS5Q0pNk18Yl9n2JB/ViJE6Zt
	Wx/wc6SosPHkZKm4QOZcXy4AI3bjhT1JSXR5WYjdej8s0vuyO/9QoO0E4qZrzP4SqohU
	0GVtg5I86LZxYWayOaWlIsrEl7uxBPArjI/ur0k1xH/1pV7jE3rSM9Pmq2sp9XYnnPZl
	l8kA==
X-Gm-Message-State: AMke39m3OHb39Xhoe8kKuqvxYdSsDcf/ff0MJyrfQOKENbqOqiXaRmtbgxNhXMZzfNrVrA==
X-Received: by 10.28.157.67 with SMTP id g64mr675755wme.111.1487804588324;
	Wed, 22 Feb 2017 15:03:08 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:44 +0100
Message-Id: <20170222230250.30288-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] abiword: unblacklist - gtkmathview is back
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index d021147..b08b994 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -125,5 +125,3 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
-
-PNBLACKLIST[abiword] ?= "Depends on blacklisted gtkmathview"
-- 
2.9.3


