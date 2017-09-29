Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA9C6612D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:54:52 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o3so746286qte.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 11:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SiJO6ttcmpDap4Z2QV1N9cYf/J7u4LXcnP/jChiPOoc=;
	b=HlLSO3A4QU6U9OSYE1vExG/SO32eGNDVqvXZ3lKQLuJIPbW7PPI7oKDGaJRQeuRjnz
	ArsvJmQrJaFQo7VvqK9bFDS7fcoyq0IvA1mS5z8KSyAgsoWPVPM01sOycUugxJcRt8yR
	dwoLVLvmRyGKfMOO2/x3NVfMbXodzgRaaqxUsBelYEdFZFrAZhi1jkG/po9cWViSOyNf
	b1sUenbJLarqCr2kqYrkdfyQXg6JOxXIWv3FLwwLB6S4Ou3lpnqqjmGkopAz61ZP74I2
	RpWlXytNlRA8dLK0mYdpx7DXPz9F7ZxUDD06NNVDjZ5YieIr9FSrqtEILMwfgijRKEyF
	1ezQ==
X-Gm-Message-State: AMCzsaVla2KFLRu4KByW3WWJUHpOZCAcH2CdIIje+Z7KYJv3Ur+ihFJM
	ubOmwuhTVdmVfBqalTlG0cfAzRH8
X-Google-Smtp-Source: AOwi7QBfP2JdgMDuoqQuyk0sjpPH20Ob5EfQ2+0IWi8M+kZAqFJ6mWPCwZ1r9ylUHC7ndx+Al7wcLw==
X-Received: by 10.200.48.185 with SMTP id v54mr7363605qta.245.1506711293435;
	Fri, 29 Sep 2017 11:54:53 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f34sm3072812qtb.40.2017.09.29.11.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 11:54:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Sep 2017 14:54:46 -0400
Message-Id: <1506711286-24000-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] meta-perl: update layer.conf to include openembedded-layer
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
X-List-Received-Date: Fri, 29 Sep 2017 18:54:53 -0000

Several recipes require items that are in the openembedded layer

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-perl/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 0485ac8..a861c3e 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -13,4 +13,4 @@ BBFILE_PRIORITY_perl-layer = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_perl-layer = "1"
 
-LAYERDEPENDS_perl-layer = "core"
+LAYERDEPENDS_perl-layer = "core openembedded-layer"
-- 
2.7.4


