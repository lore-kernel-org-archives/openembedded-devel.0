Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 516F66FFE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 03:01:06 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so9517424ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 20:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NBh8+UcujA9Y0F7ao1ESzGiD4h8c1lmXGTM2Lbz0K6c=;
	b=daAf90Xo4+8RkcInH4ypDOxU84bwNjhscSb34Zavo+j01uFZwSsTSbMpRMvsmrpgYR
	NLsw7nF1E4y9B3/ZXhRjhzzONZWa80iu8yGNAQ9GWg6wLvmPKTpY9L7g3pwA5SeOCyAb
	YFsTWu7gKPCiJAtLpZRSkoDVeeoOptSz/8IDd65GrIdqx3EFb6TLdyopiDRV1pyVYeZm
	BmTojyUUu+uFNcdSa9AIk5sydBZl9vLyoWuj4Y5BPLyD1wJTdbR5Mzks9UokPYWxeyn5
	6asumLcdOvk7mEMD9B7GI9qIQYI7xUDLk9SXRcpjyUbpEFTLj2dCo3PC5Zy/fmP7dy8M
	Y5aA==
X-Gm-Message-State: AD7BkJIY20pcW2jQhXyM70jDk+MikQ7lTEvNYsbJNi8J7/pi+9KbKnwK7WhMC0FWrwtr7w==
X-Received: by 10.13.243.5 with SMTP id c5mr308511ywf.40.1459997330652;
	Wed, 06 Apr 2016 19:48:50 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:13 -0400
Message-Id: <1459997302-25271-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 02/11] libcapture-tiny-perl: update to 0.36
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
X-List-Received-Date: Thu, 07 Apr 2016 03:01:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libcapture-tiny-perl_0.30.bb => libcapture-tiny-perl_0.36.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcapture/{libcapture-tiny-perl_0.30.bb => libcapture-tiny-perl_0.36.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.30.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.36.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.30.bb
rename to meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.36.bb
index 3a3f843..e77dd77 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.30.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.36.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
 SRCNAME = "Capture-Tiny"
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "7b0fbdbf4199724df1e53fe0b3e2ef4c"
-SRC_URI[sha256sum] = "a3b4e55278757e77d50df0b1a79f42e6e8354b7d41db806da39bf161bee63aea"
+SRC_URI[md5sum] = "db6444111c30ac01a76a4c118241c7b6"
+SRC_URI[sha256sum] = "ab8742e53ad204a421bc82d5813f3c4c85c76581ea10d910d0aefc161f8cb03d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


