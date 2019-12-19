Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0157FD87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:39 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q8so3451480pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sJ2w0ZPG76gM8iTwEY/g3H4OkHNygBBQ0QdcQo2jevo=;
	b=Hw5VNRx4xL0dDTdJMaNFxRGgyLG6uF3NeY5WXoTOjBpldynLL5h3xU+wHTLBe1k15m
	phZslQNPxMUDGE3TeMssW8PN+fuEtDCV1SSCq6f2TO+5E7cvp1vlhoyjDRZub3zJFIgK
	poRQE5YKVHAL67FrKnVGU6Wq+k7OKgiscaEd2Gr8Of0dzQQlLGbcn3MA2+3ZvMi9fg9b
	nRry6nZZHWv5ln6EEHfZXuhacO5JgT6uzDJB4FmW1iw3l1rE1GNtElUAil5HRB+jX/O3
	ggVVuZ25VneLJSSETiPXJQLsqwTxCSGV3Ew6QT5/813DFCBsbMyF9k8tkHZxkUzTc65g
	Ugzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sJ2w0ZPG76gM8iTwEY/g3H4OkHNygBBQ0QdcQo2jevo=;
	b=X/pyhY/W1rsSSK25lH45m/nFVrPrhmyUpfek0ba4yL4zYzxnaWyBSoDPiaClP7RwGK
	eXSlAk9fwlDtcE0q4isquMWO0jgDQo4DEuzUHL/h0Ya9GX8anzjnPeZr8ICqOaQ3SRpr
	qJAKMI1+wWQY0fEDBS7TDMx+RqcNiPYCpr+vdhU5QzpBztvjO/aAwMISeXqFOGc30nbb
	d/ouTDi4YpNdq6WIBx+2aPhQHWgFo4lEQFS3foRR86ZQDW7sN8qGDVhBVxRqAjjjQd5o
	Cv+xaiZ2UEoiU32IJ/fqZ8HYfD+u/jCFXEUVam3EKOpl5BIFP2x6uhwrF9iOu/WT7QtU
	pAEA==
X-Gm-Message-State: APjAAAUsF+UkOyNiVbWtVD+xOqVxHGUo5JPabvZzqaGF9i1c9MQa9tk1
	BGcnc/T1gBR8NHsW0T0R7+XPG5VF6ds=
X-Google-Smtp-Source: APXvYqxosB09jplPZSh1TK9OsT5qq9sNb72bI1Q67W8tfnVTYi+GSEExTS7890HtxhqTjNQUpXsBOw==
X-Received: by 2002:a65:49ca:: with SMTP id t10mr9845859pgs.37.1576769140586; 
	Thu, 19 Dec 2019 07:25:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:25 -0800
Message-Id: <20191219152529.725879-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/8] libfann: Define LIB_SUFFIX suitable for OE multilib needs
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libfann/libfann_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/recipes-support/libfann/libfann_git.bb
index c986e17757..eae24461dc 100644
--- a/meta-oe/recipes-support/libfann/libfann_git.bb
+++ b/meta-oe/recipes-support/libfann/libfann_git.bb
@@ -15,3 +15,5 @@ SRC_URI = "git://github.com/libfann/fann.git;branch=master \
 PV = "2.2.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.24.1


