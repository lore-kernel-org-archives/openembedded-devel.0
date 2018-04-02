Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE726075D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 12:00:59 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id j73so14760315qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 05:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jSyql6Z8z8HYy1RXSQvwznDYFfLO74qWpxB71FQ8xwI=;
	b=szCDzy6x3orn02fcz5EOhbMTWLZnNsyH6cHIhABR/0f75yTrRZmb3hj/kfkBspQXHT
	3S1L86ATS2k09EKmmWLTqyUt7lcZNnJMcHCG6fkBVZGhCirHV0e9At85kKWE2x3QEj5u
	pSS7tNuhS1zipSs16rXRLOOfaGE1pF/63f/74ZfygklULHwv7T8wS37v/OwjglfQZtKI
	PaH317T3sPJbSZidpmnKsVJE+pOpWvRrgoFhSoQyJf13kkf7tkEv51f/TCe5c8Ke4KXe
	il2QLWrq0LoxDm7zT307MoozzqpRP1p9cBi6kQne3HjndCBHovg2Z0535I1w6DyjB2Mc
	NpRg==
X-Gm-Message-State: ALQs6tBSm5Oa81zXaptMLeR4Qeg0AZ1JCSledrhdNxQYurL436/YN+HA
	giH91xpSjfa7+mTkEFJMOaXz4eFw
X-Google-Smtp-Source: AIpwx48KyCBedL4BpmsRmP+i3PwnRWvzikH3G1alb8NrdHtbADTVuRxQVYS2x5mD7mFJTFwMuD9C3g==
X-Received: by 10.55.31.204 with SMTP id n73mr12575227qkh.38.1522670459587;
	Mon, 02 Apr 2018 05:00:59 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id a20sm142543qkb.17.2018.04.02.05.00.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Apr 2018 05:00:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 08:00:42 -0400
Message-Id: <1522670442-18442-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pip: add python-misc to RDEPENDS to fix issues import xmlrpclib
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
X-List-Received-Date: Mon, 02 Apr 2018 12:00:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pip_9.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pip_9.0.3.bb b/meta-python/recipes-devtools/python/python-pip_9.0.3.bb
index b0f7533..e3fc6ba 100644
--- a/meta-python/recipes-devtools/python/python-pip_9.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pip_9.0.3.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "7bf48f9a693be1d58f49f7af7e0ae9fe29fd671cde8a55e6edca3581c4
 inherit pypi setuptools
 
 # Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
-RDEPENDS_${PN}_class-target = "python-modules python-distribute"
+RDEPENDS_${PN}_class-target = "python-modules python-distribute python-misc"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


