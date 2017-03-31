Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 827DD77D57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so251266wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R+HNraKV2Mfp5r7GU/PAy9f3c8gK76FALgryAzBigac=;
	b=rYAOFyvm1w7oNA+ObQMyb7BVeEYP1T4O09zBJP0/slQh7WJlcQTtr0JPS2KQoLXh8q
	Rjj2BCBWpmmm/bSR6XwfhoNeeqCxewO9YPjQTzWfgqAv96iYexq1furwQh1vP1H696JC
	Y2srVbfnkaYEJyU8QMKiUAUyrklD8aJb1FAtY8Td7bRucbJL6h37QXxpVpH84M1nJAn4
	M/OlLb9XnrelQMZbmhqosHEWJeDiSYxNlR/HziKkXJG5EtUjdSeq5KHddKsC7Rbeh2/N
	4xKITCG9S8hDZowrBlLjZfrvCYPZKnVXlwuEPgZP+D8+bOe0dTUIoleDiGPwuyHIyhor
	/z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R+HNraKV2Mfp5r7GU/PAy9f3c8gK76FALgryAzBigac=;
	b=nOesdex+dq/YKl81Ctj7B/h6BmmAlO6EzLWCmr5ZvlvkCFrNBJHzt2ptQtgW27VLPB
	/sDxS7sMIWb14AfqIB3NaGBgGaz7hEVpY0HElowG+57JXmcfBE7SgJwuOcke8dZNthZl
	lexuUQN9CY9PGoRxxBK2krogFm75867MU5BN+RVgSYhypD5A2VV7BuKoUy1owZaSu1Si
	axP5RmH67+82KZrN3jMHQjl4QeStL2eAqKP5I1Fmy2c3DEyrhWI1ZQB1krvc+9PH4rtq
	UY+ZO012Ju4cE3fU/5qSkk6u2moly/+rshbAecdVAtnj+wFyn0A9TzP2ICC9YUB4kPpa
	RoGA==
X-Gm-Message-State: AFeK/H00tQ/1TLYF1ipWEP+PbuXsrmxI36LaJ80OznQrPSo+WMqWk4Hf6CO4EShBqgJqFg==
X-Received: by 10.28.11.69 with SMTP id 66mr4023251wml.38.1490973517294;
	Fri, 31 Mar 2017 08:18:37 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w4sm3238301wmg.29.2017.03.31.08.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:22 +0200
Message-Id: <20170331151828.25907-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
Subject: [meta-oe][morty][PATCHv2 1/7] lftp: change SRC_URI source
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:36 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Changed SRC_URI source to official web-site, which keeps tarballs with
old releases.

Cherry-picked from master, but without the upgrade to 4.7.5.

  commit a2e075ba656a89da58ca4f849c2f08ec6d50a96f
  Author: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
  Date:   Mon Jan 9 15:34:07 2017 +0100

    lftp: update to 4.7.5 and change SRC_URI source

    Updated lftp to version 4.7.5 and changed SRC_URI source to official
    web-site, which keeps tarballs with old releases.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index 287821194..d62453745 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-- 
2.12.2


