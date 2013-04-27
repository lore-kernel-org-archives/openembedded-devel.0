Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWBnZ-0005cX-HR
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 22:32:56 +0200
Received: by mail-da0-f47.google.com with SMTP id p1so2404809dad.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=akoPRVLmunwYXqEEUudNa9pDkCKxGDVPteH2e9Agwbw=;
	b=YPa1Oh7v0sKONVGlYsEnW8MTqi/POfxmS46NIdw2pLXkekx7yQPb79tCPmt5wXPWTQ
	TccRWrd07xXcwCkDvh6dMnFPcSmqeXiEDHZ/2wN00//+7lJR7p0SX64Mr8LukOwE/vpm
	+FLICgEqnea6RdFW42pAPrVwZgMgYg2evq28UM5ZZ03H4h40gmKwc85nmaKQc5Z1HSIG
	Io9ZzyYeu1aLDhwYI64Lqc61qrl1WbO0PdxmJMJKm21VqcTCv/LmUKbdOl3k1ENFgZWa
	iMm5YOWMb0ofTVS6IQSgicq2nqhd6hZkissqf3fb/tasKMZlCNbCgj4R5AOjK5waDGW7
	ETiw==
X-Received: by 10.68.226.106 with SMTP id rr10mr64110723pbc.127.1367093696121; 
	Sat, 27 Apr 2013 13:14:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	iy2sm17044238pbb.31.2013.04.27.13.14.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 13:14:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 22:14:34 +0200
Message-Id: <1367093674-13613-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
References: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] meta-multimedia/README: add dependency on meta-ruby
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
X-List-Received-Date: Sat, 27 Apr 2013 20:32:58 -0000

* mkvtoolnix depends on ruby-native
---
 meta-multimedia/README | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/README b/meta-multimedia/README
index 7bf7fc8..3562a29 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -4,7 +4,8 @@ URI: git://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded/meta-oe
+URI: git://git.openembedded.org/meta-openembedded
+layers: meta-oe, meta-ruby
 branch: master
 revision: HEAD
 
-- 
1.8.2.1



