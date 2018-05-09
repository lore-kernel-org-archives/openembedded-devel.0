Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 76A4974FB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:17:17 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id e20-v6so264259itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZZCxZ5x7TcI5G4buv7tePl6wfToCPo12fyM7hnxiABk=;
	b=I4j+FHUnPYPRmgcKWNJE5lR9b6HlVLnL7sRA2DHiWS7j6NhEg9G/OVhqwgsuiYkCun
	ao9gmsQNLkp0Dgg4v6hNZss7i/l5L8r9dvztiHyzJD9lClqMzDmiOCshm5PjgmWVeUOc
	SsLmmpkIUixO66cjG7mpE2cqhahkwhkJnJlCn7fI0bRwNYBioJ4Z5GejKYMFHCI7Gnmf
	DZewLrpba5STKyckRc8hutkhhxMJ2paaHaCLB/1/1MUXEF4pAWi3WB3MKpfyZCRn2fva
	yUgMXK1Y2Ww5Xb9USk5WnFcYG1+Rbb2Z/KmfKZ7O02hOqB8ZlObEaVtt+6MTfg0oVz56
	pWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZZCxZ5x7TcI5G4buv7tePl6wfToCPo12fyM7hnxiABk=;
	b=dN9EwOGQv7zGSqA2963AjEfFjVT0JRm+wFSpdIhGreEz2tF42oXN4eCLPZ8rjBw+Lg
	eMQ3uAWOHf11v9f1TPzsAH9gWumUhKfek8BBkN+udvFiej2XqoYJxWiCLsRvC3ORvqJ1
	O4PnMqa1TjD98cDTVCbXXqs7pF6vuVP3MgbDxrrEFCEJibueah282mTgxjVBo1sbEBJm
	6HO+C24+DpHqdSEWBo+wXoljv8UI7P6vFXf/o2wiZtzap1q6bfkQ3kqNE0qgOK1MGJ6D
	eCOK8yQelea3PCrXrv5sJ7ptJpsrG7joVoo9zcsygDK0N33Akjs5jm5vKRaQsSspqru4
	9xug==
X-Gm-Message-State: ALKqPwfF22m01tppD8v2Qkjbc2v7G6vlsuYniUUYB2IgRxcglQw1YlH8
	ESrDFNUwWXtKibSamE3HeeUAQaTW
X-Google-Smtp-Source: AB8JxZr7tDocwC86ec9bN/TNj4Dm062HVtECDXPwdCJckTYAwQ/9JAmXIYSCxG27KqqkOFOHkpsx8g==
X-Received: by 2002:a24:ac44:: with SMTP id
	m4-v6mr11796306iti.136.1525893438229; 
	Wed, 09 May 2018 12:17:18 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	g127-v6sm7276222ioa.79.2018.05.09.12.17.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 12:17:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 15:17:11 -0400
Message-Id: <20180509191711.5389-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180509191711.5389-1-twoerner@gmail.com>
References: <20180509191711.5389-1-twoerner@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] gst-instruments: update to latest
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
X-List-Received-Date: Wed, 09 May 2018 19:17:17 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../{gst-instruments_0.2.3.bb => gst-instruments_git.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/gst-instruments/{gst-instruments_0.2.3.bb => gst-instruments_git.bb} (90%)

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
similarity index 90%
rename from meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
rename to meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
index 07d0c55615..feffa9fe19 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 DEPENDS = "gstreamer1.0"
 
 S = "${WORKDIR}/git"
-SRCREV = "4ce8092636ee6572148b5fa044080734cf5a6b8d"
+SRCREV = "3b862e52e5c53ad1023dc6808effa4cb75572c4b"
 SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;"
 
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*a"
-- 
2.17.0.rc2.3.gc2a499e6c


