Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D56E971E61
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 20:29:26 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rd18so4999559iec.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 12:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XblEPhOLuYlleJTQa0QBBkNXy+SSa7ByoI3JN1Avz8k=;
	b=FQX9o/6NMoLcW3m1K6uarDP2K0n6vr3eo9Kgmz8rUqsju3CbXi5+7C5JEPxxFrpvMv
	1zEzoJmczXgCHKep+zAKAxthsg8bqaRTWsJ8DWk9Kl/rBPf/5jFeGtTLLJo9JKUCP55o
	5nJJBqpu2h6LouyjIp+poLqM6NAX9LvTI1XVzpaWQDzUG5owUNHB41tKkn7S89Kd4qlS
	kUp4aghs3zfEDgp/akZgXGW1SXzPs/0qkvk3V4/vgw52X1Sy/DPnbuzB2BWKJ1mU+qUB
	DOfy8nQilMWngXDPIn32oNEiu7PIuP3AacQ57f6/a8YVaA7Po/Wqe41GLd3mHIL/RV/W
	cqKA==
X-Received: by 10.50.109.228 with SMTP id hv4mr26714909igb.45.1423081767737;
	Wed, 04 Feb 2015 12:29:27 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id 16sm1382580ion.23.2015.02.04.12.29.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 12:29:27 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:29:20 -0600
Message-Id: <1423081763-2905-3-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-oe][PATCH 2/5] lxdm: RDEPEND on libsvg-gtk
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
X-List-Received-Date: Wed, 04 Feb 2015 20:29:30 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

The theme uses svg files. If libsvg-gtk isn't available lxdm
still runs, but throws a bunch of pixbuf errors.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index a3dcc1b..66dc269 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -70,7 +70,7 @@ done
 sed -i "s:last_langs=.*$:last_langs=$langs:g" $D${localstatedir}/lib/lxdm/lxdm.conf
 }
 
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash librsvg-gtk"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.1.0


