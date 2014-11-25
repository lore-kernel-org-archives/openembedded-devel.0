Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 890F970A7C
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2014 16:09:41 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x3so652359qcv.15
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2014 08:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cDd1rUHIYYjY/exGe3ZS4QFSsS18o44jzaGRUxuCGzw=;
	b=BusnCxGKbGzT95OdW+MNJXAvQ6Rt+e5xpSkyRKkXU/KZML2hh8yCCIK8/5P3qeBzAL
	qeTFSSZsfIO5nC5K1zJEO/XoyeQy2eBm5uB6VPT5Q/JLcACYUFYiL5VjKfwNIFojttIt
	nM7u/GadnbhMCIit+u3kpSfAPtsqZ3X1hbmponFqfmfnyneNZh9htqv5tCBMRHdYH5YW
	7N4p9in2/gZ0Af4VHwUZBy9qdX2MP0SxTcHeKxuVQq4i5wcOY13AdEKSqL8Sdi3joZ+W
	EgCSO5sKn0Z8Y5Ql/v5RmYL2sDBKe99jjPxZq0nZ/j6izFvXzxzdVOrHoQ7sWOO3Z0fX
	vBUQ==
X-Received: by 10.224.14.133 with SMTP id g5mr14003330qaa.81.1416931782334;
	Tue, 25 Nov 2014 08:09:42 -0800 (PST)
Received: from localhost.localdomain
	(pool-71-171-45-99.ronkva.east.verizon.net. [71.171.45.99])
	by mx.google.com with ESMTPSA id i1sm1421828qaz.28.2014.11.25.08.09.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Nov 2014 08:09:41 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Tue, 25 Nov 2014 11:09:36 -0500
Message-Id: <1416931776-13600-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416931776-13600-1-git-send-email-philip@balister.org>
References: <1416931776-13600-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 3/3] anki : python-sip package replaces with just sip.
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
X-List-Received-Date: Tue, 25 Nov 2014 16:09:47 -0000

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
1.8.3.1


