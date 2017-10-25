Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E32F071AD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:13:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b15so30381136qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dzGq3q3VRzPtz4+Huq3T+A10UTL7Xb/5JfvX8dCt0yQ=;
	b=ekPiom9KF2UJZzJV7Z7HnFclaA6rwf5DlQoLgt3M7no7sPJVKbAiwG8dA2Lxz6z/Jl
	N17aIyANcegctMlxYnLGra6SbqlvcuJZQmxLHHjlogVKBrOFpB9E+qAQXREO43nCjlPm
	E18QOumlNZT9WdLSdUTaZTmcp+uHDYoiO7tgK2VjFmrcYUurLvS8xbl+hnx/pPZpxLXX
	WYWtLAfI/QKuFzsPyyxSLwecHKQ8MrrbiDOgP5aywyPUbniMQ3cUloNKfDKMt9JMXeFz
	Xi7tIe6eouTOfx8Ef0so6YqkH4zak0MEHQhx7P6swQDxmjo7GaSAv1qx7cC3qZ6lT4ge
	sg0A==
X-Gm-Message-State: AMCzsaUEQ0/J/RnaJuh+K4v7AOIt3oOXjdg8OL9nuJNdjyBKDGliSSiL
	wy7Wz2Roco/LqjcA9R7+jIvigj1O
X-Google-Smtp-Source: ABhQp+QO6NTR3GfDpy1Z20tnx+0OsuNmly4z0NDLACW69rxenvu+HKAKAgoKei3JvOOMMUtlqKGTIg==
X-Received: by 10.55.76.85 with SMTP id z82mr2896581qka.183.1508937181667;
	Wed, 25 Oct 2017 06:13:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	c16sm1912846qtd.57.2017.10.25.06.13.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:13:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:12:54 -0400
Message-Id: <1508937175-31067-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-sqlalchemy: update to version 2.3.2
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
X-List-Received-Date: Wed, 25 Oct 2017 13:13:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hon-flask-sqlalchemy_2.3.0.bb => python-flask-sqlalchemy_2.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-sqlalchemy_2.3.0.bb => python-flask-sqlalchemy_2.3.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.0.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.0.bb
rename to meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
index 8799767..7650917 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
 
-SRC_URI[md5sum] = "c86449f44e90e996142872ac4b97f7ee"
-SRC_URI[sha256sum] = "da19ff62e31f82825b5467811c76e2a1c60bba927e175fe091a6f739063dd829"
+SRC_URI[md5sum] = "373ce61dfd03b593ad2eaba68c9fee35"
+SRC_URI[sha256sum] = "5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53"
 
 PYPI_PACKAGE = "Flask-SQLAlchemy"
 
-- 
2.7.4


