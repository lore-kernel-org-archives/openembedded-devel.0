Return-Path: <p.patat@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC8236D13F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 12:25:16 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2901368eae.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=vSG/Cil3NagGX1/X93Ebj9/INF3UpDQ0uZt0R4T0dT4=;
	b=nd5wcT47PXwIWC56/ZlJrBDy23RDSktyL8UsHiXadGulTLeUIE5m6m6SInuaexiGKu
	VBWb/IFqof0rMmKylsnaHpJP4BR2uHLOzJmnAv3M+5esRYS4kU1fXedIBMTQ8P4VHOR4
	fhH3NJdBC/bTKVjrGaGTJgKg7Ygpx05ee4cmwrzMW5P2YH1KJCrJYKLPDtmCtWzNbhun
	/sEuJ/8NaidIxOd3iU0Sqeyilmj5Fkb+4dCqr81PlwWQmIAyE6PTxqzsDrcSy2Rl5SSO
	QepYB3WtTPdowwrt/ZIbx31TC0mFQtfmcuThyiWfugkLHBTFlY1koo2Debz6UuavIHc6
	4gjQ==
X-Received: by 10.14.3.9 with SMTP id 9mr2485128eeg.72.1383049518498;
	Tue, 29 Oct 2013 05:25:18 -0700 (PDT)
Received: from ppatat-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id
	r48sm69741325eev.14.2013.10.29.05.25.17 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 05:25:18 -0700 (PDT)
Sender: patrick patat <p.patat@gmail.com>
From: Patrick Patat <patrick.patat@innotis.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 13:24:26 +0100
Message-Id: <1383049466-18494-1-git-send-email-patrick.patat@innotis.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-multimedia][PATCH] libao add missing plugin to packages list
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
X-List-Received-Date: Tue, 29 Oct 2013 12:25:17 -0000

Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
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


