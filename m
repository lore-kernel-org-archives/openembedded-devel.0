Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Dec 2017 07:18:13 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 9079E782CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 07:18:13 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 977A128023F; Thu, 14 Dec 2017 23:13:51 -0800 (PST)
Date: Thu, 14 Dec 2017 23:13:51 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20171215071351.GL27580@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-networking] [PATCH] tinyproxy: 'nobody' should belong to 'nogroup'
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
X-List-Received-Date: Fri, 15 Dec 2017 07:18:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The classic 'nobody' user is supposed to belong to 'nogroup' group.
Without this change, it will get a 'nobody' group created as its
default group instead.

Ensuring the existing 'nogroup' is used as default group solves
following sort of complaint by useradd-staticids.bbclass (when static ids
are enabled):

  tinyproxy: Changing groupname nobody's gid from (65534) to (1000),
             verify configuration files!

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
index e8025c4..efc0acf 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
@@ -23,7 +23,7 @@ inherit autotools systemd useradd
 
 #User specific
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "nobody"
+USERADD_PARAM_${PN} = "nobody -g nogroup"
 GROUPADD_PARAM_${PN} = "--system tinyproxy"
 
 SYSTEMD_PACKAGES += "${BPN}"
-- 
1.9.4


