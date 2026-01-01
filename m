Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70805EEB57E
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 09:16:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101672.1767258993784375541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jan 2026 01:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bez6gaRL;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso31668835e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258992; x=1767863792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi3sJpw5PsvOPqb8+nPKonDlzn1ugZzqLeLs7OkNRWM=;
        b=Bez6gaRL7g4VIPGjv72QeaYUzVoWvqHK2SWKaR70hMvW5huSPQBx4ByFxPcJek0HCb
         If78yWaladPBhk7R4uWkZTzW7X8JW1iYyU9hdZiWl6r5wtjXx6jiEOYLsvYOb/IxniEC
         GkHvRwyq0Bo5JHchcAoMQQEAERpOBw7J4QiPq0HrcptRjKAhrEZTlAo1D4mCqGuwMRs1
         QMseXT96lRtwl2rk9TFcR9tM/f/dss9cr6GmvwM6MdMqmTcjHMBHKb3jtyh9F8ARATkn
         XfgvsWoBItwqqwbtHoISNaWktXPybUSfo1sYzRW/eGWOIWhEDp9thVWkQZjwD/BC2Toq
         /c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258992; x=1767863792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oi3sJpw5PsvOPqb8+nPKonDlzn1ugZzqLeLs7OkNRWM=;
        b=lfavSflJ1uXU+pbDteMBI+lollcCX3XPn1b7X4sz/v2iXRs36ZpQFT0WgzKjUG/1bb
         MEluLLzslg23c0D7bH7QOZ3cz/4eRfzIUQ+D+elZ94kO7sajn09VT8vBmYFF0QlEjlWV
         3O/KbpoDFHyEMSUw7YxvmYHm8LeWZGa+xwN514wlGtIA27R9rrecJlpwhMCHKTShsCcR
         7jbHRkMAKZSGgOxk3KYcvDWfLCRPq9lhDjCIqeXSDTdFxh+SFhKDKz8Q7+a8v/Ai+DRI
         TRm9dkpH7Q14PG3y1sxxRmwZdPVsSArAtuFnKUKJ+8YYVE6PQz+dHKZ99phHEi7zC6Y2
         4wIg==
X-Gm-Message-State: AOJu0YzW0Jq77/2Vew8A4L+S5gtk89w/1NClL4tOH3hUkPs1Z7+mxlks
	0x9eDXzIo2PUHQK+gyxQ5c/T/SewOS8NAolu1QK9AY3q/j6Xz+v/oh/jINlsvg==
X-Gm-Gg: AY/fxX4Oo8rRaojN7mxuECvrCc6QZ1cS65bsOanY/1NyRgR9dHReJNyURpqXsB1/JNb
	CbDIyrBFW/jxO2LzA8HQshM02imRIUxXI5RZZxpsER1s9Baf4wKDnxlrKlZ3VNJxPrTwxc24kwH
	fv4nSnub4519i0+EOoq6MUuSRrcJaLe0MRNX0DfKB5Zz/pVOOWshWOM82I5ZKqeoErXyezSpQRa
	8jQBzCyUz6CHfoA6djFT+UyuxBfs4r9AnzkwlTL+U/IcsDfJXQjfEp0MCW9wX2V+KZS29Tm4X+a
	LeBZthmP0zBI2FK8uX+KsmuPLn4CV8ShXKHi44kHJkMxMSgS+oKuaQdgXR1OpXrdIONoH2hJwqg
	dDXpfru+9CDYtl76UvVWG0UsGYtyFQLOkT3PrUSZeImAVztOnOjK0YUO1C0l6DilkByJ7TRCS5T
	aye+QhP/cQVkJp6jYVVgc=
X-Google-Smtp-Source: AGHT+IGXj0MRM9OYSaGwr+3IuaTVFf9Ez1FPDOMknabgV5FnK+OjPzyQ3PwECWWnNtCXufPFjHecyg==
X-Received: by 2002:a05:600c:35cb:b0:479:3a88:de60 with SMTP id 5b1f17b1804b1-47d1959e061mr460780735e9.37.1767258992010;
        Thu, 01 Jan 2026 01:16:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm719752695e9.4.2026.01.01.01.16.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:16:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/3] proftpd: set status of CVE-2001-0027
Date: Thu,  1 Jan 2026 10:16:28 +0100
Message-ID: <20260101091629.3744709-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260101091629.3744709-1-skandigraun@gmail.com>
References: <20260101091629.3744709-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 09:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123085

From: Peter Marko <peter.marko@siemens.com>

This ancient CVE [1] is unversioned ("*") in NVD DB.
"mod_sqlpw module in ProFTPD does not reset a cached password..."

Looking at history and changelog, the module was removed [2] around
the time when this CVE was published, likely as reaction to this CVE.
"mod_sqlpw.c, mod_mysql.c and mod_pgsql.c have been REMOVED from the
distribution. They are currently unmaintained and have numerous bugs."

Note: It was later re-introduced as mod_sql when it got fixed under
new maintainer.

[1] https://nvd.nist.gov/vuln/detail/CVE-2001-0027
[2] https://github.com/proftpd/proftpd/blob/v1.3.8b/NEWS#L3362

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03a1b56bc7ce88a3b0ad6790606b0498899cc1e3)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index 345c714a52..b8f2b50f79 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -25,6 +25,9 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
+# fixed-version: version 1.2.0rc3 removed affected module
+CVE_CHECK_IGNORE += "CVE-2001-0027"
+
 PACKAGECONFIG ??= "shadow \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
                    static \

