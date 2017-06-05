Return-Path: <acfoltzer@galois.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1BE780D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 17:23:41 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id 9so85868836pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hnC/ZeoUYKGeiJ567Plrc/IRxiTnZgREF0i1QLLMH3I=;
	b=jA1OtDOu5m5PiNzsLpbjYVNs2a6E7+wg/nK5BqEkD9YUElLbhDuXGNRCAzLJAVQyWY
	YWTaBoLj4PCyRgJqzHUt4Gnhj6Khszt/WoDunfO7RpRsbNiNUBUe7NPq3YMtOrmlWI3v
	h9nDZr4kSZrEP0u0vpEedcdlw9S3Eai6Ye9RO+4HkIS5ORMw984Bw0mnEDVzoXUT+AIC
	4bVb70IXAAXKVJ8/qzHYWuitMjoHPEgU/XyPGB69HELhvDM7gLGaGqqoIo5QR7rxcqE6
	0yOEUQ7U1RvMsz0UfueCMhbf5WDumJuycG3jSZmjIAg0r7/w3Tx+vLqq2ipCd4D+qYtZ
	k7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hnC/ZeoUYKGeiJ567Plrc/IRxiTnZgREF0i1QLLMH3I=;
	b=Iru91Mr1hY5trAiiOyBUvsa9aXqDyqlDwvCtFk9GWNhHwjC6x1ym3p2jcVQqxeJDSP
	XSuWTtpVnqchTkII5TgMKWQ8zbrIfr0Pdvg4AtY560dboAz+U5dwA5o+wuloJ7QltxEE
	nQ8llu44PDYkkzTY1S+/LOGVutqOE2StIiZ9vCEsLSX4MoEVsYv+dzwCa+nnEiFpRlh6
	ebbPsMoyjrgFeRjd0EUbNZu1SpYao8jzYiTYT9X2pQSWYnJguPm6d0HrjYbksU0ESi/N
	9mmnbzYe3Gdm4AJTIXyFe57U8asxQAN45+i2yl+rLfXC275fx8JOztObAO0qcCkDB6e2
	JXIw==
X-Gm-Message-State: AODbwcBpkhv7OLMfPhj7KwFNwxPxlc2vNQ08RZ/TVC+3az8GGrYaQI0m
	NEdDxiFBwO53qmqkhkkZqA==
X-Received: by 10.84.130.33 with SMTP id 30mr3762602plc.240.1496683422375;
	Mon, 05 Jun 2017 10:23:42 -0700 (PDT)
Received: from svarog.galois.com ([2001:428:6002:405:8055:63c1:97d2:1da1])
	by smtp.gmail.com with ESMTPSA id
	71sm35220907pgd.57.2017.06.05.10.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jun 2017 10:23:41 -0700 (PDT)
From: "Adam C. Foltzer" <acfoltzer@galois.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jun 2017 10:23:20 -0700
Message-Id: <20170605172321.12557-2-acfoltzer@galois.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170605172321.12557-1-acfoltzer@galois.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
Subject: [meta-oe][PATCH 2/3] meson: fix build/host confusion for bbclass
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
X-List-Received-Date: Mon, 05 Jun 2017 17:23:41 -0000

Meson and Bitbake use different terminology for the build and host;
this provides the correct build machine info to Meson.

Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
---
 meta-oe/classes/meson.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index c33174a..d2ae626 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -66,9 +66,9 @@ c_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
 cpp_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
 
 [host_machine]
-system = '${HOST_OS}'
-cpu_family = '${HOST_ARCH}'
-cpu = '${HOST_ARCH}'
+system = '${BUILD_OS}'
+cpu_family = '${BUILD_ARCH}'
+cpu = '${BUILD_ARCH}'
 endian = '${MESON_HOST_ENDIAN}'
 
 [target_machine]
-- 
2.9.4


