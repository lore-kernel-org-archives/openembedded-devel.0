Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37957.1795594129991715817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jvo8P931;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38692f62b22so6066365eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594129; x=1796198929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pZwVnsqgSCgSJtJ5YkFAoX7eyGCNutf5la1yRuIlos=;
        b=jvo8P931gDHxZGXeIjLduEtAdc9AcP/2qbnUltkOmVo8ixpoYIiRTvSnqTxgZ5QZbu
         OiLzvQqFmoPJCLkyub9rD7bIPsz8W0+JzhU9B8N/+xd5MMJABlthzK1iY/PZ/C82fwss
         cww7a7rNRUSqfTnlZ51xv/2Ls5ySqBJBozQZeSZxTXnr6sADEW5CPhVXKNXWAD5St3/r
         NxpHp3/+hUhUqq3VMwaxIpMdiPSoVjl1gubLqjmaqhrEgP3S4F70ECGA4Y6G06gUmyt0
         fIUji0Zkz2oKC5+262SfGaZFWK409MjISraIaLamyuKAOqU7H6XkxKEFVdIS0S4lGl5f
         +7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594129; x=1796198929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pZwVnsqgSCgSJtJ5YkFAoX7eyGCNutf5la1yRuIlos=;
        b=ayTA6YfuAkJfDvBRroFemXsEoR02NwN+Yj6sXEESjLSnk+pXZT0XABuBTkte4XoHC+
         Wp74u3cKfjNInfFSUtJnFdKx9uT985ZrGGykwSdtwxUT34fde7b+s4o/lva0yVGfrtqd
         bZ1nmDieEfTdXZv5JBHM2JfepvRr9JDa+aW4U8wc1o51VtLf1lucaR21ubtA4NnMBW6f
         yG0dWn9Ej5yOwrQW9uRU+Zhf9iQhgrgJ/t0iPgRqmDGIYs0aUl5bIL0rYkPzDPUvGYI5
         FdacZGjghmt3soU2zZkNctlDd6iPfvgSWhaZlw/JDrgTG+4TntrZMcwS62PscK6l9WrG
         7XLw==
X-Gm-Message-State: APuU4Z+JxGttXOSX/BFHqDj0l6tYsXIqAGwny3oM2u2WJCFP6FZoPEtG
	tSEaGnsHWvyIGl0v6s25VD7lNM8BDNcbURdZiOJUQJXhaOabpqgJpftDAwWiRKEX
X-Gm-Gg: AZFdTZd1e9m/oo1fFuQ4yYy50/xNQVFk7nSWEu9A8pn0at6d43vL2lQL9Aglyfy9i4L
	i/Wb7MghVTpNj1P55oGemu8H+cu69K0pF/ManecrlCQ5RKYVAJFK/Zx5639Fcn3G3JQvsGaAd+R
	EnZHt0PJtf1ogDuKDuMkVh1acS/D6KOe/Z2HWMlK5UMB4VfbWWVuKZg2XH1OCwKLrDq2r+hdLH/
	TmFAIhFhIhFMBXFFDSlwIDpko2iSzA7jOhmfA7zSbCQFSMw8MjRvVN78NWigyftg0Qyyxi3f2b3
	0Vo8+lCnjwHQYakv/sSE4tPqc/JraWD4gkE+/WMeJxdnYg7XqkCnvxa4bPp3vtSUKtwQJbQvZ0n
	f+czdFykcr0YzOeVRTsHgxztvoWdDTFk6sIZ8m9jMcTHqb6i9Mr1kvq5hpG5uogalewEU9cZmg5
	FcyB2eZyrM/7SKEjo+Q4WffydBuxNmjh5hZFY8nNvSlPaITrXAgkIRERxfIlkxsm8FtUiRlkx7N
	pMU+LLm1MhXe7pBowyCGeRpCPkTveOOWA6r2n1m7eRdoau40Da8kLsrKUcXevqnVo3rCcX4d/HZ
	h/hQxZX577OKoRsBHlLQSpxa45hs+Gy9aeew5G3aVoXD0q8aujC0TpEMJUVMHWVZZnOUJMbsyh9
	EDIyy6NNOSLoOCXSaHNIEkyG4xRhfsz4MI58ENLMw1IBBmCNyeVK3fvxwtftmJcc8ByoGnRVIEv
	W+MSUE2kq8lJF5loNR3qWm4pIQZT+1c3BRXf349jRWerhlRdnTmkF3Z2nL+AGqErMvqBjARje3f
	akda0ZtGjkjdDsiT1aq1uDgYgKn5wKF3ES1gbGN0DAZcpp55WUqtjOc4OEXZG/u/K8dSBCQV+Kr
	fcUc
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr25263014eec.23.1795594129315;
        Wed, 25 Nov 2026 00:08:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 54/55] postgresql: Add Spanish locale to ptest RDEPENDS
Date: Wed, 25 Nov 2026 00:07:10 -0800
Message-ID: <20261125080732.2419614-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133057
Content-Type: text/plain; charset="utf-8"

The nls regression test sets lc_messages to es_ES and expects either a
translated message (nls.out) or a "lc_messages is 'C'" notice when the
locale is unavailable (nls_2.out). On musl, setlocale() accepts any
locale name, so the C fallback never happens, but without the
postgresql-regress Spanish catalog installed gettext returns the
untranslated string, which matches neither expected output:

  FAIL: nls

Install postgresql-locale-es with the ptest so the translation is found.
glibc images without the es_ES locale still take the C fallback.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 21dbad30f3..00545ec74e 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -236,7 +236,7 @@ do_install_ptest() {
     chown -R postgres:postgres ${D}${PTEST_PATH}
 }
 
-RDEPENDS:${PN}-ptest += "${PN}-client ${PN}-contrib perl"
+RDEPENDS:${PN}-ptest += "${PN}-client ${PN}-contrib perl ${PN}-locale-es"
 FILES:${PN}-ptest += "${libdir}/${BPN}/regress.so"
 
 # server needs to configure user and group
