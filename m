Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B83078A24
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:41 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y26so438142pgv.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4bBCbgZp5PJiMY7qw/mM/AKSNgNExvBHyLNUr8ZvMJc=;
	b=mPrdgUx1zYL2FZOMKWklgn2k2roK7JlxO2gUPMiRI4gl+F6b2Zy1t1n23OpazrGU5Z
	DwFSvWvZ76QNsbFX7+P5Dl87IKJ+utrd5u0jzXJp5ju6aXWBbZndCLcvicVGvfJFtT9x
	Guzq3mleSKsaVB2AxPhOI8dWdBARlp4FVn+RzjM3RXa64k3eCCm+Xt5Y6FN0uxGCLgG7
	x93gKxTnFaRBSbttkXwkJKl7Ic5iwFdEPQyUiFLocqAHp2Rr58RX/Kl0TwRk5QEwjmqp
	vf184t/laIKMr2yv8Pl+X7TROkHQPcc7Xb/bQXTWbQCjTfyHxGYVcDUh6iJiX32zdvTj
	m0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4bBCbgZp5PJiMY7qw/mM/AKSNgNExvBHyLNUr8ZvMJc=;
	b=QqlIU8UEbsM7adzdQaD3RUPcDtlsU3l5zgxlirWSmIQ7q4GYRdVR1kiG1amsGYR6j5
	BcEzh+PltoaYwCwakJkXs1MG+ZBac/mYK7ke6icmrZ3ySB3xL1mnNTbpKQ+gyyeYrgpX
	8zUPST47cWZt5FQKbgkDJR0bfDvp3P5Uv7pYRXUnucAoesOzhh6U41r41/1z+mv+I2DT
	ZqD2XZ+kKqdBtruwE+m8eYpQQfdEa0zmmyaG9yWY2xNPf5NsOCPVtHiu3UN3IC4sWNFK
	ablvGQsK1q+v4608093RJvfbre3lAfKV8TZW16TsF+UC26gWKkPJuUFxZeWqLOi/JYUI
	hQiA==
X-Gm-Message-State: APf1xPBdAQ8mVHFSdfgYAjmkrXhdpv938CYix7eJZJhfnd+KqlnFhw8a
	UI0/eGIlI2fRKivcloKIFaE=
X-Google-Smtp-Source: AG47ELuwOMznFI00XXY+rMATt3XgR86hOa6vn7XE5eu+kta7TNDHDcFWLq0OZlsQVkLOa/mQ1ZosMg==
X-Received: by 10.98.73.89 with SMTP id w86mr21051549pfa.227.1520395422584;
	Tue, 06 Mar 2018 20:03:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:17 -0800
Message-Id: <1520395408-19266-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 14/25] polkit-gnome: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:41 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
index 8e99731..6e941e5 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
@@ -19,7 +19,9 @@ EXTRA_OECONF = "\
 
 DEPENDS += "gtk+3"
 
-inherit autotools gtk-doc pkgconfig
+inherit distro_features_check autotools gtk-doc pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES_${PN} += " ${datadir}/dbus-1 \
                  ${datadir}/PolicyKit \
-- 
2.7.4


