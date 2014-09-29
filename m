Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 0E69271692
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 13:16:28 +0000 (UTC)
Received: from localhost (213.114.64.43) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.279.1; Mon, 29 Sep 2014
	15:10:50 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 15:10:23 +0200
Message-ID: <cover.1411996185.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe] [PATCH 0/1] Make it possible to use breakpad in an SDK
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
X-List-Received-Date: Mon, 29 Sep 2014 13:16:29 -0000
Content-Type: text/plain


When building an SDK (using <image> -c populate_sdk), for an image
where an application depends on breakpad, we need to add the static
library, libbreakpad_client.a, to the SDK. Thus, we need to make sure
that it gets installed and packaged to breakpad-staticdev.

The following changes since commit 0d01e1b72333f49c29d1a27ad844c4cd9f90341c:

  smartmontools: add systemd service file (2014-09-26 05:42:54 +0200)

are available in the git repository at:

  git://github.com/darander/meta-openembedded c3982a9e7a7182cfb3f0147477202f0c7b15858a
  https://github.com/darander/meta-openembedded/tree/breakpad-sdk

Anders Darander (1):
  breakpad: install static library

 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.1.1


