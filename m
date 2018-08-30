Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id E895776EBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 11:32:00 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f8-v6so6974177ljk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1NP0fYMzlVee+49lgd9xSyIgWoefkX/zoADfNyZqamU=;
	b=uEOqdjGmnIvog5uTp8eKRCGF6GvBfpicdaHQSQuNUjxxjSVnl9EUPILxszCAPZDhOo
	17J5ijQUCIy4Vy+b8I3Ig2tX1UU4mxr8CsB+p0WhkAOnxJRcdfIgbiq6B1cJ5kLkpfk7
	3LrfUXZzH0w/kkRE6kuczwRKdkdGJV2iR67u6ZX01Jmll9i88zUnEl2NsFtaKJu6BbgW
	IXCm7sTJ67fC3RrfmjFgkTLZUZ/2s8Un/AB6RREneej1ibOfBdmH/9YrvY76xURVKhTS
	ZMxZbuT3Ns/epwwUz4tvl9httJgr7Qo3/e2xGz96rXf8mE9tX/RpucBoC3FqW70r3Qtx
	C1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1NP0fYMzlVee+49lgd9xSyIgWoefkX/zoADfNyZqamU=;
	b=M02RMhzzhHZnl/ujJGP6ty04Zo6i+qQoXs7/EFhYxTmxcbAVbJ2QsEp440vGb9RcoS
	ufQ5g603bqqkdJDI7zgeGYRw832A51OH3vR98sH7W+io/ToF8Qa7xIBUnvKclRcS0k5B
	u9O946WMyGAOQNmVu9d3A4qOa34R7hmPOLg/NS5bLgEZe5LEu+gcqRpWL0oxs2tVMYd1
	2g2REB+5MK+arhuEx6TPY5GoP4nOv9gQFxkqNzODOFNzhYija5ZZTGT/wbh9GruQ2BJQ
	XPSi/4r6YH7/crebfzKrA66zzq1qMrTJStTZfym0yHBe1XQhHSFdJ66jd0fnLLGHZNQD
	VFtQ==
X-Gm-Message-State: APzg51DKCwT76CbkveJ+LVBZFTdoprRPUZwJMqM7orRmfnNCkzCZQ8JA
	eF0L7fg0YzqXhiztoPoVVQLVeJqFyOs=
X-Google-Smtp-Source: ANB0VdalMehI7Eblpr9vOB5i6wFcUuJTl5tpcnVyTvXYRx4gDsjTd9P4Ox5BIecxs+1oPy8EsrhSAA==
X-Received: by 2002:a2e:8147:: with SMTP id t7-v6mr7520763ljg.32.1535628721143;
	Thu, 30 Aug 2018 04:32:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:70:0:9:bdf0:af66:b584:4e8b])
	by smtp.gmail.com with ESMTPSA id
	v63-v6sm1186337lje.20.2018.08.30.04.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 04:32:00 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2018 14:31:49 +0300
Message-Id: <1535628709-5431-1-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] crda: Fix 64bit builds by inheriting siteinfo class
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
X-List-Received-Date: Thu, 30 Aug 2018 11:32:01 -0000

Variables provided by siteinfo are already in use,
but the siteinfo class is not inherited for some reason.

Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 82a297b..9a79396 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -18,7 +18,8 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
 
-inherit python-dir pythonnative
+inherit python-dir pythonnative siteinfo
+
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
 EXTRA_OEMAKE_append = " USE_OPENSSL=1"
-- 
2.7.4


