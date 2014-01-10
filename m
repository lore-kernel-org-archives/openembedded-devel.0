Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE9E6C046
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:07:17 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so4442894wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 23:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H4ngMWbFCiqxNT/1I322HuV35Cik+ylFWgTZ/8f3y5E=;
	b=HyuYqV+ymrUjsa4QWI+fKaDPoh6VPp4h/CRhhb01CiFh1h1vgl5tp93QTfnHgvziV3
	qJx/+Z8mHY842Irc/YUu5gK5+gDc6teLhSDuBQIV6wXAoHiul2v8MbCJ4ufXeC+Eg2HI
	K1bb46cWufmGRZiBEqVOSa1dP9bBPyaFgSoHPGFXOXRJFMTvTo9xVA8EOttt1H2RVbER
	YtZEAzqoOG5ue6eKXVc/rRqTU0I5f0xSrDN2lj1x5s/9SXJVmDmbN7Nn84quZlQWMAzp
	oQ4RKYfYW+C3Tlm0ZF/UrJJ6KIoJ1N9J3CNFwyyfmbq0bMxwTJwr4Zsb+MJZKZkXjUUS
	nqyQ==
X-Gm-Message-State: ALoCoQl3XGq39vpHiiFPS84ypxYwwP0zqxw+9Tln4qmZOGrbfa68FopEU95DBmS9Bz4G2x1c+0an
X-Received: by 10.180.160.212 with SMTP id xm20mr1005225wib.33.1389337638057; 
	Thu, 09 Jan 2014 23:07:18 -0800 (PST)
Received: from localhost ([2001:610:612:0:223:32ff:fece:c738])
	by mx.google.com with ESMTPSA id
	kr10sm3335769wjc.22.2014.01.09.23.07.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 23:07:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2014 08:07:10 +0100
Message-Id: <1389337631-1844-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
References: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH 3/4] fetchmail: add 6.3.26
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
X-List-Received-Date: Fri, 10 Jan 2014 07:07:18 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/fetchmail/fetchmail_6.3.26.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
new file mode 100644
index 0000000..a45f746
--- /dev/null
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Fetchmail retrieves mail from remote mail servers and forwards it via SMTP"
+DESCRIPTION = "Fetchmail is a full-featured, robust, well-documented remote-mail retrieval and forwarding utility intended to be used over on-demand TCP/IP links (such as SLIP or PPP connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
+
+LICENSE = "GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbb509e0303f5ded1cbfc0cc8705f28c"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://download.berlios.de/fetchmail/fetchmail-${PV}.tar.xz"
+SRC_URI[md5sum] = "61b66faad044afa26e142bb1791aa2b3"
+SRC_URI[sha256sum] = "79b4c54cdbaf02c1a9a691d9948fcb1a77a1591a813e904283a8b614b757e850"
+
+inherit autotools gettext python-dir pythonnative
+
+EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
+
+PACKAGES =+ "fetchmail-python"
+FILES_fetchmail-python = "${libdir}/${PYTHON_DIR}/*"
-- 
1.8.4.2


