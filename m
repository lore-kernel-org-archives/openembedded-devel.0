Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B79578678
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:52:33 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 68so10209487ite.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QpF3aUnscpTsI33mGng3g7X9AUk2kvRxD37RArxJVJU=;
	b=DEGHENpXmkUnnUX6p2o3HBAbm7Jw00VgVzTaiRXoQ3k/yuqsPxgsyvxx17rUai8oLx
	14wU6lH0ZNgWBz6+kOxQftVWVUCwAkEPTErk8OLIxy7w/YhCe7L8nEuxOCnKWEPEmmHf
	Qfo/UAzH4tJoPdAm451AZVE9aV4RkcvsRmOCDBro4FCgyW7Y27U4yep51VRzPznhpiBO
	BOJr5AdW8Irac3ZG5Mz/ObxGSWKko3DaGVqZB3yB9X2yIljHFrr8NK8/6L8/cJAGIQrb
	xhR/tL6D8z7c5CISk9xJKtoA/kjyHLler7ktCsRpuCcC/GO2CjAfd/XwnxG/uNrfc0IZ
	b4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QpF3aUnscpTsI33mGng3g7X9AUk2kvRxD37RArxJVJU=;
	b=aI5anqJ3Q/ZiMjremeMqz/wrSAWUvFyIPAG9l6W9neZMDCW8uaQ0baXxaoOqVVqAEW
	uyRqWXhgmjRqc2d5VjVwUpWPGiOCH5tYeqwbw2Fomz8kd3JMvvxJ7KJ68urYjIwwPrJy
	w5N3kwTImMRusRoo45Tbhecaj64873/jmKu4teQLczL++VSqEj32HKCAUc5MQl46evoq
	cTVtN2P1iER3svAdGc+7WouUxVa/kynzGT9DLq9KhoDMNHIsNXE7gu5SBTHONsVVGvkQ
	T6eiUxCTHXD6U0QCkVC2SeJIUn0DbSErjB/Q7xVBmfOazWope3pQvs2H3KqoFJTs9UWR
	zORQ==
X-Gm-Message-State: AKwxytd5sdQorSc/xMllA2dtq9aYPUc2cuQyNLyJJHR2j3y5eEi+k7hX
	cTmSfhMs61Fi/wOQ6x19TLU8j8yL
X-Google-Smtp-Source: AH8x225JylUGLubR9VgfFcHbx6awGo80Fm8HlAR68XOzvHBfi3Cld6jZTJhKpEQLd7vwjwgqZkuXHw==
X-Received: by 10.36.118.21 with SMTP id z21mr8405362itb.116.1516636355115;
	Mon, 22 Jan 2018 07:52:35 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	202sm8132951ioz.84.2018.01.22.07.52.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jan 2018 07:52:33 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jan 2018 10:52:28 -0500
Message-Id: <20180122155228.27517-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [meta-oe][PATCH] uriparser: add
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
X-List-Received-Date: Mon, 22 Jan 2018 15:52:34 -0000

Currently the following layers/recipes DEPEND on uriparser:
	- meta-measured/recipes-tpm/tpm2-tss
	- meta-webos-ports/meta-luneos/recipes-webos/luna-sysservice
	- meta-webos-ports/meta-luneos/recipes-webos/libpbnjson

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
new file mode 100644
index 0000000000..825c868ad4
--- /dev/null
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "RFC 3986 compliant URI parsing library"
+HOMEPAGE = "https://uriparser.github.io"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=72b0f9c74ae96eeab8cf1bf3efe08da2"
+
+SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-test --disable-doc"
+
+SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
+SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
-- 
2.14.1.459.g238e487ea


