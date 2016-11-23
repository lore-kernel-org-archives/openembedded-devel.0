Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DFC5F71A7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:35 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so452219pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zEd9G+q4YBplo9yHrKE6/DaKcZOCRgDjKOoIfrUHMaQ=;
	b=DOO8oFZ1R7WtJTqmo0QxqxtddZZq5aBA5SzXNSd+PExpsvcM8WafHt+4xv8pcyGDvW
	TYBDbIexFzxT1cBevCNxGI1sbFNPYUAClYMsNp3S8KIWbm2Gwlv8QOhPQhJXQsxVxxFP
	wxNjnR6xxRFoUlTiywfT8lGcYD8wtYr9oETSBO1+bmN2J/fQmzydkd+EJMzEMqsnVRb6
	J0UYRKTwfXlgR/0Q3gs1RiSKeEv4NTpfeiW8sdaHk9es+VJo3kt2o2Bb7+dpumEP7V7b
	Ixz8/K4UJ/8eoT4vILIH3adoDTkaPmK1ZkejpVNXrbZZQi5eY3EPRUyINVZSYVc2sL1b
	TSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zEd9G+q4YBplo9yHrKE6/DaKcZOCRgDjKOoIfrUHMaQ=;
	b=FimFFbLBx9CzqdxUFpG490lAiFeUlr4XIUDN3oaHWweyizGE5gDdiwEEvzVob3ffGA
	YTvJuIIiPXiZThuFH/WvzuSwPeW/ZpT+94FHc5DFuvXw3rj6zyj5FRKSva2ZwIUAfk2t
	q2f8lSUVgHXt3FnY4SYeglHQIHkqAwWCl1UGhqi9f22mVd6y5WIKOW7F2B+MDVoCJA1N
	8ZuUMyEjyKjVFum9gNZtfFmAHM+0m+UE6MIK4wdiwAuj49U2SFS45jOxk70D6dqNSikk
	AtnJeugv48IHcFGQIJy8o6s/K7LmPSD+/kBuIeMvss4XlmvrOFM3CGvtELzkIneKMJxv
	g2Bg==
X-Gm-Message-State: AKaTC036f+hsC8m4uSEyMJQl3x/dkjWkcK2/r+6Fwgci9ZICqJ5BGO9veQYo7+Kwiq2FiA==
X-Received: by 10.99.170.5 with SMTP id e5mr3604885pgf.46.1479892957460;
	Wed, 23 Nov 2016 01:22:37 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:47 -0800
Message-Id: <20161123092209.23699-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 27/49] libgit2: Update to 0.24.3
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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libgit2/{libgit2_0.24.1.bb => libgit2_0.24.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.24.1.bb => libgit2_0.24.3.bb} (91%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb b/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb
similarity index 91%
rename from meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb
index 092a674..8f580f9 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=34197a479f637beb9e09e56893f48bc2"
 DEPENDS = "curl openssl zlib libssh2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.24"
-SRCREV = "211e117a0590583a720c53172406f34186c543bd"
+SRCREV = "4cf1ec7cff28da8838a2f0a9fb330e312ea3f963"
 
 S = "${WORKDIR}/git"
 
-- 
2.10.2


