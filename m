Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE117F3D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:30:47 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id az1so1605453plb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UEYOpPqNmVdXFvVmS46maoNrtmIreYYZoUBzm0Bgylw=;
	b=rr2hSxN55xLIK32243TeXqKNn2zcjEMiH3EroRgI3Q5BS4Qd4WpBrMqTaDbgJkDicK
	89SD8k81BA7OGnNkVwSNzy3OMIpgKkxOL8460s7wZm5sNUpo56H2Wq6MCq7HJJxuOygU
	0Rq/CD9giSLL3fgDfflAxNyeIEMRPmh91L5gr9cvwG2mukbrFfDMhaw7th56lN7lg4bp
	DD1/6bGvfuA3MggnFzMnaAEKHBySzLTqMO5+Hm3300lFJU0jDULvXhzPcsA73KCxul4h
	ehJ5jNTwlIFASxUZ9z4iWvrr8wpIl4Lvvt5eYkRAicG2ek24EHgyIksve37UaYB9Pg+J
	5Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UEYOpPqNmVdXFvVmS46maoNrtmIreYYZoUBzm0Bgylw=;
	b=IjPZZtY73zVOjolSj7JodFwaWYNanvtP9rosrS0uHM8Oi5hTuaMO8XUYVtvPxfMxAI
	evMMlb26XJvjzIYpuM/7qsmuVxgGA+bAaSUO8/KGWZgmYa0taMLdEuhKLu0nrRKZoXAs
	/MNj+5lp9pnJ4CK+gAiOPCftUJS74o6UDG2ES/bm8XZ6XF5FnBZBHvL8fBPvOFuQ8NEi
	11txCJXNHnNMXieGFZ5oIjOOQi6/34nj97Qboy0PvTXDAc2MXzPWuKzLpZs2iFvCqXwF
	WCHCy3T/RdaZswfejfY9ZHz9Ln8Wq1gOojh7kFMRibp91BlmUG3HRu9i7qX6pL0l/ahZ
	ZrNA==
X-Gm-Message-State: APjAAAX5+v3meIfo798Q+Z9qOy0CjhN5s/ph5k7tB4/MUdLKbx5V42Iy
	v/tIUnZ9e4raqUJCSUYxbJgBBnXd
X-Google-Smtp-Source: APXvYqyaLeEC0ONMCOAU9yzf/maE2qXpCQjwyT098dwO+U9MndiV2z98B5ovJKGCKH3xh/XDP4p7lw==
X-Received: by 2002:a17:902:6a:: with SMTP id
	97mr13382023pla.257.1567132248436; 
	Thu, 29 Aug 2019 19:30:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:90d2:579e:19f:13b1])
	by smtp.gmail.com with ESMTPSA id
	d14sm3731425pjx.17.2019.08.29.19.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Aug 2019 19:30:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 19:30:40 -0700
Message-Id: <1567132240-27573-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
References: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [[meta-webserver][thud] 5/5] apache2: upgrade 2.4.39 -> 2.4.41
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
X-List-Received-Date: Fri, 30 Aug 2019 02:30:47 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Security fixes:
  CVE-2019-10081
  CVE-2019-9517
  CVE-2019-10098
  CVE-2019-10092
  CVE-2019-10097
  CVE-2019-10082

See: http://www.apache.org/dist/httpd/CHANGES_2.4.41

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
index 70dd1ab..f489bba 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
@@ -25,8 +25,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "930e217ba2d71e708a3f1521ecae7ec0"
-SRC_URI[sha256sum] = "b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2"
+SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
+SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


