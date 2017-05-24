Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 May 2017 15:39:23 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDB67805C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 15:39:22 +0000 (UTC)
Received: from samweis.auenland.lan ([91.0.195.130]) by mail.gmx.com (mrgmx102
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0LwXCt-1e1EpQ1poV-018N9n;
	Wed, 24 May 2017 17:34:19 +0200
From: dl9pf@gmx.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 17:34:07 +0200
Message-Id: <20170524153407.22969-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.12.0
MIME-Version: 1.0
X-Provags-ID: V03:K0:Cqz8odAObNn9oIzGf6VkQrkGjtLzvw+7DbsXaa+0HObQPgBwxIW
	CzawaTCf1OyMN97g4u2X+muxZ/joQQGXxAGmJ5/rY3eLixIcC1vMc2v21CGcvO/3jYMubYT
	ObQt4j1DtrQhTYsVDxUkmoEnyUI6h/+7RjTgNhL8hhXg/0EAuTIbFeV8J3IY9MWzmvRTd07
	mbnHqYDxW/lXIWG+riUoQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:UguEStg6Pro=:j8PjVPLcqdlglkrXmxXjSR
	rfGcpqCh68nRErRRo4/f4IGpKXXHRcVHzANd3Z7Hci25JczkVSaKsIeolqJ7j074nbo1GyJ/p
	JFIYrui3QSqCmlIfyxg3aTH0icpa4Cjpneu4PiqP7WyeNahW5YiqevU/5U2c83yhqIbMDhQL+
	TR0IGu7PD3cy0iB0dyKn9hGTZ/5A7c2oBKYNT9+ijDABQdB9JaRE9S+h2ADpaUxJpkMRyitUe
	wrQSzqxaPnlrBBIxX4orSYfDXS0K9k6eYayCiwRvhm9AJRw9yyHUQ3MwlclpC/h9Uk9/cw8Hd
	Xejnuop1IaZOAj7MQulbkruIw4MlrqXUo1qHax50aix+s1bTvzLCfcNskLOfBKEsUv6UU2j56
	nJeTK+/S3S5VNEUmpT43j6NXEY/78FZPj0WFVB0GQjmlKtE9i8qcT4pIvgwPGPc1jaIZIOpoH
	OafVeVWG2PxMaPwPbG9IpUeh/rC636GIFuEwRrN8wPvkjGCsIRRssiLsxccMynvGH+1aLs1d2
	JoBgTJTqX3j9Qk/QZo2xvdeq3IE+nqiuelyS05lNSZmI5FjcE+eSeqKcbmMr4ueqP3r+MW5e5
	ZuL/I73eefhzhMY0CXDADElyztRp2kmqADxvXfauiW0f2LQ+rt18lehvlWABfWPx7ztoOPgKM
	CK6wfhXC37SOy1BiQte95Fz2VeCdWQ+lLeJDS6kExLY0mF+lFx58OmuRj1a1cO7WrnhZ4otx6
	RAEP7ANgd7Jos3QDXeNcFXRZEWlncR7+sdlHL/VSpXPozBWv6SbMe/3ThoRdQ25NUQH/A95Em
	LLlQ4fy
Subject: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
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
X-List-Received-Date: Wed, 24 May 2017 15:39:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan-Simon Möller <dl9pf@gmx.de>

This patch temporarily fixes the unavailable upstream URL for sg3-utils
with an bbappend that redirects the SRC_URI to a mirror.
Checksums match.

Signed-off-by: Jan-Simon Möller <dl9pf@gmx.de>
---
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
new file mode 100644
index 000000000..aeef696cf
--- /dev/null
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
@@ -0,0 +1,2 @@
+# Upstream URL currently unavailable. Use mirror:
+SRC_URI = "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"
-- 
2.12.0


