Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id BACBA6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 May 2015 00:53:04 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so34957204igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 17:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fk5AGqV2giCKPBhiZ6FpdsMgLiSkDQSvb87M6JwA0h0=;
	b=JBIkQAC6+B7L87AQ7x6S12RzJ2tnuZM3Pxl2HJ8EHIJy65M9Oco9RNzRNxpKiC4qlc
	I/EyEpYnY7doLZrNQ8JK/jWMVoqg3xYLNEVTBmEC6z4BSUK1Pr9QoiuA8QDBMw0t+2pI
	icHCCRslTJ57vKAEw8weFWrNoaXVq6po3eKGm926y1Yz8U9SA2QWn66+wiHu6WOQVsFG
	35ksGUNLi56kgbnvCFdSzImv29v0cfi9e6u9/2G+ow/rxP+GDnl/ZaefMVVnlAxD6opK
	2m8eD1+wBl30q6as+eLt+iVjWlDbSJz1MFdqNVN4A1J6Tbq0/flZsGLD4ARgwqmCGchL
	qGkg==
X-Received: by 10.50.72.8 with SMTP id z8mr961144igu.36.1431132785112;
	Fri, 08 May 2015 17:53:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id l128sm4695153iol.1.2015.05.08.17.53.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 17:53:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2015 17:52:58 -0700
Message-Id: <1431132778-29191-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH][meta-networking] ntp: control refclock driver support via PACKAGECONFIG
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
X-List-Received-Date: Sat, 09 May 2015 00:53:04 -0000

The default configuration of ntp includes a large number of reference
clock drivers. Provide a PACKAGECONFIG to allow control over whether
or not these refclock drivers are built. Leave enabled by default.

  http://doc.ntp.org/4.2.8/refclock.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
index 693bdbb..811ec2e 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
@@ -8,7 +8,7 @@ SECTION = "console/network"
 LICENSE = "NTP"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f41fedb22dffefcbfafecc85b0f79cfa"
 
-DEPENDS = "pps-tools libevent"
+DEPENDS = "libevent"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://ntp-4.2.4_p6-nano.patch \
@@ -45,7 +45,7 @@ USERADD_PARAM_${PN} = "--system --home-dir ${NTP_USER_HOME} \
                        --shell /bin/false --user-group ntp"
 
 # NB: debug is default-enabled by NTP; keep it default-enabled here.
-PACKAGECONFIG ??= "cap debug"
+PACKAGECONFIG ??= "cap debug refclocks"
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
                           --with-crypto, \
@@ -53,6 +53,7 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           openssl"
 PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
 PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
+PACKAGECONFIG[refclocks] = "--enable-all-clocks,--disable-all-clocks,pps-tools"
 PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
 
 do_install_append() {
-- 
1.9.1


