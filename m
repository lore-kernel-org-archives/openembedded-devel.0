Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id BB9EA796C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:27 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id i190-v6so5568527pgc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I1IvAQcR6WqIpjnaH4Ef1vOgFGyRVZ/eSXYroxKN+sw=;
	b=f5bp4YIbGRseNhPxHAFlhuPupHP3m1b1OllkBeV9oKDYw5rbIMQWKKlgnO4wd/4sR4
	wxU9Jf5q9YF221l5r6QwXtFh2AtGUMXvDMYCASYRZoKGPFCTWYHudBl6sIXnfcc0kkf3
	/++7gH7VgH67AugbdIt4Qo5pwepqHH3tnBQMrZukvmGGRqTAGQ7/Yyzeo3qCf3hweKx2
	yKOGidawtwWzcv/IZmQE2wLLWEaleLVGFI5Nl71/uk6lojp724uPOcgr6fBeihEFkOUR
	bouuo7Yd28X5mbfzOXu5Btx7Nu3l7lDfv8x/LTf6rGV7rvGLihVFwotkS0V6aw/lqKG2
	RZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I1IvAQcR6WqIpjnaH4Ef1vOgFGyRVZ/eSXYroxKN+sw=;
	b=h/u3iLCfID5CvB+iEcOEWB9M3YvWvYn6xpVERXXSlKRpWR30hQzbqLXDeOKU1LyLg3
	idf8rBwlBdh3k9jKBkTI/IEPovr78jGuRd5Lq4dh2bwNdUqUYm8/gaUnExacHcQ7w1pf
	U5Eq8htClODZNsOqlKJnyjVDEnBgHTZpSqRIjTZ3YmRzExWGiyjafmIdUiQ7yVilcmHG
	bo4mGZFKsQVclvSfAYKSsWnEjfm4lGCz2jLaBIvAr+MUxjASNAuba+JEzDtYTCo+9q0r
	lMrMWX3KMMFk+n/jg/jMEmPGIMqnwtPojg5JHDueGpMCzeFIRfsI0OvdFoKmy/5qMiMj
	T/Ww==
X-Gm-Message-State: APzg51AvjgjAF4kDe0oc5JcUukcrToWp53+n7O1uA2TqAl+2X4ipQbrC
	FnblV28ei1/HZKRXaWwcLIJPWQMv
X-Google-Smtp-Source: ANB0VdYy+XIGPf5c+628A+ukapbbNc7uwN5dj2fK8v/uwpWoeaK4PcKmE4EXL0g+t0Bgnob11z59Xw==
X-Received: by 2002:a63:f902:: with SMTP id
	h2-v6mr3925337pgi.154.1536254548528; 
	Thu, 06 Sep 2018 10:22:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:01 -0700
Message-Id: <20180906172210.42551-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/17] crda: Depend on openssl10
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 9a79396ce4..c596dedd4a 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -4,7 +4,8 @@ SECTION = "net"
 LICENSE = "copyleft-next-0.3.0"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
-DEPENDS = "python-m2crypto-native python-typing-native python-native libgcrypt libnl openssl"
+DEPENDS = "python-m2crypto-native python-typing-native python-native \
+           libgcrypt libnl openssl10"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
-- 
2.18.0


