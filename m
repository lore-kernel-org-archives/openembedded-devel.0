Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id F04716A9C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:07 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b12so2828468wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NWxuB5C17Zm0yqyqJLKYRd0VDXTeVG1jusc2br0M0u0=;
	b=t1663s36vsN22tZrXwTRFjbUvdHxsyCyzBTovMp/J1jVYhUkziHkU0ms/9wzSpTofo
	hLIzNMo81EUS1fC7TCKsKuxO7YNpTowmU/S3ttj97A02/jmCaGINWJxEquIv1jl8CGfQ
	Ch/iI+RoynkdXywqK0l19lfpfxAmrygN2G4Ftghz3+DUqTGZ4Dbfj1uCECE/ZcRdC6Pm
	wLCdRc0l84eeJLrgyAbxF/HSHJV1smaQNtDuMvKYmE+GwH3He74IQ+Z9Rx4QMX6k8K9S
	Az2EfXb5zUismDHO5gkkW086Z8vjCmiSQiyz50DSRJoiekzn8JHC1cvxx+HPc5KB2Sli
	3Cxw==
X-Received: by 10.194.158.130 with SMTP id wu2mr8974548wjb.12.1371501308681;
	Mon, 17 Jun 2013 13:35:08 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:08 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:52 +0200
Message-Id: <81e1b0f3db1b60c1fec2112c0cffeb9dd41bd030.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 9/9] klibc: add SUMMARY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 20:35:08 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
index 4ec989f..9c2590e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
@@ -24,3 +24,4 @@ FILES_libklibc-dev = "${base_libdir}/klibc.so \
                       ${base_libdir}/klibc/include/* \
 "
 require klibc.inc
+SUMMARY = "klibc, a small C library for use with initramfs"
-- 
1.8.1.5


