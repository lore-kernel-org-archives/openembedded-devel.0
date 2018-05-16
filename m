Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 913CE603FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 18:09:53 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id e20-v6so4351402itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tpg7DwaxwYzaA4mcC7T8FYfTRdBdp5Q7jCN1YGkpH9g=;
	b=c8zBHY0Cn5RxSPojWA9PE7PmaVdma1cExYuWOxs8ODK1uljqiknvLDzxJx6DYYdZwK
	JYEfxvJay+5mGuT3X1J7gXeRJfKeiXcl6+ibagLSHFIm0o3S6enhiLhhqNhWpgNxtdsg
	ugqcg/1dr0pa1zh+SJtxvTBil8/r8rq2XCEUzsVLapoBMuvq54Vp0C0wwf6KNyifW9ea
	h7AgVGL4xDpGNMSpjI6nBe3OMOfKJwOKGMc6+bUEYSLwiDNC2nI+CCUzJWGsodq937Fv
	jwOBbOZddkHS4gYbYYiKQ5mBmyYZc4oKfJnarqnUg1lBDmDJI1ywYy7ZVqV1zbIA4WHI
	JBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tpg7DwaxwYzaA4mcC7T8FYfTRdBdp5Q7jCN1YGkpH9g=;
	b=ELnwVhAnPKvraMBdwyCz0BPmpqKVD3C7oJ9AUK4BmVfewVn72gm3KOzSiiMTUpXA/a
	Em25KrjMmJj/FpLq4on7f6N1DDRkBeJnSeDackWFplM3ahXAREawMMXof0IBjS32QNKV
	EbEZnBWU+4+6cqxLJ2IFcz6B4XR1d9oS7ztw8Wkns1tuIw7pRqLIpk29mhRa2UUe9mkw
	puUKaCooZCX13TQPgHfCjHTi5+V1m6R67DhdIB+vf8WeC+eIqriICWtq9MM2xXi3wpia
	BX6CWEtcuyjVBD0POHV6+kJlhpmPFke6vtBDVXo3tRXzxhdE5rQCMj0S00Zfok2OdJut
	4+dQ==
X-Gm-Message-State: ALKqPwcFIrYv/+okulqewGLrF8MI0xUmUh01Pt3biWm5QqTyjoqxqqUQ
	MhztR0Svtl6JCOqHQnYOFsAbaQxw
X-Google-Smtp-Source: AB8JxZobpFlRU7MmwucD36HqCmSOndamzqRfvvgTclw6QJBaUs4IqBCwlRi0hNSgWctB3qt6YQwv5g==
X-Received: by 2002:a24:c146:: with SMTP id
	e67-v6mr2141646itg.70.1526494194449; 
	Wed, 16 May 2018 11:09:54 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm1571003ioc.52.2018.05.16.11.09.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 11:09:53 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 14:09:44 -0400
Message-Id: <20180516180944.29303-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180516180944.29303-1-twoerner@gmail.com>
References: <20180516180944.29303-1-twoerner@gmail.com>
Subject: [meta-multimedia][PATCH v4 2/2] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 18:09:53 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes since v3/v2:
- v3 does not exist, but 2 x v2s do
- no change

changes since v1:
- replace the frankenstein variable name "OPENHBRANCH" with the
  more sensible "BRANCH"
---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index bf56ea1d84..c044cf33dc 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -10,9 +10,10 @@ LICENSE = "BSD-2-Clause"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
-SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
-SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
+S = "${WORKDIR}/git"
+SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
+BRANCH = "openh264v1.7"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH};"
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
-- 
2.17.0.rc2.3.gc2a499e6c


