Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D32C4708A
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.6148.1650617676510264480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 01:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=VqU/rbFi;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650617676;
  x=1682153676;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G8r6sTAuvx4wPatWyRImAfOUoz1K97khlTAEo9+EL/Y=;
  b=VqU/rbFiHB1AmGw/E+Ma7iVdOl3mRvK/kkYq/8EjBD3WxbhnaPhfG0gk
   Imu8VnQpiMBJ5G4MlZ/d39qVZTLpEvFfbsIKsEZr9iBdVvwZaazf9N8zJ
   lKYoxsa7F4enozfUZrHy4u+qQu0Nf0znPsnzF6oYy7IENp/r9ZZt685id
   voNTdjlksLa9OIcFVHhc1gUKySo+IX9uo+okzQmRTvpD9fuqo3fobX+24
   HRJorXer/3p6QeVCsRzhEQpNTj8T33RdmJPWcAzz5kUhHzPy22W7Y3Lzh
   bDQ67pH/xYWGuhpcc4JEjh0P/rvMBqiYzmSn+2OEFEc58ARvJPmXYkw+J
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gpsd: Correct the creation of the gps-utils-python
 package
Date: Fri, 22 Apr 2022 10:54:31 +0200
Message-ID: <20220422085431.22474-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96731

The gps-utils-python package was introduced in commit 66721940 (gpsd:
split python utils from gps-utils), except it was never added to
PACKAGES, which resulted in the following error if anything depends on
gpsd:

  ERROR: Nothing RPROVIDES 'gps-utils-python' (but .../gpsd_3.23.1.bb
  RDEPENDS on or otherwise requires it)

Also remove a no longer relevant comment.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index 8d270ec58..410db92bd 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -79,7 +79,7 @@ do_install:append() {
     fi
 }
 
-PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils gps-utils-python"
 
 RPROVIDES:${PN}-dbg += "python-pygps-dbg"
 
@@ -105,7 +105,6 @@ SUMMARY:gpsd-gpsctl = "Tool for tweaking GPS modes"
 FILES:gpsd-gpsctl = "${bindir}/gpsctl"
 
 SUMMARY:gps-utils = "Utils used for simulating, monitoring,... a GPS"
-# Python files are required for gps/fake, required for gpsfake.
 FILES:gps-utils = "\
     ${bindir}/cgps         \
     ${bindir}/gps2udp      \

