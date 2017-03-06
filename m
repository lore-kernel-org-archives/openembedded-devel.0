Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8A49774DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:54:44 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o135so4573416qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Il1QhcWIytFxnfrq+0hcHAuzBGm4wILbkH1Rb9+H/tw=;
	b=Wkhltlo0/IEbCmoU6XMG9bMUu4b+m+IqdNyqvaeQo79X8L/MvhA8A+6oXkDlto7eiH
	4dfyNqPZNSiz1oTOrgpzMB9TweXvTT9h9EJAfSTHAZB0SHEejLihbcYr5Em8Ct7IpxRX
	seEEEJYjS+u6rClBZiM8Crk7ptwSWYRQOyUuu6NanZrd7Mr86AJtchXjfs6D3REUJC0G
	kewlRd2Wb7WXpDdsl6GLRwK7To8aXCoT3z6Zs05yTYufvXKc38zE2AHUvBgk7QPEZowY
	57Gg0XrbAjRSfNG3LXhzSTa3j2kBVfX3ymq91d4gBduc2HYn0gCpsSOTlwqYg6tckErf
	4FOA==
X-Gm-Message-State: AMke39nL4lSw2WnZ+xlcmiRdNcCjUxbRRfn/Akyfy+shujIlWMgU/q9dsur2MuID6U2thA==
X-Received: by 10.200.0.25 with SMTP id a25mr3243330qtg.199.1488815685724;
	Mon, 06 Mar 2017 07:54:45 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d189sm3356243qka.12.2017.03.06.07.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:54:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:54:33 -0500
Message-Id: <1488815674-23600-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488815674-23600-1-git-send-email-derek@asterius.io>
References: <1488815674-23600-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python-flask: set clean as broken
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
X-List-Received-Date: Mon, 06 Mar 2017 15:54:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index fe8d388..04935a6 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19866b76b054ab30c270c0eb9d7e43d7"
 SRC_URI[md5sum] = "c1d30f51cff4a38f9454b23328a15c5a"
 SRC_URI[sha256sum] = "93e803cdbe326a61ebd5c5d353959397c85f829bec610d59cb635c9f97d7ca8b"
 
+CLEANBROKEN = "1"
+
 PYPI_PACKAGE = "Flask"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
-- 
2.7.4


