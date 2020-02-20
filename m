Return-Path: <viktor.rosendahl@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 723F0615F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:00:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so4945751wrd.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=03xxTNay5aithJY4z2Z1g/u+bLuJ5dSb1d0LhQqXBFc=;
	b=gdAtxCsrRCdoFO72kLLBr0rrcT2BBAENJuGiMAIuvk82DU6TV/tZJaYM/ahNBWuIV/
	QorKVZcKvzoereJ1GbEdnolmA+3vLQ5LPDbWuTWfIaHBvl7ZpHxMieA+bfcejOhNIcRg
	RxYdO15I3fD5A5gQ7bSWIzkSXo72Wc6kOOUhgSdpRJ/r6CBzvO73sUvBtASGmfQePRIb
	LnFNPQOJUyXO/QhJ9z5AL2qNwaZrHdl1ydalW0xoyF4QrE0dBZ4x02+guyqpOC9vb3m4
	z+LfW3dKB5anUeIrtlT+u9kil/KHiaJaUpjawIYegAkquntEV2BLBjHYYgElasZfHzRv
	QXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=03xxTNay5aithJY4z2Z1g/u+bLuJ5dSb1d0LhQqXBFc=;
	b=NtpxQ1/GFs/7P5EGcW9EsReSk6gEFRWAnripuCL2OL5gP1OQlX+88NN15akdpzv3vY
	gd4Epj22ECXYUtg1zeClGDxSwSjizNTroc7nYHIQeHu1BCgBe14K/JXSlfFEXEF7mrTH
	Ke1ueW6w9863KTQtJi4bFzv77v5mpsWEBOHy2JfLym+S/xpxpvUVxdlrEqnjtLVpUnfM
	iiz8Ga4QzFxHoyrs7yVaY7/KysocFv0m2pOC5p7+Snaw8sjxAOuTJkxlDM0R5F3FG/ho
	Blt7XD2Zi0GcrnL0xrEchgAd3wDyOGhxrP9gRgoTCHNC01wYFDwo44HTDD8IhbDtJB+u
	VDPg==
X-Gm-Message-State: APjAAAVMtDbhlbI38SWMXpjWrp5aIZ11sxH4pjmJK2hm7SZTX7i5z5PE
	YoqBzGB/b+pQNMSzomMWvr4A1s4=
X-Google-Smtp-Source: APXvYqz27dg6ewIj83mhTwFxI7zK5Eb3bgH3g/HxGCC+FztfQQKbrusBdRsNRBgHPhv2ZdcahF1dgg==
X-Received: by 2002:a5d:670a:: with SMTP id o10mr42796896wru.227.1582210801776;
	Thu, 20 Feb 2020 07:00:01 -0800 (PST)
Received: from buster-jangle.bmw-carit.intra ([212.118.206.70])
	by smtp.gmail.com with ESMTPSA id
	e22sm4876308wme.45.2020.02.20.07.00.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 07:00:01 -0800 (PST)
From: Viktor Rosendahl <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 15:59:55 +0100
Message-Id: <20200220145958.38718-1-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH 0/3] Make lcov work with gcc-9 (backport)
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
X-List-Received-Date: Thu, 20 Feb 2020 15:00:01 -0000

Hi all,

These are the patches that makes lcov work with gcc-9 that were merged into
master recently. The commits in master are:

416c4f7d5 perl: Add libperlio-gzip-perl and libjson-perl
64441dc46 lcov: Add support for intermediate JSON format
7002e7dd3 lcov: Add missing missing RDEPEND and enable nativesdk

They have the same content as the ones in master, except
that the third patch adds one additional missing RDEPEND, which was alreay
fixed in master.

best regards,

Viktor

Viktor Rosendahl (3):
  perl: Add libperlio-gzip-perl and libjson-perl
  lcov: Add support for intermediate JSON format
  lcov: Add missing missing RDEPEND and enable nativesdk

 .../perl/libjson-perl_4.02000.bb              |  22 +
 .../perl/libperlio-gzip-perl_0.20.bb          |  30 +
 ...Add-intermediate-text-format-support.patch | 898 ++++++++++++++++++
 ...Add-intermediate-JSON-format-support.patch | 247 +++++
 meta-oe/recipes-support/lcov/lcov_1.14.bb     |  12 +-
 5 files changed, 1208 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
 create mode 100644 meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
 create mode 100644 meta-oe/recipes-support/lcov/files/0001-geninfo-Add-intermediate-text-format-support.patch
 create mode 100644 meta-oe/recipes-support/lcov/files/0002-geninfo-Add-intermediate-JSON-format-support.patch

-- 
2.17.1


