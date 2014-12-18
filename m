Return-Path: <philip.balister@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0BE728AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 18:40:53 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id c41so794197yho.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eDd/q6vnS4ItKdUpgcJMxhqhgW9ocPHxH2+mvTAKluQ=;
	b=tfJhCmbasA8y9l6y9JwckkyAUTJWtObmL10YixzgR4p4gM1zSF5UGlrlSqsI0xEMI6
	91PgSX5ybzfz5UtFYGn1tHI7h7qPLgcdATvm4zDpgI4FA2AWqzUHWkxjwiIgPI0vUdJO
	Jc3mJbcRpFcXkXsm8x/2Jf1BrwwJim+AbGp1uSXCg5xD6hzO9vm0dbPf4BQHFnR055JU
	FBbnFbKy3jC1wkI93EAYZA2m8YKGetRhESuL3po97f16X61RYAg5wgFzpocFIb8yk9ih
	cDdvly88nHORmoKu920cI/v5+IqjqG8AV73d3NFsOhpoJpxjGrs5KHHnK+00QstRZJom
	wXFw==
X-Received: by 10.236.32.8 with SMTP id n8mr3218069yha.74.1418928054368;
	Thu, 18 Dec 2014 10:40:54 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-45-99.ronkva.east.verizon.net.
	[71.171.45.99])
	by mx.google.com with ESMTPSA id o30sm4395036yha.37.2014.12.18.10.40.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 10:40:53 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:40:46 -0500
Message-Id: <1418928046-29624-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1418928046-29624-1-git-send-email-philip@balister.org>
References: <1418928046-29624-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCHv3 3/3] anki : python-sip package replaces with just sip.
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
X-List-Received-Date: Thu, 18 Dec 2014 18:40:59 -0000

The sip package provides python support for the target.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-extended/anki/anki_0.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/anki/anki_0.4.3.bb b/meta-oe/recipes-extended/anki/anki_0.4.3.bb
index 7943ce8..d441a70 100644
--- a/meta-oe/recipes-extended/anki/anki_0.4.3.bb
+++ b/meta-oe/recipes-extended/anki/anki_0.4.3.bb
@@ -1,4 +1,4 @@
 require ${PN}-${PV}.inc
 
-RDEPENDS_${PN} = "python-pyqt python-sip libanki"
+RDEPENDS_${PN} = "python-pyqt sip libanki"
 RRECOMMENDS_${PN} = "virtual-japanese-font"
-- 
2.1.0


