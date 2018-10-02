Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7954E79368
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 16:25:50 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k19-v6so248902pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3YzUGGlMTCugnCo2KJ+BVVyjB85FkR65CL4vzpvEJDU=;
	b=LpfjrSn0nqvH008sTwvDLZ437A0o1LXRc0+xPw78Ih+qni0JS/TC3apEQOfV6ySwBA
	ufPobo4sxeDd/kBov6KgBlramT77Tn0S5FeiaQINU7OrR+dELv6ds13NIiox7vGnQmed
	E7dK4W1tuu70gnxNviCmOt6kCju1tpddxD+58JumRapgiq7Oljes0NGUn2N1+l26Q2gH
	CmRsxoheAEYxQdj4EMtqq7te5XtX+HeTLqCRgqA45LKNBFK8guKY6mMOgCdQkE1MM6Mr
	DFWuz3ujzpcJ/YvpQTyydW14ELFTKTLzcqHP0I0fgoKIQzme/6QW35b+pmKy7HiJW4Ud
	PVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3YzUGGlMTCugnCo2KJ+BVVyjB85FkR65CL4vzpvEJDU=;
	b=TP+vyD+UGeyRLb4k+Tj30/yKBjKFEGd7eJHZIp59F0IX2yZWLQpYuPF1nA3D0vEITX
	Js6LrzLoKP1Pkiym4y9uIhNksJfZDyV/t7/VJoG10vQIyrxWXDvC4FDpn/I12bk518RO
	ViUjnvUnuNSAQqgEhPsMHtn3j3Rt5FimXFAc5raBxSvYJi45wNTp3lK0mmuTR9XOycth
	NypFMRktFzNEmPctpNSSbINpRbpKW/l8L2GnzWs7YiCFUHNEQxSb//XA9CRvDW1tRxCP
	qtOZEIc8HoC0jUO1pFhM/ku6D9OUh8WedlTs4Rr6T2E7bEw19oi+tRyLu8XFWxUqeqGf
	V5zw==
X-Gm-Message-State: ABuFfoi01W6ZRzn1TkFD+nTND/1hPN0SHMHnf3+6VlDoHaxgpIMw/sOg
	zNtKtUnsm/+Tj36kMZhG6MUq9V3v
X-Google-Smtp-Source: ACcGV62OGdL1f6/XOQz3TbzrJfpC9QFh5f4lgz+x8T31bwXEtacSOCN0nSLKCCI4F0nH87FUd/6nZw==
X-Received: by 2002:a63:c20f:: with SMTP id
	b15-v6mr15272690pgd.13.1538497551136; 
	Tue, 02 Oct 2018 09:25:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	74-v6sm15706476pfx.182.2018.10.02.09.25.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 09:25:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 09:25:42 -0700
Message-Id: <20181002162542.42865-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002162542.42865-1-raj.khem@gmail.com>
References: <20181002162542.42865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] yasm: Switch to cmake and use 1.3.0 release
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
X-List-Received-Date: Tue, 02 Oct 2018 16:25:50 -0000
Content-Transfer-Encoding: 8bit

latest master might have issues, so revert to using 1.3.0 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index b685b42412..ebb14a8831 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -4,14 +4,20 @@ HOMEPAGE = "http://www.tortall.net/projects/yasm/"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
 
+DEPENDS += "flex-native bison-native xmlto-native"
+
 PV = "1.3.0+git${SRCPV}"
-SRCREV = "35af9720e36df19382a57be26643b0d6bb48a363"
+# v1.3.0
+SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
 SRC_URI = "git://github.com/yasm/yasm.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext
+inherit cmake gettext pythonnative
 
 export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
 
 BBCLASSEXTEND = "native"
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
-- 
2.19.0


