Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8054.1795739674751373505
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WTkzCeG7;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385d8a00598so10996599eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739674; x=1796344474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnFrnHU64biHmtnQM2EUnyLrtUqTXw8afiFiUbhAse4=;
        b=WTkzCeG7qYV7m9IobhBMcmbxl6xgL27Q1nWsS2Ifk6XcRh2oOBy42ji62cKBT9/wqR
         Jcf2PQglnJknCY/XllvmZ/inzfDp4LF5Rmn5cly0aih5XaO3TT9JNKB4pdJQx4Zv/tkW
         LzoZMuSU5frcHIhrZe1N+tHEYh1Geb3kUy0TJez1ug7m8I6KQ3mK5ONr0XLFYzlvd8fw
         7eyCK7PCcnvE6HFWziHBy0BSK9dvpofa/ZiRK2+lh+RvAxr+eCl42Bg6fje3ZDVIHEiL
         YBlEiF4pYl8bQI/kV1aYwXSmaq1AdqgQdvPLavBWiUHVLfGYtWdp/GFnwL3TIEukisII
         r3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739674; x=1796344474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnFrnHU64biHmtnQM2EUnyLrtUqTXw8afiFiUbhAse4=;
        b=nuKufpBXgk3TuZko/xYJ7B7TyF2gDdaoLZvcPuRoktI//JbD3g1O4HvIIHRMMLI0ja
         a4EnyvojQKgcDFOSVQi7FS37zzK3CRThfhe4HSvGVBJiv5z0TXabVbb+BM0pRXhQnxzj
         ucOL9Aq8Tp/F3a5lN2pZwmllVr5oq9kHNZPWJe+FIDOeixu+p3uRMQ21E0cGYQj91T/k
         pJCajqvCeKKOvXsBzon4LCL4+0ZT4DNxjJdjElm3wIbYl35YO1KqrX8+TQ7INhTm1cAv
         lF3qgRpK68BguS5j4IE5fowSMVILmwSCwGW93z42dLGxrYgVMpj3VJtRaXxz8PtN28en
         oMrw==
X-Gm-Message-State: APuU4Z9D0/3uUbGBFJ7AJ+EiRIAvd/r8n5J8rJBmsTPFRXJp1wiRZY7A
	fC3tRylAqaRm/kvzsirsFZmY+LB1AzgfX9bntK4pGu77I8cwS9EQFskwebmMGP/a
X-Gm-Gg: AZFdTZdDvBbje4UHyHNM5fkd/kkHvVV740SWYXtFZgKtHVAywPw5usVqqU0Tm/jkH9s
	u/eU03Yk6Kd+1GFSGW+YxTnAwP/MxNmz5QDtfohkLkBgw1AFarWF7ybKQsemE+zDZFhbm8t3066
	MFtf7UqIFXVN+NwazVzxPrvBdMp4xfkVaRDHsoaCAuwSxzJRcicvNKFOEu1Q9adqApLccy9SYuH
	SLA5JdO1TLxUX0AP7dwve94dSu/O+2W+7ZFdrNUW12tEbvV+78tftWyNWv61FGVYCH40YyenCPf
	JI1F8MXg/sUwj/TZ2Sq/ZgcVQjQVl54v0RTi9I82aXZ9XfUGaXLYo4GqJjHIsBFIQFNvURF0GoI
	hxMOVT3e1bqoPeKk7Gl9RyQ8SKMtyaTEk4U5+s4C2cd45qLuFSoQwwLvJXD1RUAZRTGBau2o8DP
	Te2jbV9S2WZSUzdXp063HvyQR9tWHbrl/gjKdfl8S81QUhlO8WcqxJWZ35xcwLPqCRcIZrdj0DL
	9nJ3kirBBKP/TXUeRyAizOX/9LMM10M4qF3HBpgQsFO/At0x81FjTkSWmeYvzufJqlfywo41xIn
	94SMTjjxXfk+gYHFXNuHSXoGTcOnYa3AWJYKZA/9pshYhy7stvAH6elQKwYPaWCfJm74+/SitkV
	nQzGJjiVf/bt8xpIIFVRVb+iAtCzdT6dHNdIi79ElXTT9m1QPkTU/DTzyROchxIwrGJctrGofiI
	wyxaZqGD5KgsNM8Mc7TV/Y6dy9GF8wXQchdAKoWrzX+Fc1y3Z9eQ/Vtb5OEEncUfUtNUz6NSQdO
	wXCDL8f93omh2uwb9fBQ+Y0vrsLo9gVzXj3NpeCsxBuEmHxhAn7nZZa9QIg/Ch/uakPD2HPX1Yw
	jy8k
X-Received: by 2002:a05:7301:1505:b0:384:df31:6a07 with SMTP id 5a478bee46e88-386a87efea0mr15004525eec.30.1795739674031;
        Thu, 26 Nov 2026 16:34:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/69] ace: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:19 -0800
Message-ID: <20261127003425.2166632-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133103
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the ACE+TAO-X_Y_Z
release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.8.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.8.bb
index 6808dcfe43..3fa95b0a4c 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.8.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${@d.
 SRC_URI[sha256sum] = "d56f06d99508139e7a537122fdf52fb0c4d17805510094527643e1007857c421"
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/ACE%2BTAO-(?P<pver>\d+(_\d+)+)$"
 
 CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
 
