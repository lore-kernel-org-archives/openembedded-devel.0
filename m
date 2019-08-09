Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0373B7F317
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 14:06:32 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r1so98328955wrl.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xhnMt8NcMp9y/mYcnx9vN+2UyktYFQt9EPskcKh05Sc=;
	b=APnfIrIInhLFwp5PtIRWvGWd1834WAC0Gmff8CNEDWSdE2orR3ujBQO36NjxrdjZrn
	cS9kI7Gvu4hOCZ83dUlGJ53GnlHY01MTdi7/+aVnzKGnDP47cDAa0PMoKNCYTwvimnFL
	7ufQgOeXqyc588MqSWrgfxpO8rZJVXwL0xjMOY1DBamvVziBcAVhovzXeJ1fe7z20h4A
	W95Vp6v/Z0k+TOSibVM4OeOV1TnReqOEH6qYsScGo3GJPOow5zwUWQk7wpan0727RodY
	3OMwbwlwhG27PpMIOIfko874lKEkjXKMEN35wNw5l42Fl9mejmf3AF7TtK5mYE5yF3aG
	GApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xhnMt8NcMp9y/mYcnx9vN+2UyktYFQt9EPskcKh05Sc=;
	b=bwUoX7+E8y8McPXSuOsKAGOypUbCqrWtmihaHs7gfXDVX5jJL6DrX1NFeFyYYcCgPB
	z9+TgTQcqMPPjUkqmaVJutbewCbfhLp3sJJrGEA2aK+QIsl6ePGHm1VTOKFGE7XE1Lmh
	qn4oABR2P19dYfffThgaQey2aQkYhiY7s6HOTA1r2Y5OloFXN2/LaAHRe9ycKy43y20W
	cj5kKQxvIE2tFC6tPHQzbRc+AtVVgoPrhCAEtWo+EG8cTVy57JJsgp0bBBhg8EiZtVKo
	u6dD/3W1c4cCO3BlkBOT5ibp4y6lgT5hHKnPHvoPEGT+A5cpuGMTIS0vR36wOKDElJSu
	nUMA==
X-Gm-Message-State: APjAAAXNmXrGberorH4SdeGoFTFIEmqXj5AAdVt9VQvMxLUiNJ8Tisku
	AoOwELF8f1EcQMUmRqOcgvKrvJWQg/YSdg==
X-Google-Smtp-Source: APXvYqxskchlIEboL3ThtQ4Wt0F+wBV+6k2OGLY4c6CptiFHgHi3E0R46hlt3vvk8ShAyidx3vUivA==
X-Received: by 2002:adf:edc9:: with SMTP id v9mr15977683wro.125.1565359593492; 
	Fri, 09 Aug 2019 07:06:33 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w13sm19226141wre.44.2019.08.09.07.06.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 07:06:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2019 16:06:26 +0200
Message-Id: <20190809140626.64555-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-panads: remove the python 2.x version of the recipe
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
X-List-Received-Date: Fri, 09 Aug 2019 14:06:33 -0000

As it depends on pathon 2.x Numpy which has been removed from oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb | 2 +-
 .../recipes-devtools/python/python-pandas_0.23.4.bb        | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pandas_0.23.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e037abf53..42f416346 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -40,7 +40,7 @@ RDEPENDS_packagegroup-meta-python = "\
     python-sh python-greenlet python-paho-mqtt python-traceback2 python-gdata python-dbusmock \
     python-whoosh python-lockfile python-isort python-wtforms python-feedparser python-flask-restful \
     python-pysnmp python-flask-babel python-pytest-tempdir python-flask-nav python-pyzmq python-pyyaml \
-    python-protobuf python-pluggy python-jsonschema python-msgpack python-pandas \
+    python-protobuf python-pluggy python-jsonschema python-msgpack \
     python-periphery python-pint python-pycryptodome python-yappi python-pycrypto python-pretend \
     python-pyserial python-pyiface python-docutils python-grpcio-tools python-django-south \
     python-backports-functools-lru-cache python-py python-click python-flask-migrate \
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb b/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
deleted file mode 100644
index b3bfab969..000000000
--- a/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit setuptools
-require python-pandas.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-future \
-    ${PYTHON_PN}-json \
-"
-- 
2.17.1


