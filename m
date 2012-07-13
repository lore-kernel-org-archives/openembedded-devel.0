Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSB-0007zC-Ph
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:25 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247498bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Q616WoabwAdLoRs6qn74veXwav6w4aDl1Cd5PqV2mwg=;
	b=Zr2r1I2ErlCaftyTsycRSKi6TOT18OqpCC9RSOfcWvid5P80PEhuyU+SH/RsKvehj1
	OK3m1R1psm0/Hr1ildDRTKlkW6SpOX6fsuwe/oD4S1KXQiqRYsLxICDJA9GhqBK0EOgf
	XzQaQLqOiJTNQGxRw/Jc1ajQD5PW9j5dC89SghuoN3GTasw4WSbMkMgzpiOuII+HnjWf
	ErDHbzJxkMuXCkN3VDvkqqIv0XABeH7OEZcBsoGo7LsJbOHG5qB9GnW6pT4ZNp/hsIgu
	YkRk4j+tYK4RAUf6pe55e/ErCQLyifLUDFLjXGgbhz5gHmgyFuulPHyI42ZdXnZPDRea
	K66g==
Received: by 10.204.129.208 with SMTP id p16mr94955bks.129.1342168271959;
	Fri, 13 Jul 2012 01:31:11 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:11 +0200
Message-Id: <1342168240-7760-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 03/32] layer.conf/README: search directory structure for bbappends changed
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-systemd/README          |    5 +++++
 meta-systemd/conf/layer.conf |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/README b/meta-systemd/README
index efed2ee..84578b5 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -10,6 +10,11 @@ URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
+To make BBMASK'ing per layer possible the following directory structure is
+used:
+
+$[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
+
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
 
 When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index 9caec69..3310abc 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -12,7 +12,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/*/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "systemd-layer"
 BBFILE_PATTERN_systemd-layer := "^${LAYERDIR}/"
-- 
1.7.6.5



