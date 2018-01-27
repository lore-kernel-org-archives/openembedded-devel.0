Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9525B788C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:11 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y26so1447791pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OvettxvBOIeSgbmp6UbV+zdXRYDjbCaSWjzeNtsaFew=;
	b=uhUqE2CmqyjDUMogOVDFQg7wyFyrunleb0zYYr8mmD9siMYHMRFussViK2a+9IaRH+
	IVUxDf06mVatby/QyRIkwi1+zet/CQcQBn0Zc1GZ6mCjCOgtVnKdj0sovL+oprmpkVdo
	XOSiFuKeUgOx5d1Szmf6sJTLzd8SRlYr7B5JK49CGlirArY/FO4MlovGX9/XqDlDkab5
	u8T21j/kp6TsQLX+b/wI6g60l6SFDkbQBmhQGYJZYGBy8KTC1+Rb7UDh/p5/RuIrp9hi
	WYehYh3lONah9D9qhhotAS2/lhFLiaACc2BFROM36oXEtbDlTnsKYTdNALEZkG8ClQDw
	tY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OvettxvBOIeSgbmp6UbV+zdXRYDjbCaSWjzeNtsaFew=;
	b=FlR0ncKXlNrnBOemTVNFrWYMlVknYOi9FVPP9fgJXqS/ZS4T7zWmjoE3XIHKkl/PQV
	loRZGOIgtwrueqSbDANi8L90TbD/9hbpU1ORZMHcuaPygUPaqCPUzqKq8UrISb9wL2d3
	MS+pUu5dPv50Zdpnp1Jc81CBJC9cUUmcyk4DR0WMCTLOq6Kt6hciCVYtRj1sfFcum7g0
	/Xh7Jk5AGjh0nDBiZ9sVf5WLjrty8+lKIHJomBhbLr9yswcFUR932GC7m1Xs8VhQ5XJj
	ctTg1QeVHftW9Ye2XZ2dTnUAUBFi76SoAXzssy2/3az0IU3RUapYylkDHhisZ/2XGVvy
	fQLw==
X-Gm-Message-State: AKwxytczFp7PmHP4DVuFfIC7ybAiQcNnKrwuX7QQHPtsAk7N0acqx1/9
	fEuI2h2l9TfIeRzFApuoxFikxw==
X-Google-Smtp-Source: AH8x2245c3ty4I3DGb9wnncyw1doWQPuw3M+g7/N1MXK/BdsxhU/T1srQLGzPUtzEOuPOKcYxIBbYg==
X-Received: by 10.98.16.79 with SMTP id y76mr20897489pfi.111.1517023513017;
	Fri, 26 Jan 2018 19:25:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:36 -0800
Message-Id: <84119b2d1704197f57b1491e71c55f00e1ed7cc3.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 36/36] uw-imap: update SRC_URI
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:12 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Switch SRC_URI to fossies.org since the original site is not available.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 884e4ba5353dda109ec101bd7e6c588e41665807)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 0849e88..91003f6 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
 DEPENDS = "openssl"
 
-SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
+SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://quote_cctype.patch \
            file://imap-2007e-shared.patch \
            file://imap-2007f-format-security.patch \
-- 
2.7.4


