Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22041.1794808944854017867
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FdvKJq9c;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso4512384eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808944; x=1795413744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAWkDoNVdzhXz/YkG7mY1Qag9SzPoO6jH+Y6/6wF1Tc=;
        b=FdvKJq9c7ETcojnxgj0QNNeJSFRUadvhEwwTxWTkiabMVjnTzcY7PXKdMWrRMcm4GE
         3rPNGnAlO++uxQMi/W+92tzDQEmRbZPo+DbLlLeQS4G7M0IsHIX7n6BR5r8b+snynQau
         uLv4ssoTJEZWCBi13wb8n6jQVG8wOuvW7lWO7I0u6est4NV8DFIFJIlzaLPYbg+U0xJv
         N4Gk14J8H/7CoUDsYuJljDvdqDugu+ZN/yap0GKrjxL0a5jv2aXNQJnjsY7EcM39KufJ
         5J+4TSjBmcgRsY+QbZP+OeG5lWAoOJORPSqsD/zVk1f54QWub7UVQUL9nEq0RTsdFXeY
         w8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808944; x=1795413744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAWkDoNVdzhXz/YkG7mY1Qag9SzPoO6jH+Y6/6wF1Tc=;
        b=plYOEte+Y4RoQ/AAGEg01NR9/NkSUBOaip0v1M9CG7Q6ug0Y2f1mCjSu/ihivN4PKr
         AyXQcvD2h9d/NJIwfBjhEKrOyZsPSbvqd0Dt1MabG9ge3GExHj5ZUy4VlDW/Q2qeUGmC
         i3ooqy7AdrLYEV72YscBz5W5Lbgwcqqx0vvNvKpV2FJfjyxegZI3uxeHC38kcFr7SOYI
         iHvCZCkS5zjjvOtP5Yp8zfBOlLg6M+Ec1SxjBbn/HrKO+hGsP62m59dnW/yJgJ3A8zlc
         avMOBtFvhXehXm3gGOFdyzgZjBf/ce50Sffb20+GXXuhpanmz+jXy+3OpXeB+TTdf25D
         wQ8Q==
X-Gm-Message-State: APuU4Z+1dxDNEKyuGgxDyoffKi88gGEHYTqhSDxwozCYuxmf0PvUUqlZ
	IL9ZhmqWFpfS4YY4jnpk4NX4LOZKLz3FrKWzZ12tdf8MI4bk3KGZ1rYXx3oR+fUn
X-Gm-Gg: AYBFou11iOMrzdEqJEvJT4r8trgmdIMygxrzBpLSLA9hj+RkULcSbFU0Dfu/ZP370jL
	c3+/DNqYoIu7AHe+31Ncg7MSNDJbFEN4QiNisGoIKIoNGvi2ft6kPMC9jzNyEup0no9tP2a32JQ
	2pVyaFTdPvL9IfqfVE4/9p25bsUTgEVdgnzmpSzqzsNcGeDu5kXvmqoR3zo268useZVwzs+9/VM
	XLo+ljAQ7a2UJ4Uq8Lm5og06qI7UokFCqZyITf6HBjGDLtJZmK7xs0O+KIEchhO9VAogXbcfyg8
	oK5zjOOVklmzO6QvxWlp3HLwe/6dJPlEpvVo76rAbfbv8Y0/jBXd2u4ngY7HSjt/enQdJB9j6Mi
	mpOkpQ9k9mv+QvIO0OiJ4J2lt3F8Gefm08s8RjTO4GV4FaVwjtWfSO48dENu7kOyMx3R6TolIKp
	GFZVWysV3vbUTsgAx5Y33+LyOfRVOUl13gPt/V3ZegH9wLIyxd/VtoZLtymLHXXAGFF2AKmFZWI
	KCJh+XTNyV4TGnz/sGqBtagiOQrq5ziyPrtWoovYy70MRULiUuKt/RLaacgtZ3fdbo0KX/VEArB
	h8KliiVg41dWcqZI9WWfga8YVUOhk9FnUjoQmPqDySnwFnRIOi5bZc8nGmOn990HBjC73YAGkvK
	qFODkTa0jCAiSjT9bMpoesAE20f/KvXaqfIYGHNtIR0b/6xMGdI1SyDJuSXUJKb68U2fqDyRnfH
	UJ+QS/1e4KrW/U2KetMkwOovmoGCYG+jx2DZu500rwUda50Prqv0pIA8eByKBg4YcxrlsUFbKup
	lWoFqsFrayXUbMWmx/RgcAg+lhWHRnqfabEIfOn4LtBE/WYSxXjxWh61LbLGO2anlisf4KA46we
	KHQc
X-Received: by 2002:a05:693c:8813:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37967315a29mr9212282eec.16.1794808944125;
        Sun, 15 Nov 2026 22:02:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 11/30] libhtml-parser-perl: upgrade 3.85 -> 3.86
Date: Sun, 15 Nov 2026 22:01:49 -0800
Message-ID: <20261116060209.2916444-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132409
Content-Type: text/plain; charset="utf-8"

Add the perl modules the ptest needs (threads, utf8, ExtUtils::MakeMaker),
and remove t/headparser-http.t, it needs HTTP::Headers which is not
packaged. Most tests failed with missing modules before.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...arser-perl_3.85.bb => libhtml-parser-perl_3.86.bb} | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.85.bb => libhtml-parser-perl_3.86.bb} (76%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.86.bb
similarity index 76%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.86.bb
index 34e8cc6de8..2b76eb74a2 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.86.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "fd42ba6abe07241cf0ad57be246c3980065f683e4465e59b46af9efebc8e0c71"
+SRC_URI[sha256sum] = "5305e1d5faa70ee0aa282d85a5c9aa93911e8c7afa590ad1ced5703a544e20f6"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
@@ -30,15 +30,24 @@ RDEPENDS:${PN} += "\
     libhtml-tagset-perl \
 "
 
+do_install:prepend() {
+    # needs HTTP::Headers, which is not packaged
+    rm -f ${B}/t/headparser-http.t
+}
+
 RDEPENDS:${PN}-ptest += "\
     liburi-perl \
     perl-module-config \
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
     perl-module-file-spec \
     perl-module-filehandle \
     perl-module-io-file \
     perl-module-selectsaver \
     perl-module-test \
     perl-module-test-more \
+    perl-module-threads \
+    perl-module-utf8 \
 "
 
 BBCLASSEXTEND = "native"
