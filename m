Received: from mail-qa0-f42.google.com ([209.85.216.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1UMfy2-0003wN-LW
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 16:44:15 +0200
Received: by mail-qa0-f42.google.com with SMTP id bv4so873409qab.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=WINJ+XOMryJgIwHFPgiHXvmVdBcs0mIyBW1bqXo/mBc=;
	b=uMMxXgoG93hjysJU/U7FdjBNc1hIN74GWeE+sOyPlxXeYn12Pb/x33YReawGerL4ef
	WlIa54MyfiHOFUdUJ30ZB5cID6fUhDgJRxARvppwZEQnh7wOZIG//gNmwuomYLnbrfb1
	AP9D9ytO2EPaFhSnx+YjoFU6Zma+763gWcEibSvCGBIn1r1C/NE8werz3FiWeOuvIaw4
	NPaDQaYNIbUzxlfAh9nLed6vED1YSxi8Eh519hEuZyl5fH9QzOC+SvPF8hAANieaGCrm
	HDH64x8WI3bzjRyoy/ijWlLOpYjxKaQecpWwCIbjsGKFK5hpz30pPB0uAzx7TFvQvKSE
	obzQ==
X-Received: by 10.224.96.4 with SMTP id f4mr12675326qan.79.1364826426023;
	Mon, 01 Apr 2013 07:27:06 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-165-43.ronkva.east.verizon.net. [96.240.165.43])
	by mx.google.com with ESMTPS id h5sm22110057qai.9.2013.04.01.07.27.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 07:27:05 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: philip@balister.org
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2013 10:27:00 -0400
Message-Id: <51599939.4541e00a.7e3d.0ddd@mx.google.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1364826420-23737-1-git-send-email-y>
References: <1364826420-23737-1-git-send-email-y>
Subject: [meta-oe][PATCH 2/2] python-cheetah : Add support for sdk generation.
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
X-List-Received-Date: Mon, 01 Apr 2013 14:44:15 -0000

From: Philip Balister <philip@balister.org>

We need to run cheetah on the host.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index 1dad958..9dc4aaa 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -15,7 +15,7 @@ inherit setuptools
 RDEPENDS_${PN} = "python-pickle python-pprint"
 RDEPENDS_${PN}_class-native = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "853917116e731afbc8c8a43c37e6ddba"
 SRC_URI[sha256sum] = "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
-- 
1.7.11.7



