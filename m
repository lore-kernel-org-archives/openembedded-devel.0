Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6405D77E51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o123so18541596pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jWOdrk65W02Ms7lxadgD8MFo2raDy+wMA0H9XbxI+64=;
	b=Hw9L47g1KuSVVmidiAQ6dkeDh9MTOIBDaQyx/ULMEGExdBHhj53k4oajR/hRkSziN5
	rIsjBO/ggBRD9F1M+K1D9tWHCgRi6lSzoQV2Ga/g9CnLyHnvEV02Rxn9aYRWO5wAAig0
	FI1FDc6J4NGjO8LFu++G28pNc+AZhn5kozA4/utI7SJQSiNzQRNm6r1xINP705hd0LLV
	w9yrQsFFKW7bEYZ72eBvUpwjfFiDQjnGjtc82PC27xcbdtR8LTRMtzl4/Mer55N9H119
	mq+eZBYciqN2gUWvnpXQfIu9y08Y7OluKpmxE+GA/p3HxohmbDH70XJGSJHkz9AMq4L+
	3Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jWOdrk65W02Ms7lxadgD8MFo2raDy+wMA0H9XbxI+64=;
	b=Al2vP7eg/f+YgVGnGWPCN+Tax5p/g7/sMqRIt+vaqOYVPfz3bAy0O9/H6bWIqjIGE4
	btIrUxkJF2DCcPEEFNdIwkCn7kr0834LayvUg+UY2IBY+qu73uZWadpl61Ui9/hkw85B
	1EN2a/8WScrWRfO47ZtsVTJe/QUHP/8J7pfblJz3L7TFHVRKeZ8Mmt1uC8RGhZXFsRp7
	bLfOhPwfoFwj82D6xAlH1DXuE2rs71gBlNyvPsJg100nDDVr/d6s5/bhxWy8jdpPD3aP
	yMOjDEVSBpv1JXzi44stVOEqpGRpndStGeu0XPQS3USoFk7VeVndFaUrTkK3za57PXc4
	RkSA==
X-Gm-Message-State: AFeK/H2JHEbRIQWZdMon3mDT+PVJx88MiOkbHXg6ALLdORoO238tM3AWTJAQGWxtTnexfw==
X-Received: by 10.99.132.73 with SMTP id k70mr4126651pgd.28.1490978599355;
	Fri, 31 Mar 2017 09:43:19 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:21 -0700
Message-Id: <20170331164247.5052-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 17/43] aufs-util: Define HOSTCC
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:18 -0000

Fixes errors like below

| make: cc: Command not found
| make: *** [<builtin>: c2sh] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 7d5352eb4..50d8b909a 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -18,6 +18,8 @@ PV = "3.14+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+export HOSTCC = "${BUILD_CC}"
+
 do_configure_prepend() {
    # Replace sbin,bin paths with bitbake environment
    sed -i -e 's;install_sbin: Tgt = ${DESTDIR}/sbin;install_sbin: Tgt = ${DESTDIR}/${base_sbindir};' \
-- 
2.12.1


