Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDCE771D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 02:09:51 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so1880641pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WEHBnFj68rMyaBveZIoHfrcAkRQOmxZ695pLeNXTrhI=;
	b=TuDVot9kTmcGiqqYdkfMrotFkclpWF6Jsxee4Ozo0FjqQW9+fmctYSrxlMGemmSctU
	HLNKB3IDTJpPfhPS9pehKYgRGRI++F0esIneZ9rfUti8+6Py9yLNTY5NJVzWPQqcBrMR
	6sF98GRoV5Iaiftw34ypU+ShknE9ZSiTY2h6Pwbu2tnXXxdiaBg98rmoV0SIRq8Pzg3i
	iaum6prumjaNnCw6qxFBo1zkHzTEWrYLbdWGFs9RjeFJbuDJjJhOSgyk0ipUlOZuCn7+
	Zcf/+VxegJrq/TcTRCyG3KjCx/REEahSjmR/Aat+tsPehaKepemVJ4Q2wS8f1R1CcLsT
	guUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WEHBnFj68rMyaBveZIoHfrcAkRQOmxZ695pLeNXTrhI=;
	b=tSuwC4b5f0CEpXFAiiktpjV4umPgLN9deAz+bfLaEv8CT334T0NkjZvz0reBKDeW/R
	Op8gS1qtzST9laNjdlk5A+54w/A9hRRwMuM1dRTk5oY22Z5MTgOAloENN1G22olE8NLm
	/+gHNxZmCrA9zME5WnfmbfbEdYgzO46kcgXrf3X8BoFiTUE+uTT4c45atLvm23QYmNk2
	1+poyvI1jjG38I8Rm8TsYsTl/kwjYoAPB1UCs30wfBTOerYLItvauyiK9NhEM0HO3c3D
	rCynZ+WPObRPTiNqFgH20QVVkJ7bBnNO32iOXrMTt9GssS+nbwKjGUUG6A3dy4GEqIQH
	fbYA==
X-Gm-Message-State: AKaTC010FkzaH7HiZD48NjicHvTJSuq7wul3vePMIn/bOd4C0cWi8o0d1/T4p8UYFsAyjA==
X-Received: by 10.84.225.22 with SMTP id t22mr21419857plj.76.1481767793336;
	Wed, 14 Dec 2016 18:09:53 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c142sm90098329pfb.23.2016.12.14.18.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 18:09:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 18:09:40 -0800
Message-Id: <20161215020940.10105-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161215020940.10105-1-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] gimp: Enable libmng plugins
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
X-List-Received-Date: Thu, 15 Dec 2016 02:09:52 -0000

Now we have libmng recipe, therefore add support for libmng plugin

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
index 1f83523..38e10ef 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
@@ -20,6 +20,7 @@ DEPENDS = " \
     jasper \
     bzip2 \
     libgudev \
+    libmng \
 "
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
-- 
2.10.2


