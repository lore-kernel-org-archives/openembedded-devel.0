Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 822FA76A51
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 03:07:25 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so9533023ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 20:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xUrmac4NueR4gPy/1v5n/TlTiWl9sPC0/fTRHWPcA6M=;
	b=S/9i+pIiGHjE91uVnN3cqzbxhoSkROCswLEKbXShRJQt5x6OUY6Ci2ZXWqscbzlaBM
	qyw1sxoEjzBDVa7ZeeHT6mHzl4P2xffwNpdQwnW/urzntijRKUqrmdWhDMZ2RbUTh7Oa
	s/KYajYcdMVLoec4MkWZAZJdhOVOpActzxDV9+jdSaf3n0IdJHDQjfrW8V4G0YOj+Mk8
	l/OAf2R7UYOArAJNRofxITzVw4/vz1Vp432nnQVyl6GRmYfd1LtPCZrrQ+VxqPgKmWu6
	jsyMmiJsoNGtuTIEgh/g5C+MAsTagU0BU8Hbe0mvHiHl5MDlZ3beuLMuDWJhfQft9EJ0
	apvw==
X-Gm-Message-State: AD7BkJLXqfXc9hEpInT9rCcyXa2BBoUYCDvBGbwLxr+VqWJhXQyXfSynjUHksSeMuQhY9A==
X-Received: by 10.13.228.2 with SMTP id n2mr362011ywe.23.1459997329801;
	Wed, 06 Apr 2016 19:48:49 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:12 -0400
Message-Id: <1459997302-25271-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 01/11] adduser: update to 3.114
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 03:07:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../adduser/{adduser_3.113+nmu3.bb => adduser_3.114.bb}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/adduser/{adduser_3.113+nmu3.bb => adduser_3.114.bb} (89%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb b/meta-perl/recipes-perl/adduser/adduser_3.114.bb
similarity index 89%
rename from meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
rename to meta-perl/recipes-perl/adduser/adduser_3.114.bb
index 969a739..fb4c0c4 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.114.bb
@@ -6,15 +6,17 @@ SECTION = "base/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.gz \
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
            file://adduser-add-M-option-for-useradd-when-no-create-home.patch \
 "
 
-SRC_URI[md5sum] = "ccb5864bde56683182c89c44474e7182"
-SRC_URI[sha256sum] = "02682be3f51f3e732121f20a3e4922bb8bef15cfacb8767fc250a01d09502122"
+SRC_URI[md5sum] = "3a079dd4e41d5a1fbaccaab03aacd881"
+SRC_URI[sha256sum] = "693b45bb0d27938fff2ecee5442ea2ac1b8804472ff0bb8faffd39616e58211f"
 
 inherit cpan-base update-alternatives
 
+S = "${WORKDIR}/${BPN}-3.113+nmu4"
+
 do_install() {
     install -d ${D}${sbindir}
     install -m 0755 ${S}/adduser ${D}${sbindir}
-- 
1.9.1


