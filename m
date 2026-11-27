Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10331.1795752998157507997
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K7LzsjUY;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8649266c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752997; x=1796357797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrGSgW0oYb28WjqG92+aHMXnZiGLBu9mXMBiPbNs074=;
        b=K7LzsjUYZo8Lj5EsDWIZ1lVDLiyTOU3xUJOw6riphpBs9gVy0GiLU5DG/bGVmk93yu
         I1uMmy91DHMz7AMCsstlKrGbDpG8Tj/3F53b5G8SRw2BO15nyQxR9kgX+yDWzEEy4yNq
         Yek17orbQYKNCe3U6/JRvNC/7FgQLXy9vgg7a67ziIaf57CVu9rzF8RnTiTGy5T6Rs6k
         R+4okG/5s9iZOMj2TsyODcC7X0jkybCVM4/OHjHpqzdBa49yD3oIrBEQlXwaFKOldCld
         Ir3oBmRiyRL8rnplR7B48y+PvClaleSGTstO3muHN5kM9FqHKLWIFdpmGQp6jkjWhG2o
         tLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752997; x=1796357797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrGSgW0oYb28WjqG92+aHMXnZiGLBu9mXMBiPbNs074=;
        b=ju+fB8ZixRvV0SU3PxQGkORqDxpRd0YaxPB5pldWV8VHAfgxDr66GyGtXInYjrZr3F
         V0Ssok4kfUveWurHQ4lVoAPGJ/lGFma/jfLJW3r5cM0QsYR6k+MMIoLkQlssKTiC3AvF
         QsmG2ncCr7vhEgqBAnvf3vWgu9HhZtexppWULLSAOaAx4LF2RfPV51/sQEmrv1MR2YMS
         cqD5tH0a8bMN0fQCwBYnBxjqEKLrtAdauABoepAaaWdHS8hbGgLVf/2n+Q7KvKpp0H+K
         Up+GlpBOhsaASw/YvbcxM58Ue1mPWT8EEd8CBiFtfF+qu100zU9r75ex3P+tPtR17Zg0
         0doQ==
X-Gm-Message-State: APuU4Z/DjlutrnZThZvay6OKtOWtticEiH6eHl3IO0Nkzq6mxPHVz29n
	+beOmastOb7gIfXnRw7nM7CHR48RSUjnkuBqNWvhC9V5m8aleH+TEOA/sEN5ZQBG
X-Gm-Gg: AZFdTZdVdPxH1I6ryD6pFoJxNceWC+RDj8A8uhtQVXwF2KN5mBkKla9eXji+mPjNdCi
	QqWh92xLI59Rgb8KaXtFydlgQnBrppWNbJcO9LEtPHiY1vz/7obETztOHLbLhkS4vT+1N5ZQUeI
	JM/azVdHGNN1MaZaOCPFk/osKhN/gqq8leNt1VYIoTsMje1a1evAoozzDcd6AhXS5ry1qRUqvpq
	qPNjblWpiVMpWBMPU3UmlpzNXFIiQA69Tqq5BLzpBXLrIe67AYL0RROFp0x+F0A+CSAFtK6XhcS
	8KCLGW+inn5CNpdV75AYI36FcSEHXi0HcYMI80TXPcbeH5UtlPVmSW4NBcm3UOM3fwG9/ZLTOXN
	XoVPtifli4p6tGwO1nF+CZ4OP7lDYRHWBb/x3cJwAA90920yge0u5mNNSwNdFZ1KHdOBRR6F49i
	5OrTzkoK3WcBFdHEh0AM5AAizNM27VoYy2/Z+3q2iETGcNq9A5O+kvkLaHLH5M/9HZphUeKltqG
	ETbArhykSCG+Tt53kvopke5Z07A4E0AyJaUcTB2xYHj7UE6nYln4KGJgeViqNTP3lLEULpKRGxZ
	Gdih+iJtl7lnV422B1SeSByoG1QaQ2AMmbNUn70dl5yOKdoLT6eR39pz1EriTCxULln82GHj4ug
	Ug2R8zGVE5mEpUt+4aeGapaLHwYGEfbbzleJ3k08XfwTwnrQx63ohzdb8QDKvaztgMxGMDyCV6M
	G2mBTYVhbY/VVaZC6ce/NpbVI9T6Qs/oW0rdxYfWnAhJmQrGbIBeNd4cANVkW8eb50CGHj33iRx
	emRiI4FrgTM2Jpac3wG7VyaZ6fyI0dMhbChG7iOOVbM0J/2WOCw5gcJ08KG3AYz/9Rb9HLpL3cV
	zCeY
X-Received: by 2002:a05:701b:2319:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1b55686d5a5mr20175595c88.13.1795752997475;
        Thu, 26 Nov 2026 20:16:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 18/32] python3-sentry-sdk: upgrade 3.0.0 -> 3.0.1
Date: Thu, 26 Nov 2026 20:16:00 -0800
Message-ID: <20261127041614.1775064-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133237
Content-Type: text/plain; charset="utf-8"

- Coding agents that set up Sentry get a one-line hint when tracing is
  off or no logs are sent; it points to SETUP_CHECKLIST.md, which now
  ships in the package. Disable with SENTRY_AGENT_HINTS=0.
- Avoid double span exit with agents.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-sentry-sdk_3.0.0.bb => python3-sentry-sdk_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_3.0.0.bb => python3-sentry-sdk_3.0.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.1.bb
index aa03b6cb25..019dba499d 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.1.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
     python3-certifi \
 "
 
-SRC_URI[sha256sum] = "daa5f0baa931dfd8c4d6844b4992764683a1abdcbad968c76703c34f0e244f13"
+SRC_URI[sha256sum] = "f70e3b7e789e2bfbb8d5614615037ab73303647aa7f782cc442452c6289696d7"
 
 inherit pypi setuptools3
