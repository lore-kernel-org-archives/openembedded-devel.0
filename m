Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A025B65D00
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 09:10:09 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c85so50494994wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2017 01:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ujlP+qHetzn+yqXgyJ1WnVojtTBrAmn2bz0ZxEjTG9g=;
	b=xIz81EA6kagnCWbzV4t2py5fMbVni68VFxZo7spmHCs6hd844SkHa0q3ECRfqIee/X
	FD+FjM8djiFJWlgkZXHVyqg+1kuZlMzexJ/HdKkWWCWkG+Xb7avfJhS6s4QEPwivuxEk
	CQBv1OWLcGDmxBrS9z+vh3TucTro9AVmUsmw2yiAX5DT9P3mYwztMBFOgBHJrLxInZCU
	EjD5zs/aJhL1wFW4KIQQNm/tGafZhQodD2MhEhiIHNlK9bVchud1ZdtuhIcB0+CSvYC2
	CaZm6DaGBbJDD+dB9krjXxYEaOpLXFKQYLQNTnpJZoLOLDCGbn3MyKXIhkELCe0WRDPe
	Ihww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ujlP+qHetzn+yqXgyJ1WnVojtTBrAmn2bz0ZxEjTG9g=;
	b=dXDJhV/eHxGAGiiTz2EnRP1LzkC0I6jOcjJbQZo6SNGhxZV99K5CTYK0ZfjzWq+Hj1
	UPRZCEqYTtkyiDE+Tv7RjEz2zVdFhhwFWrj1ngseUakBfSDRrsUU0rQ7eUJzdiTMOM4b
	XQOOMa4VfoetnvPGUKBnnynosL0DXa0UUPEJomtvsjifQSEj/HY2SG7plhr4prNRIYwS
	TP+zgRctQNwAAsoFtCD9Y5cnI12uvcXF8mvY7NfdPAv9DuIkStT37htOy6WdqogUBXog
	zYNwKFx6M6v1E3qZppPu8zNlfBoGam0bt5Stomh9mv+Z3PsMq4BSPylqY23di1rkBwYz
	/cow==
X-Gm-Message-State: AIkVDXLmAXpPt3GRBIWWhDeYTfdsiQE8BhuA2xTL5m3jBlmdATOA/lYBu8kb+bIAHLTElKsZ
X-Received: by 10.28.143.20 with SMTP id r20mr912752wmd.2.1483780209914;
	Sat, 07 Jan 2017 01:10:09 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	203sm7363630wmf.21.2017.01.07.01.10.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Jan 2017 01:10:09 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Jan 2017 10:09:59 +0100
Message-Id: <1483780199-22045-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] tcpdump: remove obsolete enable-ipv6 configure flag
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
X-List-Received-Date: Sat, 07 Jan 2017 09:10:11 -0000

--enable-ipv6 configure flag has been removed from tcpdump v4.8.1:
https://github.com/the-tcpdump-group/tcpdump/commit/572684c34837f4a.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
index 18efb9b..35a5cfe 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
@@ -19,9 +19,8 @@ export LIBS=" -lpcap"
 inherit autotools-brokensep ptest
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-PACKAGECONFIG ??= "openssl ipv6"
+PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
-PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
 PACKAGECONFIG[libcap-ng] = "--with-cap-ng=yes,--with-cap-ng=no,libcap-ng"
 
-- 
2.7.4


