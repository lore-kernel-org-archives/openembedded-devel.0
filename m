Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id CDB3B7F266
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 17:31:24 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d199so2173413pfd.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2019 09:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uStQQ3F5oVozYMfwRTHcjp0CN/bERyX1Bn23jot+E/4=;
	b=Ixl83C5yStpWDEIOEdQZRxY+AJNr7wxRRywdBPyAdwMaR8P68h1A1IlVr8ofITs5M3
	qOH3NGKmSswRr9I5wcD8DbO+XiJ2gM8g2Robt7xRWp2miwND/GXGcu5N4txGPkIy14Tm
	m1tC9QHvKN6g+9K28zGk/gD7GM5RxV7zfEaLFH5I1ZW91wHkyaK0vUtKtR9bZ84So4ov
	zMpjVZZaq04ar0hu9bGsGeI7FcZU6eVNOxlQ/QG7yPicYD7zWBAi9O8uZrJHVmF7bPJH
	X81P3Ni/w2/l1CKQoXg6+5Nh9Ej6Ae/YCr/drAFnh3qwN5Ic9r8aH2PmF6WtAWLi3gPl
	fLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uStQQ3F5oVozYMfwRTHcjp0CN/bERyX1Bn23jot+E/4=;
	b=PD8SokYHCCxk1930WYwzVeCgATCDcuAg9qjIFz55HPhnBd53hSPSJpCiHc2im5xPxb
	Lkz3qp6R7sPjyoFWeECqUVYpsKf2lk+nL1Lqk+8Lsq/v5jJv9jtc7sjMoJWTTx7UHLpx
	WOSYkgsvetaDICqRoeiNJoBwmY8yWHTZNb6qnj7GfGKCZRquYjGWzMmm65psLNKAzrKh
	RvDU2v7TZZPv3DOL4tpHIzmAMe/ERaJKPVhrsgtlXgD1LUyfuLXm+ORmUTWgeZW6AZFn
	RJnBNE8r8jPns1f/9nE2rTeoJVIiSg3rd/emTN7Tn7CEG4iGVIzVvaIbM44S5tdiQs2A
	OT6w==
X-Gm-Message-State: APjAAAVuy0aSXwzNzivTPZzim0axRtxluzw9SzwnS4XNcdWtw09jtLzf
	FO49HPvHzdvWHpf3FDBA3b8/MXKKFMg=
X-Google-Smtp-Source: APXvYqyA4TSmWYt8/x1cEAFLA8D1h0+UbWITDHuSFTij8hNMjz6SljKwlV8bgVJwtpDun+R+9VZwPQ==
X-Received: by 2002:a63:a24:: with SMTP id 36mr6311310pgk.94.1575394285270;
	Tue, 03 Dec 2019 09:31:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id k4sm4229507pfa.25.2019.12.03.09.31.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 09:31:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Dec 2019 09:31:08 -0800
Message-Id: <20191203173108.87041-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203173108.87041-1-raj.khem@gmail.com>
References: <20191203173108.87041-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] emlog: Use RRECOMMEND instead of RDEPEND
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
X-List-Received-Date: Tue, 03 Dec 2019 17:31:24 -0000
Content-Transfer-Encoding: 8bit

This helps with re-using sstate tasks when machines are similar

Fixes
Hash for dependent task emlog/kernel-module-emlog_git.bb:do_packagedata changed from a70b22026e418998e61d08b0b0ab64a3e26fd0da41a1d12f4356554b6b043794 to 7817106c7626c3c4b238f03771fc32dc8f3dc5e7496ff98cf8a812039939f915

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 63d12477bf..22308d7e85 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -19,4 +19,4 @@ do_install() {
    install -Dm 0755 ${S}/mkemlog ${D}${bindir}/mkemlog
 }
 
-RDEPENDS_${PN} += "kernel-module-emlog"
+RRECOMMENDS_${PN} += "kernel-module-emlog"
-- 
2.24.0


