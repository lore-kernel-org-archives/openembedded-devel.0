Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LUeF1-00058y-5P
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Feb 2009 10:40:40 +0100
Received: by yw-out-1718.google.com with SMTP id 5so936577ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2009 01:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=lT6XAWPfnmA6+hMDijHJG+tHaFU1jQbZQE5h+qdTJ1s=;
	b=PiPOCjRvDXpHq9B4c3yTAUW2Ybo9ZYrUUNFuPtdZaY6c8Z/ApUyp0uOBvzB/rJbYb2
	fFfIABGv/quBHnvgpTtWH/d8b5MC9/RsIk4Cd1BvAlEl55CiWO3khSy1vUetLHjLzhxa
	xE0dPDaNZBZW5wSwjPp+Yd11Z1K2KZOcTXukU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=oXdL8bGKrgEf+DtQ/AISCABS2KoyypSCJkhJuREkwVZSgFlSw9uub5+uv4ZI2NMnOl
	EKRSVn7CPIr1LQ0ss4hi446DoipNmavTJRnJBU9POHjykO6DfiGfdaHEXRJKgrnnuYqn
	FZegHEwDKXZD6OGmd/BoebReO4EOQHgLMTWsg=
Received: by 10.100.143.17 with SMTP id q17mr4528464and.29.1233740413212;
	Wed, 04 Feb 2009 01:40:13 -0800 (PST)
Received: from ?10.6.9.10? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id b14sm8543652ana.36.2009.02.04.01.40.10
	(version=SSLv3 cipher=RC4-MD5); Wed, 04 Feb 2009 01:40:12 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 04 Feb 2009 11:40:08 +0200
Message-Id: <1233740408.5817.8.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Update directfb-examples package to 1.2.0
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
X-List-Received-Date: Wed, 04 Feb 2009 09:44:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Update directfb-examples package (current one is not buildable).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini                           |    4 ++++
 packages/directfb/directfb-examples_1.2.0.bb |   17 +++++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 packages/directfb/directfb-examples_1.2.0.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8b414ff..72963fa 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -194,6 +194,10 @@ sha256=f83af60d53ab4319e5d71a4459cc10464ffd683efabacd6bd773bb807f8771fa
 md5=0cdfb4dd248eada3dc35db4f8cf75f8d
 sha256=c54e779a720841126e23d692de85243e23b0d94fb7792a958b96b5bd097a8b85
 
+[http://www.directfb.org/downloads/Extras/DirectFB-examples-1.2.0.tar.gz]
+md5=ce018f681b469a1d72ffc32650304b98
+sha256=830a1bd6775d8680523596a88a72fd8e4c6a74bf886d3e169b06d234a5cf7e3e
+
 [http://media.djangoproject.com/releases/1.0/Django-1.0.tar.gz]
 md5=84d0490e4126f31d1c23f640e1e86f2f
 sha256=4c780b9e2906944ce02a9325b15f480d2bd4c0b12137f752aa4800c0f8563acf
diff --git a/packages/directfb/directfb-examples_1.2.0.bb b/packages/directfb/directfb-examples_1.2.0.bb
new file mode 100644
index 0000000..7fd3f38
--- /dev/null
+++ b/packages/directfb/directfb-examples_1.2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "DirectFB extra providers"
+DEPENDS = "directfb"
+SECTION = "libs"
+LICENSE = "GPL"
+
+SRC_URI = " \
+           http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
+          "
+S = "${WORKDIR}/DirectFB-examples-${PV}"
+
+inherit autotools
+
+do_stage() {
+	autotools_stage_all
+}
+
+
-- 
1.5.6.3




