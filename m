Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 743DB7D38A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 01:00:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3910MQt000231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Apr 2019 18:00:23 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 8 Apr 2019 18:00:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2019 09:00:19 +0800
Message-ID: <1554771619-6761-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH] python-flask-socketio: move to meta-python directory
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
X-List-Received-Date: Tue, 09 Apr 2019 01:00:22 -0000
Content-Type: text/plain

The previous commits put the python-engineio, python-socketio and
python-flask-socketio to a wrong directory. Move them to meta-python.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 {meta-demo => meta-python}/recipes-devtools/python/python-engineio.inc    | 0
 .../recipes-devtools/python/python-engineio_3.5.0.bb                      | 0
 .../recipes-devtools/python/python-flask-socketio.inc                     | 0
 .../recipes-devtools/python/python-flask-socketio_3.3.2.bb                | 0
 {meta-demo => meta-python}/recipes-devtools/python/python-socketio.inc    | 0
 .../recipes-devtools/python/python-socketio_4.0.0.bb                      | 0
 .../recipes-devtools/python/python3-engineio_3.5.0.bb                     | 0
 .../recipes-devtools/python/python3-flask-socketio_3.3.2.bb               | 0
 .../recipes-devtools/python/python3-socketio_4.0.0.bb                     | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-demo => meta-python}/recipes-devtools/python/python-engineio.inc (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python-engineio_3.5.0.bb (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python-flask-socketio.inc (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python-flask-socketio_3.3.2.bb (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python-socketio.inc (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python-socketio_4.0.0.bb (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python3-engineio_3.5.0.bb (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python3-flask-socketio_3.3.2.bb (100%)
 rename {meta-demo => meta-python}/recipes-devtools/python/python3-socketio_4.0.0.bb (100%)

diff --git a/meta-demo/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
similarity index 100%
rename from meta-demo/recipes-devtools/python/python-engineio.inc
rename to meta-python/recipes-devtools/python/python-engineio.inc
diff --git a/meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python-engineio_3.5.0.bb
similarity index 100%
rename from meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb
rename to meta-python/recipes-devtools/python/python-engineio_3.5.0.bb
diff --git a/meta-demo/recipes-devtools/python/python-flask-socketio.inc b/meta-python/recipes-devtools/python/python-flask-socketio.inc
similarity index 100%
rename from meta-demo/recipes-devtools/python/python-flask-socketio.inc
rename to meta-python/recipes-devtools/python/python-flask-socketio.inc
diff --git a/meta-demo/recipes-devtools/python/python-flask-socketio_3.3.2.bb b/meta-python/recipes-devtools/python/python-flask-socketio_3.3.2.bb
similarity index 100%
rename from meta-demo/recipes-devtools/python/python-flask-socketio_3.3.2.bb
rename to meta-python/recipes-devtools/python/python-flask-socketio_3.3.2.bb
diff --git a/meta-demo/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
similarity index 100%
rename from meta-demo/recipes-devtools/python/python-socketio.inc
rename to meta-python/recipes-devtools/python/python-socketio.inc
diff --git a/meta-demo/recipes-devtools/python/python-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python-socketio_4.0.0.bb
similarity index 100%
rename from meta-demo/recipes-devtools/python/python-socketio_4.0.0.bb
rename to meta-python/recipes-devtools/python/python-socketio_4.0.0.bb
diff --git a/meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb
similarity index 100%
rename from meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb
diff --git a/meta-demo/recipes-devtools/python/python3-flask-socketio_3.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_3.3.2.bb
similarity index 100%
rename from meta-demo/recipes-devtools/python/python3-flask-socketio_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_3.3.2.bb
diff --git a/meta-demo/recipes-devtools/python/python3-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb
similarity index 100%
rename from meta-demo/recipes-devtools/python/python3-socketio_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb
-- 
2.7.4


