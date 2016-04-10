Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59EED77202
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l6so16766466wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ej2HITbbTnqSxabwesMxcEuxldwtfKnD3Nun+YSeToE=;
	b=kDhZsVKX+wzXrX86ywcJx79hjTN02NuHwk4YCf6JdxpewA5wslBVxDMjHP28zixFjl
	o+IkRBa5IaY31hNFmb5+/dgPZ7wF+kObAKljEn9T1hWsKQVBdfLeBasSrKqRCdM/q7af
	2dwk5YNOjUOSevzB2EE5RRIdPlVY2KTLE/vNPvv+MJpGQqBqlcKSCSta/01EbVGyLobU
	4oQUhbfLSG9Fgree1Ob1Wn2mBZe632m8YdL7b6AAu9/GSwSdDFaUyhhegteBwY2Xx0bk
	jKnUrQbA14AI6Ktt1UjvwGXagtPFvkLMTFmlB9Cx88Ye31XJ7gW6f68uYSFOY7M5y78p
	SiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ej2HITbbTnqSxabwesMxcEuxldwtfKnD3Nun+YSeToE=;
	b=R36+xT0DQHz5DW2Su1rywdcOjEYKMwSZKEEkuBgygGYkccQM8cHPDerUQWer3td2dL
	kxOfWEtEKjKb7PPjF4aqdMYp2sdWGHSHUZjQP8sjGE9AvFBwEEALbOIMlc4+NBSucHao
	TzkOpH4IrVa7HZ2+qvVKf6b4We1r9m26T4imuWHJQvpl3N1tKyt2DQv8b3+i3pviKrI3
	0amlqvc9TWlqLsETYoVA6TlPB7eIhwXHh+grQumI3w+n9bZNy6CrALkFXZq4+4VBd2d8
	wbO2cxNy+ioCH+hpHgOieG/rfDg+EjZiqdPLTReLsQVMA+K8RmVL9XW6JsiWEcI06lOq
	UrNQ==
X-Gm-Message-State: AD7BkJKyz5HbB/v0Qvs8wX6vSvkGxRmmr6Ohimld1ADcQWagZQe3ZsmNRceoh2ikJsHUCw==
X-Received: by 10.28.30.86 with SMTP id e83mr13860447wme.18.1460317309983;
	Sun, 10 Apr 2016 12:41:49 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:03 +0200
Message-Id: <1460317290-4787-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 04/31] qtdeclarative: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtdeclarative_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 93442fb..64722bb 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "0fab5761d5428aa708edd66e40fc3c449adc4b11"
+SRCREV = "dc558b69f083c89aa8c02952e5f167405939a61a"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.5


