Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOwOD-0004j2-TN
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 22:08:21 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2297338wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=75bC6RMvTbx/pUkw1m60W+06oWJqULjZ/kqbKLlpMD4=;
	b=XDWDSauU4dYKMJLVbmTZeO9dh2zTZKo2qx9Wr2kpCerk310vPY83j9vlQJyuYOa/UU
	3VxP1pYa2TcwX9ibpSDczUkVngHmxakA3Tpo0c9uuU88GJbhr61QHRr9mDi6qPaOK9Wv
	tjnaFPqBIihGMRCL9PRIIoBps6RKiEYG1DrEpiXZCv4oo4Jcf9lgnLZObl8TzvGc1BYZ
	RoNgyM5rtfIkkOTx8O1AEHF+wjao8j4anNdiV3OdUf8VqUAH9bA6Ab7EYfNT3O/T8oZk
	jWaHZgC5O4SsU08dUJ2z4+QL2xCaRif97XC11hM0HX9zYISMY7ORmDe0IbvGSGFLAKXr
	darg==
Received: by 10.216.145.88 with SMTP id o66mr14012710wej.169.1350590104380;
	Thu, 18 Oct 2012 12:55:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm35442415wiy.11.2012.10.18.12.55.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:55:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 21:54:33 +0200
Message-Id: <06adf65bf49ad5e358ec6ac70880211741fe1d4b.1350589969.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] mcnavi: move from meta-oe to meta-efl
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
X-List-Received-Date: Thu, 18 Oct 2012 20:08:22 -0000

* mcnavi depends on ecore, but meta-oe does not depend on meta-efl
* thanks to kergoth for reporting this!

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 {meta-oe => meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb (100%)

diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
similarity index 100%
rename from meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
rename to meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
-- 
1.7.12.4



