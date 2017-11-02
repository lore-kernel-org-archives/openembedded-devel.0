Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7B15A78259
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:57 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o44so4507852wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yC50S/e1m8Ws1lxZOHOeAGaLZRRXrsQJS1ec829EHx4=;
	b=J+omr8pAQ+xOah6wlBe0E5T8QbsB8KcHKJipXjtCxePptv/fOhE93oimk4pw+rMi3m
	wn2vS4/3LrIkGgvPgqwYTppa/UK/xT4Yf9Ia1rDkAUhZ5jQdEjxXUfkJB6M/Fc3geezx
	3ORgMmFoWQXl+w5quewKjmOzPbo1GZBMjnXh/VRHqJ0xppzsMYarZ8NxPyyPpTHACiSR
	RrL8Y+OlSO32AJVZaJwA6pmKSBe7kcDM/Unh91ah4cNRwu9PlFZNdrMKKw/fPTFC3SPR
	iXL9/01mOMh/9Uwoj8prwgJywUImIyQZ5owzwLNY06pWCXXpSL+QbLI+jBtD3hbQLU1+
	TAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yC50S/e1m8Ws1lxZOHOeAGaLZRRXrsQJS1ec829EHx4=;
	b=ukK8sxKOqhwzWapRoxG55s1c+ftis1Hrk+asCDm7+SSFqAfeTjphIhDwMKpUhGQU6D
	SXXCSHuEDd1KMOQOheLUXLbt5Lp0aignYQRNNV8dkhm0saSDbgcHsTHi8dMbLu0DG8Hs
	whKl+YbwyaTozH/UA2S6Skuc/vL1B0fMStOqn5epDgnNvGFV5gQkwSCW+rtfkioVaQuF
	6sUE3+yzb8bFhJSk+Anaw6iCVkwSiWfDvwVXfmDkP/pHZmLWpuMLKT92fzq0wW1Gsfns
	O9CpQChQm8h3wgM1zLPIzghuOYmqTEr80gnbTSIvKvU2SHbqb7BpzgcNtkL5cWD7k/qV
	dGmg==
X-Gm-Message-State: AMCzsaU/Ie/YMGpdCh1XyjLZtYmRSVgaDPAznFcLBtwLF9qpONx+31R1
	ENmpho7tatOELUaxCRWn0h+v7g==
X-Google-Smtp-Source: ABhQp+RIxPd5JQXXYwhROvoF12De0UYsHuvvfFQwNhpQfzw/ONQfJDnINDrUXahprQNbbrzj2e6esg==
X-Received: by 10.223.146.101 with SMTP id 92mr2229653wrj.21.1509618718328;
	Thu, 02 Nov 2017 03:31:58 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:28 +0100
Message-Id: <20171102103129.3703-10-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] xfce4-appfinder: update 4.12.0 -> 4.13.0
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a development version but this was tested and considered stable.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb} (54%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
similarity index 54%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
index 175a827..7e73911 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
@@ -2,13 +2,13 @@ DESCRIPTION="Xfce4 Application Finder"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS="glib-2.0 gtk+ libxfce4util libxfce4ui garcon dbus-glib xfconf"
+DEPENDS="glib-2.0 gtk+3 libxfce4util libxfce4ui garcon dbus-glib xfconf"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "0b238b30686388c507c119b12664f1a1"
-SRC_URI[sha256sum] = "2ad4a58019a76a6b64a816050db25f96854917c2f2e89d6a9df6c18e6c84c567"
+SRC_URI[md5sum] = "6b6cf080c891f7945953f8084a901552"
+SRC_URI[sha256sum] = "c0eb3b29eba3cfa9175ed35174e83a21faa2a2423ddb79501fe8846cc430e3ae"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.9.5


