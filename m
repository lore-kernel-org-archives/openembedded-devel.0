Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id D17BB7F89B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:55 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id x28so16187933pfo.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0Kt/GBRuYtMFGpVlExr4WAb2MAKmxQV1L45lJvfrHFc=;
	b=fjRr1mzC6ODime0biwuhbLR+quyzQsd48OBfvmHAduTh/WD00jqy5VDVRrlTKRG1QF
	yUkjUgGWJ4wUPbW9miikQqChsTvSNCfYtUbV+rMXhfRmeHue3rn9pax8lBccBgi3WEOM
	q19TuxtxrgsVRI1E6TpIHK0ucbN3Nl1vO/Yaa5jqgZZ+fX5ntJ6+dfhoWwLwCS0cZ702
	wWwsywJlIOveKD/PaTEjH0lS3M5IKQhcGl3EWlxIcgkgE+FzuPkVWnH/sjvpc1ii68Ck
	L3mnc3bVT2L6hpYOw7fhvhR3zvfYj6RE8LiyGTExEMRPAAAEoFmtXC8BpsRsVFKQW2Ms
	N5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0Kt/GBRuYtMFGpVlExr4WAb2MAKmxQV1L45lJvfrHFc=;
	b=fK1jqSn+ZLXA4Mc4jhORcUBYRpT4hXf9CuGELSH+yThQnh9ASDWHVBoltdsELRXe3X
	IiEpyC1yA5bD9FjBPqemdyRkxSOnSQUxZip5Qq1f41crzF2xFst6suPagY9RTAo6/Sdj
	UmHYnlFqtDv7aYG6PHP+iKbunqydqKdnvnsUpaRltzLneaBtrDDJVcTDOjIUVswWUG2g
	z6eodH326QKTm8f37CY8V73O/pMgEA5dVyICT3Pq/IUEIgMJoemyEyuBM/L1jTdOXuk/
	iSWqiOBzsxspQZFfZltbRc0fRAAWmuiUYgkgkckQ9H0fFltcugM5nrLbiE3IILYuhrd8
	n2Fg==
X-Gm-Message-State: APjAAAWmFgIskp+AWtsdPAYs1wQeUQNVHLrHk8dxL3hNNWYxpD7zCmnF
	NtICJeIT8qaQI50fCvBPNjvw+jOS
X-Google-Smtp-Source: APXvYqwHx/Dv/IN0z2F19gnHEhKp1DKRzcxGRvfL38hyGm26V3cxLio5loRoNJHLW2Rv+jGsC/QjqA==
X-Received: by 2002:a63:df09:: with SMTP id u9mr22931580pgg.20.1575137456792; 
	Sat, 30 Nov 2019 10:10:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:38 -0800
Message-Id: <ee5aa6911b2e93b89e67ae6167ee7d9a029b9262.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 08/15] samba: upgrade 4.10.8 -> 4.10.10
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:56 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Security fixes:

CVE-2019-10218: Client code can return filenames containing path
                separators.
CVE-2019-14833: Samba AD DC check password script does not receive the
                full password.
CVE-2019-14847: User with "get changes" permission can crash AD DC LDAP
                server via dirsync.

See: https://www.samba.org/samba/history/samba-4.10.10.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/samba/{samba_4.10.8.bb => samba_4.10.10.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb => samba_4.10.10.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
index 4ab8b26..e002a9d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "f3c722bbcd903479008fa1b529f56365"
-SRC_URI[sha256sum] = "c41f05fb567f7359998b451543501c7690a2bf6551d658a76bd6916316a410f4"
+SRC_URI[md5sum] = "dde27447f39d124efe18f719ccf956dd"
+SRC_URI[sha256sum] = "700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.7.4


