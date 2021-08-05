Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.3619.1628129072170464832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DqQrydc6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628129069; i=@fujitsu.com;
	bh=wLackPzY/JjrNZefRyKrccOuH+Wtx8Bv5Hn9zHAO/uA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DqQrydc6DHd5clN+E+41U3dN88Sik/HP04ZlRnF2GK18tnibkRLg0wh5GRlVTot6C
	 akAEQHrjw4bdU0jCWotM4VdW2Un7Py9loZAv+CE6T9x6PXuBupNDm2H48eEgOPkLjR
	 2dawa/Soy6TrYwMI6mcp0LAuhdtxeTyEerwLJrHGPLVi8SYxku4rBnodbepuBqFdyc
	 sI9GRFTIoSqXbUhHdMAzGTDvpzeXq0rk2gNYQzLNZ5MPTyBJdw8irvcGgSKIfaf0o6
	 7b6tj1r9wsTOoMQAnyWhPJNUeVjQZSD8VSjsiudTtmYc++Vl8htiSKuqjyvokkDeod
	 tR2rSb2YqiBUQ==
Received: from [100.113.6.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 21/AA-07605-C274B016; Thu, 05 Aug 2021 02:04:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRqqvjzp1
  o0DhJ0uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzVj4eydbwT6OiouPzjI2MD5m72Lk4hASmMUk
  MWPKelYI5zijxNX7txi7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B6ibg0NYwF+ie
  XcBSJgFKHzx1QEmEJtXwFHi7IlNYGMkBBQkpjx8D9bKKeAk8X3aHTYQWwioZk/LCVaIekGJkz
  OfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwTGPlnIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1
  DAwNdQ0NjXVNdIxNDvcQq3SS91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmBAphSyftzB
  eOj1B71DjJIcTEqivB8kuBOF+JLyUyozEosz4otKc1KLDzHKcHAoSfC2uQLlBItS01Mr0jJzg
  NEBk5bg4FES4eV3BkrzFhck5hZnpkOkTjEqSonzprsBJQRAEhmleXBtsIi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmYNwdkO09mXgnc9FdAi5mAFl+I5QRZXJKIkJJqYHL9plWzu65d+LS
  pQ/ZZ9Q0zNsVY7GWR29//4FfA3e0e23nmdF/9w+F0+D+PiHPjz1czPIU0Z3hfnVfh1G18K4D1
  6s3nB3/wXF3Et/FbjqbSotU/zRec3iZ9eslNTnH+xhz7NIuLzXb1/8N6Z3hsuepk4XZxfsMWI
  6X9/f26Xx5diTgTsXPVqu52wchG881vr+/8F253IXLqi8TuK9x9GceeyvwTe7TSZdPV2btz9b
  cs9neIr/v8+kpclcXU+QdmHNv17vk2VTERe50i+YCiRtZglr60irP9MlGRd7fzTXKu2Rb63fP
  iL5+pzcdvHp5nNrP24Yut12Y3LtX+xPKJ+VTo3uVbdt4T9ZsqLXC/JFhHiaU4I9FQi7moOBEA
  rc2Ip0MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-238.messagelabs.com!1628129067!282444!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22487 invoked from network); 5 Aug 2021 02:04:28 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 02:04:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17524MtH008057
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 03:04:27 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 03:04:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210718.0 -> 5.9.20210801.0
Date: Thu, 5 Aug 2021 10:04:09 +0800
Message-ID: <1628129049-4619-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628129049-4619-1-git-send-email-wangmy@fujitsu.com>
References: <1628129049-4619-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

ci-env: use unified CI environment variable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210718.0.bb => ctags_5.9.20210801.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210718.0.bb => ctags_5.9.20210801.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210718.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210801.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210718.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210801.0.bb
index 9e803913f..b6fdad27c 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210718.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210801.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "23ea3765d15a4cc361a1dfef497617c91c704fbe"
+SRCREV = "6544786c167ed3149d56e1ffe740c70513762197"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

