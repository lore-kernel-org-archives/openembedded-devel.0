Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 535 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Dec 2018 02:28:19 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 737A86D546
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 02:28:19 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 721C92804FD; Wed,  5 Dec 2018 18:23:13 -0800 (PST)
Date: Wed, 5 Dec 2018 18:23:13 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20181206022313.GM24510@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe][PATCH] hostapd: enable 802.11ac support
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
X-List-Received-Date: Thu, 06 Dec 2018 02:28:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hostapd has supported 802.11ac for quite a while now (and it has been
used in many OpenWrt/LEDE releases) so it should be safe to enable
802.11ac support in the build. This does not automatically turn it on
at runtime, but just makes it available when a config file tries to turn
it on (rather than spewing syntax errors about unrecognized directives).
---
 meta-oe/recipes-connectivity/hostapd/hostapd/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
index 2789640..a62bec4 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
@@ -139,6 +139,9 @@ CONFIG_DRIVER_RADIUS_ACL=y
 # IEEE 802.11n (High Throughput) support
 CONFIG_IEEE80211N=y
 
+# IEEE 802.11ac (Very High Throughput) support
+CONFIG_IEEE80211AC=y
+
 # Remove debugging code that is printing out debug messages to stdout.
 # This can be used to reduce the size of the hostapd considerably if debugging
 # code is not needed.
-- 
1.9.4


