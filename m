Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rickfoosusa@gmail.com>) id 1Q5Rad-0005AG-HJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 01:47:47 +0200
Received: by ywg8 with SMTP id 8so1221649ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=OMe/4tynbF2xJCOvYyE54n9Lhhc2nMPrWdQrc4+/7YU=;
	b=u3p7jgzBdAhNfBMOladBOZOw3H9U9VmQUQO0eCwvjxfouB3lIfLunU/xQwtOcPYXCi
	1wYsa9ci0NZ/M9b6cUV7qp6Iduu2oGRGeEA188H4nCXUqs8KoQk7JtR7QGRVb1ANKN1w
	0xFAUOOXMYV575oJsrG5zuQ+7otgRL3GX9BYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HwhykGKKDlLuXWdAnZmJ+87T4Ih3GXDCaMllNQaV60r24zVGoavdhAQDxdZFDtCJIo
	/4xx3E2toeUN2amL4RKYbWhi/uOEQ6T218wXHVKam6QylgpKf0HZfk3kX9aTV4u93XQl
	ap4Zw9IZj/eGA4nXmIP9LCTqIs+EpLscH26lo=
Received: by 10.150.115.14 with SMTP id n14mr3553118ybc.293.1301615146290;
	Thu, 31 Mar 2011 16:45:46 -0700 (PDT)
Received: from localhost.localdomain (adsl-68-93-135-199.dsl.austtx.swbell.net
	[68.93.135.199])
	by mx.google.com with ESMTPS id b4sm71835ybn.23.2011.03.31.16.45.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 16:45:45 -0700 (PDT)
From: Rick Foos <rickfoosusa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 18:44:46 -0500
Message-Id: <1301615087-19374-1-git-send-email-rickfoosusa@gmail.com>
X-Mailer: git-send-email 1.7.4
Subject: [PATCH 1/2] Elsie added new version 3/14. Created version d per comments. Signed-off-by: Rick Foos <rickfoosusa@gmail.com>
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
X-List-Received-Date: Thu, 31 Mar 2011 23:47:47 -0000

---
 recipes/tzcode/tzcode-native_2011d.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tzcode/tzcode-native_2011d.bb

diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/tzcode-native_2011d.bb
new file mode 100644
index 0000000..f18f09d
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2011d.bb
@@ -0,0 +1,15 @@
+require tzcode-native.inc
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2011d"
+
+PR = "${INC_PR}.0"
+SRC_URI[tzcode-2011d.md5sum] = "95095242ee368e6a7e107f154590ac11"
+SRC_URI[tzcode-2011d.sha256sum] = "68f2c07471c5390199c09fe9fee6a22f8a4dac24713af88b92da17b33ad98cc7"
+SRC_URI[tzdata-2011d.md5sum] = "03c5793502b7c41985edd73146bf7e36"
+SRC_URI[tzdata-2011d.sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
-- 
1.7.4



