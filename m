Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 462307837E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 08:31:22 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id z129so4751088pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vK5dcz/V34jDGlaQj2dqWTkEdN4TAJLJryuOZkWZiok=;
	b=FPSTHXJrFDbCucOa8hiK9GBpzY+uqOySQBsavFqK2gf9eitOxvpqNfQ3kCP5q9jV2h
	EKIF5j2zJ7SpagS/jDqXyk+Ac1l/Ea6aBQ36jI16ERJFh1pGLDkoUnqHNjnF23+gRFrC
	yoQzDqSmfhkgADsrVkakpvtns3FMgJ/YC2/dx4wfN29IDf3VggTnqcJuSSreyqJtM6gn
	GZz6lzYlkm2Duz831tuNCnhvb39UJ+HN0WpQ3UKdTgMHpcrjfB5mIEha2d5AFOfbLhCk
	SdA7/YyLoT5lhHjvIrS6sWAWePAmb5bAeodZ1JUEViqAqeYQfOr45CJ5KzsEezf9ni/I
	Hw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vK5dcz/V34jDGlaQj2dqWTkEdN4TAJLJryuOZkWZiok=;
	b=O8kB38L+3qv3f2AwjifKGPqCxidjIX9GXbIeHyhNBQ3LkoJyviFZWvjvuIGasA6Qam
	eRIr7909ObyGt47LB0ksFB6AgZ6B2pXOezqUlgduB6zWRvoywasKqe+xIVRVVkdmihLM
	0OH41YGBWz56HpAz3+FNjKvJoW8jPEmEkKQ0AXqPa6a5fIQVd0jf4g/b9gG2yPNjEMzm
	h43E4ovKMlWsyplDBMSyiwzcu6OIoqG+TpBUOBv1kNDw1uinvIDbqNIJ0FPMiRbw1FBf
	E/reVG6JVKijfGVkHlqXreo4fTnZe+0ugSfpMga7pvbOmZft4eJSVAey6SoMYTTWo73z
	WRPQ==
X-Gm-Message-State: AIVw112NCaD4AnLuuwP9oV38G4nkjV599saSwymP0PcXwJObwCSefCWw
	ukQF1Gs25kIjUp1C3zE=
X-Received: by 10.84.215.2 with SMTP id k2mr16867190pli.104.1500885084228;
	Mon, 24 Jul 2017 01:31:24 -0700 (PDT)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com
	([2405:204:5517:55b5:ebb1:6447:517c:34f5])
	by smtp.gmail.com with ESMTPSA id
	m186sm19754267pfc.54.2017.07.24.01.31.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 01:31:23 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:01:11 +0530
Message-Id: <1500885071-11437-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] syslog-ng: provide correct PID directory location to restart/stop syslog-ng daemon
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
X-List-Received-Date: Mon, 24 Jul 2017 08:31:23 -0000

If "--with-pidfile-dir" configure option is not specified, then the syslog-ng
configure script assigns PID directory to /var/lib/syslog-ng; which is
where the PID file of syslog-ng process is created. But the syslog-ng
initscript (/etc/init.d/syslog-ng) uses /var/lib/syslog-ng/
as PID directory, this results in not stopping/restarting syslog-ng daemons
when it was requested to do so.

For example:
-- snip --
root@qemux86:~# /etc/init.d/syslog status
/usr/sbin/syslog-ng (pid 345 344) is running...
root@qemux86:~# /etc/init.d/syslog stop
Stopping syslog-ng:.
root@qemux86:~# /etc/init.d/syslog status
/usr/sbin/syslog-ng (pid 345 344) is running...
root@qemux86:~#
-- snip --

Hence set --with-pidfile-dir to "/var/run/syslog-ng", so that syslog-ng daemon
can be stopped/restarted via initscript.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 0977f7e..f1bf9b0 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -36,6 +36,7 @@ EXTRA_OECONF = " \
     --with-librabbitmq-client=no \
     --disable-python \
     --disable-java --disable-java-modules \
+    --with-pidfile-dir=${localstatedir}/run/${BPN} \
     ${CONFIG_TLS} \
 "
 
-- 
2.6.4


