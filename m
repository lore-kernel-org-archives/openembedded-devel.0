Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC6070101
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 16:57:12 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o77so141084qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 09:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eKurYw3LIUvavHkpwFyzSinNxyhXTm80LWg0j7MfmoQ=;
	b=gdtcu3njm/Lo5zPQeulNcyk5vAwdTXd6pGpWL/8dRIfZzaNnZGNWuJlSHpUrzmF1ho
	RIkfTDC/Fg39vdSGUM6wnQ37hTzi3GEAWmKVOUF5CR3ayI7nfmki6G5j/BZNhMvPB0Q7
	X87T/aez4pIMLkzuL1RLl6AXGyXC5VpMH98iBFL1xfAY/tZlomr3owlicNGn1lXNUsNV
	YjT9fczfuH8z9P+zYu/EGFiPoN8Cq5eck0JqvTIjtzgwraL9MN7LyJhj55quuFXKfXVV
	4C1dIGzwYlYiLJ9q6UlJn0qRR/z0CjH/TCply9RpGPTz7JUwL5pkNGlgIlzL7WaYixxW
	/1SA==
X-Gm-Message-State: AMCzsaWVurts4oXAStWzdgm8MUePRjAdfbvkY5mQKSh7P4e/kvGyJ6UM
	PcjhUCamAXgPXCxq970TQTkBD72r
X-Google-Smtp-Source: AOwi7QCJHsNa00iMr4hw0r2xkCbZ2/7tzH3/PBl//zC0srdBHy/fNgk7NgyUC2fNGRSUK0rI0AFCKw==
X-Received: by 10.55.20.72 with SMTP id e69mr3505152qkh.194.1506704233949;
	Fri, 29 Sep 2017 09:57:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	x62sm2970089qkg.39.2017.09.29.09.57.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 09:57:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Sep 2017 12:56:44 -0400
Message-Id: <1506704204-30673-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] meta-webserver: update the layer.conf to include the openembedded-layer
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
X-List-Received-Date: Fri, 29 Sep 2017 16:57:14 -0000

The cherokee recipe requires mysql5 provided by the openembedded layer

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index bb508a8..84fdd81 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -15,7 +15,7 @@ BBFILE_PRIORITY_webserver = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_webserver = "1"
 
-LAYERDEPENDS_webserver = "core"
+LAYERDEPENDS_webserver = "core openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.7.4


