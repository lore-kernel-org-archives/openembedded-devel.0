Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D24C07FC14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579608021; x=1611144021;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=27MkoODepJOgDh10LaXsYvMeNthC5DsEATANx10LoYU=;
	b=CRJ/jIeVgx5CSzbxj7h2QJPdR5O5ySdIp+G2HDhjn7XLwteMfR4gLvft
	k/VZ5iMFt+pPv1KRIcCxEzf1cgE2ARoYU91eD6XpSqgAms0wTr0/gwNvE
	gBQl2tFJC4YbxW+3umnvYng9pryCq9pmbJutf5YI7b/wZsFA8i31uyqeJ
	9V2G9JZMpUwJ6RTKPOrgr2jdSdJNft0wXa1H39ooemYXnqZxd7B2Cok9O
	FeKCdfYyXNJBkDaeZKDkzIjjBlK1vjjdRjkNIftT7IBvd+U1L4AFXoqYq
	pzoGN3XzlgMvmqhRP/chUqljbNfnxOTKyF6hb2btKImC0dlwdSgiNAmSo Q==;
IronPort-SDR: qhbRb5uDlw7Ihf5q7VGaDizWTyOfaDPoKaI5RMSmx+WzEAf1v4282dosA9zS8CopLqftpWFwjp
	ytztxX0G06ckSFVe1fhJ3Py9V8c7DD6pmw7uT3T4la3pWkJFolnRdDyG5pV7aEn62TqKZ67XIC
	605ZoLxlm4+BjB8dc9ykRdo6kXa9jF3bp9OwkDT2Sla6R2R69FeLTdmqrngC+e5zmSD7TvCHkJ
	dAf/xXPHStq5r0pUTBHEkMYDdvGPPwK3Txyi/6LgLP+uTsYXYgZZU7QV+TLsc2FPZfuF8oav2r
	yas=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; d="scan'208";a="22157354"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jan 2020 12:59:48 +0100
Message-ID: <20200121115948.384592-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] layer.conf: add LAYERDEPENDS for openembedded-layer aka meta-oe
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
X-List-Received-Date: Tue, 21 Jan 2020 12:00:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 9be071d..0ddc5f9 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,6 +8,7 @@ BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
 LAYERSERIES_COMPAT_meta-java = "zeus"
+LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.24.1


