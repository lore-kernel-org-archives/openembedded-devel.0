Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rickfoosusa@gmail.com>) id 1Q5Ran-0005Aa-Db
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 01:47:57 +0200
Received: by gxk3 with SMTP id 3so1222703gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ps80vOQVilQcSDqKYe9YRtwjYh4GiYddUmUHjdH3fJs=;
	b=vshqxVzKcNX7lHBD/SzS+3msoSJ+NVhg52avpHBOolHkTkupv+PBQbCZOUibY9HJtK
	nVe7+S9IrC8E5BmJIRx/z47vdOpDTZ3dOl3v8JMG3oCu9Z41BrflBVEDmyd6Bo9KRwsn
	RTa/l8azhRg+4s48Smzh9UyVp4xz38UOerAGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YEeJPi/4OAPKbI2plrgbTMex2TkoimTRS+ozNdvd3eNX733zFfTiY+exUDxv1XLo7t
	eAbGnyWMPWbPqWg+WZKHj7/hId19ZrvS+74lk0V7+Npcfs+xf0HcQ+mmsoNse3k1beqv
	YwPrFYYEvi//LFdhnG7uPnM86+lYOR3vBlDGw=
Received: by 10.150.113.4 with SMTP id l4mr3263887ybc.279.1301615156151;
	Thu, 31 Mar 2011 16:45:56 -0700 (PDT)
Received: from localhost.localdomain (adsl-68-93-135-199.dsl.austtx.swbell.net
	[68.93.135.199])
	by mx.google.com with ESMTPS id b4sm71835ybn.23.2011.03.31.16.45.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 16:45:55 -0700 (PDT)
From: Rick Foos <rickfoosusa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 18:44:47 -0500
Message-Id: <1301615087-19374-2-git-send-email-rickfoosusa@gmail.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <1301615087-19374-1-git-send-email-rickfoosusa@gmail.com>
References: <1301615087-19374-1-git-send-email-rickfoosusa@gmail.com>
Subject: [PATCH 2/2] Obsoleted by 2011d, no longer on server. Signed-off-by: Rick Foos <rickfoosusa@gmail.com>
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
X-List-Received-Date: Thu, 31 Mar 2011 23:47:57 -0000

---
 recipes/tzcode/tzcode-native_2011b.bb |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2011b.bb

diff --git a/recipes/tzcode/tzcode-native_2011b.bb b/recipes/tzcode/tzcode-native_2011b.bb
deleted file mode 100644
index 30996d9..0000000
--- a/recipes/tzcode/tzcode-native_2011b.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tzcode-native.inc
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2011b"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tzcode-2011b.md5sum] = "c63a1425f7252aef1fe54a258cdccff8"
-SRC_URI[tzcode-2011b.sha256sum] = "8031d05102e5c5109521a282aaab0629680bec82db783c716905802313678d67"
-SRC_URI[tzdata-2011b.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
-SRC_URI[tzdata-2011b.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
-- 
1.7.4



