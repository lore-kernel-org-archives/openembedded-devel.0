Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id A569C7E068
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 14:08:50 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m20so5228846lji.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A/WZePOYa4Gjty1Uy2sJx152PzuzOcyXdQK6ypVquu0=;
	b=2RyaNGFSsLVHRmMarXCkWfLv+RPso/qofO2htbLbfV49DV0qBjaS2ubGov2WaUUi32
	rozaRCtbwmOm01KvGWZ8CDp8nlwRyXWiY422fg60JC0Wb/ZIG+noerAjfRZ3UqkFJxLQ
	4jpMuBNMq5iBT+EcuiSIfJqvbf0rlLC1rvEK+YVZ6A69gzFOCaZx/gsYsrADhe85AlrH
	iiNT+UehkXWzrT14b3TBulkii9lUf7mxc52JhHLGn0Lq4O4XTv0cDk0c+QBfPJU9cUCe
	6s2K06UmzH5UJ9HViCRDlp6MBlZrfN3V2b67ATzIRyE/EI7FpzpxKnU45RDj1CWAqk0q
	v7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A/WZePOYa4Gjty1Uy2sJx152PzuzOcyXdQK6ypVquu0=;
	b=avo1Xqj4cqYm2StD8NlhqhbuCA6GKdd79m6GJ5mweF4WQUx1dGCrJDUl8tg26wTLUe
	ArW3bTwe7KRnFKFckZtucbNMLtVaWdFolMN+HaU3iUEWv1N59exhknr77iS50Ltv015D
	Y1YrmJF1bg7MNAn/3eXtWM11BKqUfdltswU/w3fJrqe6QciTDweE6l/kVM4TSHtkWG0n
	2hdT6kUmHU+yc2inLVF6VknrNuRkrXhJBWpoNFcZzc4QtUdgfiwQiF+cZRT2lCn/AcVF
	f5WXqce8YF4l7CAqu5US5kMY1BbQcIj+NjHJl/avf421jJiBweg8UGTrGhGL+mgU2x5d
	0hUA==
X-Gm-Message-State: APjAAAVsM8cvhYOP41t8OCouCcra0yvh+OFxQIdk177migznU8t4DhBb
	RMBdxzgAOAOAuuIfIqodxHuBwrCJa3s=
X-Google-Smtp-Source: APXvYqyVl4q4dM4ulm1b/LvKdsPBku5nI8inL+iAX2isrx1Sok3o5Lo3RrjQ2YoWTUsl15bncTIjMA==
X-Received: by 2002:a2e:92ce:: with SMTP id k14mr6064920ljh.83.1557497330704; 
	Fri, 10 May 2019 07:08:50 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n1sm1383640ljg.84.2019.05.10.07.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 07:08:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 16:08:42 +0200
Message-Id: <20190510140842.17978-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510140842.17978-1-open.source@oleksandr-kravchuk.com>
References: <20190510140842.17978-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking 2/2] conntrack-tools: update to 1.4.5
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
X-List-Received-Date: Fri, 10 May 2019 14:08:50 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{conntrack-tools_1.4.4.bb => conntrack-tools_1.4.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.4.bb => conntrack-tools_1.4.5.bb} (91%)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
similarity index 91%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
index 46168b0ba..51e0ec1a6 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-too
     file://conntrack-failover \
     file://init \
 "
-SRC_URI[tar.md5sum] = "acd9e0b27cf16ae3092ba900e4d7560e"
-SRC_URI[tar.sha256sum] = "b7caf4fcc4c03575df57d25e5216584d597fd916c891f191dac616ce68bdba6c"
+SRC_URI[tar.md5sum] = "9356a0cd4df81a597ac26d87ccfebac4"
+SRC_URI[tar.sha256sum] = "36c6d99c7684851d4d72e75bd07ff3f0ff1baaf4b6f069eb7244990cd1a9a462"
 
 inherit autotools update-rc.d pkgconfig
 
-- 
2.17.1


