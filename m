Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Spdx4-0005Zo-Of
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 13:22:26 +0200
Received: by bkcik5 with SMTP id ik5so2314656bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Qm9Nl2iDnBnVEaXOLIunsjE7cGDEwnyvnyLNKV2zDuI=;
	b=CDjXmFGchac19TLXsQ3yT8Lm9uN7r5vS7dB+p/TUHO84e8jhl3pQ7zwHg6HBDUN/uG
	yUDaSXicnBd2oyW2XimstEV0OoeT6fg1+1gG48yMonk441ib2pOCxGOqszdh9k3K3f7z
	TjNk/JsSQk4VWp+dwctdYeKsyMWGkIRvYV7zzqHBe6nnPMxlMPr9EbjG+vGYTRixcDHo
	An/Kl95DNZ4TtZMbNs0QBopJPuiLTprAReYxVSm4wXRkDQcDkMILyPJ3KWmNMQUmoBeL
	t/uEyi05rZuqZ6zuEZovT8wXl6gQrzCyIAsMZeX1pQe56rGfIilZvaf757Oz3E9RgoUc
	zVpQ==
Received: by 10.204.129.14 with SMTP id m14mr583721bks.7.1342177872690;
	Fri, 13 Jul 2012 04:11:12 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id g6sm4544247bkg.2.2012.07.13.04.11.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 04:11:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 13:10:45 +0200
Message-Id: <1342177846-26594-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-system 1/2] systemd.bbclass: introduce SYSTEMD_AUTO_ENABLE variable
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
X-List-Received-Date: Fri, 13 Jul 2012 11:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently all services introduced are enabled and started at installation. By
setting SYSTEMD_AUTO_ENABLE = "disable" the default behaviour can be
overridden.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-systemd/classes/systemd.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 8af0d58..38b9ed5 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -1,5 +1,7 @@
 DEPENDS_append = " systemd-systemctl-native"
 
+SYSTEMD_AUTO_ENABLE ??= "enable"
+
 systemd_postinst() {
 OPTS=""
 
@@ -7,9 +9,9 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-systemctl $OPTS enable ${SYSTEMD_SERVICE}
+systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
-if [ -z "$D" ]; then
+if [ -z "$D" -a ${SYSTEMD_AUTO_ENABLE} = "enable" ]; then
     systemctl start ${SYSTEMD_SERVICE}
 fi
 }
-- 
1.7.6.5



