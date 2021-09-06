Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web11.19774.1630917702341893473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=enf75NTW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630917700; i=@fujitsu.com;
	bh=8Qc/UwRVrVW0OxdO3TaekjvB9Qtt37SiBOuIVNpCHjk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=enf75NTWo8mF9VYsu9XoYB5hAp4NrVPvYLauRjHaJzlySCwokFXZw6Fs8BdOcx8jw
	 8iQZaTTqQ9LWIQxQ4/A9dA+aPFTpLV4iQI8feG2ZKoCt0R7Ln100FjnPjx4zPOrJ+0
	 VkonC1847kZkeUt9zbU0Ck/T8mNxVtJcINRAkrCDy7ua3H18SPqqKCnUfJ1XKIlyRN
	 Lw9h2EJzvbcg6bJNGHKTrRau3K6itX2GivHMTZo8lcNh51VcthiLDAkDp+Lhg/A7MM
	 ZRAV9OGGCRbQPpo+aYwBtWUetKwhb4l/5WHK4e+iZhuY8MCd5nWIk6vAw6X864EkX/
	 Og4JN5e72KiQA==
Received: from [100.112.196.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 46/DA-21838-444D5316; Mon, 06 Sep 2021 08:41:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqutyxTT
  RYPMzMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePC+iNsBXeFKuZOfM3UwDhPoIuRi0NIYBaT
  xOTVu9kgnOOMEs8mnmTqYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFvCV6Ln6hh3EZhFQkXjfP
  BmshlfAXeLot/2sILaEgILElIfvmSHighInZz4Bq2EWkJA4+OIFM0SNosT2nWdYIOwKideHLz
  FPYOSZhaRlFpKWBYxMqxjNk4oy0zNKchMzc3QNDQx0DQ2NdA0tLXSNDfQSq3ST9FJLdctTi0t
  0DfUSy4v1iitzk3NS9PJSSzYxAsMopeCY3A7G3jcf9A4xSnIwKYnyPjtomijEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgvfiJaCcYFFqempFWmYOMKRh0hIcPEoivMcuAKV5iwsSc4sz0yFSpxgVp
  cR5L4P0CYAkMkrz4NpgcXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDva5ApPJl5JXDTXw
  EtZgJa3PbQBGRxSSJCSqqBaXPZuhDGtZ9/3v/VxXryZ1B5dtiNG0VtH6enO4tGca12kbk0t7Z
  ap8Gv9N/qDQcyyjfplt5vbjx9ZdVuo1V1eQ3u+5KnLPg4XaVV2PXhuTWdj/8eOvm4yWtN7MaL
  /t/at/85Xn/2hNKOxayxK73aWCwWnZ7n5uf+7ZjkR+eU/8mvr7v4GWtn/hM3/RX6v6vCdUEqq
  0uyXE/UXM+mybIJjkYiwcbbL5++XnnoiVm8p++afY9z9h6LkOrr/W1fq/b6yZPAVzs4FzQITO
  ltWnFjQ4nM+pr/92Z+mCvPJLSrFhjo3D36c7xmbninWet1Rst2VXPgTsa+Hf71K6c/NJ73yui
  hZ8Cjf3/urz7yuqJdWomlOCPRUIu5qDgRAF1fF0oeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-285.messagelabs.com!1630917700!11628!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20206 invoked from network); 6 Sep 2021 08:41:40 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-15.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 08:41:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1868fdBo019850
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 09:41:39 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 09:41:38 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.0.5 -> 5.1.0
Date: Mon, 6 Sep 2021 16:41:32 +0800
Message-ID: <1630917692-67472-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Traitlets 5.1 brings a couple of updates and changes to traitlets, and is
recommended for all users. What follow is a non-exhaustive list of changes:

 - Removal of the ``ipython_genutils`` dependency, this should remove any direct
   and indirect reliance on ``nose`` and prepare traitlets 5.1 for Python 3.10
   and above compatibility, some test suite changes also accommodate Python 3.10 changes.
   If you package traitlets downstream, make sure to remove this dependency.

 - Removal of ``ipython_genutils`` may have change the default encoding detected
   for the command line argument parsing when not utf-8. We expect this to
   affect a small portion of older windows version. If you encounter issue let
   us know.

 - Stop recommendation of ``CUnicode`` in some circumstances as it's
   deprecated.

 - Our test suite is now using GitHub action instead of travis CI. If you are
   packaging downstream using the git repository, you may have to exclude the
   ``.github`` folder now, and can remove exclusion of

 - It fixes a parsing issue for list of one single element on the CLI.

 - We reserve the right to remove official support for Python 3.7 in subsequent
   minor revisions.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-traitlets_5.0.5.bb => python3-traitlets_5.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.5.bb => python3-traitlets_5.1.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
index 01fdffb87f..da234215ea 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[md5sum] = "2ffe54aee5d0d87890127dd28ce3f6c4"
-SRC_URI[sha256sum] = "178f4ce988f69189f7e523337a3e11d91c786ded9360174a3d9ca83e79bc5396"
+SRC_URI[sha256sum] = "bd382d7ea181fbbcce157c133db9a829ce06edffe097bcf3ab945b435452b46d"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.25.1

