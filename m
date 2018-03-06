Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 83B1E78A7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 01:55:12 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id ay8-v6so10944194plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 17:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=kev128FJgzB42UbFfECmzJxSznh13vjUKiz7rhNGRik=;
	b=HzzIZXHVopK8SJ4z73smuKgIZfnc1vJpVFS/uZ0vj7EAIVS1D0FBpMOXvK44DziaG5
	SzJtFUjet3/v1swe8HvELJLnzL6H0yZNM1KU/U8GXwotposW1lLRI/9KwdXSMEMUaGeB
	GRZiER+VUlcQJ+42i8xSydxTv1PVpvAafn4fjS1XDZcLH0vnKw9dRe7+nXqPv1jZOCqe
	Y9mCXgatGOdioGNnc/MdtUGMPlbxlaUxJnRALKObJ/ATSo/cpNknEyYhepwCAffiP04j
	FbqmGXwDUjjwqbX15vviGKV6JxhDR2aj65pRNnkBiLdZIc2rzKiSxx/H6QH68Dja6k2y
	eeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kev128FJgzB42UbFfECmzJxSznh13vjUKiz7rhNGRik=;
	b=cesplP9aDV/l+iuSx4cssC9XAqYbhLY9w2xecwE+hIHLfn/hboBJHiCD8P1pGa8dFl
	CVBLjrjDAMxD6jCPRCAGnkfm1nUs+ucMqPGxPPh0VGjVU1sWT2cibTIXqgo4XgjI4qPa
	qt1CQ810uOyYIWl9BzgooVI5rP2l1REV+kTVfp3frOkrOPTLb4VXzq+TgNW3+8j6TO/y
	Lqjc4PFmhqpKG+Ix6ergf06gPJuwAnFoxlJP0zYq8/WnLU2jy7qK1hdyFoBDclCe9JHb
	WDm74vp7bmoPXfbHa9EXMpG+gfTFWLTnXjk7VqUioSayr/mHJj4E5fLq6TpE+Pg0HlI1
	OXLQ==
X-Gm-Message-State: APf1xPCdP0RjDSmvEtUTp+rd/S/VRcWYMF/MrmaulF1sgDq8Kopb/Tl1
	2MZJVjseFVslD9odQDiLTYo=
X-Google-Smtp-Source: AG47ELsLBsVTOkwN0lxpj28Lmcf+62BGrkb/OW8RHY4rQFWRcHtdejA/J2JCCtQCNTM2UgatqYBM2w==
X-Received: by 2002:a17:902:4d:: with SMTP id
	71-v6mr15091773pla.341.1520301313797; 
	Mon, 05 Mar 2018 17:55:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	p125sm31985927pfp.43.2018.03.05.17.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 17:55:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:55:09 -0800
Message-Id: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/4] xrdp: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Mar 2018 01:55:12 -0000

there is explicit dependency on libpam without respecting pam in DISTRO_FEATURES so add the check to prevent people building it against broken libpam

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index 88e309a..671a251 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -8,7 +8,7 @@ inherit distro_features_check autotools pkgconfig useradd systemd
 
 DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native fuse"
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
            file://xrdp.sysconfig \
-- 
2.7.4


