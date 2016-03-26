Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 46C1971633
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:11 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id y89so8548373qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=umupO1tSwD5oJ9m/A7oXnunaZ5+sh/jmhk7Wjs6J8iA=;
	b=EuFI9o8eGzP7zZ9L/g3LhgRYEq9NZbBJ93bnZdie2hfuULyuHDk+3brb/9U4Njq3Mn
	9Vl1/MVnWsutsc7aT9OWFJz10W9EvlrSx9Ivlq5IZ61rPGcgVWRujhUh80xktM4+h84x
	dDhdcxVZxsJAbAKIMSwq5mh2AQDu5eyPnh0qrZ3oCRKl73qzKjQARMWkmKb3RSL4tliI
	NHxEbCaBTZ1j/W7C72KU6yjdQcI60P9a8ubyWEktxXlg+OoZH+zIC5OR8Va4u2cU7mgR
	QBxNJVYrqMyINMpfn6jAmrHaAjjpkw3R6WAdzyFcF+AQkUQBBkKjDH4gO32ElmOpwpuH
	TrXw==
X-Gm-Message-State: AD7BkJIizdl44HI+qOEJI70uDNt9mn6lW6hs6eAL51YB/NeZ6cx2eEl14yI+uIWHYOCAZQ==
X-Received: by 10.140.91.34 with SMTP id y31mr8063098qgd.84.1458997512110;
	Sat, 26 Mar 2016 06:05:12 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:25 -0400
Message-Id: <64fcf58cf9f203f26882d6adc764ea877ea03391.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 05/30] python-pymongo: update to 3.2.2
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.2.bb => python-pymongo_3.2.2.bb}         | 0
 .../python/{python3-pymongo_3.2.bb => python3-pymongo_3.2.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.2.bb => python-pymongo_3.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.2.bb => python3-pymongo_3.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 5cdd5bd..e0f52dd 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,5 +8,5 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-SRC_URI[md5sum] = "463b4d325d8fb4070c04f15391b457bf"
-SRC_URI[sha256sum] = "f50a5380b45a83c5ea1e673ff19363d3cfd5850f7620536e51341d26eb2ae979"
+SRC_URI[md5sum] = "70408f8115d7aa52fb6eef0e552834a6"
+SRC_URI[sha256sum] = "f2018165823b341d83d398165d1c625e5db5cc779e7c44c107034407808463b6"
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.2.bb b/meta-python/recipes-devtools/python/python-pymongo_3.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.2.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.2.2.bb
-- 
1.9.1


