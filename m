Return-Path: <menschel-d@posteo.de>
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47F7D7454E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 07:53:15 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1EC6821027
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 09:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1523778356; bh=vYa8EzGoj7lbHKG662l6di3/C57lY8aCqrZfTGEJPn4=;
	h=From:To:Cc:Subject:Date:From;
	b=mH3Bs5DlQab6kXrIcFRpxmkaDWL/5Pj8cvd6sgRydIpABzXOIe+fKQyyn6xVYqZsf
	immK6FdEqhqbgUjA0OSZ4A8w9si4+XJr7BpHFsl8Nw1cJgOaykFgcV/StcWBbcHSX2
	RJASkOs1DwUFniRQc2bmmUx8mhWBnLuch1gevqSPwQgDRMYonb3Aq6T5ZbBHflmEWs
	QvJeIUq0mXe4GpdJy1A2a6Qi8tGsW8klj8qhxuz5Pv/Vq6jWq/iN5KRb/m0KWkQyFs
	tTwKhDc1rojOc0J/1Bx5b/HXZEBZ5do1pTS3EqMbAyrCvd2t4ujPeZ/YOI0gzPbIVs
	zf7jM7fYuiWFQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 40P3Tv67Rzz9rxN;
	Sun, 15 Apr 2018 09:45:55 +0200 (CEST)
From: Dennis Menschel <menschel-d@posteo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 09:44:34 +0200
Message-Id: <20180415074434.2896-2-menschel-d@posteo.de>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180415074434.2896-1-menschel-d@posteo.de>
References: <20180415074434.2896-1-menschel-d@posteo.de>
Subject: [meta-qt5][PATCH 2/2] .gitattributes: mark *.inc as Bitbake files
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
X-List-Received-Date: Sun, 15 Apr 2018 07:53:16 -0000

As the file extension *.inc is quite ambiguous, Github's linguist [1]
tends to classify such files not as Bitbake include files, but something
entirely different.

This commit overrides the default behavior of linguist to classify these
files correctly.

[1] https://github.com/github/linguist

Signed-off-by: Dennis Menschel <menschel-d@posteo.de>
---
 .gitattributes | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .gitattributes

diff --git a/.gitattributes b/.gitattributes
new file mode 100644
index 0000000..cb2381c
--- /dev/null
+++ b/.gitattributes
@@ -0,0 +1,2 @@
+# linguist overrides
+recipes-*/**/*.inc linguist-language=BitBake
-- 
2.14.1


