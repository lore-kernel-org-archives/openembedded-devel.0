Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc4-0004XJ-53
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:40 +0100
Received: by fxm17 with SMTP id 17so12727991fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=+Onry9S0DEN4FONBCIGW5kNYYJIdv7EfwQansUIbe4E=;
	b=C+FA2u1K0oDYhW01UThMi0roi7E9hMIAzp+RCaDLxE/mgR+Ae0qu2vbGgirjTPLM34
	2juysF/P1tcuJW702phK1P3Y90dmnnCm/kvjSRv28Bd29sElniVbBiR4CtVpThC9TtGO
	lgwHR8TxQVQIAVnfbsVzGbznSMx3i/m2aFhCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rr/K2ywNQ3gDEt3WqU2zETuJQxzzCfZzIk3fh4lgY7qDjTsJKPnYLRG36lz2O4cBYF
	3O22bFggYJnlQPRpELTPMTjQRtHsfjh76oMxawQ5h+rP4zV3WtbDV619/PgVoqRCTu3K
	LPlzQd5cTzdfdHQRqNNZ5dP68Gzxj5//+LW50=
Received: by 10.223.104.145 with SMTP id p17mr75806fao.105.1294084938704;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id b7sm1984070faa.42.2011.01.03.12.02.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000oo-M2; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:01:57 +0100
Message-Id: <1294084926-3115-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 03/12] image.bbclass: rm symlink destination via ln
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:40 -0000

Rather than rm'ing the destination-file manually, do ln -f

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/image.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 7c1f3e1..db13dd0 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -140,8 +140,7 @@ def get_imagecmds(d):
         cmd  = "\t#Code for image type " + type + "\n"
         cmd += "\t${IMAGE_CMD_" + type + "}\n"
         cmd += "\tcd ${DEPLOY_DIR_IMAGE}/\n"
-        cmd += "\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
-        cmd += "\tln -s ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n\n"
+        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n\n"
         cmds += bb.data.expand(cmd, localdata)
     return cmds
 
-- 
1.7.2.3



