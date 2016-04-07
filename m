Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 54A7D76FFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 02:48:55 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id o63so9537764ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 19:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U+kVJgMNBApVCRCoQc4M3HdgebJ8/bJUthVlDwXYksw=;
	b=lJH8ggM/yIHM/Hp1GoKYffdOXQZTgZtnICVdh5uqa+4ZCU0kk87mvL+sbsXxPeo1Nn
	KzZ6KjLgML2IvzdiM8+2nVJgDnsucHOCBRXqNpIYi2B3UTOWK4Tru6wIuabA6OeKwZXl
	qsZSi2FAl9RjTWVZtqCY3dVKXFj0kAeAOKpx+pRA8EWvNdrE951RAl7SEh/w9ZBEe5Nf
	r3RZMGINZYpPpcGdJJr4JcFXq94t8MNFoX/s+gzLjJZwW6un0AgMmx19zUNMawiBElkn
	rqBWByAtpVClxu5r/QGKlVbo2dIGk6LY25Cr9L/SFYB/J6ar7lUmIesTLhK2JlqdSJcc
	78EQ==
X-Gm-Message-State: AD7BkJKbOH5AGFo0dllZHd/hde6iTdmNsDNvmtl8AfViC15b4pbMULweLtaegzb5QKf12Q==
X-Received: by 10.37.2.131 with SMTP id 125mr322551ybc.115.1459997336012;
	Wed, 06 Apr 2016 19:48:56 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:19 -0400
Message-Id: <1459997302-25271-8-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 08/11] libencode-perl: update to 2.83
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
X-List-Received-Date: Thu, 07 Apr 2016 02:48:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libencode/{libencode-perl_2.76.bb => libencode-perl_2.83.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_2.76.bb => libencode-perl_2.83.bb} (89%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb b/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
similarity index 89%
rename from meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
index 9939962..ee8c67d 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
@@ -7,11 +7,11 @@ AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
 HOMEPAGE = "https://metacpan.org/release/Encode"
 SECTION = "lib"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://META.json;md5=bb6a09a95259f80fbf2855c8f9dc3e85"
+LIC_FILES_CHKSUM = "file://META.json;md5=fdbebc82e925d8acbce42cfad131c4d1"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "90ee2160d40ade6cc4c4aa1b1ff4745e"
-SRC_URI[sha256sum] = "0fa01359d34d1d129e9bcacb0b9bb821e36e9fb5f1404cfb557dfa680368f265"
+SRC_URI[md5sum] = "0d3f59e8ea704497647eded665919053"
+SRC_URI[sha256sum] = "5d3a90e30aabe78dfcf5e816ffb1da1e33475892dbd0075320315cdce5682988"
 
 S = "${WORKDIR}/Encode-${PV}"
 
-- 
1.9.1


