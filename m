Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwe-0001O0-OR
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:26 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so333610eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=PT8T6tsLmg1Q8qolOgvqQMOYK5OPAY+hptxui/wZILg=;
	b=BXMUH1vLIoqm5t7rlIkwyTfOMQMZBs1QzIr7Axvhc4IPD807rHmG9T2nzrMJqDBsOY
	8QmXfNW0nCMc57JvZLFt0COFGuVYSHgzAvhcnx/tYJ0ZYgTeRJhQyMwBNlIFdBvWsTvQ
	vSFPVGuzT45HKUHuQImhWWxb9KRmyrph8Mr3Dq1fh0H6gRZIRD66S45OTIxymj3Sm5nJ
	mML3gUdLO23egHggBaD9dEqSsmQh5Qc+HloJnjZEuO4j3vDEH9FqdVlCf1AjWHzbdjYn
	XfWLS4CmG7xNJpv112iSn92ylc7nCFtMb9b0Pur9oxBqlQ9fIFJmZRodOROkkLAp5PMP
	MwtA==
X-Received: by 10.15.94.200 with SMTP id bb48mr6991555eeb.21.1365610503262;
	Wed, 10 Apr 2013 09:15:03 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.15.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:15:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:21 +0200
Message-Id: <1365610462-29689-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmtU2O7tYLwqfdf9ZSWosS8FCkOfYIWEsq1izof/5JpD9oacdg4Jp9rB9zyWvonqQ7dABmO
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 7/8] cloud9: add autorestart on crash
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 16:32:29 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service | 1 +
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index 714b465..f805ea9 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -3,6 +3,7 @@ Description=Cloud9 IDE
 ConditionPathExists=|/var/lib/cloud9
 
 [Service]
+Restart=always
 ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
index 777d2f4..afa85bf 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.8.1.4



