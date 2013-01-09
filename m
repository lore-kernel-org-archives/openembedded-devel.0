Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsxsK-0005OU-N2
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 16:47:34 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 07:32:18 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so1622485wey.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 07:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=YfxjXh2h2X10IK75kmY3uN15O7tJa+tOydnlSTQRm2s=;
	b=od/bG63d4iHX5EOuKLt+ZHvDkhy00t3XCCa54XckebdRLFt+eAMC3Nw72eji8yjel1
	yAuhgrqqae/TNToCFA8iLrg1MSbS+ijfkS9Ipv5sSskCpf7kom6pdHgEa/3DveYQ3tSI
	qomhnBBhdMhRUPzc3cLzPjAq5nmZKttPUCKGVSLO0jsSNYpVC8RQG6wreq56IBy7ipGY
	sMW9lUheITCKLpXysSWR3L9Mu6kAsPgEJe3PuiaCWpwA/M52PJtsGrioJp8sPAW1bsSj
	J66oaQw/+EnruK4Ppe+wcdvB3TLPvHBDV9mhWlB+39aI3tRwkmRPaYSxf3RfDiSpypzj
	0mbQ==
X-Received: by 10.180.109.10 with SMTP id ho10mr4074663wib.9.1357745533096;
	Wed, 09 Jan 2013 07:32:13 -0800 (PST)
X-Received: by 10.180.109.10 with SMTP id ho10mr4074641wib.9.1357745532920;
	Wed, 09 Jan 2013 07:32:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h19sm4344111wiv.7.2013.01.09.07.32.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 07:32:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jan 2013 15:30:18 +0000
Message-Id: <1357745418-30724-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm+0x9rf+QSXPRcXu3S4/o9JZZUw+ecE2PJ1wfB3SmVPg4/tk2tjYlVbZetvYYZnX6nDInktruu754J5pOuA5/X3bwhgDaN/Px9Jtgn1slMLP1HaQGvHOMcdLigZJGqIktTO3XKe+NaCheReD8hFW9hFcGDCFi93PetIPsFNIpOtFEzuaIuyftzQeFya7g72seKul/w
Subject: [PATCH] python-mako: use setuptools.bbclass, fixing install paths
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
X-List-Received-Date: Wed, 09 Jan 2013 15:47:34 -0000

An argument was missed in the manual setuptools configuration which meant that
the tool was installed into
/data/poky-master/tmp/sysroots/x86_64-linux/usr/bin/mako-render.  Using the
setuptools class reduces duplication and puts the tool into /usr/bin where it
belongs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
index d2222d6..9547246 100644
--- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
+++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
@@ -11,11 +11,7 @@ SRC_URI[sha256sum] = "fe8698e845035586bd711a6748e4e40a208a58de276b91380261647004
 
 S = "${WORKDIR}/Mako-${PV}"
 
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS = "--single-version-externally-managed \
-                          --root=${D} \
-                          --install-lib=${PYTHON_SITEPACKAGES_DIR}"
+inherit setuptools
 
 RDEPENDS_${PN} = "python-threading \
                   python-netclient \
-- 
1.7.10.4



