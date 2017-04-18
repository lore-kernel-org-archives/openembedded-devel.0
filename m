Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9286071C9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id o123so163440pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7NMXnES39iqAJ7hHtjnqFIK0Q6XVkJCfEoU8Ke2FtWE=;
	b=Jl6tULJl6axOMsvnX1clo4NSuLKnhMiywGRVRJ+pUS5KPwJfkEguuWJM1/yl33w6xG
	AAsWSLxV1IwYe39fjEWWiWXW32pcD81SsvQXXofD4wbLCTu4WCv2bfLsEDo8w3VfHoAA
	UxRS+i4Nd8XOkREV2tWUj1N47i+4qETkd/9EjcrkfanNIylR3YCg3LUXjBwx7SQ/iPiQ
	vtB5BIeLxAOP5qdVazDrVr8Hdab+1oOlZmGnMI7WOwQFdBxe7IzQMSLrD6J4B+gIOVXY
	HHdzdYO+QWSlQS+tcdrH7IjAh5r1L1a0Iebr+qNPmcRJRsSRYGEDZ4gHShl8XBXNb53K
	y2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7NMXnES39iqAJ7hHtjnqFIK0Q6XVkJCfEoU8Ke2FtWE=;
	b=EVgPnv9Tw3tlw3cOIfUCt+bPkE3/ydChhLIYeJdq+Ov38lPYY863bE66F7mtGJALRe
	JoDC0+ey/amzhF7+xc2KLpBArQ6ivRCJ+nwqQRzY/BBOAbzZWXt+cXBcGKVzfPp74Fr3
	5fXB5I1Q6pV1w22ONqfNo44uE0ilA7BNrMLs+auQ4g+QSZ862iWiabPZxylYrRRO0hlZ
	qJuiRYUuKeVsOH2P1gdzow4MDw2sZR+/QyJJ3M8edoAdYMSETT4dyofRZUYdn8UwsDff
	PdbCScDNp6SJcmLzAuFwjESy+oI0RPhuxNYwikyx7osGurf4wmMCvRxmJq1luANraKn0
	pyYg==
X-Gm-Message-State: AN3rC/56Pnh2N1jPn8cplnbofMpfn5t2xwXNY1wBySBRMiOohoDAJP7r
	hRPwOjhbPvIMR/H0
X-Received: by 10.84.132.97 with SMTP id 88mr25489105ple.61.1492539732352;
	Tue, 18 Apr 2017 11:22:12 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:23 -0700
Message-Id: <20170418182142.27253-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 13/32] fftw: Add -D_GNU_SOURCE to CFLAGS
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:11 -0000

Helps fix build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
index 559985169..ed14e1658 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
@@ -19,6 +19,8 @@ PROVIDES = "fftwl fftwf"
 
 EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 FFTW_NEON = "${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)}"
 FFTW_NEON_class-native = ""
 
-- 
2.12.2


