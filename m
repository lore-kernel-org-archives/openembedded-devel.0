Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA78E606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:07:58 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n202so3510576qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 14:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2gWAlbSBI05OT5HS9PWrU1pwAOJk2coD50v7XZU9Jho=;
	b=eqzYlHCvcB7+wBJM5Y14DDRvce8dehRcQqVHwwxapYkvMtnbIakxx/HLh0FKmrQL20
	mKN3wESfR0Q90qKAOWg4WWzv/3b/eJRd47+m0TzUZDN0rcjcR/QBf3LPZ3A6ko83mSr7
	BtQah2s6pY3nBlA4WTLE7b7tbyxiGFK/QGRiVdp3B9ZM++cvACsC/kztDzH1inXQlSFK
	QlurtR0dmwSq0LFu+Jr9TMxn9vtC607awQ5patLihh5DI+2qTM/uCRpQUcyDkOPgoF3T
	KRBYGWW3R2w/HRITDLTQnOu1sRkZ2Zohn12h7VEgou6BFXqB1MoQc65piWnS0BAxWtaL
	EIJA==
X-Gm-Message-State: AEkoouuWKbUPhOCjmBi9GELRwEeiUYdERW2hjm/1gXYVd+KwZXZHJVcpbHqS8Cf1Uy9nrw==
X-Received: by 10.55.179.129 with SMTP id c123mr40929465qkf.50.1469653678922; 
	Wed, 27 Jul 2016 14:07:58 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(mobile-166-137-178-128.mycingular.net. [166.137.178.128])
	by smtp.gmail.com with ESMTPSA id z64sm5367239qkb.3.2016.07.27.14.07.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 14:07:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:07:45 -0400
Message-Id: <1469653666-11180-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] libssh2: Add native to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 27 Jul 2016 21:07:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
index c43164e..ad0f677 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
@@ -22,3 +22,5 @@ EXTRA_OECONF += "\
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl --with-libssl-prefix=${STAGING_LIBDIR},--without-openssl,openssl"
 PACKAGECONFIG[gcrypt] = "--with-libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR},--without-libgcrypt,libgcrypt"
+
+BBCLASSEXTEND += "native"
-- 
1.9.1


