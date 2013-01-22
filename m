Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1TxeVQ-0007UX-IP
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 15:07:24 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so3380266eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 05:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=H73A1H3/2a1p0tlW1ZXIvKiabCmlYQnwLiuHI40wc5o=;
	b=G4y8TLMBWYrUsbw1TDdngC0yQ09twZMj/e1LCOjMg4P04JAQX4wTPVc5/wisuTx93h
	+rr+Cj2cBsM1M0Tyb5n4e5GP1r65qGiOGA+2FzNOJHAybLzxJirI88XKJ77SmYG/5nvm
	4CBp3LdUUIoaakHydzPT+He23L8qFjmHeWL23h+/JZQsleDwfn6oRcmZ437SJeDGC9m2
	hAIa/WY8ViDszJIXp1USad5We7NP1882fkFhLR+6wmsL1CB1CfNB2ehVnr9N9tWWC1ne
	rqNR4JbmjG+d3fV3H3k7eC7r7o73D5SxVtkzIuiBe2+oy76LlQY4auJCMBCa5Q1TsaXb
	WfIQ==
X-Received: by 10.14.203.2 with SMTP id e2mr72533014eeo.20.1358862706456;
	Tue, 22 Jan 2013 05:51:46 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 43sm27091907eed.10.2013.01.22.05.51.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 05:51:44 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id DD80240075E; Tue, 22 Jan 2013 14:51:32 +0100 (CET)
From: david.c.nystrom@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 14:51:26 +0100
Message-Id: <1358862686-31602-2-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358862686-31602-1-git-send-email-david.c.nystrom@gmail.com>
References: <1358862686-31602-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCH] Fixed non-existing twisted-bin package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 14:07:25 -0000
X-List-Received-Date: Tue, 22 Jan 2013 14:07:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../python/python-twisted_10.2.0.bb                |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
index 5215dd6..bfd6643 100644
--- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
@@ -62,7 +62,10 @@ FILES_${PN}-test = " \
 "
 
 FILES_${PN}-protocols = " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/ \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/test/ \
 "
 
 FILES_${PN}-zsh = " \
-- 
1.7.9.5



