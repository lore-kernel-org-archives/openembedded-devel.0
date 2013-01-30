Received: from mail-qe0-f48.google.com ([209.85.128.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <geiseri@geiseri.com>) id 1U0Xj6-00052O-La
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 14:29:23 +0100
Received: by mail-qe0-f48.google.com with SMTP id 3so689957qea.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 05:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=e+woRAlTvWxH0+xjQ47fWFtTcCG57dSDp0Qx1E1ilws=;
	b=jrJt/ZJaoBvfCItzOTDMU8xf4bjsTpscAlhlxeh+/nlPuHk5TolvPFgYp8SLK6y7Vx
	DGsRlkxoNLofXNxfqZHyojav5PooJjBIeVMLItswRJSO7D40DRTn9zXZ6CQbQjcbjfZI
	FhPRz6nkddfpYZCiSl7NPTjuhuuANNziAbeeIUt298Qz27FLwzDs46dItSOUw2DvKj48
	8Ia5X0gViehwNgSxcTbP9HudL2YmqSdTlc96AJGwfiFJ4H9jLDqOiJOk1cgdEShgaUmh
	gC7+r0/AOITWrKJu68SWqQHoXku5b8rnDjTTuGPPXRye65HWnFuyJGI7XCu6ZtySUsjg
	hz3Q==
X-Received: by 10.49.14.202 with SMTP id r10mr5718536qec.10.1359551618831;
	Wed, 30 Jan 2013 05:13:38 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPS id z5sm976817qer.8.2013.01.30.05.13.37
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 05:13:38 -0800 (PST)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2013 08:14:37 -0500
Message-Id: <1359551677-27049-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm4bRIMF2RZGT5O7OdJdA1OkhrpdThhI4zpNsUk26XDP4hw1bGZlJO+bJILSF76mBHSksE+
Subject: [meta-oe][PATCH] krb5: add e2fsprogs dependency
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
X-List-Received-Date: Wed, 30 Jan 2013 13:29:27 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

Krb5 needs libcom_err from e2fsprogs to be built.  It looks like
in some cases if e2fsprogs was built before krb5 this would
silently pass.

* add that e2fsprogs dependency explicitly.
* added back the PR and updated its value to r1.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index c755862..1edf6bb 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=e8fad1d174de32f8da0ddc56b67b6941"
-DEPENDS = "ncurses util-linux e2fsprogs-native"
+DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
 inherit autotools binconfig perlnative
 
+PR = "r1"
+
 SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar"
 SRC_URI[md5sum] = "1a13c53899806c4da99a798a04d25545"
 SRC_URI[sha256sum] = "fe37fb93b398db98a1b23f814673ea2ae4b90138f85e1a4027ef639456a78651"
-- 
1.7.9.5



