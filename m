Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id C33BF60017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 01:38:14 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id et14so32273699pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 17:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7ROo1HT+fzkqPZB2jMEULA0j3DQzLsUe7026axurqyc=;
	b=BmrbcPcWN+NIUeSqZb9r1oiQOQNOaZeB1Bh14KNUB9Hm8d0TLRpgRx1iw+C2kyzCaa
	O4JDRQcJSXDYQFqUXqiH9Y28k4pTmcv0r6uFhKMMXPgW4blsubZxfypJNUM5Wyp58mzg
	g2+opngjSSOcyinohO4VjvgCoVu+ZmY/vAqPr/MkG8VU5+WAXOJMaCdvgfS0pV0steqE
	mDIpWWUmfOGWWHt/9KCzCKLfO4MZDojadGyUXsBrMbv0mc8JlAtH+SN+BeWv0RXo1xrZ
	DXuQyekQXOvPrL7NicMWoXzqOjE7LKyiRypSjbxn+1iseGi613t2gEIj9NI4eTIjyPNC
	KS2g==
X-Received: by 10.68.135.136 with SMTP id ps8mr10468391pbb.130.1422495494906; 
	Wed, 28 Jan 2015 17:38:14 -0800 (PST)
Received: from localhost.localdomain (104-37-60-13.dyn.novuscom.net.
	[104.37.60.13])
	by mx.google.com with ESMTPSA id mz7sm6004330pdb.3.2015.01.28.17.38.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Jan 2015 17:38:14 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 17:38:13 -0800
Message-Id: <1422495493-7230-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] polkit-group-rule: Add polkitd user and group
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 01:38:16 -0000

Recipes including polkit-group-rule.inc correctly install a directory
with the user and group set as 'polkitd'.  To avoid warnings like
these when assemblying the rootfs,

  WARNING: log_check: warning: user polkitd does not exist - using root
  ...
  WARNING: log_check: warning: group polkitd does not exist - using root

create this user and group.

Note: although the polkit recipe itself, on which this depends, is
      creating this same user and group, it seems that the useradd class
      needs this to be specified independently.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index 8d1a89a..3435e93 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -7,3 +7,4 @@ do_install_prepend() {
     install -m 700 -d ${D}${sysconfdir}/polkit-1/rules.d
     chown polkitd:polkitd ${D}${sysconfdir}/polkit-1/rules.d
 }
+USERADD_PARAM_${PN}_prepend = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;"
-- 
2.1.0


