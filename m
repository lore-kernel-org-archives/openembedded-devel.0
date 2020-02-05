Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7FE60CAD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 14:41:49 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id z7so1060166pgk.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 06:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tNiOb4Jl+opuL3wvtPJ4AEdk0TxGirJ6nFzHfFUy+64=;
	b=OcFiHWXffCNHk0tU6LNPZjlGGSUY9YEpY3KRSRppm8q9H6l+RvpWieNSbFjaHqQs4W
	3nPzNGHrvRIt386ms8paQ3MVXjJfszoT984eBh948pYTirK8oC4j+U6J0DJVjzCWKI8/
	5K5qBdJ4mpagj7JyDWal+8tMT6Ff/vN2OaiBnflRz+lUOzdlv3C+s+1c++pOijGolmLV
	YZbR8IB6Ht+9Cp7iF4NuuP0beOXbnEYd2t34jTZb4L5e0r5IemRcefIB34wweV3ErIo9
	awCuB1n7jn8DNE2wl2N1pkf1IqUvtfG3Ue37KZWhnEauLeE865AEYPIpwAMD0w78WYlq
	8OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tNiOb4Jl+opuL3wvtPJ4AEdk0TxGirJ6nFzHfFUy+64=;
	b=CyntFJlhv2bvGR0lNAHWlkPXuVldHeIWOqc1n0kMptLgo5zh0n+biWOCARJDbHDr2c
	XQlqP5IePHT528SybqQaT9+qfL2a6WMkPPRGIbtsA/6QBxoZmmM5yx96zpBi8nN75m+/
	MX6PhoNvw2gPlDZt44ym380PZycOkZpzMoQWZwQgL139gneDJBjqNQJIELflQLQeB7h1
	OqmF2eXWBXBi/Bz8Pjwcgq6bjx/kfCNpwn4TX4tNfMox5w/dotoio3wWOaQSCHdMcAl2
	m0y7PBuMGM/C/ZncKKqXwnEP96gmCdG+Ybf9C865M1XwtcGanxhoUhhcFqNmIchI9HR/
	N1dg==
X-Gm-Message-State: APjAAAU9/FdMyebErs1psNS0KTrcLDEMrh+6JxR0n8+Ia5Y3um4syWqe
	XDmJjt+yzJ5sr7foKf1GPvzQtXr43N8=
X-Google-Smtp-Source: APXvYqxxd8I6H2aU9mYJEyV+tgwajTYNRCeU438UHAQul7tvTX1trvQLCp3jg51ng6qmLVwUtwT2HQ==
X-Received: by 2002:a62:1883:: with SMTP id 125mr36064121pfy.166.1580913709913;
	Wed, 05 Feb 2020 06:41:49 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6000:9640:780a:b2e3:ee68:173c])
	by smtp.gmail.com with ESMTPSA id o73sm52091pje.7.2020.02.05.06.41.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 06:41:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2020 06:41:17 -0800
Message-Id: <20200205144117.21693-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python2: add ntpath
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
X-List-Received-Date: Wed, 05 Feb 2020 14:41:49 -0000
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

python3 has this but python is missing this.
[Yocto #13740]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python/python2-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/python/python/python2-manifest.json b/recipes-devtools/python/python/python2-manifest.json
index eb52e862..fd98774d 100644
--- a/recipes-devtools/python/python/python2-manifest.json
+++ b/recipes-devtools/python/python/python2-manifest.json
@@ -267,6 +267,7 @@
             "${libdir}/python2.7/lib-dynload/xreadlines.so", 
             "${libdir}/python2.7/linecache.py", 
             "${libdir}/python2.7/new.py", 
+            "${libdir}/python2.7/ntpath.py",
             "${libdir}/python2.7/os.py", 
             "${libdir}/python2.7/platform.py", 
             "${libdir}/python2.7/posixpath.py", 
-- 
2.25.0


