Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UdkTg-0007GD-Fh
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 May 2013 18:59:36 +0200
Received: by mail-pb0-f41.google.com with SMTP id xb12so4211120pbc.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 May 2013 09:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=c0uEoDJr9d/qQz/Q0RucoDQumTuoAuIlJGsSjpdHSys=;
	b=k/GsFSfeXSnkoddRKw9S8S1wmYrX2gutUn5w9xh0qPKXzSXig+sg5ySIW9+JtBjVyp
	mTxmlZZCs8IwL9/GbYeNUOLk6drXMHu5ZJbgvoVZeJyvy2aZuDcB7n3up/BCz9d9MlD0
	0cv4apY2shr1Gcqsp9LkYwUq2byQtLcY0t5goai3cbX2g3mZH6W0dPerqH6eltDqbE+B
	43/DsXd4d9TzcGeZ/aMfSnbXaVNXEQX5jJi3uf5Y1UxovRIWVBD4yowLGsjq2EGvIrcY
	ohJMSHkOlAimKuuVGZuZx4VQtLTrzm3nt2XHfc3mTcBSHg/9ILM5nmxv9CWum8yhCSfE
	ZFOA==
X-Received: by 10.68.166.229 with SMTP id zj5mr28390395pbb.167.1368895270232; 
	Sat, 18 May 2013 09:41:10 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id 10sm16272486pbm.0.2013.05.18.09.41.08
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 18 May 2013 09:41:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 May 2013 09:39:27 -0700
Message-Id: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
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
X-List-Received-Date: Sat, 18 May 2013 16:59:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Eric Bénard <eric@eukrea.com>
CC: Denis Carikli <denis@eukrea.com>
CC: Otavio Salvador <otavio@ossystems.com.br>

---
 recipes-graphics/libxi/libxi_1.7.1.bbappend |    2 ++
 recipes-graphics/libxi/libxi_1.7.bbappend   |    2 --
 2 files changed, 2 insertions(+), 2 deletions(-)
 create mode 100644 recipes-graphics/libxi/libxi_1.7.1.bbappend
 delete mode 100644 recipes-graphics/libxi/libxi_1.7.bbappend

diff --git a/recipes-graphics/libxi/libxi_1.7.1.bbappend b/recipes-graphics/libxi/libxi_1.7.1.bbappend
new file mode 100644
index 0000000..c90046b
--- /dev/null
+++ b/recipes-graphics/libxi/libxi_1.7.1.bbappend
@@ -0,0 +1,2 @@
+PRINC := "${@int(PRINC) + 1}"
+BBCLASSEXTEND += "native"
diff --git a/recipes-graphics/libxi/libxi_1.7.bbappend b/recipes-graphics/libxi/libxi_1.7.bbappend
deleted file mode 100644
index c90046b..0000000
--- a/recipes-graphics/libxi/libxi_1.7.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-BBCLASSEXTEND += "native"
-- 
1.7.9.5



