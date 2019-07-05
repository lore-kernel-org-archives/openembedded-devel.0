Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id BBC6C7ED69
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:12 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s49so7968631edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MALl+egEZmE29ydwTVWqNsaqgNitc1zmQBrvmRE2wEk=;
	b=dUrzKKIoP2bUPNNVoUrHeTmdqkC1Lt6NFXDQSSEgeIlD4Tj+6eXVIChWUaAw6AVKrD
	/Vcziw26Ji+FZzzWf72a03vukV4nLHeRVf+0axXwG0e5OnT19llJLCQID0RLHyVQlCas
	47mRpgQu3dEraK73bPJcCSrLHjP3L93k5duk/yBRIZNYSZfb+4BSxurb/CAz6mTXxpH7
	zQHmfdPn49gsXKeBhXtW0bL7cMrvEiVssyrpFevgeqmtr3uTjzi+B45fY4XKD8leigUG
	zF4MzQ1yr6Z+pJDxqywE7C4c4zd16jETEy/kYrTiWDQNzkHwTs8SAQLe5hpgUrlIkkxf
	YBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MALl+egEZmE29ydwTVWqNsaqgNitc1zmQBrvmRE2wEk=;
	b=SHscOyqg+evdvY2lpQfxV5/np6OdR+E4RIPGsauhaUQ/gesB3vldqhfmIu4eMd0MPu
	RYtCgS9IYDAt0r82ITeNOGTncbV7yvHJfX5+LMw/ePgIET/x5FvR+VC8GBP36rg5QUQ/
	xrXO9BmOWfy3yOQIX1yjAGLlxVK7inzacCZe+dBVBksnO3Va4ZRPNE2/Qg9UFDWm5QKe
	0ik/Ymj9nC69VLmFwhPVHN7RNqIq69wQP3EGS1CZ2sp/95DHSYn16HCZagVA/buP9eUh
	37yUKFCPHLVKcMz7q9XV0TGp8qlXVKfQr/9ktoKD5LqVWIJ2taa+H1XsqETD5ti11Yr3
	tICA==
X-Gm-Message-State: APjAAAUuDkX/KMqPcdJO/E8sF23nwSsdZsm6gEimCEOSlURVselpnFYN
	5qTZQsCLFb49hulGjOYDm4JcycFBDGQ=
X-Google-Smtp-Source: APXvYqzs78wQueg4uAP+Gndn+ndtqhQ1Xqy+4czTc9AgFV2F0dsB3/TlCRVpkC4Cffju4a3EOvYI7A==
X-Received: by 2002:a17:906:69c4:: with SMTP id g4mr3051106ejs.9.1562325553335;
	Fri, 05 Jul 2019 04:19:13 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:12 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:23 +0200
Message-Id: <20190705111824.22255-23-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 22/23] jdom: Do not use all as PACKAGE_ARCH
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:13 -0000
Content-Transfer-Encoding: 8bit

It DEPENDS on packages that are not -native.

Fixes:

ERROR: mc:qt5506:jdom-1.1.3-r0 do_package: Package already staged (/workdir/build/tmp/sstate-control/manifest-allarch-jdom.package)?!
ERROR: mc:qt5506:jdom-1.1.3-r0 do_package:
ERROR: mc:qt5506:jdom-1.1.3-r0 do_package: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/temp/log.do_package.5632

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/jdom_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/jdom_1.1.3.bb b/recipes-core/xml-commons/jdom_1.1.3.bb
index 8073819..df9125d 100644
--- a/recipes-core/xml-commons/jdom_1.1.3.bb
+++ b/recipes-core/xml-commons/jdom_1.1.3.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.jdom.org/dist/source/archive/jdom-${PV}.tar.gz"
 SRC_URI[md5sum] = "dc8391e84cfdb170fcd8279aa370019f"
 SRC_URI[sha256sum] = "d471718c4ac7a1a2f10715b93cb3fcd2ecbab60384b73ad1c089712e47bd8d1f"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 S = "${WORKDIR}/${PN}"
-- 
2.20.1


