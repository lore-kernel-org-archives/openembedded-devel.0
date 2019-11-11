Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id EF4AC7F555
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:05:50 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 15so9720384pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 08:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=98LDCQkSc5HlWx4320caZqynqbWYkcVfTEn1XcOkDtA=;
	b=gc6ZNVVlK+HNoNb+98F3r6JRNCxE9vKXzeyMTOkWPOUT7luJDZI0Akal9i7neur1r/
	yjHpmHLNTKkz3svEiZnqNVT1LLKYx5mCTWB6g66/2rmAiUVdLzcGDJDW/IofhTuC5B0f
	G599ExDA3jv31gGQ3XNZbPq500Y6VVVDpqGl4t7pOyB/Q+oVE0jbSYHppC8IfY9J2cIC
	Qq4PB+lS7puROcW12IVoFDO9/PFEU4++u2qlsjTizSwtdejtzgicV8oFp5Oj9xipoX31
	rsPoI7H1l5v8Qg9+6aZoadOm+61zM3uw1flRrvGg3UPxdejNVVYsxPy6yszFUlmHAq8Y
	0joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=98LDCQkSc5HlWx4320caZqynqbWYkcVfTEn1XcOkDtA=;
	b=VCBTZo41oRdlPYQKh/elcVE3FfrOmNBNYmJO5ACugVQlmb8y24Wk1XzddRxmDNn90f
	HbHcfbHug7ozyn4CSwRyQ6rP9O9P4frd8vI0eF/Y1Ki7fK7EEPMPkTayRBRTsrrb8GKW
	CpGcmniRXQC2Jf76NIHhrrhX1yx7NM706Eg3FlLbP5Qz9t6OWsBMC5m8mzA656kNPb4O
	WpsXdHABzldnCK0mjrqWBZ7q1ro+kZBMcHAebUuT9rZn6tbmWlYpLQOdKAJlJ/6OOK4/
	aOroZF0hhmW+bfBOiJAUFvdC6oBZP6JHJbT0qMXdV/MPJHEyIAUqqeWVXkY8QCX/KLrb
	0cTw==
X-Gm-Message-State: APjAAAWYBO+AP1M2W4dPEcijnyIYU0ep4XrURfqf58vRezFcqLYfUjAb
	7GuolZEcoApIQVfTHWpExV7RRgynqQ8=
X-Google-Smtp-Source: APXvYqyVHtdyC8fktuu9uphZHt8GxYumWtmmtWsHZbJK/oByEFBcG+cpS5jcvboIik3R6pYfnHi5hw==
X-Received: by 2002:a17:90b:3108:: with SMTP id
	gc8mr34117857pjb.54.1573488351642; 
	Mon, 11 Nov 2019 08:05:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id s2sm4301353pgv.48.2019.11.11.08.05.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 08:05:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2019 08:05:35 -0800
Message-Id: <20191111160535.547773-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111160535.547773-1-raj.khem@gmail.com>
References: <20191111160535.547773-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] tvheadend: Update to tip of master
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
X-List-Received-Date: Mon, 11 Nov 2019 16:05:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index dc6cd46b0a..5b3c469793 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
 SRC_URI = "git://github.com/tvheadend/tvheadend.git"
 
-SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
+SRCREV = "fda89e85e0b6ae796d8a09e178d3937aa7869270"
 PV = "4.3+git${SRCPV}"
 PKGV = "4.3+git${GITPKGV}"
 
-- 
2.24.0


