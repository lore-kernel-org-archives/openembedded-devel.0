Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 313217D593
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 16:52:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f1so15136076lfl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SSZuXR22mSimOm+ZxKZIejLEhFg8y9yvww5tnm5PjJI=;
	b=1Lb1dsDDG4CKTZct6i9wca0OZPLnWDXHrG7e9kZLLScDICftwXfV3kBdtsvMvJFK2w
	S4/MCJDzdqjYk5JyUxw1J792e2kTDZ16dowMV4soGtyRFDX+DH22vl3jMJXiVCn2OIUb
	89iuzvHGE/fGLDGztRr8oWHBjULiQO26fb87yR6TxkjQWQGVT70ABT0SSULyaLHdKFf1
	pNgYGcado5Qa55VwZEF47xPF/V//WHTBGwc5Fdmz+TrTXj3LgOLgeXvTF6vmSUquo+cz
	fuJhkkwvdxVvUOwWUsCts61XsU8G/olyjLdZ1d5yBOvDJEi2GLnKIjn94KAWpEoPHNH9
	yvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SSZuXR22mSimOm+ZxKZIejLEhFg8y9yvww5tnm5PjJI=;
	b=nBW/oC3+zjwHQxlvY7NOKCdNxzN7o//1I58DncadAxu8NzZzkOfOc1qRbWficwFNnb
	VZkv4O2RcfEwmt1lJbDm4zXyckDIMI5jUsbx96L95M9d9bpPwsxNTunu+t8g/QPzjOcI
	pU5+Au7Xm7I4w/m74G1vl5M3gDmeFaaduhR6dLbZIeFWkcUAc63h024IKhWdUcU0+NsE
	mQ4jWVMoswXHiLT+kYjjjo4/YYQYoWgAP0DTQoEbibkT8zc5MhyHKQNm8aHxD2N8GbMH
	OyNacRgToY/hDlER6qG0PaD1K7kNjf/zfzU7iqyXzWPca5+tOD5JY81g1DsMX/mhZf7v
	gBGQ==
X-Gm-Message-State: APjAAAUEjT2Wq6uB2K500VEjRnTI3CeshQCrJ3Jb0C432mUpetMmowsF
	TCzM9AHzEKqEkAheBn7+XvAmSNQ4fbQ=
X-Google-Smtp-Source: APXvYqxJj71/dboGixdLxZ4764h6TMQZHHYVCKO6gqDkE66evZ4ceWlTv/TY4x77UjucreVtzyJ1fA==
X-Received: by 2002:ac2:510b:: with SMTP id q11mr4323109lfb.11.1559062335374; 
	Tue, 28 May 2019 09:52:15 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v20sm2988488lfe.11.2019.05.28.09.52.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 09:52:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 18:52:00 +0200
Message-Id: <20190528165200.10764-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libp11: update to 0.4.10
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
X-List-Received-Date: Tue, 28 May 2019 16:52:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb} (92%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
similarity index 92%
rename from meta-oe/recipes-support/libp11/libp11_0.4.7.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.10.bb
index 87d99c1a6..2911e37c7 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "64569a391897bd29c5060b19fa4613e619e59277"
+SRCREV = "libp11-0.4.10"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


