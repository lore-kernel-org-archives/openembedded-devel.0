Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id E084871FC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:53:58 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so2442880wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kpwmH55qX9H8fYvVXJ0aOF7eDT4cp0EOp4ut/0e2PGI=;
	b=L7uFyDQZmtcbmYsesqqQx2+t7bdPDIjIJn3SqT7t92WgDOExXMQysAXTLHAdrMgHoH
	tpRB93VoRetaNu87vPSl/yRQ7al15172sdnvznr27Znn9ODk3orKZdgfuiqi63Ojazgk
	icq+pYEDAKp4ZGX31LdxoKnhREJqp2lOtg54hYF27qaZSsts6tsn8rSorPrdIk2ZFDtJ
	sm3JotLaEubv9RQIOzmg4vuYO4Jaj2yG+toFQ5qDQW8TcHiS5uQ5lL+YSiCJ6x0xpLuA
	EQk1eRZZQGCWB507oRF6MpjL0qkAAal2A+lQRcTfC0pqx8OU7sacqdlDQD7d8WS4xdHF
	OOBw==
X-Gm-Message-State: ALoCoQkkp5omMs9kg3tvAqwt9WGYCHYCkq1aZ7hMhkBCh3Nkw29X5+RxqjgQBkWIwH/a5RGHe3EC
X-Received: by 10.195.12.76 with SMTP id eo12mr56340606wjd.22.1415728439294;
	Tue, 11 Nov 2014 09:53:59 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx8sm14461196wib.2.2014.11.11.09.53.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 09:53:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 17:53:47 +0000
Message-Id: <1415728430-30366-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
References: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] gupnp: use GNOME_MIRROR in SRC_URI
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
X-List-Received-Date: Tue, 11 Nov 2014 17:54:02 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
index bba86a9..c8c6164 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
@@ -1,6 +1,6 @@
 require gupnp.inc
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.20/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "c01aa6d3a78792b3a24591f036dd91f4"
 SRC_URI[sha256sum] = "205d47b950a1b7190df1115f454cb38a44d71aacfec75d4287299e400e139b69"
 
-- 
1.7.10.4


