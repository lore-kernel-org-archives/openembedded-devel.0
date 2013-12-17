Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 894256E593
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:31:31 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id m20so4288958qcx.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 16:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=u8zJ8MpU6RVCCC1Ph+TFZ1m9Dg7G+K0mRc1fwnN5J/0=;
	b=EQmPvT3DDwWhLNLjimo4Ol70wvQD0upKhlJMeimcIyzB+HT2AesDS1DfxNkNKIdGLW
	Y9XMqSEjCHVcz3r8e2i3mDolrBcWVJf+kMKN4GH+32eiTXzXXmZYBe18QLUuk2ly1W9p
	bCPYK+WxGPf/tR7+f0kAaw6rNhkyWS0ME9d/2zQ1O0V2daLSqetSAMZOleqsCrOKWyvx
	8TT0deFwt2MAcxS+HT1Ummm96tTM6+YokElE3lCZE9+ruUIbIJPksVg9BgawUnlCfmGj
	6/uMEEM+TIR/k2XIkymQqPZaZYONYVPjeQoAj2sNjARMxdKm5lzq6AnKsJCCLGXV9/s8
	Q4dw==
X-Received: by 10.224.135.71 with SMTP id m7mr37494631qat.10.1387240291113;
	Mon, 16 Dec 2013 16:31:31 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.90.230.254])
	by mx.google.com with ESMTPSA id d1sm50936060qai.7.2013.12.16.16.31.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 16:31:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 02D9B17643BAB; Mon, 16 Dec 2013 22:31:13 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2013 22:30:56 -0200
Message-Id: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 1/6] meta-oe: Drop pointercal-xinput from SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 17 Dec 2013 00:31:32 -0000

The pointercal-xinput has been moved to OE-Core so we should handle it
here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

 meta-oe/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 393b4e6..2a5a428 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,7 +26,6 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-  pointercal-xinput \
   mplayer-common \
   fbset-modes \
   gpsd-machine-conf \
-- 
1.8.4.3


