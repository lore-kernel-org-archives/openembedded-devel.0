Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16EB06FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 18:17:14 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id b14so4874248qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R8hHH0u/zZ1KSELhGDuHZJBpOf84fjKe5WI6b/em9eA=;
	b=JI/GqIy/NVe3PXfPalfL94mLADWuIDrVc8lGRxWOaU+6Za6MscgYs10X74caDlEsvu
	nDaKUD5KhaHEP/b8cHah0tXKot3nPuDU22rf30PedCC21BpxW2YUhoQzvgXKbZU3hA9S
	8Gl6k61irrYFzaZ1H7HWo0CUBiBZ5Hp5sa9zABNiOp7MzsoZMkGMBSdixEkKBaD5NGWr
	uP9Oa7rOObLIwcZ1IAakKS2tLXObQtX34x6RygxJM7+7IaEBSFVrelF2Nj+5wrjduAls
	fzMJVCRIOG/mv7Jh8LaVHRQd2TJ6okFrQXR3Cn8BpEC1ilZiGQhlaRUSlePhjmQle06h
	TeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R8hHH0u/zZ1KSELhGDuHZJBpOf84fjKe5WI6b/em9eA=;
	b=Akx3rs6WL+etlvVWKnzXYxS6RDpZIJT0ZPog1yYrEeKtV/PNDfW7sb0HR2BcXpgwsb
	jqDk+rnsOE/dLjEgz+Rz7/p+WjPzZA3Va7JE//Xg6tPGyjvNPne/2+LD7t77OdqYXZW0
	LmTrqmTTDPIFhVQTrIJ2kUAPZhYmcN6rQqMq7w3a+O+MooqqQkEUDzja6GqzPNVynyES
	skzQGJM2Q4qh5RSq41t8jluRbzy+EJK0K0bzeOBctPBH+LqU3iuZC9uBXqsQ8rP5TyBq
	ep9iPLym5Hx+v5sUun1b2Z/LJ8/a/Df7R4uQO8KRQ1tlQUR1JtHTUPnxZI5MEOsdxamb
	/RkQ==
X-Gm-Message-State: AOPr4FXWTdCuh66hbW/WBeWEORa57CNp2w56VUwGxgA5+seOi02fTjrnA7+RKy57VYlaWA==
X-Received: by 10.140.18.197 with SMTP id 63mr9015588qgf.18.1463595435570;
	Wed, 18 May 2016 11:17:15 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.158])
	by smtp.gmail.com with ESMTPSA id
	f19sm4744845qgd.21.2016.05.18.11.17.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 May 2016 11:17:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com,
	akuster@mvisa.com
Date: Wed, 18 May 2016 11:17:09 -0700
Message-Id: <1463595429-8748-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1463595429-8748-1-git-send-email-akuster808@gmail.com>
References: <1463595429-8748-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][jethro][PATCH] ntp: Security fixes via update to 4.2.8p7
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
X-List-Received-Date: Wed, 18 May 2016 18:17:15 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-1551
CVE-2016-2516
CVE-2016-2517
CVE-2016-2518
CVE-2016-2519
CVE-2016-1547
CVE-2015-7704
CVE-2015-8138
CVE-2016-1550

for more info see:
http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_2_8p7_Security

Signed-off-by: Armin Kuster <akuster@mvista.com>
Acked-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
index 1836dd9..fba2f5e 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "60049f51e9c8305afe30eb22b711c5c6"
-SRC_URI[sha256sum] = "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
+SRC_URI[md5sum] = "46dfba933c3e4bc924d8e55068797578"
+SRC_URI[sha256sum] = "81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.3.5


