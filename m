Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6849E6DB94
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:48:30 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so3437114eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KsQXWywFJPVqrP6TVEGP2PBnLY++6qohQRl7Y1XSlfg=;
	b=tuvmvjgmNQKrcoozr1nepg725gKN1Cls/Q+RVJi3/59LGGOBQbfFOoY/TlLrCCbOtr
	WL0zXM5RkE/MXIGHNBokEVRD8yyvDkORwhkc89T2jqU6VU5WT1o5ZFYWLgcugkLvancb
	X0rDLnzWNMdOvnUzkDPhnHp9Bcf+TUk492nittkuPmdlueum3FQ8fuZb/F894sjPVF2H
	bVBjAtWEovnKFGZ5uGU88wDFHWDLFCO+wa3AI6/a/bX/H2sHnpKPad/vz6VJOCNUOHFI
	IuzfXVAAlRjx041nk2cyoYf/7uZeH0r4MGZ+NfpVGaCR9tymIyZEOtoUcj/ZTL7JiH6L
	ij1Q==
X-Received: by 10.15.100.198 with SMTP id bn46mr2112066eeb.11.1384966111511;
	Wed, 20 Nov 2013 08:48:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm4470048eea.10.2013.11.20.08.48.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:48:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Nov 2013 17:48:32 +0100
Message-Id: <1384966112-24830-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <20131120115839.GL3708@jama>
References: <20131120115839.GL3708@jama>
Subject: [meta-oe][PATCHv2] usb-modeswitch-data: Exclude SIGGEN dependency on usb-modeswitch
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
X-List-Received-Date: Wed, 20 Nov 2013 16:48:30 -0000

* has runtime dependency on TUNE_PKGARCH usb-modeswitch
  Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata changed from 5709ee415d286847b58e7b438b5b9f75 to fbef5eee3bb2bacb805a0bead2095b52

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bc025bb..bd7eceb 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -33,3 +33,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   distro-feed-configs \
   ca-certificates \
 "
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  usb-modeswitch-data->usb-modeswitch \
+"
-- 
1.8.4.3


