Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 337317C0E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 10:54:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id 96so14709806wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 02:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lhXhuLKLRCGfpQSk+R2bahr1JO7yo4FrpdE0aNN0lrc=;
	b=F9DQnv9uSSb15jKkBn9HtDI+ZfK+kO0hnPCfnNd/Gi60t2AFpjv/IfMI3CIL+A2N/j
	VexQK8TE+aYEjngTMAtM2Wriw81wejoh0F73bh2BQRodmb5mFMrXz1Xl91l2ibE3Nvyy
	rVzQjUSOVBmiFKqqFId4YCwxk991brC/J5rr1YCLZYMrFiOL+lyP/ze8Hb92bVq7gC0B
	AjvIhVYT5RO6Tyi5P/29Cd8jcizb9AEGZguLqjp9g2GFWOdNk3JBJR2IX86xKmokDXTY
	m5FoTuxI5XAK8LskHqwXXgIhqcwvnp2WD3OWxX4WAxW45A2jfZU77pQzD3Bhc7f4mWdf
	OxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lhXhuLKLRCGfpQSk+R2bahr1JO7yo4FrpdE0aNN0lrc=;
	b=UkVz0aXh0G4nxpIl8XGu0sJ1kiYtbZL8jv9czntPTEv9gC8+6DMjutfS/ByGH0mtFH
	ufz+2nxCZ+u3NBj4rY6zPDoz0XZiWKllrl+zaXB4c/dbXPX75b5FukARd7Gnwd4zf0eU
	CbrR7SXJqwbySsIrl9aDU5IW2caQbQTxmYoyvUm3Ja8OQP83FdHU683b3lyKiE09fgJ1
	Cx8te9RIkjVItlIaVkgJcCa6FFCEDeRvcCRKbwb+JAyXYhE/ytt6OlfzgeoJ6W8JvgJQ
	m8QR2AObA7RDvVMoqRtS9xFjDlh0aFsQgdO2QnW2A65kzhr8fA2j4CYep1piQYc9vFhB
	5XZA==
X-Gm-Message-State: AJcUukf6SnNEXY8J7y9RAkl7fIFKGqR0C5/JHtEdHHHR/DKFTpQajoAJ
	bohX/t5jUd2ptkqMFeiTJqcqmKQ2
X-Google-Smtp-Source: ALg8bN5WjQ5qHOqMgzy6X01J+Z1wvxnVO8tCmBIfQgWEOxxLO65LmtJVPGLX2tEd64PUhJqHn2P9yQ==
X-Received: by 2002:adf:b201:: with SMTP id u1mr12888909wra.165.1547204086705; 
	Fri, 11 Jan 2019 02:54:46 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x10sm72616360wrn.29.2019.01.11.02.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 02:54:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2019 11:54:37 +0100
Message-Id: <20190111105437.35023-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111105437.35023-1-alex.kanavin@gmail.com>
References: <20190111105437.35023-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] openipmi: correctly build against target perl headers
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
X-List-Received-Date: Fri, 11 Jan 2019 10:54:46 -0000

Previously it was built with native perl headers, which was okay
with perl 5.24, but not with perl 5.28.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
index d28ebd484..f0426ce36 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
@@ -38,7 +38,7 @@ S = "${WORKDIR}/OpenIPMI-${PV}"
 SRC_URI[md5sum] = "1461ac4d78fc516646fd0a6e605a8b05"
 SRC_URI[sha256sum] = "f0f1a0ec732409930b7a31a6daa6cf39b585f52059b62a5f092b7ece21aa75a5"
 
-inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd
+inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd cpan-base
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
@@ -78,6 +78,7 @@ do_configure () {
         echo "SAL: STAGING_INCDIR_NATIVE = $STAGING_INCDIR_NATIVE"
         echo "SAL: libdir = $libdir"
         sed -i -e "/^PERL_CFLAGS/s:-I/usr/local/include:-I${STAGING_INCDIR_NATIVE}:g" $i
+        sed -i -e "/^PERL_CFLAGS/s:-I .* :-I ${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}/CORE :g" $i
         sed -i -e "/^PERL_INSTALL_DIR/s:^PERL_INSTALL_DIR = .*:PERL_INSTALL_DIR = ${libdir}/perl/vendor_perl/$perl_ver:g" $i
     done
 }
-- 
2.17.1


