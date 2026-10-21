Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7506.1792574978375085558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=glBvIrsD;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so997466eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574978; x=1793179778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQg+0VGRSROtbeHPtiaaYx0eJ8t9+4O75AB5SIh9B0A=;
        b=glBvIrsDlcU1sXRvKPIPyeO8rhT03E0n3d/A/kQz9i9m8+7pik1xM7iu5E8zaZMrzT
         Qm7cV7uiDmR1KJLmH2+RQSfPBQZcjlec34AhgovATX1PI/fHrwBdma7snqlYIj1PwlOa
         /bXFsLs30d7fZC36osrtr9V1CQUl10EDUIpJy+qg9laMp/N7zvkC0LT3oDoITw0QRc66
         bmh76rgWEJDA2Ast4ROL2aJ8yhVifPEwnJ/rDbMJGbwVqR19sHOBR2AMu/pLT0q5rtsY
         DD+oLSdgCxn64bvn8KTXJ5ukzjIyrKb1w/86rD9yPyTliOV7l4b8tMVxkUzFSGi+yjGj
         JMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574978; x=1793179778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQg+0VGRSROtbeHPtiaaYx0eJ8t9+4O75AB5SIh9B0A=;
        b=mkmsbaoJ6omqNLCKvElvaR3zm1drjmnX7w5WWJcTSlXy2rypDeAEuZbD46vPSSvrM6
         +gTaYSLuYgzUdAZY8lS93YF20FlRk7u57M476UJ/IvcAzvC/cBRe1o2RaIvOYBx/MYwx
         thcpcPgrMR5VXOBlVxTU80axQCTv0eev5DlDJO4pFoDyDVcrXikyI+y+elb99XkpH4WY
         zVQqsFE2qmR2agiM/Andds7yI1q/jgFelycKcAZVd7aRQGnUKzEh1GBuuwbOXDiFnxm1
         XQnNkrexnBSdyuGRiQCXtVufgvN0JpcUFc5CnVzLdV8yiahrTgUUqOAL8jT9QDexOWne
         Xtsg==
X-Gm-Message-State: AFq9FYJGvvigFJvUjB8+ia69NGskpH0lq/n66WZUKSchOobBR3QdAIto
	VvtKxdlBRs1J+/1d4MPrwMvlcel+vX6vJsrXbP4eP7iCGxGW+kbHRUqE9jaFjA==
X-Gm-Gg: AYBFou3OAib0WLvy7soa1lOJWlGtrUNmlQutHgfRQsoHs6IKdIv4Vp/Fo/eeX8MixdQ
	xH/OMhi6hJq6Xuzt7DapMYHqkdxrSrdSllcE7h5RIgMPz1PjFieO1/ru02poEk5VXm9toyJaMVc
	MQHfkf3j/qj8WmwbMrWUijM29lh4284R4+3z3YyEzgwJwFTcU+N6eAAWVTibLXVqrwJRsp+0HEi
	SVuk7cgFgDIr5E4Heu/oeaVP0YDTDk2kcWjKq+1C3C8RYaPrmh27L55ihDNhRPITXVA7y/pIEDQ
	L87ZnTnzE0IBX1VrfdeMmPP3Aei4/v/fYBAWcf/6YUu68eCHuTtYYofxjDFv2mMUU90TCWfGXF8
	hyppdAIPblfQIfZdA3KKG+y6yJ7TUuchQGrU+nKOAofNF8VGXaFGK63dM5vY1DgjRIfKLNKDi7E
	z6HSkjmM1DpTKnJfHk0HpglyypaosBY7Kx42wC+Da94vuXEFMzl4JdapqHo9KNTR+SrSLdudJos
	Hco54ugPFzOnyQyQ2kBwocHha7bBjOz+cXSOp3dwo04sAwIrwDQwFVckRnv7g6yTnLmNWK0lcKB
	AWABeJdSddT+L5Myeks8dX69Yzcf/jU=
X-Received: by 2002:a05:701b:281b:b0:14d:baf5:c40e with SMTP id a92af1059eb24-190a437d5c0mr1790019c88.8.1792574977631;
        Wed, 21 Oct 2026 02:29:37 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 15/44] samba: ignore CVE-2026-2340
Date: Wed, 21 Oct 2026 22:28:28 +1300
Message-ID: <20261021092857.3585453-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131202
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also confirmed in the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-2340

[1]https://www.samba.org/samba/history/samba-4.23.8.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.23.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index e498b30bcb..c0d8fe4a00 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -46,6 +46,7 @@ UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>\d+\.\d+(\.\d+)+).tar.gz"
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
 CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonStop Servers"
+CVE_STATUS[CVE-2026-2340] = "fixed-version: fixed since v4.23.8"
 
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
