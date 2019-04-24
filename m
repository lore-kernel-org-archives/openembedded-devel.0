Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09A607D686
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:34:23 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id w23so15584595lfc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pz5Vu4AAeHLtWqxORbnVIyXouIcXsNgZ/qzG19uQ6Mo=;
	b=Tnyr+q+JMeucCOb3SAr4EMR1uNjvVmecF0pye2N4dn639Ri+/yPJaMFHnVklV4xJyd
	2gdHxKo6IZtVjuMJxxfn+Pe0a0UdE6i4McRJFHs0IsTNnEVu/krtfowiiWhV0J7oqVQ+
	J/Xtx9+WRSMLLR/dUwqM2ly9nmG/w2WzpsWSknMnt1UiFFBE32Y0IXOm92Y17hoaVtjP
	VCndbjiw4h7v7iyk4vfRmnUfbaCiMwyosO8YGQoDplYjTDTcBYYcbSjs7uuzoFZH/Pzg
	Baa1y8yiyDUcAY3jMn3JPnG0+RiH71O5j1FzbN4/Tm5tsLiMkJ2zsW2NMUtEQSN7Lgyv
	4OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pz5Vu4AAeHLtWqxORbnVIyXouIcXsNgZ/qzG19uQ6Mo=;
	b=dkGtcmh4Py/tzIgEPOybfwXjR9IpZUVg9zjhEGCfQ5KE7J4HTFkhw+apBWPzmfi5mr
	DEimQewYDL0BVivl5ELXtyexC4z2ImdHnmec0o0xsEfJzqvHIKeAnmeyxdmg3koF92bt
	UCQ1bSzzTnKgzfa/kWKhaweHW18xhbd4oyVlwivxtFiHo2BUspQoIsSqE2bxYm4Yq+oz
	u2SY2nJIr98IC6FJKg/eyrAXPx1o4hAgThcgkANK28v92C9j5JrcmxvdnG7AhXINn/Xe
	mjWojMgOP7dS0uh2l+2aMcCtZlod45WD+BpVfI87MfkI12w2/kK+08h6uYtEH1+Xdypb
	Te9Q==
X-Gm-Message-State: APjAAAVv8gYVmmaUwa/fhD1NK1rltWdO5Piex6wwVfOYB59OSm7+nV4p
	pZY2mT+5qM6/nUi1XmC6ya8m7zwpves=
X-Google-Smtp-Source: APXvYqwjujmfQ2hD+q7JK4mCkLSfT2Mmk1vfP+rgFcKygpT+k7ZG41qFWEsJUZfkK9z+vcj31JDuag==
X-Received: by 2002:a19:1dc7:: with SMTP id d190mr18523461lfd.48.1556134464270;
	Wed, 24 Apr 2019 12:34:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z16sm5413513lfi.9.2019.04.24.12.34.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 12:34:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:34:21 +0200
Message-Id: <20190424193421.31946-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] vblade: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 24 Apr 2019 19:34:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-daemons/vblade/vblade_22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/vblade/vblade_22.bb b/meta-networking/recipes-daemons/vblade/vblade_22.bb
index a51a8c31c..a52a1e92b 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_22.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_22.bb
@@ -4,6 +4,8 @@ SECTION = "admin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/aoetools/files/vblade/"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BP}.tar.gz \
            file://cross.patch \
            file://makefile-add-ldflags.patch \
-- 
2.17.1


