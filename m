Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7995E7CC8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:59 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id j3so7424427pgm.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=98/GOTlcNMegA/5v3KTHHNNCdZo7vHl4FBn/DlTo/gk=;
	b=kcXkFnOc/lhT4g80jIhInes4fSvWenLL9iGsy00+eo1djFMMfYmdXTlVI4B1qvDICU
	rKHPXxGbVKQnaXos+11+JGcGI0JIJWj8aX75JMFTo4X2QIwk48WvEyHZLBclHTgN/jOw
	NLiO6NZuDo4AwaomeKaqtIlcRSBshJIUXR0hIbbV5gGK2X3BW6FvDzeYWnnDh4ApmAK2
	QWMhvtYCeALfg7JhQduWcrGoCXOg1W9IjXJeQpjF3oVBGmP7q2gt6uDMPrqlgTI9qg8Q
	UXbEVDgI00XWuMxKLW7cAU7u5NDCJil8n+4d0d+r/nIy5bAo94XeD+P4JDYB3EUY3Oqc
	O98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=98/GOTlcNMegA/5v3KTHHNNCdZo7vHl4FBn/DlTo/gk=;
	b=GNaxql0ml7g2rFjGvEiG/Ct3hh9c4aQblFK7EphxJuVrPoa2Kv3BHWSs6bs5qXp6O/
	mXkjFFWtlz4e8CoXfyJEDE8G2wLnFGAvxolNQl1fIFTvsSP8ToJYzozLl3vA6wjkdwMr
	q/wGT5rq2TokXw0j7kuK12wvLbtZTtyULQ7UdAPs72mef5HPrv9FBVD9oFSJBEIkIXF/
	KlJBb+MwqRb6/K3YabchjKtkrcz4s6eANVt3Eblbp0QxZoPBpWPjTOfML46buEdoTdZn
	z6msHs9to4h8lV/hYVZA8nRCGS9VDVq+dDzgBPG+eECPCt+Q88gHokYNxnrk7qRkOlWO
	xs8Q==
X-Gm-Message-State: APjAAAWqI9m2zX8gf/BXOb1UHmhlj4e/8MX8Y2zqHxZ8jQutI7xNklQl
	9yeVpwq2ntUiAWhHhf4ub0s9+CHb
X-Google-Smtp-Source: APXvYqyozBu+7T5gRIpSq/7o5TFmzSQlp4jc7NkEq2iH0SfqaGtxyH+YhkXtrNmLzorNhXi1KaB0mQ==
X-Received: by 2002:a17:902:8e82:: with SMTP id
	bg2mr5163398plb.217.1551851160339; 
	Tue, 05 Mar 2019 21:46:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:44 -0800
Message-Id: <20190306054548.16430-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 08/12] netdata: Link with libpthread
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:59 -0000
Content-Transfer-Encoding: 8bit

Fixes
global_statistics.c:90: undefined reference to `__atomic_fetch_add_2'
| collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index b0f1602528..390fa4ba9b 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -27,6 +27,8 @@ DEPENDS += "zlib util-linux"
 
 inherit pkgconfig autotools useradd systemd
 
+LDFLAGS += "-pthread"
+
 #systemd
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "netdata.service"
-- 
2.21.0


