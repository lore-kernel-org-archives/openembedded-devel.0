Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDpM-0001O9-R4
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:55:32 +0200
Received: by mail-pa0-f42.google.com with SMTP id kl13so443018pab.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HnBqvS8onMdKWB8YdE1RMC7Rp/PixCLc0hcuaS6HAQ0=;
	b=kKWVg/TtCvZfSLLZoZWjD5myV8Ef+ahNElOVw+kPxnUdIV5eW4ADHY0uXtSJ55x2Jt
	VbONicrIhBNVSxVxq7k1Z46WORY4sHagRkEv8HAuXR8RthNYl1nwk0byPacn0sJk0E2B
	0osc1hRP8Plb35ppum+wGyb4UGF7zESVGS2LFXTRpgY32+VMyOCf9Yhs1zZwtx67DbAx
	sG37+DsdLd2zaCVfXK+HiSdoQuq+JMsjIW+x8RvfdahEnlAotDjVjSJLPYotIj2mDcRO
	Ok4bRpiViUY94bVPxrfRS8uuKuES2pDud6Q1O3ADoWACr65sYJ7JBlwEVAX7bbf/ZUb2
	prkA==
X-Received: by 10.68.196.33 with SMTP id ij1mr77717256pbc.203.1367339818681;
	Tue, 30 Apr 2013 09:36:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vb8sm29132141pbc.11.2013.04.30.09.36.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:36:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:33:01 +0200
Message-Id: <258e8cccbe22868d8595c8c1f335253fb5f4591b.1367339450.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 11/12] meta-multimedia/README: add dependency on meta-ruby
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
X-List-Received-Date: Tue, 30 Apr 2013 16:56:35 -0000

* mkvtoolnix depends on ruby-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/README | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/README b/meta-multimedia/README
index d82ceab..b241577 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -4,7 +4,8 @@ URI: git://git.openembedded.org/openembedded-core
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded/meta-oe
+URI: git://git.openembedded.org/meta-openembedded
+layers: meta-oe, meta-ruby
 branch: dylan
 revision: HEAD
 
-- 
1.8.2.1



