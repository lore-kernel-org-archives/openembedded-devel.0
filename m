Return-Path: <chris.d.garren@gmail.com>
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com
	[209.85.161.43])
	by mail.openembedded.org (Postfix) with ESMTP id C8C407D44D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 18:00:13 +0000 (UTC)
Received: by mail-yw1-f43.google.com with SMTP id e76so2616943ywa.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 11:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RGiQr0l68EEObwtyN5oNYn2x3srRV5wQPM/qo4Wm6TM=;
	b=Ulm5qU2t4Lej9thee7BKgxC02Mso/zs0IKcjG9EmSUWdKkUmex1iJcqqUzqeewflub
	2DLMiEhBL9fgMBFeXEbCYBm5c7tt/B/oUYtCJwyMTR66AHTXrxmtBvOeM311vRChJNi9
	xjao0g4gIXl7KEmxX0rhgHjIVmpn8j3eKKrGj7Kb5s9TcShQdjZCoS1OyX/swa+a92qu
	g3+m3CEE8NvQpVyz4Z1+kxj/8WfrdRlUT789+X4y6ImvPL5+GY1u8PWtx+03tFElQ2gP
	0twFesGHCRsTU5FH9heui27Ccrgw04z9XHHBTRMbvXfUhUOCO4l72nPXt4xKK8/n9bhC
	C0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RGiQr0l68EEObwtyN5oNYn2x3srRV5wQPM/qo4Wm6TM=;
	b=jGj7CUysrRfrnyZHXleZDdOWg5TzoIfgCYcwRvjdTY9GdiRwMrMH4SdB+WYE7JQmp0
	EZZm2xgt47da/TGhyJ5lzHJM9QSrx7pAzV1R5kOeSwqi3C0BnkhmiEp75f04M/RNmpnk
	0UWPdBSqXojKcxkfIbIBEaW8sxZtLmF+WOCvBaQGDKNFewOkqrqCpAqTIkWnvaY1Yr6j
	/na4SnBAxLCJrR7Q3+WVq9XDl2xnrD+vqjKFzgFqjKa/DZVPZKD88yruwaawX4lNUxLK
	+Wa6orOjobdD8Vu1CXpPvhFzdx6y1gr7FZAm66gHQLs6RyKQEHCiA4FGamMh2BV+Wlqs
	B8mw==
X-Gm-Message-State: APjAAAW3qRGgHTatLibxsplMUvKqMQ5PJzOzlGmbXDatrkWX8NZL/fTh
	esMnO01nuXFdCSsPDzLRo4K0P0di
X-Google-Smtp-Source: APXvYqxhkl8PKKxf36P/fK8D4edulxxhqq1EJiXIhJfFMHRfCUqge5hU9rWGvFF7rbDXlOWpAURJTA==
X-Received: by 2002:a81:6705:: with SMTP id b5mr11609103ywc.31.1554487214547; 
	Fri, 05 Apr 2019 11:00:14 -0700 (PDT)
Received: from localhost.localdomain ([207.67.30.60])
	by smtp.gmail.com with ESMTPSA id 23sm7600433ywq.91.2019.04.05.11.00.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Apr 2019 11:00:14 -0700 (PDT)
From: chris.d.garren@gmail.com
X-Google-Original-From: cdgarren@indesign-llc.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2019 14:00:09 -0400
Message-Id: <1554487209-29330-1-git-send-email-cdgarren@indesign-llc.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cryptography: Add -pthread to link flags
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
X-List-Received-Date: Fri, 05 Apr 2019 18:00:14 -0000

From: Chris Garren <cdgarren@indesign-llc.com>

This builds openssl which needs pthread_atfork(),
but it's not linked which results in runtime errors.

Signed-off-by: Chris Garren <cdgarren@indesign-llc.com>
---
 meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
index 9c2f884..ce7b5ab 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
@@ -1,6 +1,8 @@
 inherit pypi setuptools
 require python-cryptography.inc
 
+LDSHARED += "-pthread"
+
 SRC_URI += " \
     file://run-ptest \
 "
-- 
2.7.4


