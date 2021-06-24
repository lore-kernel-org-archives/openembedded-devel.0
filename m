Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.1615.1624500188765308265
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rIrOZEzo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500186; i=@fujitsu.com;
	bh=/rv+B6Ovk75mTngGXv6/iF7U1J31gnZTGvTpjvq/bmo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rIrOZEzozxkNs8oKokjJy3SXzSkcs1BZRiZtAYA65BK24NOAO94LlU3HaCIT/oq2H
	 hbj/TM/H9RbNcN4zIZzY9h9hYwkaL4GK8gAsY57aosqWmmHAokaL5WN6OuWt4zRh0g
	 UD5VaJunLkXH98ERWmcGljSAcfzfQtRO2jbBbCalN1QZqgZMQj8ee3M22ErT2jRzLk
	 7f05D9WvYRSISrLbTlBBpBwwkdb3sIHNVRNbZZQZCvDx4D4qmdCT/GI4sOTY320vsm
	 SNzrO6AHnA074wSk4FrijrK3ll73lIupSbgMdJ9Zf3PiGnDMU6+fcJGYtVwZgQsZCo
	 hqkYzjYKD80RQ==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 65/D7-39611-AD7E3D06; Thu, 24 Jun 2021 02:03:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0b31/HK
  CQfcefouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPr52e2gvWCFdtPfmFsYPzI38XIySEkMJtJ
  4svP3C5GLiD7BKPEtYM7GEESbAI6Eh0vullAbBEBfYmls/cwg9jCAp4SJ89PZgKxWQRUJX4cm
  8cOYvMKuEts33mPDcSWEFCQmPLwPTNEXFDi5MwnYHOYBSQkDr54wQxRowhUf4YFwq6QmDFjG9
  sERp5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11jXyNRQL7FKN1EvtVQ3OTWvpCg
  RKKuXWF6sV1yZm5yTopeXWrKJERhIKYXMv3cwPn79Qe8QoyQHk5Iob2n75QQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKErzGwNAUEixKTU+tSMvMAQY1TFqCg0dJhNfyCVCat7ggMbc4Mx0idYpRU
  UqcVwekTwAkkVGaB9cGi6RLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5zz4DmsKTmVcCN/
  0V0GImoMUKvy+CLC5JREhJNTA5MxzUNJPwX9w0t+XqzzsGv4slD+Rd1fXcIzftqN91tsXyT46
  cD79iu8Qr7e6LspodE51/aXzVMXwQUf2V9XBp3+zjCkqpcz1eJEVkbwzpaWZ+rNQ67YzCwp3C
  +oWLXupf/yC4e/EuF5+CwDPLSu5nVjeYds5amp4g+szX89Keyq+VHSvfrT6muNNuudbb1StOF
  vYysCVcfxbLoeZ2Wcjq4D+zfIlzT5at0+6d1eFjwFvwaQZTZiV/1Om28C3WfeLbe5kXrCl3/n
  0i0az7XNaTc2Us3bo+bjf2OlwQMz665PTu+zPVQkN3S2QoZ/9P+eZldmPhzT/3dq39f6v4OgN
  7+I5mwcK7ty/M39G3i9dUiaU4I9FQi7moOBEAQAYp1R8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-226.messagelabs.com!1624500185!80344!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19239 invoked from network); 24 Jun 2021 02:03:06 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:03:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O235SH021086
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:03:05 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:03:04 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.17.1 -> 2.9.18
Date: Thu, 24 Jun 2021 10:02:57 +0800
Message-ID: <1624500177-10845-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
configure.in-disable-tirpc-checking-for-fedora.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../configure.in-disable-tirpc-checking-for-fedora.patch    | 6 +++---
 .../snort/{snort_2.9.17.1.bb => snort_2.9.18.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.17.1.bb => snort_2.9.18.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch b/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch
index 87fd05bfd2..d8c945a481 100644
--- a/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch
@@ -52,9 +52,9 @@ index 8662cdd..0ff7e27 100644
 -    fi
 -fi
 -
- Z_LIB=""
- AC_CHECK_HEADERS(zlib.h,, Z_LIB="no")
- if test "x$Z_LIB" = "xno"; then
+ ##################################################
+ # Centos 8+ does not have inbuilt SunRPC support  #
+ # in glibc and is separately availble in tirpc   #
 -- 
 2.7.4
 
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.18.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.18.bb
index b5ff430993..cca18d726c 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.18.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82"
+SRC_URI[sha256sum] = "d0308642f69e0d36f70db9703e5766afce2f44ff05b7d2c9cc8e3ac8323b2c77"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1

