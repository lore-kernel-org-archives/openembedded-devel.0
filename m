Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 55A76793E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id h3-v6so510337plh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=doIuFTzTmgAJeB6syKbQnIE6dNf5NKdHqiDT33HfaXI=;
	b=FjAj72uCYAyUQCTyKaP27zCChMHsilTAjL82jyxh7Jc8SbKXCLV9flm/uQTXQwRGxQ
	mL/Q8RlwTcXfUm5rTYn71hyEyzuwWUwj8PqW1vEZ49PZ++imbejWIxRT8TBvZSdeIjmS
	jQtHSISM4e4hKLFeYm2q8z/+W8uv3fAGFjZjQmtEhI6843/Cw9ZFN+Yb3OLeYRp5wvQq
	/T+4VvwkQnK4X2t416Dj15VyW+6mMfxOQnwXqA4h1YoUPOulxp7VtlbGp2zLqJ1E/niz
	7PsVl5ZUxg+M36oxdFTEcutDWf62mBdy/ANFmbEVHOpjc7VDQWFjVgBB+Pya5oFDl4MF
	x74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=doIuFTzTmgAJeB6syKbQnIE6dNf5NKdHqiDT33HfaXI=;
	b=DWJz7e5IOtLxjIUTEnnC59/QzCD0aObrHjY0/w6wQ+2Em8FZN6+WyDMqm57cBBHPwx
	MdF5BJ56IEpWca8+W08ZY7W3hdTQ4HeV/13VUKXiFuCZbdxU6yq1YcPWEWGiLxVsNlUZ
	52krMUamQBPyD8Gga9uY1p8gWmBZs4lxBu9uujy5sqkU6I64/70u9vk/2hgAn24/R/I6
	Q3z0j8hzy5gv35VaHUS5lk/m3Pd4UUJwWS3ulnCqTNvgOul/KM7+Ygxo8Xa0JfDUaRNN
	cT3YrqkN1Qz9SdtNmtuPF6V3cRPpWHmhpJePmRflJp+p34WCdvZmsMA5xYwYZQHca/AI
	QdVQ==
X-Gm-Message-State: APzg51Dd+B3aEkiV9qWxlDYyxSkAD4/i2lQ5pqtsfTSuyamu1dGkLjlF
	iLt4LiirHAxybUkBC9v6KuaHCJme
X-Google-Smtp-Source: ANB0VdZjgmlNZpvF/Txw86gUw5bSBEbOYgEHPZMpcFnz5XNmHpEmuLeM84IVVYH+RXhIKOE5t1MxuA==
X-Received: by 2002:a17:902:a413:: with SMTP id
	p19-v6mr40595649plq.220.1536181361312; 
	Wed, 05 Sep 2018 14:02:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:22 -0700
Message-Id: <20180905210224.21225-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/12] sip: Upgrade to 4.19.12 release
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:40 -0000

Inherit pythonnative instead of using python from build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/sip/{sip_4.19.8.bb => sip_4.19.12.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_4.19.8.bb => sip_4.19.12.bb} (90%)

diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
similarity index 90%
rename from meta-oe/recipes-devtools/sip/sip_4.19.8.bb
rename to meta-oe/recipes-devtools/sip/sip_4.19.12.bb
index ea944b32ff..be58959989 100644
--- a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
@@ -4,13 +4,13 @@ SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
-inherit python-dir
+inherit python-dir pythonnative
 
 DEPENDS = "python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "0625fb20347d4ff1b5da551539be0727"
-SRC_URI[sha256sum] = "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c960801679942377c297bc"
+SRC_URI[md5sum] = "e28b0790dfe4962ce6bbd7c4772f40c9"
+SRC_URI[sha256sum] = "24617fc31b983df075500ecac0e99d2fb48bf63ba82d4a17518659e571923822"
 
 BBCLASSEXTEND = "native"
 
-- 
2.18.0


