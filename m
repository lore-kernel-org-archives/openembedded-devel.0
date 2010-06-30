Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlRy-0001rs-E0
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:46:51 +0200
Received: by gyc15 with SMTP id 15so146851gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=JeRYZh3Uke83auUukDTh3rqs1PnpTJ7zckH1npEnuqE=;
	b=CKIRVqVnq1RMaM3etkNi1MWOJKsYSCuG0sQmNx3lBAQMGSId2ZPwyq+u0myS/lr4m1
	db0BC/N+otKMbAceUrvupsdV6pBDwV/TLpeKgItwKlaVvjjMV6+Dp0CMJTjrfdxMvB09
	ywiyij+aRx8ZP5V1nscVWoHrEEyi3w1zUCDVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MlvV0nbgHcf3i+G8tAVfcpFa8Yv0DowH9NPFldbogNKXHA4NwUsgXSvReDHGIQEL51
	u79k/Vt11r6qd8rWtleU93BN1x9Umu8Trqs7T+iuXzbO+CTC1uw2hdfdkwTG3SB8j+mp
	xIgBD0HCxgeeRvaaPr5VBLPe9b/lfCVpCYtTs=
Received: by 10.91.63.40 with SMTP id q40mr6352228agk.92.1277858526687;
	Tue, 29 Jun 2010 17:42:06 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id r42sm345299yba.0.2010.06.29.17.42.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:42:05 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:41:43 -0300
Message-Id: <1277858503-27321-5-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
References: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] rename libsctp package
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
X-List-Received-Date: Wed, 30 Jun 2010 00:46:52 -0000

---
 recipes/lksctp-tools/lksctp-tools.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/lksctp-tools/lksctp-tools.inc b/recipes/lksctp-tools/lksctp-tools.inc
index 9832dc9..9cbc963 100644
--- a/recipes/lksctp-tools/lksctp-tools.inc
+++ b/recipes/lksctp-tools/lksctp-tools.inc
@@ -5,19 +5,19 @@ LICENSE = "LGPLv2"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 BBCLASSEXTEND = "native"
 
 inherit autotools pkgconfig binconfig
 
-export LDFLAGS += "-ldl"
-
 do_install_append_virtclass-native() {
 	:
 }
 
-DEBIANNAME_${PN} = "lksctp"
+RREPLACES = "lksctp"
+
+LEAD_SONAME = "libsctp.so"
 
 PACKAGES =+ "${PN}-withsctp ${PN}-utils"
 
-- 
1.7.0.2



