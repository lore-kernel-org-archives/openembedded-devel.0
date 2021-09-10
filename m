Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.12401.1631294615074357950
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 10:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bstYhEvx;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 5so1575828plo.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Sep 2021 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfqrDMa1THF+yPJ+u5XdCFsQYRID7YmxZoqgFvPPkOo=;
        b=bstYhEvxp4eW2BiZZWFSyecHzosY5DnreBWt7KufVgMGuEK85eIKp8t0SNGWy+j6cV
         NLF2ZArYYoDn+/6uVXqf0h5WGqQ+/MIUY97u1VaLumaK1xiR1ubzMLn456dLv6VYB5Yh
         JEUWxiidJdqBCw7ZRIMs8nnq8zX5wD+2a5jHZNn9aBE/HraucED8RveZa/3JjZRfTOaW
         dknvkOpZp7N+aGInK0otBDBJGpUdIQqrw1o+pchy+2NCDGx7DpDQSwfKqhxRvQWtkOXh
         72l6BTNeZabs1gbn5CF4XKL9rs560mPvEnxCwfymFZNoGqcOjYXNFEx70eLVsxbuMqKx
         q2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfqrDMa1THF+yPJ+u5XdCFsQYRID7YmxZoqgFvPPkOo=;
        b=hZegUuQnitDWLT8pPOjHuqktCUJ1XL7aWzqvUvo5vnEPI3I3g4xbw67pck950zG6Hz
         KMPz1VRjfjZVz6EqmBZA/o1ZHcnCwwPZaLF1krRJP2QS0b4V2+FahGO2mKJyktvW1OD0
         nH5VtBEQaVTT8Bdxld5vbwNgH5jpHDBm6DDx+wR/sLyI72KAHLQ8gt+Du1QT3ZPb6vdI
         tAZuQxTh9CvR6L6KfCd2CrkG76+7wVnuPU8xuuwwcNUkGdNplQkcOah+bIPGXNBb0trK
         ORfsXlFg8GcAFXgVXeGhgMVpaLNNRJGUJFt7c+KZw1yT7FdDMp5iBLS1qKhlpyBsZo+v
         e7gQ==
X-Gm-Message-State: AOAM531bRWo4blpfZf8+XFlfZ+vfw/D+qNLA5oio5WAxyu1zbm+QZJ+C
	FABlO/UkpEdGZ243Qq643s/wCUyHG+8=
X-Google-Smtp-Source: ABdhPJw3DoUzZEAlo7e33J6I+q8teP39MyauNxZnFa1OmUQMGttKpXYBvSWpK2AyhV/0Hg/OuG25rg==
X-Received: by 2002:a17:90a:4049:: with SMTP id k9mr10742589pjg.175.1631294614366;
        Fri, 10 Sep 2021 10:23:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:9fd1:b728:fff3:766f])
        by smtp.gmail.com with ESMTPSA id gk8sm5409674pjb.49.2021.09.10.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 10:23:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][dunfell][PATCH] stunnel: upgrade 5.56 -> 5.57
Date: Fri, 10 Sep 2021 10:23:32 -0700
Message-Id: <20210910172332.2671280-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Jean Texier <pjtexier@koncepto.io>

Source: https://git.openembedded.org/meta-openembedded
MR: 109039
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-support/stunnel?h=gatesgarth&id=b76712700c79e4627028787ae65ab306c21eed02
ChangeID: 2543a2516b0f00024ed117a1fe33d1157b3d725f
Description:

Affects < 5.57

License-Update: copyright years updated.

This is a bug fix release:

 - X.509 v3 extensions required by modern versions of OpenSSL are added to generated self-signed test certificaes.
 - Fixed a tiny memory leak in configuration file reload error handling (thx to Richard Könning).
 - Merged Debian 05-typos.patch (thx to Peter Pentchev).
 - Merged with minor changes Debian 06-hup-separate.patch (thx to Peter Pentchev).
 - Merged Debian 07-imap-capabilities.patch (thx to Ansgar).
 - Merged Debian 08-addrconfig-workaround.patch (thx to Peter Pentchev).
 - Fixed tests on the WSL2 platform.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b76712700c79e4627028787ae65ab306c21eed02)
[Includes CVE-2021-20230 per changelog
Full commit https://github.com/mtrojnar/stunnel/commit/ebad9ddc4efb2635f37174c9d800d06206f1edf9
]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../stunnel/{stunnel_5.56.bb => stunnel_5.57.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.56.bb => stunnel_5.57.bb} (86%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.56.bb b/meta-networking/recipes-support/stunnel/stunnel_5.57.bb
similarity index 86%
rename from meta-networking/recipes-support/stunnel/stunnel_5.56.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.57.bb
index 3411e5d0c7..8f6de571f3 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.57.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 # a combined work based on stunnel. Thus, the terms and conditions of the GNU
 # General Public License cover the whole combination.
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=d6d635d290ba1705821254a0278f1ef7"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=6bae28875b3b599f8f621f4335b17955"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -14,8 +14,7 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[md5sum] = "01b0ca9e071f582ff803a85d5ed72166"
-SRC_URI[sha256sum] = "7384bfb356b9a89ddfee70b5ca494d187605bb516b4fff597e167f97e2236b22"
+SRC_URI[sha256sum] = "af5ab973dde11807c38735b87bdd87563a47d2fa1c72a07929fcfce80a600fe1"
 
 inherit autotools
 
-- 
2.25.1

