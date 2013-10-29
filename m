Return-Path: <p.patat@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB3F6CC53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:19:42 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id f4so1092376wiw.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 04:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VYvQC96RfjzuxzQZwQyloIsV1YEseAdg/jvZ65pv304=;
	b=nSUIdevx0EtAdigmvJ6EPCsVuGkEtjoxTy63tM/W2VxzAX0OkTF8XXDte54J9YBEEP
	x1G/I1Wk1jew+a5gjrl6nYI+60sUseHugONi4K795Qf2Lb1ComFiYFWLr6gPdLkq6SbZ
	KSyMPnZmvO8BwAivbv44IQ34TiCWxHO8RcU1+VDJcbBiVrt9yDGjElS8VjvpGSdtJqSn
	qKb7qOABKCbdLbx6OxhYwiz7uMqcPU1R5EA8XHqvb+HgsjyVLlqBb9AyAIENCJEePzYZ
	LQmnGe99JswztuOY2Nde7NdKctBmySn3083mHCJHnKRRpkuCFgKEly9HcI3O9BdExKBN
	ad9Q==
X-Received: by 10.180.211.237 with SMTP id nf13mr12902208wic.55.1383045583545; 
	Tue, 29 Oct 2013 04:19:43 -0700 (PDT)
Received: from ppatat-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id ey4sm3829368wic.11.2013.10.29.04.19.42
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 04:19:43 -0700 (PDT)
Sender: patrick patat <p.patat@gmail.com>
From: Patrick Patat <patrick.patat@innotis.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 12:19:32 +0100
Message-Id: <1383045572-18281-1-git-send-email-patrick.patat@innotis.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-multimedia][PATCH] libao add missing plugin to packages list Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
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
X-List-Received-Date: Tue, 29 Oct 2013 11:19:42 -0000

---
 .../recipes-multimedia/libao/libao_1.1.0.bb        |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
index 08950b5..47e8f28 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "29de5bb9b1726ba890455ef7e562d877df87811febb0d99ee69164b88c
 
 inherit autotools
 
+PACKAGES =+ "libao-plugin-libalsa libao-plugin-liboss libao-plugin-libpulse libao-plugin-libalsa-dbg libao-plugin-liboss-dbg libao-plugin-libpulse-dbg" 
+
 do_install_append () {
     find "${D}" -name '*.la' -exec rm -f {} +
 }
-- 
1.7.9.5


