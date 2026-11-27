Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8208.1795739709802131433
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=El00DQ5I;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so3652290eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739709; x=1796344509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpLxTHQtTU7g90UfS3WsohTI9sI7+xwAnvan4q+ONPA=;
        b=El00DQ5I1bLL1xdgpYxDK3gucpwdtXrUkhzTeoqTP1NM/jtsYsMzjkAN0htHOzzIC5
         64itQKcDUkB6UPYQmKtp1I93/ltRSvfjWCXeU3aZcTX5koa+ewpvyKnLJiKdfwq8aufA
         hGxv4h/a9upYdnJJI2tz4Aao/poVKc1A0FKObyOORqm+vbwqRwzSlKcCAl/+SpOAeOCp
         bkXjF++PmCfyLNiQiGOtEhw+z2TOOXCO0J3ZzWu4ryEGGLy/iWMFNJfewS48MHoFllyM
         Pf0xk4od4y5pDGAA+uZAQNqxU0h5e3cSRWABEu3RRyQIeWUF0hLvaenfyEqnfuWtmVUC
         nd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739709; x=1796344509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpLxTHQtTU7g90UfS3WsohTI9sI7+xwAnvan4q+ONPA=;
        b=ZF04YJBzZnPGaglAgJzDt2wM2AKFouoZ6Ae8i8gRrJibSFNz/0dUDqMdqeti6rgf1P
         2Xao9KpH52IQHUWBNAyOdlZT7Pue0o/5rJoemtYKegR29KPUjtjI0EcbcKE+pej9h70W
         5cBNS3IXqVjgbWlFRurBnxR9b0QVMRb1ivCPGgRZyxU3vGy5p1DOnHN4HnPplyMj3n9l
         VlJVf0FOXRP/n31/P2vkz3hJhTcT9PXi0p4DGZhLbwaXRiKR/WD1YXFRWMHWWzaoODrM
         3rjCixe8yr3D1AMvr14Hu9It5ElV8n21EW2rr8kD8hzZmHSUQhlQ8952JUqlzVlCVD6H
         nb6g==
X-Gm-Message-State: APuU4Z9mSfVMbSAKGwnaJdmVhMI2DklTbdsiLY7d6+W8mAxJN6m6vVb0
	NxEC14uEDgaNMjY6pKMtQYuji2rkgu+QRv8lqZltbevcuBoTHP4B1Dj5OBvqp/Zn
X-Gm-Gg: AZFdTZfjy3L/YyVSwZRMHn06r5zIkQVaHyf1nTJ1Q9iiTEz/2x08NXElVArN8UcELTc
	5WLPTyKMwGBBJMwTgsgNe+7hYaFzk3IFsFzdMVEqT1ELhDEL5/+zMXufzHe2PJ1jaig7Nr9kbOy
	EVfNuQi5N6StWqe5VCklsChfNRBpaaE6SfkweAYUXHPQhBHdP6I2GDoeHIOffLOHotpdOpuFEaX
	Nv+Nsbp8R4BDIhfO8eUghSmGZgb6LC2tHRj4GdBll/L8EYxCAeFz61uAe+lv+IaEVT35QaizeFo
	rQoZNx8RYxQtlnU927yQhJsq/jdoF/HgcaMjgZ/BXPqebvlHArrAWgHAO7qTNJ4K3CBm2LCgwzh
	8pXMtie6+Fa7D/RDSEvBk7RxULmlYDX6zjvpRj5d9kyhAqIR30nasQmIJM3b3FccOsmoh8YmVXi
	Lp3K5LZVeqDssUZMSuNG5QoKTd8BsHbXQeChG0r2yFD4LmRFF8EgTi/3+sk7DJdag/bFSyo0nh/
	iqDj8y+q9pC9vEKKh6O1RY76ViRwkV9xZgUuvSoanuVzYx0dKKa2V9ToDI+iGlA3V9NbolMbKQY
	UyxeYewqNSQ9+vm47XGw/vbcEFHwDRK4I/iFNG5GhCn6ak2dks1s8u3cfCnqOdkK+PIow+Cy01W
	agEiJdRXAqUWUW2iy447CTf5UsiI+6+iet/jnAMw8GRAxqyVSZiwzyRKX4dihVxXdaT3Ctm5m+x
	qbznTnxd+SeA0aQv+AFgjfYU6Mm4SUZizpadrV7Gledx2cT3tUwktnBLxnmUg3uSUeD35t5a/Ed
	usnXAr3Ew1ARnxa5nEPB7CbqVarw7DdNuRvNJOfSDg3uHJDHvsqpdg616vi+ITNaOeTlTH+bSeo
	AcUN
X-Received: by 2002:a05:693c:414f:10b0:386:cf0c:8482 with SMTP id 5a478bee46e88-386cf0c8763mr8463344eec.24.1795739709211;
        Thu, 26 Nov 2026 16:35:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 38/69] pangomm: Restrict upstream check to the 2.46 series
Date: Thu, 26 Nov 2026 16:33:54 -0800
Message-ID: <20261127003425.2166632-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133138
Content-Type: text/plain; charset="utf-8"

The check scanned all release directories and reported 2.58.0, which
belongs to the 2.48 API series packaged separately as pangomm-2.48. Only
match pangomm-2.46.x tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb
index 4caf4ba3e1..b4f17745da 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb
@@ -13,6 +13,9 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.sha256sum] = "38ca0b050b065de4e3da0c182df657437757063bbf0c4b6c9567ddba019b1d68"
 
+# 2.48+ is packaged as pangomm-2.48
+UPSTREAM_CHECK_REGEX = "pangomm-(?P<pver>2\.46(\.\d+)+)\.tar"
+
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
 
