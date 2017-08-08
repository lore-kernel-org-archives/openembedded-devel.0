Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7223571984
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 18:02:30 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x77so3707573qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 11:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+9aceXe7WD1FmrNovldxMuLQfSwd+B9B2hr+sDV7WhI=;
	b=W+QspREBVqURl76zRUIx4xF6MM2NtgTk5QOFN0xOm7j9pZcWy0jmhv/8bBIjLh3UVP
	R35Q3QfvbYgouvYRb6ogYtFWZUO7WeAd1yUtM3nnB+YnIcKrsP70l5X5M4ZJW9d/RzwM
	XUqXs2R8OW7uhgksDMMdgfoCSswHZ/GaI5YkH4VmYOzpCesiDEEqxPofiRC5WxUzRpqf
	CoDTl1OVW/LnzWE4CEeyOc/r5Bx1OkG2VF9Xb+bPdvQ7N7K/LDBF8Y/mx7t+iEdYjYBd
	XN1SZFzAa7IvI8jSU/C4ytU1IpG658J7iAsux+aUcO4vcDfNJtuYKhOnMaJrLkUR3Xs2
	iCKg==
X-Gm-Message-State: AHYfb5hd7UBiIB+HvDCAYmg59sMh+7en/DGsE1K/UhmVY1PgiDr88p/1
	NU4h2XRn7ucsKbKG3Hs=
X-Received: by 10.55.16.6 with SMTP id a6mr6171323qkh.205.1502215351294;
	Tue, 08 Aug 2017 11:02:31 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id v64sm849862qkd.96.2017.08.08.11.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 11:02:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:02:24 -0400
Message-Id: <1502215344-17892-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libnet-ssleay-perl: update to version 1.81
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
X-List-Received-Date: Tue, 08 Aug 2017 18:02:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libnet/{libnet-ssleay-perl_1.80.bb => libnet-ssleay-perl_1.81.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.80.bb => libnet-ssleay-perl_1.81.bb} (91%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.81.bb
similarity index 91%
rename from meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
rename to meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.81.bb
index cf621aa..a861b69 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.81.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} += "perl-module-carp \
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "b1e0fd96d7f3be57580377226ca5f089"
-SRC_URI[sha256sum] = "a541a66d59fc5f9bb7af09d3a0b68305e4c43ba9488b12915728fd282ea01b93"
+SRC_URI[md5sum] = "71932ce34d4db44de8d00399c3405792"
+SRC_URI[sha256sum] = "00cbb6174e628b42178e1445c9fd5a3c5ae2cfd6a5a43e03610ba14786f21b7d"
 
 S = "${WORKDIR}/Net-SSLeay-${PV}"
 
-- 
2.7.4


