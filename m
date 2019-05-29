Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEF77E271
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:25:35 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 33so1008453pgv.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GecbiCYxJgYiQmqj/IF7WUkjDgbPZeCr/Kq8CGMh098=;
	b=QFFDRmnJt6kjhA0hJjr1TvPGYPLJNaSk4V3CxXiQ3Rgckslml5WKcR5PgQ+hK61f6y
	qP0zbvVCm1QLRLrozmbXbV8DMmKsTfT1BYASdgpQr3S/ZJiZfjFmoiZCeOc2LqVHjZUZ
	4O+C/z8nuSt57SJPjGwUdK49o8xBuLX7iohX5f6r5+SWAsY2NTZivlQSmFGQTWlTwqXp
	SP96N3wRrtZ5zdq/HIE7IUgWRP0++1FLyfZR2woXDguEKjI0y1ikFcwYlLSz6iHZNy2O
	y8m+a4VjZLGDFWOSuW61rVBCVUVgdPG4UsROh4gGGS6V2a7iMdXNXIjULq3e7waaazue
	tP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GecbiCYxJgYiQmqj/IF7WUkjDgbPZeCr/Kq8CGMh098=;
	b=D734wHuIX596ip0Zdl2lDHKN1PWfvUdzIaAb0LZAYfVPmdhX2Jhky1bh5mWPvC32Y2
	DSd1irSSaN47BGXGWOqavsffl0Yw1H3DGO6gcDqLOLShv2mkcXbgUD6yJMEnt32XoMX2
	48ZgawQqbltK2JD7jNpOtVbEdLRD6rzRU89ZiapsKGDl0kFcmto7v2UirkS2lXKq38l2
	qRJugFmgNeYxk2WXhyIaoDo+KF832lUuZYiOZ6VS/jHZE+A7kWiQLj3R8Mz1mqfgVbLm
	2v+UUSLv8qR59HSrkID9Tr+T3uNoH1jJ+zBBx/mKKe69zpnp5rpe5bGbbnYnQV59GpAe
	R5fA==
X-Gm-Message-State: APjAAAVyPyTXxNRQqnp5tq3iWA6Zi9CJqeuzUIZmGQcuSZlsFwezUyuE
	pS/WHbgdgZdTTwF8kfRhk80lKURss31crA==
X-Google-Smtp-Source: APXvYqze3bQHoNMYJYW//bH5kxTvTM3zRKJrv4UDaOvrJf9zckwAdCe2fepUnoP3Nll6DPOxZKb3Bg==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr39164185pgk.219.1559121935904;
	Wed, 29 May 2019 02:25:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	h123sm18896231pfe.80.2019.05.29.02.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 02:25:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2019 02:25:25 -0700
Message-Id: <20190529092528.23660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 1/4] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 29 May 2019 09:25:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Upcoming 60.2.3 mozjs (meta-oe) requires python(2)-six-native for its
configuration. Currently python(2)-six lives in meta-python and it could be
moved to mozjs's home meta-oe but that would be just further clutter.

Once applied here patch to meta-python will be send.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v2: No change

 meta-oe/recipes-devtools/python/python-six_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-six_1.12.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-six_1.12.0.bb b/meta-oe/recipes-devtools/python/python-six_1.12.0.bb
new file mode 100644
index 0000000000..af26e83d60
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-six_1.12.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require recipes-devtools/python/python-six.inc
-- 
2.21.0


