Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7bxf-0002yu-1N
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 02:25:35 +0100
Received: by mail-pa0-f43.google.com with SMTP id bh2so3061132pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 17:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=d3DPy+sCrP4nZ2AUtt3gk6Opwo1cwU6J+HeIAtdgbCc=;
	b=r43ornZucfSnwpoEgHfG6X3k2kKiJsbNeH7tvlV3ZgufqqIBFFUq63Pn4KjHMqV0Bk
	qSuBXU+avWlEypcsSe62ELa55YAdpFFaQHqt8LHqYjIxUxOXfxE4OWLq/9xtlZs+Seao
	nJeBJjjH55sREI1yx9kJdayURepzDzMxYLuujcMQnbs9NZZK958zW0wlzKZOu/+Cay2i
	sw0MeEIA2F4D5ksrTGNKuLFWORdC1Z35pVb8WtiwJ9TU8BJSyCviivLXdXv9Xg0ezqM4
	psHOLPVx+3R6kn5yTx/oYVKBQwc9Gu4nkD7MwcEdgywNzK0MqJ5fZs9/vhOU0Hvc9uq3
	J23g==
X-Received: by 10.68.240.103 with SMTP id vz7mr35069088pbc.112.1361236165838; 
	Mon, 18 Feb 2013 17:09:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id iv3sm16045936pbc.40.2013.02.18.17.09.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 17:09:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2013 02:08:43 +0100
Message-Id: <37f4933af3a7b36d9ab7e2356a2c4d3e985a3a4b.1361235235.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1361235235.git.Martin.Jansa@gmail.com>
References: <cover.1361235235.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1361235235.git.Martin.Jansa@gmail.com>
References: <cover.1361235235.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny 2/2] ca-certificates: upgrade to 20130119
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
X-List-Received-Date: Tue, 19 Feb 2013 01:25:36 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* old archive is no longer on upstream URL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{ca-certificates_20120623.bb => ca-certificates_20130119.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20120623.bb => ca-certificates_20130119.bb} (89%)

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
similarity index 89%
rename from meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
rename to meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
index 66150f0..5ad4485 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=6135800ff6d893c7904d7aad90972eb5
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
            file://0001-update-ca-certificates-remove-c-rehash.patch"
 
-SRC_URI[md5sum] = "5105d4cc086f0d4ecf7bf2e4c4667289"
-SRC_URI[sha256sum] = "878cd1130ba056fe5f96decde7e5fc1b71d35eb8565a1515744912e100731ee9"
+SRC_URI[md5sum] = "1fbbec2028a33cf865b79c204aa2e626"
+SRC_URI[sha256sum] = "fb51ec9a2c551838cc1646a0b3c9e6bea5c1bb20ff5d71c542451fac4b191c22"
 
 inherit autotools allarch
 
-- 
1.8.1.2



