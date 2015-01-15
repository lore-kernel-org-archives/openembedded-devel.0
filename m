Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9D09F722C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 20:47:48 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so17156652wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 12:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pCGl1kLtvz1xaIxxDur9WmODoArvoKG/ThdmqgFof10=;
	b=iGCTUPIOz+flqGIs5djUMn7LC1/ddntcdPCPKAlCYffJkQlAzHlCtp1mH9wg94t+mV
	SPT5R+uGwciMJnNfBG5DBfqKqFW/kwwIiZcAXVl1OYiVTkcYfgCW+JHVtIgvreV0VdmW
	/JtoaXbg/7ZrkqeABce8KH5pkH0IyRtCcwESn42ueGznEuBEN/LtZA6sBYEVa4M6U/DL
	53Ap9RAMIxyAQDVLj6duSQ28bTEBAYsNfA65XjsB2DFCwPcuaRRJYiREX7icraeh5QZh
	o8ptKz/Lt6Cdoa5vCXZsp+b0ItSe8E8a+3e3dLII7qtLsKv0Ave725Zi01m0gQGux1yr
	HrNA==
X-Received: by 10.180.73.170 with SMTP id m10mr22984739wiv.72.1421354868238;
	Thu, 15 Jan 2015 12:47:48 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id gz7sm392409wib.22.2015.01.15.12.47.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 12:47:47 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 21:46:59 +0100
Message-Id: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-java][RFC 0/3] address failing qemu-arm runs in openjdk-7-jre build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jan 2015 20:47:53 -0000

With at least one cross compiler configuration we get a segmentation fault from
the qemu-arm binary during do_compile of openjdk-7-jre.
See the following thread:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099795.html

1/3 addresses the issue, i.e. compiles all binaries for qemu dynamically linked.
2/3 is a simple receipe which also shows the segmentation fault in a simple
    hello world application.
3/3 reenables xawt, so we can run the java demos to test if java works on a
    target since probably all demos use the XToolkit, e.g.
    java -jar /usr/lib/jvm/java-7-openjdk/demo/jfc/Font2DTest/Font2DTest.jar

Max Krummenacher (3):
  binaries run by qemu: remove linking with -static
  gcc-static-test: initial commit
  openjdk-7: enable xawt

 .../openjdk-6-6b24/icedtea-zero-hotspotfix.patch   |  2 +-
 .../openjdk-6-6b27/icedtea-crosscompile-fix.patch  |  2 +-
 .../openjdk-6-6b32/icedtea-crosscompile-fix.patch  |  2 +-
 .../openjdk-6-6b32/icedtea-zero-hotspotfix.patch   |  2 +-
 .../openjdk-6/fix_hotspot_crosscompile.patch       |  2 +-
 .../icedtea-jdk-nio-use-host-cc.patch              | 22 ------------
 .../openjdk-7-25b30/icedtea-zero-hotspotfix.patch  |  4 +--
 recipes-test/gcc-static-test/gcc-static-test.bb    | 40 ++++++++++++++++++++++
 .../gcc-static-test/gcc-static-test/hello.c        |  6 ++++
 9 files changed, 53 insertions(+), 29 deletions(-)
 create mode 100644 recipes-test/gcc-static-test/gcc-static-test.bb
 create mode 100644 recipes-test/gcc-static-test/gcc-static-test/hello.c

-- 
1.9.3


