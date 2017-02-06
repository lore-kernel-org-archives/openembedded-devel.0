Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF5F71994
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:37:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so9500021pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nkG786pHTYDeqPWOejorgob42TF7Jiw0V556fMAAPtY=;
	b=kQBiJ3XY30Vht4rqRvy8obfUcOy5NTrgTUo9qm9KMkaE5oJQwP2Mu1bVgfGvy5eZNj
	84uVT4mfGDZ6esZXDOluvPeXWpFV/CZhgfl8G8GJlxcsTS/G8TvKCuP/xrBOO1IM1bE1
	zFp15p48NOdBSGjNMw0hBxWFpPK5GOf5KKAZc6L/+b99A9DZqxNuQUotvhenCaAFZpJ9
	KceofkKffbw89bpAHfsxz/MqbzBoQjYyDu8iWH/61XaV1KJ+DS0DLymZDZvEf6/OeFWy
	CD71rPZKMmuahPQQRmFgDme+md2kzo5Sp1WnVUXw9ngOc1V7oCo8m+dy5Gm5p7UjlUKB
	vRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nkG786pHTYDeqPWOejorgob42TF7Jiw0V556fMAAPtY=;
	b=ipeQ/pOEAS8eCh3KpCU9TSETY5yaCRskM3eYAhlKmd6SXPe+D7FLdPC+OxgO8SHOYw
	qFM0N9rc6kYBaZH2PF7ED/2p5Z+fux9ll351R3op+hndwYm5+8yYdkJhksMSGNnRvwpy
	Dj0kJ0hQH9aefTzy0f3/VZpPC0LO8ouRu7MnFTo1pUiS8vF6RU6QEwl8ye/1cxbzmq6p
	bXHnbFx4s41PSxlP/4SyowX+EBuSN7FWZ7vzBEOnHpgUg9vFq1HYR1cKpZzzfyh2GEPJ
	79kuuM33AA/bpzq4q2CA2iFda9PzX4qvWFLNhse7xbJdmOCD8tg0PvkR26mQbtupyvD/
	7fVA==
X-Gm-Message-State: AIkVDXLX1CJt1ZVyQrxc4KXo1cS2WQinI6asvRmisB8gN+GFRqfLzf3IkD8RS9sedwqqqQ==
X-Received: by 10.98.210.3 with SMTP id c3mr14058518pfg.7.1486399038526;
	Mon, 06 Feb 2017 08:37:18 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac48:9a90:c71a:12ad])
	by smtp.gmail.com with ESMTPSA id
	z74sm3919652pfd.70.2017.02.06.08.37.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 08:37:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Feb 2017 08:37:16 -0800
Message-Id: <1486399036-28846-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486399036-28846-1-git-send-email-akuster808@gmail.com>
References: <1486399036-28846-1-git-send-email-akuster808@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pycrypto: add python3 version of pycrypto
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
X-List-Received-Date: Mon, 06 Feb 2017 16:37:18 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
new file mode 100644
index 0000000..00ea5d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -0,0 +1,11 @@
+inherit distutils3
+require python-pycrypto.inc
+
+SRC_URI += "file://cross-compiling.patch"
+
+# We explicitly call distutils_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils3_do_install
+}
-- 
2.7.4


