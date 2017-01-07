Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA1671C1F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 08:32:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id k184so58713612wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2017 00:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DsikvF0fWZWdCQrimHteDZ5KYYdoqn8vVMYl9tEvTGE=;
	b=uPw2tykz6b5049hdg/zKq4Mm1CnpO30ZY2bBkzbonN5gU3Zm5ejAoV55d5mpCYHmnr
	Aj8YjIZryflV52EwIDk+7wp5NdnGyH6cSREJN8idGLk3gZP05CYcEL+SkzZ5sV2LcYWN
	eew15EkCmIIAfpzaUp92g5zuOmusV7z4ZYADQzg6qPLXsVTDtJ5wIrl3VMuAzHUD2PBI
	cC0hUxLzRTHn2unYbkMf8CEZOjZnZ3Ftat3FyeSiku8OBm802bNzT9oS1kS2tGvFiY9B
	HvqWYQnCyHPXRx6GkEwKepZgan8zym4HrUUiPbUe0cQSyc4b9eTSlY1LCambgqAF+b70
	ecFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DsikvF0fWZWdCQrimHteDZ5KYYdoqn8vVMYl9tEvTGE=;
	b=K3bHDm20KPasB8t7Rnia8Rz8wCczLm6P/W+VkGD2eyq3xzNe6fmj7BIBFD5GRPhZei
	szQBSsrk1Ll9y5sjgRd6x5Mj0y+B7aN9wH/2H9TsIo70YSSiZAhi9Z2N92r80d9vfIm3
	UEkdvVFklOygAnpaYNvDFkVpxsmVPisHHyWZtz83mQe1DKk9na4rOfqM2tU4LeGSVAoZ
	pHQi4x61y/+RyaXVRN9aRkrtmRKpb/ishAoLjVVyYpp4BxBAOiJqZDaFfdzDv78oqYn4
	5Hake7/rJu+LG4x5fNDPoupHOpGN3NfBCNwhEFOD+8za8Ly+SNmab13iwUJmyuc/IiHV
	GgGA==
X-Gm-Message-State: AIkVDXLF+JAGQpa9zRYox5I/crQgpboKjfFZS4f6Ce4qbuk6f4B3w4ZcOfvVMm9p/wakyzo8
X-Received: by 10.28.153.10 with SMTP id b10mr829111wme.103.1483777945622;
	Sat, 07 Jan 2017 00:32:25 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	d10sm112304240wja.20.2017.01.07.00.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Jan 2017 00:32:25 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Jan 2017 09:31:43 +0100
Message-Id: <1483777903-9531-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] lftp: update SRC_URI with new source
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
X-List-Received-Date: Sat, 07 Jan 2017 08:32:28 -0000

Use official web-site of lftp, which keeps tarballs with old versions.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
index b627963..0b44abc 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.bz2 \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "7b54407ab24c1e78b45fe445d83eb5fd"
-- 
2.7.4


