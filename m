Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id CABD3609AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 07:54:24 +0000 (UTC)
Received: from localhost (213.114.64.43) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Tue, 24 Jun 2014
	09:54:23 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jun 2014 09:54:04 +0200
Message-ID: <cover.1403596416.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 0/1] webmin: Drop allarch
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
X-List-Received-Date: Tue, 24 Jun 2014 07:54:33 -0000
Content-Type: text/plain

webmin: Drop the allarch as the package gets rebuild when
changing MACHINE, due to it having an RDEPENDS on perl 
(TUNE_PKGARCH).

Reported by Martin Jansa.

The following changes since commit 4fcc5cc1cca20d7c772f7c8b1999ef15fd2dc260:

  python-cython: upgrade to 2.20.2 and fix packaging QA issue (2014-06-21 19:22:29 +0200)

are available in the git repository at:

  git://github.com/darander/meta-oe 1b5c27f39444bed435c8c050b2fb6def74a5adb8
  https://github.com/darander/meta-oe/tree/webmin-noallarch

Anders Darander (1):
  webmin: drop allarch

 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.0.0


