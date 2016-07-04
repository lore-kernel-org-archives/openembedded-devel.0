Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 89F066011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 21:13:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m2so12340647qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2016 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=dmWhQ5x7g/8T1M3AJl0AY+z4SDZJdAvPhym9vJZdBqw=;
	b=Ka4/fZVKVPKWpM5kKCEi7ElVB4OlxlJEtxiulnCTo5Qv4FKtMNLPN0Ig2tJ7keuKQ3
	8EhPq7ujdtwIBWpTEFiTxTMwJGK6xFaW12A7GLl2Uq2P6JKpvwBpyM7WsGrK5nKWNAW8
	/ENusaZxd9mo5ekSUe48/VBdYmld3xgLrNrhqMrGVIDQrxSqzgSFKgfnd5NaAGO8bBLH
	33enCHt1XuTTWqtQY9AWXvVyD1pVYpShQPTyMD7h+e96vn5mP8bRlwsXLcELdbhT/66v
	Tkro4/BV7gYytf8pILyv2EodC+WkIG2rsEr5we3ifwbc7gIl7h9M5JyoZxeKwcISCmhk
	Rkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=dmWhQ5x7g/8T1M3AJl0AY+z4SDZJdAvPhym9vJZdBqw=;
	b=PyniYlxPwGKx2+NQrxbBnlwjx7DRf1i15EQ0ldPYIQeWzFSfSYr4HOqTE7IkI7tTsX
	nupXrbyemjMETqgWWRgFOlKzVDaSBPdsWSzkhvN5ekd7SxT2XVlbM++Cue2wUCngtivy
	OY/5ezy79B06golWPN2f8GZMAthzFwQZDhwMShHSJlI/nj9jwkbA36A++PLpam7vlozN
	wCHLTzayewti7ID3N0OjZNaS9Qsh3isEat8JbUUUf+/ZhGTjJl8jRfvVDwjHkdi7+AWI
	0AGbd/ODWtngMUQju1qln7JYhwulEwIvXylBlo4QyOVGbS19ZTB89/ayiwCSn7i6vbOC
	s6Dw==
X-Gm-Message-State: ALyK8tLN7NpL5rPH2kMsSKclvJcfwzDBJaiCVLtOWCHmT/CCDHvBOhtGSRMmx9HkU65hTQ==
X-Received: by 10.200.49.165 with SMTP id h34mr21985895qte.43.1467666804992;
	Mon, 04 Jul 2016 14:13:24 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.6.231])
	by smtp.gmail.com with ESMTPSA id 9sm2551610qts.26.2016.07.04.14.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jul 2016 14:13:24 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jul 2016 18:13:11 -0300
Message-Id: <1467666791-14819-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-java][PATCH] rxtx: Add remove-libtool class to remove all .la files
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
X-List-Received-Date: Mon, 04 Jul 2016 21:13:26 -0000

Class remove-libtool adds a postfunc to do_install to remove all .la
files installed by libtool, so that they are absent from both the
sysroots and target packages.

Fix error:
ERROR: rxtx-2.2.0-r2 do_populate_sysroot: QA Issue: librxtxRaw.la
  failed sanity test (workdir) in path
  ../build/tmp/work/cortexa9hf-neon-emcontrols-linux-gnueabi/
  rxtx/2.2.0-r2/sysroot-destdir/usr/lib/jni [la]
ERROR: rxtx-2.2.0-r2 do_populate_sysroot: QA staging was broken by the
  package built above
ERROR: rxtx-2.2.0-r2 do_populate_sysroot: Function failed: do_qa_staging

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 564df32..c3fbc13 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -28,7 +28,7 @@ S = "${WORKDIR}/rxtx-2.2pre2"
 
 INSANE_SKIP_${JPN} += "dev-so"
 
-inherit autotools-brokensep java-library
+inherit autotools-brokensep java-library remove-libtool
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 JARFILENAME = "RXTXcomm.jar"
-- 
2.1.4


