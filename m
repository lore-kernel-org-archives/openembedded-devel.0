Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UYZ9s-00048d-QI
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 11:53:41 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so1378697wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Isficbtj+4izu/URU6c+Lc+evTj+GX2m2HaEhL3G5AI=;
	b=wI+KFtSFfh8WJyGjRhTxcBFl3Q1njaWGs+U4wURPxkeai1cX7p+rIgyW5MVi7GbzhO
	VpGzM4xWL/4GknAU5s7eStDzrvIqyKgkPSeBW6UCUkcDiFOMHEVRvcstAgdjIoJXeM06
	03NANHVW13B/XGqMzwAwaDcTwEvoQ0+fwaCIOxa4dF4tIeZyCiJQ5d3DyNgVif7A8F38
	vWgyveuBhPodxCClfAFbd7FiFfzr/T3fg6959IIMW0+cS2Jd3NBbJ7WQFraA8HDFqxLg
	39K+voRpMzC+OG0sBxa15eGe0f8aqGO+z88mcKV/QpZqn/pEFJztwElH2kUD9/TphYpg
	vboA==
X-Received: by 10.180.198.175 with SMTP id jd15mr1443650wic.28.1367660140595; 
	Sat, 04 May 2013 02:35:40 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ed20sm2150948wic.0.2013.05.04.02.35.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 02:35:40 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 May 2013 10:35:17 +0100
Message-Id: <1367660117-19572-6-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
References: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-multimedia][PATCH 5/5] vlc: fix configure failures with ENTERPRISE_DISTRO=1
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
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000

VLC will by default search for libmad, liba52 and other libraries and may fail
to configure if they are not available. We add the relevant options to
EXTRA_OECONF to ensure that ENTERPRISE_DISTRO is respected.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 059d7d2..531a018 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -65,6 +65,9 @@ EXTRA_OECONF = "\
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
+    ${@base_conditional('ENTERPRISE_DISTRO', '1', \
+	'--disable-mad --disable-id3tag --disable-a52 --disable-libmpeg2', \
+	'--enable-mad --enable-id3tag --enable-a52 --enable-libmpeg2', d)} \
 "
 
 
-- 
1.8.2.2



