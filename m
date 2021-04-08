Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.3915.1617858818222741981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WFiZILCg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617858816; i=@fujitsu.com;
	bh=kX5kU/HgvtOYPdkgjz7NVCzr2joSnktBLdt2UM81Udk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WFiZILCgPfM89xQpQ6CwZdWzxmmIrxrFhPjJup2FXxPPG9rB/AMkPg8mxBbJ+LZgR
	 57nZcjymPprX3zbDt6zFOcxHyyV2PDiy/C/vp2ZwVAIbHGaiNIVSsLzJF71yKvOWfn
	 M97d2RwO5dw4KqBcHo4BZoYfYRRlR/tTi/esFaK4sE7gNSu4Qg4GqSXP9DUyXDu45a
	 TUw69gAqXnEjMDxm98xH0lBNmw71RODKzF67nNh5jjPJSkru0J7Z0S8ZrnaqCo9Tk/
	 i1/H6GhIVF2LrF6gqXP3k/x8R/s77WIXMBhV8Bm42v9GryrDUcowuK3oPsFGH175lf
	 04Cpx9Ps1e+hg==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id D4/BE-60958-FF09E606; Thu, 08 Apr 2021 05:13:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+GYovt/Ql6
  CwdteGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPT5/CCV5wVS/e0MjUwNnN2MXJxCAlsZZI4
  dfEzG4RznFFid+s5li5GTg42AR2JjhfdYLaIgL7E0tl7mLsYOTiEBbwk2jewgpgsAioSj2/Wg
  Ji8Am4Sx39kgBRLCChITHn4nhnE5hUQlDg58wnYEGYBCYmDL14wQ9QoSmzfeYYFwq6SODv7C9
  MERp5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSQtfQ2EAvsUo3SS+1VLc8tbh
  E11AvsbxYr7gyNzknRS8vtWQTIzCAUgqONe1gPPn6g94hRkkOJiVRXrsnuQlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHgvtOUlCAkWpaanVqRl5gCDGSYtwcGjJMKb1QuU5i0uSMwtzkyHSJ1iV
  JQS55UGSQiAJDJK8+DaYBF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwLwswHoV4MvNK4K
  a/AlrMBLS45GAuyOKSRISUVANT3paG5vX1zWyKC84pPq6327r/66oVHxOnxYlzlIQyXtR9Ki6
  lsC3qU9LzdcnfLr0K6vavrL+1ccNe3bea19f3/T6z9cFn8X8Pcr5/PL54zuP0VOXFj6+6x6wI
  MXnk/O/p9eQlbyrXPfTc/ql5Nttcnhtla5XNZVbkxKZfevJpkVaSYEZn07aSCeFK26Z8beopv
  zMvIvfb1w2WpZuSe3kM1ssmHLFOfSWxrydwY1CzsKzH+/3JGw0LshvUr+irChw7+N1W3Hjnxd
  tKK1/OCXomUvyhZ40j/8INgsFl/ccnPnm0bl7Q6+a2R4mrjgadehK3xsSVe1lYkSDnwVOhV9f
  s9jTlahEqmfFBL3y31JUVtkosxRmJhlrMRcWJAOBGVl8bAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-285.messagelabs.com!1617858815!614188!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13635 invoked from network); 8 Apr 2021 05:13:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:13:35 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385DZmV014902
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:13:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:13:33 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] mosquitto: upgrade 2.0.9 -> 2.0.10
Date: Fri, 9 Apr 2021 01:13:27 +0800
Message-ID: <1617902007-4927-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../mosquitto/{mosquitto_2.0.9.bb => mosquitto_2.0.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.9.bb => mosquitto_2.0.10.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
index 97a380117..b815ac3b4 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "b77cee4ee6f0d32ca8816a58167e8b1d"
-SRC_URI[sha256sum] = "1b8553ef64a1cf5e4f4cfbe098330ae612adccd3d37f35b2db6f6fab501b01d4"
+SRC_URI[md5sum] = "3d1c327d8c5881f56983bee1e3c8f068"
+SRC_URI[sha256sum] = "0188f7b21b91d6d80e992b8d6116ba851468b3bd154030e8a003ed28fb6f4a44"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.25.1

