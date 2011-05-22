Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QO4kG-0007xX-UM
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 11:14:45 +0200
Received: by gyf1 with SMTP id 1so1887434gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 May 2011 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=eU7jzJe5vMRttrMHJH51klA2LweByIKfp9dhT9lbrFU=;
	b=ak/KCOwwYAMq4q+MSk0jwPDGMVJC58zovW021NklfK/nhmGWE3cQzpgdiAKs1BSrwG
	QXyShAU6ozEZ/vpa5TTxfn//kKPUnPvN6VtTJLupgO2XvhQiOQdiW3weAnkHryBsSALh
	jlfGDMKu+ZC8ZhKxif9JQGcWQkQkaxiIzwKY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=D8fKw4AAwTafg4IVpPAjdRrGLXbWTXyFFqOZ8qNpNrH629ud7uGINpCwQCKVZt/jWQ
	uuSDMtjLjJu6iUxwTxAikGX0ndtRDdOGp6JdtjGI3tUh+sgeZAZAkSw9nwMu7F8X/nWI
	iUXtbBhiInlXGdnJ6TOyx8Y0n1JpKePa9u2Y0=
Received: by 10.236.183.231 with SMTP id q67mr1288805yhm.286.1306055504848;
	Sun, 22 May 2011 02:11:44 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id o6sm3932259ank.47.2011.05.22.02.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 May 2011 02:11:44 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 12:08:19 +0300
Message-Id: <1306055299-22875-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Subject: [PATCHv2] tzcdode-native: modify to use the latest version
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
X-List-Received-Date: Sun, 22 May 2011 09:14:45 -0000

* tzcode-native_2011b is not available anymore for download

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...code-native_2011b.bb => tzcode-native_2011g.bb} |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)
 rename recipes/tzcode/{tzcode-native_2011b.bb => tzcode-native_2011g.bb} (51%)

diff --git a/recipes/tzcode/tzcode-native_2011b.bb b/recipes/tzcode/tzcode-native_2011g.bb
similarity index 51%
rename from recipes/tzcode/tzcode-native_2011b.bb
rename to recipes/tzcode/tzcode-native_2011g.bb
index 30996d9..65d8cec 100644
--- a/recipes/tzcode/tzcode-native_2011b.bb
+++ b/recipes/tzcode/tzcode-native_2011g.bb
@@ -6,11 +6,12 @@ require tzcode-native.inc
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2011b"
+TZDATA_PV = "2011g"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[tzcode-2011b.md5sum] = "c63a1425f7252aef1fe54a258cdccff8"
-SRC_URI[tzcode-2011b.sha256sum] = "8031d05102e5c5109521a282aaab0629680bec82db783c716905802313678d67"
-SRC_URI[tzdata-2011b.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
-SRC_URI[tzdata-2011b.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
+SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
+SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
+SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
+SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+
-- 
1.7.0.4



