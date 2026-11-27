Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8059.1795739685699513005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=o/9zuv0U;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386cf1041cdso4191201eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739685; x=1796344485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCpwseJFfsNUQgY+H2UElmsaCevhkdz/LqKi7hQ9hjY=;
        b=o/9zuv0UPk+E4zoEBeHAmdFdGdt39M7TXeTPoVT3CELxnAxraYN6hoqk7ZCMMG3cUf
         JoUHbh0Kp2Rxm2x/Vomxj83N8n7DznLaOTy59S6J5f/AddW+fKE6/tx+G25g8Kj0IcNM
         ADwXgqHKsA5PCxScdnSThduvKoydpe423YaJuKm9eECP4QgguE4Wae6sgnt1bYwkhLiI
         gSUerc+3jzsKC5PAIOndP9ljejrv46irFAXDL7HN9gTXYXV9B0yacdYGLJ9No66ZTvkG
         CEMg7gkaBMFwXjdvzw/ys23nMU+khumxPAILu/Afv9K5uNrdLEEOcS/MM9xg3vJCfvBW
         Z2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739685; x=1796344485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCpwseJFfsNUQgY+H2UElmsaCevhkdz/LqKi7hQ9hjY=;
        b=awog0ushCygQqgRzHuPuGzT58mgPG0tZvzku6c6OhugG5QJwW/zy0UwrV7PHs9nWdA
         I0Y4ZQ050WrbOPFIFMpN4W0cGLDQV8/JipWCqPfpBJlNz10EMbbKxDLu/G2K8iHYDdRH
         rc0uaUDeWWMhYL7E1uufRTtNyAo8b0CiHpcYuq/vm9zizuwgtWCpGT4Wzt+QXZCKqlDO
         BOlU94tC+4zKpY/ISr2Qays5Rxg2AtNceUilMmI41QtJP1Nek9rP/Nsb+4qCFllsIORg
         8x2ymdAR5OGGlKcE/bg7JoYuJatBVgud6wox7T5hHwQsIiKRj6u4nX7CdKQBXnayqoOS
         FUnA==
X-Gm-Message-State: APuU4Z8xNmD9Yp1swGX/C7+sFbqKofkVgEe3BWSYITou/lT4LMpFtuDE
	SFELPSUgWDY6RZTxufrV1khvHIvXEwTDqUbnzWtbzo2XMtC6nPuIFLTLr37V7tJf
X-Gm-Gg: AZFdTZdZE1myxT67T1+nmth+4O9n1XFBf+lff2umfDqUXysUqxhk4z0wQX3TYHPyo7B
	85hIIaL56OKyx/GwBbthgPme3ka6ryTXfWV80uvYTgYq1FzmiwJiH9xc1kNHnyPxtHokf2m2rHc
	I+q+M4a5+YaY6bgpHZy0zGbi7mCpISYAKXpLYxOoWvIK8IrY0esMYYlKeBOwbqYF9EG2q2/zFY5
	TndWoWI8NJ6e7UKt3redKEymadlD3v9oCsYnz+FrC7bkTZexl+G0Fq+peH9gJND7v4IS7yleFaE
	TWpVZJY/YXJ7d3Lig0UzV68Vvu2xKzB7y+v+4mZKmQATv6afGevVj+nvkgbib1Rwtj2C1xFF23s
	HHZDev6rzskN+y5q85yEzrIw0AYtLP84ftFpUb0SczQPmEqfmUaEWNBLvcVqnDyIfAVS6ET//TJ
	g55cTXSAJZcjCY2vNZo5C+Fz0gJnKID/uUhBMdWDIh+CWQ1OYI/eMGnu6hHtdMLRbPO40QQGdw+
	iLgm+rIyvQf0/OHQA9uZBQ4dnqKHkRSuJtuX7uBvNs4OjqFtJWHoUmk+cH830PThnfRiVVNq5Ih
	Nr8csYGvq46MIVJ8OHhz7f+lpnXp9XSp4o1OyKX2/vDWSR1ySD5cMYfme0D8EL45HMJM7gSvYuo
	zVXcDjELLS6Jvb6Qe+yAnE718b8x/YoL6Y3dUCFqnUuEh2A4MinYO+UKm/m9+l36WG3e7Vh8VOc
	uaPF2Ds0cyC+rcQJtbjcVW8PkEwb6aQTVRExWxMPFoMVCorH+KAovRHVEaAqiTeMSgrEzkjL4Pd
	7VStrZSt7xXTOrIP+twyekVuiCXqabdD7MIuT6aYi9tdi01dTCX+p6bjZYpZNNE76mxAZAjHe7J
	hO1t
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr8427364eec.29.1795739685001;
        Thu, 26 Nov 2026 16:34:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/69] influxdb: Restrict upstream check to the 1.x series
Date: Thu, 26 Nov 2026 16:33:30 -0800
Message-ID: <20261127003425.2166632-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133114
Content-Type: text/plain; charset="utf-8"

The default tag regex reported 3.12.3, but InfluxDB 2.x and 3.x are
separate rewrites. Only consider v1.x.y release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 7c553b647c..468130c2a0 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -16,6 +16,9 @@ require ${BPN}-go-mods.inc
 
 SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
 
+# 2.x and 3.x are separate rewrites; this recipe tracks the 1.x series
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>1\.\d+\.\d+)$"
+
 GO_IMPORT = "github.com/influxdata/influxdb"
 GO_INSTALL = "\
     ${GO_IMPORT}/cmd/influx \
