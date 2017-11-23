Return-Path: <vladan.jovanovic@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 33784786FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 13:25:40 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id f134so22012457lfg.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 05:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OnuGaZZnMKlkRQ5zYjG8/AH4hkEREuwAb0hGig9rnl0=;
	b=WcMvqgUGkiXTGoKYXAsDrXuZBArP+eV9sjdw334WTT5z45gHK13+IprAAEv/Qtu7qv
	WN3SfZOJ5W61InI1k9bMgcyT2vvbmxnq1kkTyfH5781OZ8sNGWgNVq4YTxp+2W++7/t6
	84n4I7Rt6mUEspnt1UUyXBz8zqiEfqrbmHHgVyaN1P4c2ykKn4pvPa9Lhssj3SXryYgp
	r0gQCH/RANVwSYcAGrCK7GvGviRAGVH6n9v4acB97m1vNgOzirHcK6h1rSMJS4lugOQQ
	QPsFDqFHJOLnCd/T3IMF+uKvOpfLqVlNiUYCBw5m8zcV1qAE0nrXVLjIgxGVNJGtuksQ
	VNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OnuGaZZnMKlkRQ5zYjG8/AH4hkEREuwAb0hGig9rnl0=;
	b=FgYFRSUKG9lW71YN81aI4SEEjeA18Rs1KVCKLNYFii/FoLhwMevnpi4CQNVWChcR9B
	yZ31XfslXRllVS9sxlpX8qfmGyqBqQd4nL9PbwjxWQUJ6Jy2tfDPpt4fGoSkVbqP3KXM
	z/WUFxAknLLb8zA0qjuFETK9MjG9eT2H7gxMjvd9jukK+FAvDZ9Tp/CR26BL41PSS0WV
	qNHCquY6bhxcHjPzQ1x2cMoKB1XNclLFdmd/sYNCaTvB/53QRH2ABK7cA4ZWcxRVguN8
	izvnn6jsFydFl1NLGxDrWn9zTJsjNzdV0mDf7+XivTCq3MMxS76pGaKmN/2klaLrqDEe
	KYaA==
X-Gm-Message-State: AJaThX6H9/iqGQl8rnDtCX7JC/kp7ykLd1Dvv2i+ROBTZHYrvS75QE+x
	7X6q2w5ZaLl9nZufRSi6sJhf/qZd
X-Google-Smtp-Source: AGs4zMY0v9GpJgri4pIVGvazRyZXxfbuhpV5Y4Y9jkCVi3/ze+z/MF58Dw9Mwwwdls+gW2wGjqPq4w==
X-Received: by 10.25.234.26 with SMTP id i26mr8045958lfh.188.1511443541275;
	Thu, 23 Nov 2017 05:25:41 -0800 (PST)
Received: from hallainvuori-server.zyxel.com
	(a88-113-233-10.elisa-laajakaista.fi. [88.113.233.10])
	by smtp.gmail.com with ESMTPSA id
	s76sm3312920lfi.56.2017.11.23.05.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Nov 2017 05:25:40 -0800 (PST)
From: Vladan Jovanovic <vladan.jovanovic@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Nov 2017 15:25:38 +0200
Message-Id: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] Fix PACKAGES assignment for fftw
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
X-List-Received-Date: Thu, 23 Nov 2017 13:25:41 -0000

fftw recipe using wrong operator for modifying PACKAGES variable.
---
 meta-oe/recipes-support/fftw/fftw_3.3.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
index ed14e16..e13684c 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
@@ -65,12 +65,12 @@ do_install() {
 }
 
 
-PACKAGES =+ "libfftw libfftwl libfftwf"
+PACKAGES += "libfftw libfftwl libfftwf"
 FILES_libfftw = "${libdir}/libfftw3.so.* ${libdir}/libfftw3_*.so.*"
 FILES_libfftwl = "${libdir}/libfftw3l.so.* ${libdir}/libfftw3l_*.so.*"
 FILES_libfftwf = "${libdir}/libfftw3f.so.* ${libdir}/libfftw3f_*.so.*"
 
-PACKAGES =+ "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
+PACKAGES += "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
 FILES_fftw-wisdom = "${bindir}/fftw-wisdom"
 FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
 FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
-- 
1.9.1


