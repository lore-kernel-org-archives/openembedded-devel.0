Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0D217734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 20:24:07 +0000 (UTC)
Received: by qgx61 with SMTP id 61so54274473qgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 13:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=RPZSd28yyphTed3D82WgipLhia3dnlQkQL4KPZk+94M=;
	b=OLSfbl1wtj4bQPvaEWYAJBG4fneu6RfRbl2+kSPdEiOz0DLQ2s+fX7FOiHxwZbzMh5
	6TCrtA/WJerOUcDCtP8ZEA324S7aYF+SMrfhFX1xmFjbV8s01U9meoAyDh6Nd3/yIyjE
	4ethyq8N5gG4/sRYqZpXOkZ+DSj52IXvqZ8p9tUkCF1BHIMKaDWQKsW8YqegmhQZ7wZY
	iVcW4WJmK+nmYfnMtMjN6f80xugon14UMx4w8Na1oirADyst3YO1Ndj9QXwQoYJCZDnk
	2sU83k2qyiZjIi4fcNJ9KmQ4677h8uol0baUqe8X+5gA5cnQW2e9KhlZKDP347id+4qr
	6ljA==
X-Received: by 10.140.146.3 with SMTP id 3mr2214679qhs.76.1443126247635;
	Thu, 24 Sep 2015 13:24:07 -0700 (PDT)
Received: from localhost ([177.194.195.186])
	by smtp.gmail.com with ESMTPSA id w78sm9573qge.42.2015.09.24.13.24.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 13:24:06 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 24 Sep 2015 17:23:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Sep 2015 17:23:53 -0300
Message-Id: <1443126233-5896-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] mariadb: Easy linkage of code using libmysqlclient_r
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 20:24:08 -0000

The libmysqlclient_r library is now a symbolic link for the
libmysqlclient one, however some code still requires it for
linking.

To easy the transition, when installing the libmysqlclient-dev we
should include the libmysqlclient-r-dev as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index cf004ad..47a16a1 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -169,6 +169,9 @@ RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-modu
     perl-module-constant perl-module-lib perl-module-file-temp perl-module-file-spec-functions \
     perl-module-io-socket-inet perl-module-io-select"
 
+# Allow old code to link to the backward compatible library
+RDEPENDS_libmysqlclient-dev = "libmysqlclient-r-dev"
+
 FILES_libmysqlclient = "\
     ${libdir}/libmysqlclient.so.* \
     ${sysconfdir}/my.cnf.d/client.cnf"
-- 
2.5.3


