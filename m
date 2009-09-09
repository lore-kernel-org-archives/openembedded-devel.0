Received: from [209.85.221.172] (helo=mail-qy0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MlH6U-0000Bx-Qh
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 08:56:33 +0200
Received: by qyk2 with SMTP id 2so3575336qyk.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2009 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=bH5P7s9LEuTmjhcyfBL2lI3bV9lXC2nws6l49iKMsPw=;
	b=BRiXAKdF++7IQigbmK+//rVRzztFwCcyFv+lkX1gE2SkiYYzatduiKLCB4j4V/VFK7
	3BuNKsj/mCohIFis4Yxb58v7vUPJaQ8k4J0z809y+o5JdXBZFFK6O2dxq2/fY8hiwDf8
	kNNRKLTTdcGVdOgEJUkgA2u7TWGxPaZyxPvJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=OuqEuyetSg5ZdFVl0P3lVfLUSE2LJ+oOtDOcra0YE9ZqnzprXa21KW/pEolKYauOLU
	c+6izSbwZO0zzjLPq9jH8aCQiHvbSWLtMkBbZp7UB7FL4YueqxbMIBHiRyzdMeYhjCi4
	Y0bdHEWbDX8dSUbq6oE9/Gksh5+EawxJ4dJaw=
Received: by 10.224.6.10 with SMTP id 10mr10782157qax.60.1252479363845;
	Tue, 08 Sep 2009 23:56:03 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 5sm288234qwh.0.2009.09.08.23.56.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Sep 2009 23:56:03 -0700 (PDT)
Message-ID: <4AA7517B.6090900@gmail.com>
Date: Wed, 09 Sep 2009 16:25:55 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add liblinebreak-1.2
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
X-List-Received-Date: Wed, 09 Sep 2009 06:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/checksums.ini                       |    4 ++++
 recipes/liblinebreak/liblinebreak_1.2.bb |    9 +++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/liblinebreak/liblinebreak_1.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8227844..8deb789 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -13950,6 +13950,10 @@ sha256=e485f36d74f477f3d235a05bb67b502dc744092569842d9ab45e2f785f74f556
 md5=6cef76df73f86482fa478ad8252d9055
 sha256=d9ca5d502f8a4a6c146d1f0458ac27c95cc59724caa6d845e24946d299463bc5
 
+[http://downloads.sourceforge.net/project/vimgadgets/liblinebreak/1.2/liblinebreak-1.2.tar.gz]
+md5=d18039259001ccb24b5dd4648c49c5ad
+sha256=9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76
+
 [ftp://ftp.debian.org/debian/pool/main/libl/liblinebreak/liblinebreak_0.9.6.orig.tar.gz]
 md5=e898200ac89815365e89b7c6cc2f78fd
 sha256=f23ac7320379d8e950340fe37633c21a56a5f4320d29c34a65819558fe6cdaa1
diff --git a/recipes/liblinebreak/liblinebreak_1.2.bb b/recipes/liblinebreak/liblinebreak_1.2.bb
new file mode 100644
index 0000000..a012c60
--- /dev/null
+++ b/recipes/liblinebreak/liblinebreak_1.2.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
+HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "zlib"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
+
+inherit autotools_stage
-- 
1.6.0.3



