Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2162F77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:00:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j20so163588pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GY3RqE7FQoaZQMG581fw0H0E6zZzV5Vp/O2BHHR+C8o=;
	b=IYG2wQzBqFzgIeBy/HURyQJW+EqVmW00EUUXKMskPTJQEwNBjvkHWkBJvxVr3OdcuY
	+E4hrc/uUWWbinQqfFb+ww6zQBd3Dk8Nq3a4rTRw4AM4ygqe/pkXN+nq4pWgfZRzbWdj
	oHt2jWw4iajQzgnjAqOLW8gGrb+yCyUiLgljB77pfbqXvj1pOe3vRp+0hz74wVfvJwSJ
	9arqSk5BatV8SEiRJWOPBwIylQ+NLwpj5Jaqmf26wcsDuC5JWce8H26OiGx7iGTdAolZ
	CmHnyx4IYGVbmNPuuojI9GzFfIYDG3ID4qkr99UgA3p+UqVqsaS6Be26XK5jv+TDLI6Z
	eq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GY3RqE7FQoaZQMG581fw0H0E6zZzV5Vp/O2BHHR+C8o=;
	b=gyc87KZBIYty03pxrb/A5sKhe+bxRqqkDDOCMr6U+BxsC5mAsDmqk4HmNL9TCVfc//
	hnVuAVFDpbjvxeza5L/ACriRn5RO5D83KZy5sXdT8g0v/LSEimLqdhAj/T3hlem2Dw6X
	/AKYvZEybgle+zV7Akz5pDbnhNio1/RA00EgtKdltmFMV0/yFaQboUdSaNP4Cx/MGeF2
	ZkjKWiIEuIJeMvAXWX97aNiTRERqeEysRn67okFlJhtkqAuXtTG1FABKO4UDy5XVJ5eI
	89KtqXY8zVOT1IKNY+Ko4lBJAkWwhutBBp9Xl7IlbzAiM/C9Ahu4YDMuKLcFQ8OYTsTw
	SCTw==
X-Gm-Message-State: AElRT7EzHJmSlABUUByzTvx75eBL8733WqHRsby6agBwmHingn7rmnQk
	4cQ7Dg1bD1DzWu4Ryvc9DFhgrw==
X-Google-Smtp-Source: AG47ELv4aX5PfJSWae3wZ1ZX0TEwkKwg0dIZory36DovDl4mZuwQFYD41ZfQlXoVvq1CbnJlB1Cc0A==
X-Received: by 10.99.126.72 with SMTP id o8mr10953488pgn.256.1521518413042;
	Mon, 19 Mar 2018 21:00:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m9sm927862pff.143.2018.03.19.21.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:00:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 20:59:57 -0700
Message-Id: <20180320040000.29408-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320040000.29408-1-raj.khem@gmail.com>
References: <20180320040000.29408-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] krb5: Correctly specify configure option --with-crypto-impl
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
X-List-Received-Date: Tue, 20 Mar 2018 04:00:12 -0000

Fixes
QA Issue: krb5: configure was passed unrecognised options: --with-pkinit-crypto-impl [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index 267a40ced..8be2b6a6a 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -40,7 +40,7 @@ S = "${WORKDIR}/${BP}/src"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
+PACKAGECONFIG[openssl] = "--with-crypto-impl=openssl,,openssl"
 PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
2.16.2


