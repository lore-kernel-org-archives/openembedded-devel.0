Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E000C7666E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c10so7458364pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=CDpUfxekpOXPj9lNWQCiwqn7fqTO11bXrOir3XVTmJM=;
	b=TmHjcv/QrRmGDUrLvXRIalwwr8gNFrOXfa8GIy/BWd0G67JdS9oeF6xF1DOyq4PGQ/
	2YTPsqRJxnlGJqnn2LuKvjUeF3FfdA5rBgpzJRBsP0f9CyW84yllMjDmFUF9VMSvem8M
	tC2AkEfyO5fJaOD3ii/vN0Feq8H5OqLJhfGG7PcJ5rGlh3V5RkH/qZUSgWWHDdXKwTrQ
	90uMWPFg4Ep/8h4JBE33C7f6TB5LH7laveqdjuOmDyyPogoea/p5XtbZDkS27o7f5kUM
	SN557AH/cNa1SD6qMsi4hh4Nc2X2+Snk1oimx2BeM3sP5BorSl57q5eoiqHEAdZhSYR4
	2Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=CDpUfxekpOXPj9lNWQCiwqn7fqTO11bXrOir3XVTmJM=;
	b=Vy1JEtPjxoFuZk+9SWCvIgQsux9Ig0Cpq0POPIdsVDmcGDz24k/TPNUruwPsg0fHKo
	TcJBnVhT0BwZ9ShIeLZ3qlosDe6pjnoBB08tz4yAzlQjEEZofiVP1b85W6dqdjLOITUL
	IKnJXI94Zj8gQ0AjtOblB2As+x8VR/OdIXnJzYyup+fT5PpSTSWqPHFZw81T849Z+r73
	pNfet8X9qFGy1tqWgRqsbg8XVDlV4bk5DSm9Vaqj2+ZQ5IiAl+8RYWBaaq0T13OUtGnd
	tHwUYwt+51zIl67yEDB1Kizd8XAe9ENzt8J87ALkvWasuD7xKGDv6I6/AYu84sb760+8
	kAPQ==
X-Gm-Message-State: AG10YOQvo4/YOAjFqEuK4vJeyhprnwQXFme5XwHP23TxLP30vehLx8qpgFyYbM49h3AptA==
X-Received: by 10.98.40.200 with SMTP id o191mr10155470pfo.83.1454879533653;
	Sun, 07 Feb 2016 13:12:13 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:55 -0800
Message-Id: <d5cded2fa0c0dd2ed13af0eb8ba1db6941b8db17.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
Subject: [PATCH 3/7] ntp: upgrade 4.2.8p3 -> 4.2.8p4
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:13 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

4.2.8p4 fixed following 13 low- and medium-severity vulnerabilities:

  * Bug 2941 CVE-2015-7871
  * Bug 2922 CVE-2015-7855
  * Bug 2921 CVE-2015-7854
  * Bug 2920 CVE-2015-7853
  * Bug 2919 CVE-2015-7852
  * Bug 2918 CVE-2015-7851
  * Bug 2917 CVE-2015-7850
  * Bug 2916 CVE-2015-7849
  * Bug 2913 CVE-2015-7848
  * Bug 2909 CVE-2015-7701
  * Bug 2902 CVE-2015-7703
  * Bug 2901 CVE-2015-7704, CVE-2015-7705
  * Bug 2899 CVE-2015-7691, CVE-2015-7692, CVE-2015-7702

And three bugs: Bug 2382, 1774, 1593

Details at:
  http://support.ntp.org/bin/view/Main/SecurityNotice#Recent_Vulnerabilities

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p3.bb => ntp_4.2.8p4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p3.bb => ntp_4.2.8p4.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
index 0a7a39e..4fe2ed5 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "b98b0cbb72f6df04608e1dd5f313808b"
-SRC_URI[sha256sum] = "818ca4f2ed6ca845b1c5ec43f5e6ad905eaa0fc0aab2d509ed6b962a37fbf38f"
+SRC_URI[md5sum] = "6af96862b09324a8ef965ca76b759c8b"
+SRC_URI[sha256sum] = "0d6961572548d2c4af96f58f763e22ac620f5afef717384ddc317a0e365cfdb9"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.3.5


