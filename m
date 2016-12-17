Return-Path: <joe@deserted.net>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 30E0C6025E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:54 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 75so5908722ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BIrw60G2XLFukVPwGCv7EXo4AAXLjqfxLRQ9GT+SGp4=;
	b=de2hwZhMcaT0hZYIIFA3Qtp8wxBatQcJ6WDAaZHQ7Bq25S5nM+yAXIBo0kzMjkml6g
	WRAsf2Neu9WTNS0XL01aLlZlnoI5IMXLANmq0JCNFHoJM6s8FSW5yZmV2IIrgqZTYQVT
	REFTJcrKr3dan1RbPuD/ZQggoVrlk9gNfNV0k/jfVeZkP+B+psjOPktG4DSEBGgf8YHa
	o2vECnGbXN+WlLkA+8iZtfAqTZ3CoTMlXlIrm/PRErBu1HeJXbHemFsT0PPFwmHQbEZg
	iv6tUdGo9mK+KD3wqC5Xb4YE68P1kRGYHkcOjybQrrvJp0u0PU4gM2V7j2tgwzC6Vnye
	xNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=BIrw60G2XLFukVPwGCv7EXo4AAXLjqfxLRQ9GT+SGp4=;
	b=BW+14xQ10+8KSmDZTvPX5axbAgmxit9fRkt+Ga20oKSTkVJAcArhpuq/HMrvaMGExs
	du0JYG/NlgBP4v6UEnoqenOn4JXLTwB+EY9Fr3I6bZXz+Hbd/UfK7jWw8Pe2HOqamuQI
	6WPEV69iMFmaTbyCHNZZ37Wr/DIlp367e6tMuOL2fbHjkQ39CcU2VcdVRelv8EZVgauK
	SJtYuNqsHCMrylFJgG/3lb5AxzXgsJyE1CHPG5TbzUKZH1mz/3CWnqUIMWJYu9RaOU0I
	PNCkdVZwj/J3bfXrIV/VWcRFdf6ws58NqoVOL/Se/UMA8y7LQpN5tbWDBRINTfkNYZPR
	D/iw==
X-Gm-Message-State: AKaTC01uFoyd881+DDJGsU7eJFYOgk9PYSSXtXBPjMhN03yGdTYevVwSfA9+tIwBHJ+wiQ==
X-Received: by 10.36.228.204 with SMTP id o195mr9373241ith.102.1481990696396; 
	Sat, 17 Dec 2016 08:04:56 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:55 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:57 -0500
Message-Id: <1481990698-15962-10-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 09/10] samba: start on boot with systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 16:04:55 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 76f97cf..804a4d2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -44,6 +44,10 @@ SYSVINITTYPE = "sysv"
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
+SYSTEMD_PACKAGES = "${PN}-base winbind"
+SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
+SYSTEMD_SERVICE_winbind = "winbind.service"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
-- 
1.9.1


