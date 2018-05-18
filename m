Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id CA25174C18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:23 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id c10-v6so2923076pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ySzCviZFLGlfu98cUfef0GD6RopOM4y19ZKZi+/7bXU=;
	b=QdnpLYC/tHQMS/d8u8hKQZOwwgfDdr6W+xfRoRnvrH9tHxvK0BIcc6yZZ5xtvNYJOY
	YL20hgCgsjfyWLKd/UBDWKcCzM+NWwwQKanzzUVntKcr/RJKmthR86Ej7FjVF0LEjs9M
	lGTFPQFxk8hCPvhX4OmdVs74UozpHzaJd/wdL/kaPJVAlFuMMpJmoSlGHEj7JTfsrots
	KYD8yAv+ZpI1jtKylsH4YU2tNLrOHQsKYZ6zXaUaCOd8MK6xwIPXa/TYBR0utoYIIpBV
	Iv5DZ/FN62MUDEkeCaAEpwtrLzJqTQJ2wLnhAtSY+pYES//ld4quC3PQoGZ6yyCEDo8Q
	7/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ySzCviZFLGlfu98cUfef0GD6RopOM4y19ZKZi+/7bXU=;
	b=MO+wRICbvXhFssZh72sAG4JD5gXFHkhGc5s3MGsn3kwQxwfV6xlx3rGIv7odyL6qc0
	FzoBuC/bjtS7aJHmtEaE3gZWtQtnkD21Y/NSi9BQ6jrlNLYWFt43xhFvj0zcWRhn4x9G
	Jl+4JJ56p7cNMJQvY/U+3mVd0bOW316TEecSCEKr1jg1Vb0iTd0SmdjDoqrlR5oK2rP0
	3MztTukibMU+kwAFQrsA01HDmb0Ed1wCYSU6CAvF6wAkuXiWzkLf+wnfiu2reHcp2zyb
	7Au27nTqcYlNS3gnNyn6CQ/quLc4JNLrJd0XXr3G1Ei5AfpPjbLi6DmE5Jf5LNdTSRHK
	EMag==
X-Gm-Message-State: ALKqPweYRFrwv0GL5wCpw3jG7G7cWEvhGgAVRhZ+6+rh0GdrWttAQlOG
	GmPbY2QuD2b2mEgdVkNBpUPhEg==
X-Google-Smtp-Source: AB8JxZqGwFnOhTliwKGzZDSAazoZYQEnh7kfOCrGPDf0YwVEp+Ii8KkweOIt/rjtQ8DqhaxRfLL/qw==
X-Received: by 2002:a62:b204:: with SMTP id x4-v6mr7288573pfe.21.1526607084505;
	Thu, 17 May 2018 18:31:24 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:43 -0700
Message-Id: <1526607046-8081-14-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 14/17] libftdi: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:24 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index 6bea165..d28b7a3 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -3,7 +3,6 @@ FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
 including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
-
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM= "\
     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
@@ -19,13 +18,11 @@ SRC_URI[sha256sum] = "ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681c
 
 S = "${WORKDIR}/${BPN}1-${PV}"
 
+inherit cmake binconfig pkgconfig
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=off -DFTDIPP=off,boost"
 
-inherit cmake binconfig pkgconfig
-
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 BBCLASSEXTEND = "native"
-- 
1.9.1


