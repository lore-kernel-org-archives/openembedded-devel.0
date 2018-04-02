Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 82A0E72EF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 18:05:54 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b6-v6so3133440pla.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 11:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vWlVjuwVu4YJ4RAIkPc3G3iXEe12vHh5bdIgcbn8c0E=;
	b=g/ZsN/NlRz0Vx4j0PM3IBhSzdF4IdrAzMhJQwsEDqSnpDwCOR5Scmyo/xmcN7ownY5
	FleRfJYrmBNcE7Rxl7fBclBx4DwhBYGQ6aDkYDdftf34ysDl7GnGZb74LZ/bdsVX8lur
	WwNFhurkHndXF5xKbv3tpN4FB/D92z5QxPtwNn2zNy0AlneE2bMyMg8TLt1QNsqB7A4M
	awOtZNQMi5+Md1R0MUFHkmJ6AUpmhTxdcRxSd4MIzRepIcC9Xl2sqv3V7k26pPJud8xK
	20U45cWE/8ei/gjCr0NYMiSFBvS1435CanPMrt3TtdbVq/f41NgSFDCss7AHszlZY9cU
	Vmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vWlVjuwVu4YJ4RAIkPc3G3iXEe12vHh5bdIgcbn8c0E=;
	b=E5opvoOJvEbNUZDkOP7yLlzZJLJESXjzbqm6gAvVIcC1KnrhEVU73wEQlppvp/ePEm
	OEhkjfc+I3p4nE41ziDvdbgvy8EIjDzJGtedTiu24z9hfE2odOWbTAa7IU+6cB9gJ0Sl
	CdYc5lJvIplaaW3r9IofBMWuvONbKaCBqInup8gMrfgMCmOXE/vlYlz1MIKkAkbTs8nA
	EiYKRkPnO3QKQPpd5TicU5YmNGmDATw8xwbHhIn4H1tmblat7d5+9lRZwNT6ELFKoTfP
	jbCYR7fLGjbn0OYgsD8HDdt/3lUOHMqr8olOPqWci0Yr95rro/bjUWng4eiTDBMdvmke
	DGow==
X-Gm-Message-State: AElRT7Gv+24HImTYM0WzOwHdjwLr+Ns/K11rR3+zoRG0HTq5L6/e6xpf
	9AtcKzgI3nvSs8le+zG4NOCRqg==
X-Google-Smtp-Source: AIpwx48hnLmUlSoNMxUcy9LlLyslCVVhfwRiGf9o+Tnvp1alAZsEY2HIMI+Y2HWguTbG+MAJEQ3OhQ==
X-Received: by 2002:a17:902:a5c9:: with SMTP id
	t9-v6mr10769438plq.265.1522692355590; 
	Mon, 02 Apr 2018 11:05:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	e4sm1788778pfa.166.2018.04.02.11.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 11:05:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 11:05:42 -0700
Message-Id: <20180402180546.38078-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <20180402180546.38078-1-raj.khem@gmail.com>
References: <20180402180546.38078-1-raj.khem@gmail.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>
Subject: [meta-oe][PATCH 2/6] zeromq: Fixup do_install_ptest_base failure
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
X-List-Received-Date: Mon, 02 Apr 2018 18:05:54 -0000

From: Mark Asselstine <mark.asselstine@windriver.com>

The following error is being hit:

| install: cannot stat
|  '.../tmp/work/core2-64-poky-linux/zeromq/4.2.3-r0/build/.libs/test_*':
|  No such file or directory

This is being hit in the 'state of the world' builds (see [oe] State
of the world, 2018-03-19). The uprev to v4.2.3 (commit 50eb3504c83c)
did not take into account that the location of the tests changed in
the 'build' directory as part of the new release. Updating to use the
proper directory.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
index 71d7e7cbf..6cad3353d 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
@@ -28,5 +28,5 @@ do_compile_ptest () {
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
-    install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/.libs/test_* ${D}${PTEST_PATH}/tests
 }
-- 
2.16.3


