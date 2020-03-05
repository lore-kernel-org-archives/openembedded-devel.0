Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A6B5260706
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 21:21:36 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 2so3361475pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 13:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YbMlR67FAjR5hs/n3MDAX0iKvGLD6geFHogs4KhKLGY=;
	b=p0IHRXdljLFxm0g/esW7uO15zyXEZwme0Tah/ZK/fD/UIbL2utPEls9ORfEv1yjx9F
	TNBYfAd6NJGE9BydtlPkMlVaOtIw+yxDJJYxKMndF9hsETVofMfh8iAn+G7UFsUEKLdl
	eMi/yU9hlLMYZ1slYxxUFGS5cU4+YjMri5QWQP3UwTQ/VY2sGaZQmEN/sj+0b0NeLHr+
	mIQrA1xPhvE3x+iAYpHB/PI0cX0lweMGOj84bD9RLhrTGNbG63fBZRGDHYBTu34EHMNq
	H9q+85H7bz9cGqB43kMpEvm/tZYkF2F1v7GghujhYnsrne7NbnM9r2F8b8wS02E9CKcz
	6KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YbMlR67FAjR5hs/n3MDAX0iKvGLD6geFHogs4KhKLGY=;
	b=sw9EierDAXea5BAgdB43KTzCuLwOMu6SQ2fgN4D4SYrvS9dfQAsBuFGUGmvo1xl2TY
	LQOmBrvSLZdMXWmKJZ6KpJuj9AN3d9nWiHrGZQNTo/4bHKPaFpG0u7UfML63OtcwCTxT
	+Pb+KS15IGFAvCqFqtHy3bMQB5CE00zE5PUsSwY1ASJ9uhDK+E94H2acl+tbPBmarZWY
	Q/jF8qlMd4N0bMb3WBeUZfZstS3MXBj7bEGBAgne9qciUKFUCCcNoQsI3QcnWp9MXhPF
	Z8faBqm5ZB4RRJfso2aL89xosWCO6uBgiPYZaqPyqWfAkRTDv7P4/wWplM4PQ9Ozi+o4
	nI2Q==
X-Gm-Message-State: ANhLgQ3z6XiXmf0fFSeStBswIOry/n97H2Sdg1TDbnw363GW+ZGae440
	0vqkYAmV/8vd1fNboNn9O2dRHLjG6II=
X-Google-Smtp-Source: ADFU+vuzAIeEYnEVT8tztrEHa5t+pua1X4a+P9t3uuqqarKbYRlKluhTHn1BarNbXZrBJGi3bBsSDQ==
X-Received: by 2002:a63:5f51:: with SMTP id t78mr104930pgb.362.1583443296810; 
	Thu, 05 Mar 2020 13:21:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	e6sm7716361pfj.174.2020.03.05.13.21.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 13:21:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 13:21:48 -0800
Message-Id: <20200305212148.1210753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] tcsh: Update SRC_URI
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
X-List-Received-Date: Thu, 05 Mar 2020 21:21:36 -0000
Content-Transfer-Encoding: 8bit

the ftp site seems to be intermittent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
index 79ab67ab75..b30c3434e4 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=575cf2715c3bf894e1f79aec1d4eaaf5"
 SECTION = "base"
 DEPENDS = "ncurses virtual/crypt gettext-native"
 SRC_URI = " \
-    http://ftp.funet.fi/pub/mirrors/ftp.astron.com/pub/tcsh/${BP}.tar.gz \
+    https://astron.com/pub/${BPN}/${BP}.tar.gz \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-- 
2.25.1


