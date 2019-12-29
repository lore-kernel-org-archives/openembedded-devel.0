Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C8E287F81E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:25:51 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z16so17266297pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lbqYO6566wvNNsbZy5s3Wf5LMTpzQkODQYv12W/3Wl4=;
	b=JPLxGVSwRNNvfWu0DllaFieqNiQpJ1D3YtAjHtUJF+w5pFGKwJ9yBTtWpmccKLa/fX
	lifzy87ah76nTDfo6Tj+RIUQV/V+M9ZvxBsyni9bk+OYZGNtAgrDZWJ81g9F/6VyOR9e
	EfsRzHPaDTK3X9QRrDgyI/339gQUkhVdCFuMLDNOL0vC+4MBij74WOG2yi/1NX4UBLbl
	tyi9BxfPm651dCpd3cZJB2hn5+ak9h83dQQXnziq15SkwwsH9WmFSsRTPLvcje5F1z98
	rSD4AkaTIyWhvFGP+u9mVIW4R01NsAanKg34tfjRN1aq294zL4xUSBAExU5zWpIyhAAS
	Z+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lbqYO6566wvNNsbZy5s3Wf5LMTpzQkODQYv12W/3Wl4=;
	b=Csh2olekVJo5D3qMi9UaRvkOb1isua5hKHABz5i63IbBTW5jaDW5j4e1iZPPitjm9h
	MPi60g1xgZPQteKI7+fN03eJ2JtNa03ZiC0iCSwNosRzHPGC5e4Uq9cq0yoQmGNWV4Us
	swQZQSrQ6liSUF0SYnNTtAJt5UdLs0raipuuEfImuFn0L6TAtvqIejK1lHOeRM9TXJER
	rD/qtZASxO3dNtywsxudJAeZ1uRN4lqa2K/iXayX1ULSLAU+nvhP36qZUV8BULA6g0XT
	trQ3YZyoiU+0ZOmp4GO3pmMfkTdz08DHtXuGTBRN1i5xJydEF6Mna73pBMXATZ5C0xQK
	sRTA==
X-Gm-Message-State: APjAAAXWXvYil1GdRm1TIYNXuuXv1cZwYcuesoH5VYwFc8e71DQawOb8
	jcne0xHo9ppcPVi8wENh5Zcl5Pfa9ww=
X-Google-Smtp-Source: APXvYqzl4rj8illIxbGTzvwa1z2N09QAOzvAwF+xaE7B96seva8uKkFZw6zmefrf4Qp+bC2ttl24tA==
X-Received: by 2002:aa7:90cc:: with SMTP id k12mr44555826pfk.105.1577643952381;
	Sun, 29 Dec 2019 10:25:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	gc1sm21395010pjb.20.2019.12.29.10.25.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:25:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:25:43 -0800
Message-Id: <20191229182544.16104-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229182544.16104-1-raj.khem@gmail.com>
References: <20191229182544.16104-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/5] ruli: Fix implicit conversion from 'unsigned int' to 'float'
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
X-List-Received-Date: Sun, 29 Dec 2019 18:25:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ruli/files/float-conversion.patch         | 19 +++++++++++++++++++
 .../recipes-support/ruli/ruli_0.36.bb         |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/ruli/files/float-conversion.patch

diff --git a/meta-networking/recipes-support/ruli/files/float-conversion.patch b/meta-networking/recipes-support/ruli/files/float-conversion.patch
new file mode 100644
index 0000000000..999f23fc6a
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/files/float-conversion.patch
@@ -0,0 +1,19 @@
+clarify type conversion
+
+fixes
+| ruli_rand.c:54:47: error: implicit conversion from 'unsigned int' to 'float' changes value from 4294967295 to 4294967296 [-Werror,-Wimplicit-int-float-conversion]
+|
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/ruli_rand.c
++++ b/src/ruli_rand.c
+@@ -51,7 +51,7 @@ int ruli_rand_next(ruli_rand_t *rand_ctx
+ 
+   u = isaac_rand(&rand_ctx->isaac_ctx);
+ 
+-  r = (int) ((float) (1.0 + max - min) *  u / ISAAC_UB4MAXVAL + min);
++  r = (int) ((float) (1.0 + max - min) *  u / (float) (ISAAC_UB4MAXVAL + min));
+ 
+   assert(min <= r);
+   assert(r <= max);
diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index 8548f9a353..f920b592ac 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz
            file://0001-src-ruli_addr.c-Add-missing-format-string.patch \
            file://0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch \
            file://0001-Make-space-for-flags-from-environment.patch \
+           file://float-conversion.patch \
            "
 
 SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
-- 
2.24.1


