Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8DF76FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 11:52:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j37so5840571qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 04:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MtrN+33E6jkvbXz1/PgPRo+9a6tR5Sn1PA6xapuqRYU=;
	b=TMkeXIbVjOOLJgP67PIgAuEMlLhfIQf2Ww//U9jTIhcHSbIs5hjViByAOEJ3y18Ti6
	i7qDfLXI+K1+kjhv3qcDRnodJisgUPDnqBgYPCzsfvzQbttzAytBKSFTZkadLBbYDEt/
	zYKNg80Gc90gq3NwqPB9OFU9ZhXPPMvKBPyxqs0UsINAMMTeVKxwnXPMJj7r3EEi/Rmm
	p55spYrfl1T8SuP+/URTr/gTiETmsRBP1yWbibPWWvoGDBz+6T1rOtE9bBw3dJIBy1W1
	raCdS16GNU02kb9pBKgNGyew1HH3GUQ7j2Fxn83hJrsr2h6G0PyeDCso/0C+LuqjxG3w
	aUMg==
X-Gm-Message-State: ALyK8tJLuo7bGsS8OPd5LufIQVc7W9OncYVvGRsnkBoaO8FhWdw4Am53lJ2roullozwrCg==
X-Received: by 10.200.43.105 with SMTP id 38mr15987997qtv.73.1468756342916;
	Sun, 17 Jul 2016 04:52:22 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x20sm415502qtb.7.2016.07.17.04.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jul 2016 04:52:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jul 2016 07:52:01 -0400
Message-Id: <1468756321-27744-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468756321-27744-1-git-send-email-derek@asterius.io>
References: <1468756321-27744-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-flask: update RDEPENDS to include python-click
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
X-List-Received-Date: Sun, 17 Jul 2016 11:52:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index ee7f7c2..87d020e 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "b4713f2bfb9ebc2966b8a49903ae0d3984781d5c878591cf2f7b484d28
 
 PYPI_PACKAGE = "Flask"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous"
+RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
-- 
1.9.1


