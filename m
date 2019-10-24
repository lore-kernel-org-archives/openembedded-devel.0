Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7817F8F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:54:12 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id q15so11435373pll.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tsd4ZWIAlCu9Z6wHprP+jzrnfP7THCozLg1bfs1Xyb8=;
	b=MCgKs8vjg3ZjzJptzm9VzR/TQ7Oec76enuKQQyYGAaVowqfV4bXnm6nlsdtKoYUfTP
	jkoSAgdC0kN2CMpUUm0Gb/m3aG1LiVZ28AocbDeemT/606BIBJ/41m+iTYzHxl0pA7eg
	lc3IicSeB+7suitPoPKgY8zBX5iAtmIppFdBtXx8ZyF64fRsc5RUgd+mbO7yvq3bIzkK
	rcntQ2i9IuzlpTW5ndWuFbWkX+hzuY+bhAXtQRS0jECJmAtfoZTIHKKezllil548Mb6U
	GDhRNQ5m7FnbpLkeVVVdkI5KArKqOtUlvgpC3UcQncPeo4uw71Du1Bhv1Cvci23IH+jO
	ptEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tsd4ZWIAlCu9Z6wHprP+jzrnfP7THCozLg1bfs1Xyb8=;
	b=NjDlUIj72qNfLeeyl7+CxnKj3NlLX+myVKngAJOyrm8H2wcUf2df9kznU/J2TjeXFd
	9Xk6LYymwQd0dva61bo9gQTe8+7pW4AaMQY2HhMb3b6D8dtZ5B/f0ak0viplQcKppOTK
	AjJ+dr5o75rzV0tKqPy3CvlSeqACles1iKSgjR5iWNL8aIXZ+Bk9uYOYV7juRbkFZV4k
	0xxyF03ixJIsgOVk/NR6DlbWMCfX7tYHHNdN2TrPPdEnP1IWqMF5yVi2Tr9DdkvrYR5m
	+LDZdfk6047p8UrMwnckKNJeFcBaJiYMznrTY4qtM5H+/CkDhKI0HV57LluWiQSIhHUV
	/5zg==
X-Gm-Message-State: APjAAAVfzMEAFYvgEVcmJPgE7j0RNmq6Cn9+33xW4P+XZRRYp0fCAZVS
	khbCKJNQu+u2ybNe+x/m3Ljixz73+KYxMQ==
X-Google-Smtp-Source: APXvYqywHHflKMQnJjsXUdxrxBxqU8CcMTrsWDg83YONNQdW3mX7pZ/yjEayBIroOWr3oHD6YPKvuQ==
X-Received: by 2002:a17:902:8545:: with SMTP id
	d5mr14737522plo.145.1571903653270; 
	Thu, 24 Oct 2019 00:54:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id k93sm3402431pjh.3.2019.10.24.00.54.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 00:54:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 00:53:54 -0700
Message-Id: <20191024075355.2136934-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024075355.2136934-1-raj.khem@gmail.com>
References: <20191024075355.2136934-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] mraa: Define PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Thu, 24 Oct 2019 07:54:13 -0000
Content-Transfer-Encoding: 8bit

Otherwise it starts to look into native sysroot which we really do not
want

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 17ca262734..6d42c67719 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -22,6 +22,8 @@ DEPENDS += "json-c"
 
 EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON \
                          -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/python${PYTHON_BASEVERSION}/site-packages \
+                         -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
+                         -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
                        "
 
 # Prepend mraa-utils to make sure bindir ends up in there
-- 
2.23.0


