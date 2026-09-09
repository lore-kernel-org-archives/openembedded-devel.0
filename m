Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516D5C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7118.1788942752011646609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RdHNZzZw;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so3835236a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942751; x=1789547551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeUq6rGjkHmk/kdFjYx4la3rb3PGg8YohLUcbEqTPRU=;
        b=RdHNZzZwQxKq19xGa6cFwFtfg5qovcHEOp8a7GgTs7ewLGs7JaqFQyHhhctN2xnQam
         NJTOc4+wceM+3KYeLAkyMNkL4Ksyka7xVozsmRBe6UH1idqJTRV+MMpMdGQmDkpcN8uo
         06lxS9/SV7Ztogz333NqzAmb6pyYAqJpQdAJUcnqaYCRWwdzg7fB15ZBSlQLVF6jNM6B
         fv5OUrDOyO0swz2l6RikRsp4IBwvrcJmQJd3IEKEJMLlrNsDDBA0lp4cpIEB+t0ujsQr
         1qp7IJnVdGhqFj0/h5YgyxQ/J0QFUtCU5tgr9fYjs2u00Q8JQ/6B37s6JlhdZ1y1cbna
         +qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942751; x=1789547551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeUq6rGjkHmk/kdFjYx4la3rb3PGg8YohLUcbEqTPRU=;
        b=YGL8JYZqb/SH8PR9Yp5wTO44pCmutrXhYFkDWNNp7+8lywSZVtZsORa1/mrqrzN4B4
         yRFQ94lMEr1uOjhvDPotihF/oExoZ4IF8ZHEkh46MrrZZLd38FiCoMNCSBo7ZgeBFJQX
         ElkumFVmTCaK1pkd1xvly1TCcZVEs0Sx4045u5GYMIAGn1zJSoPHHtyXs08M2630757B
         TNiXijor+GnJHKEIulWLV8WgOsx+atSYgLiwnDH2P6To8/S+KncNZU1NJ/Bce1fhxuuG
         qlR2T/xfOATRS4iaSyBK1R2tzzTN1z/MUZQsYTogv/U5unhWIo+2nf1YhxSehYx0ZXXZ
         d+kA==
X-Gm-Message-State: AFuF++lhWBKDrBJS/CTk+tqtfpf3EziPaRWIx8lQPAQM58cRMZxf68Q4
	DKRuaoAge30AfxKTSjmfFmkPIGugPGoAGELMrPKLC3wYAuiG9lchODN6r+y0kAlY
X-Gm-Gg: AYBFou2THF05ialnpqrVXD/pryqQAlB1hGZYtiqgHUioXmk47ZMoPcFN89CE8NR5gnN
	m/FYfT6dkGUZbEr5SWQ+adoF+nBInLvAkA12cONlqRc1cR267SJFhFU73OU+BQp4oTbeguqjPrs
	gSK6D5P5OabsfkjMNuLa38mA0DfwcsO83UqvyY0lqti+IhGR9hjz3T4uE5N9mUZNmV0AwPsMauA
	9wbBqZ3rbnV86lXUmKrE0a8iR+1hkLrJUpbNgCMrag5Rg7UfIGAVvEQIjCs/e6BVO1gKMV5GLUX
	IU/A6aC24TSpBo+e4tFiZU9jVHYqVRPU+Kq5husnJqEo7aTAC7Rq4ak/PRDCb/opl4Nt2UilP/U
	zKlwSxa6hHWLzVsy797sV/d9zTuTGpO0B0lmPshs2gz25YGhKwh7aoJz2o1Vs5QumUf35Aqmx/X
	3q14IC59O1fCxvOoiRANKWXjkhZ2a7lBMeeQcKrl5lxep96m8Aos1W/okdEGs1h5wHwcTTt63/y
	iaX+CsNqtcAe0t3RG/NkTSmuV8e+zO0uw==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr48861664a91.14.1788942750984;
        Wed, 09 Sep 2026 01:32:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 14/15] python3-gunicorn: mark CVE-2024-1135 patched
Date: Wed,  9 Sep 2026 20:31:39 +1200
Message-ID: <20260909083140.2494932-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129885

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the commit.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-1135

[1]https://security-tracker.debian.org/tracker/CVE-2024-1135

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
index cf41feae70..90a903ea53 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
@@ -29,3 +29,5 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "python3-setuptools python3-fcntl"
+
+CVE_STATUS[CVE-2024-1135] = "fixed-version: fixed since v22.0.0"

