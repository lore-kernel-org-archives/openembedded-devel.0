Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1447078481
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:28:40 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a2so1025565pfj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VvCse1QE59+jegbMHCLWVQjtxuKJter+nzt3cFoPow0=;
	b=mc72ZVvzVI2u8KT7N8IJEJOHTnzcZppilzHxxNlzyLQC1zOR7QAHxJSXFgsjE7e/wU
	xz3TN4raU2IHdcEojjjsTdO/STZZyKiTZDkO2T/1KwdYXolGKesOyncGfJp7wORq2YrM
	+MItaGCtHEZoZoPiklNig9oBo/j+0njh15lakUqw9VUIROJUze6CbQ7IqswXlGgJWECI
	4SkNftSsQIk7ysaOgWPtNQd2ERIB0t73sL3LUdm2nPWLI/w3SDGh6iF8+cAW+fYBA9di
	b3QDnKsda6e0tgUN0vMvt0bF3D683oa10aLHUaMsijQVVIPPXk9u6onpLkUpqyuQR0cP
	a5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VvCse1QE59+jegbMHCLWVQjtxuKJter+nzt3cFoPow0=;
	b=j2tEJUYYJDrmCsAY0xlrSSpEFDaBH1/QAjIxtofUelKsW2x54W6qDwI1wJTa1L0UOO
	8t4E8Wnemd13IbL1CJJvq5/PAl8rS65RHCP2TMJs8SzHyW8QsDjsbTL5yTKLmAuZ6tLD
	YTMpk9VmMuBzQuykP3acuhJryCk8KakuhHlttgr4ozta+dczluZ0G9+6+gn2X9mQNOpz
	6pnQqNDDlh1XE+7kZHCa+yJdSRvO2R7YVhw7f1W5twznuKOW9jCztrNweodh7U1dILqu
	kQf2ldQKpaCoiL5rsx0XunHTd+tZiXvUilHWiAUKLKVqhY5bQLsIT2vURhZy7Gt4wAXC
	mJtQ==
X-Gm-Message-State: AHPjjUjc/mMPTGGHLCbCmppU0TAA4YqJM5Fwp+Uxo2s6YUJGYq8Hv4aX
	AC3XN+af/NF8gQ==
X-Google-Smtp-Source: ADKCNb5zCFYOUUd/wUWnWajEOCCEnLBaM2EYB5S4aY6/pTxDCdqFQqsAYkZvKvbGBK3Q1ThHrxk2SQ==
X-Received: by 10.98.131.73 with SMTP id h70mr973183pfe.239.1504243721727;
	Thu, 31 Aug 2017 22:28:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:c400:6ad5:9d97:9621])
	by smtp.gmail.com with ESMTPSA id
	r135sm1657935pfr.109.2017.08.31.22.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Aug 2017 22:28:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 22:28:39 -0700
Message-Id: <1504243719-16782-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504243719-16782-1-git-send-email-akuster808@gmail.com>
References: <1504243719-16782-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][v2][PATCH 2/2] libexecinfo: fix complie issue
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
X-List-Received-Date: Fri, 01 Sep 2017 05:28:40 -0000

define _GNU_SOURCES to fix compile issue:
 execinfo.c:76:5: error: unknown type name 'Dl_info'
|      Dl_info info;
|      ^~~~~~~
| execinfo.c:83:13: warning: implicit declaration of function 'dladdr' [-Wimplicit-function-declaration]
|          if (dladdr(buffer[i], &info) != 0) {

V2: Merged two CFLAGS lines into one.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
index f79b1ab..d4bad38 100644
--- a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "8e9e81c554c1c5d735bc877448e92b91"
 SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
 
-CFLAGS += "-fno-omit-frame-pointer"
+CFLAGS += "-fno-omit-frame-pointer  -D_GNU_SOURCE"
 
 do_install() {
     install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
-- 
2.7.4


