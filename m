Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 31C0B7E05D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 09:54:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l17so7883570wrm.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zlx6nTC+wqoqNdAEMhMqUaAo63dStRfJmCt4gh1U0ng=;
	b=t8bAquw5SZXtBxIaFfsbkFSzX8jO/Sg2FzvQN/UdjDvoSbJTyw55XjskbTi/QIpdj+
	1zNgZBPO+2PEBClnKz/ftm+gbughC07X48VYSUNhBCyYWtTq004R1gN3/aJOsQ38eFwY
	uj7pgfTLa5Peg+ip+nHMNt7Yh48optup37kRjX/gpqX7OPsfD7YVy8RvVDFAOoAkxUkZ
	GJ9EZ3k9nH309PeNlb+UYWSTA9TDy6oHiy4X0adUFTOTMChkTWcDj5KZ8V7Ifsk1H4HB
	l73TaT4KISXY7AaSuZZZb5jMU/dKpzIsOTP0JfGS/hGsFBBov3MPSpsd+JnwjZYrUK3c
	XC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zlx6nTC+wqoqNdAEMhMqUaAo63dStRfJmCt4gh1U0ng=;
	b=c98uM1ObBd6rfk5Rvgkh7tEtk9LazN/hnS8A2H70vmJMenElgaxl4eqpueuqvU1265
	MQd9RXV7puvp3xouqY3WIxcX/Z47YV6m9jOGsMBY6+H+8549oqPeG+W8rnumJ+stn/qr
	sdLjtgiOzYyqrMV7JVKjripbjCZSHDD/KSahb37naeSvCAJSfAcAKVpted0oAXA7S7zd
	1x9r5tpotmXzI1SvMokntW7x7eniUNcWK54xOep/oLpoDvImEbYi1eRFq1DeRH1zPouh
	gf7l1IJqeG5CemJ39aHBTzMhDajr4Ud2zfxtzZ62/tlZtJa/ZNYgbPDCfAgCWab2ehTO
	N0DQ==
X-Gm-Message-State: APjAAAUITVdVGGnzl8Cb8lvEoMGSM3ZQFHx4yuspLsi/3XahV5fbmMpm
	yeKqSQYk0AEKLCWj7OJwkwZUbz77
X-Google-Smtp-Source: APXvYqxeWujNlwlUlI+vFeOEIS6daWTES6cZiudXdrnqFCw8C0Iepb2srPmSymz4VuuVP+nuL7Pj4g==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr14104448wru.44.1558950842624; 
	Mon, 27 May 2019 02:54:02 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n4sm12103130wrp.61.2019.05.27.02.54.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 02:54:02 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 10:53:12 +0100
Message-Id: <20190527095310.4890-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527095310.4890-1-nick83ola@gmail.com>
References: <20190527095310.4890-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/2] nginx: update stable version to 1.16.0
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
X-List-Received-Date: Mon, 27 May 2019 09:54:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
deleted file mode 100644
index d0613ffeb..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.14.x branch is the current stable branch, the recommended default
-# 1.15.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "239b829a13cea1d244c1044e830bd9c2"
-SRC_URI[sha256sum] = "002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
new file mode 100644
index 000000000..cad0db6fc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.16.x branch is the current stable branch, the recommended default
+# 1.17.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "97207283f30cd90cdba638c3ea30323a"
+SRC_URI[sha256sum] = "4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345"
-- 
2.20.1


