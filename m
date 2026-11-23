Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48492.1795411798926387841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=D0o1Fa0C;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so8132009eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411798; x=1796016598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGaDMFl4zQ66gA9HDpZhCu6Kwa8IJrfdqcyyBWXfTdA=;
        b=D0o1Fa0CqveuS5D2jGG54KfjrpxjKuZUUtaRv0jie5BRiDQMmzFDvrvNZo2Mr1Gmo5
         1ZI0/MDSJVUzq+9aV/BuZgZ1iN5Tp2w7OYhycyUN/cf15GNZbZcv9+2fky1i4xY6vzA1
         d9U/S3LAn3JB/8hnuhV3uVDX6Cm2SyFtgW31kFpEs8KYhkBhsph8KkAn6k9Cz7iec3Sk
         IHGeTMLj5iNTAxo00pt+wNtDkL3W/Qipis0fja2bd6DfDymF8gCVKv56eiA1yD2Mgm2N
         Z9CfIT7ziyhtEbf52nrJys3TL2HHeulodkVcAWp4F5cB5mxqo+PHSAEzPzALAUNvzpGF
         0ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411798; x=1796016598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGaDMFl4zQ66gA9HDpZhCu6Kwa8IJrfdqcyyBWXfTdA=;
        b=Gofu4t3zM1VlSNWAjYvRay48uSav/qGrV/GzUI4zC4xDVoGB4a4zh70qNJSLew2IQy
         C5cICIPlcRyz1YJ+ufs7fVDXyT5XI3a+ixIX3cejs50VILGR2DqhlsKmXc0NR5WQCqoe
         6Me45SsfHH1fR6Nm9NkrAItvr4XcczjliNZ3S/JmRbkoytmzOKAOachej1NwVuvzjd9n
         I9TQO+L4BEa6gSum1a3ENqQE5ryYjTdtCxaI2vxPuE7cjfE0gEjxiOPhOgCwsuD91i6j
         LyH0e5UHOnGWedpY41Hq4Ig7FvYcOWQCbCiefycRtiih9zEGDSEhO4+C79DNiugFk6XH
         QPiw==
X-Gm-Message-State: APuU4Z+laZ6Bd10/9v+nGrb4eaD1UdCYrEZQOhOAkV66nEDmZt47qGey
	FBn7gLrzuVUGw4mvMff5VW/Cda4BTqmE/vEBQxR3jY4lqVO7gxXfPj0WPlJOMNLVY04=
X-Gm-Gg: AZFdTZeLYfNhCy5StR85qBSXlgeYt82TiQ9nNF/xS7rIiO4sySlNIN39vAGbLm70UoB
	/GyoGZq5Wj7xWxbIpqu9bPW1eqvadTKR5f8J7RS4MS5NgF2K1c/y4eidgb7uzFSLv7Voay29nBh
	D9u3eYGujUy++ddJKih448p8BnXSSqrGLZB8qZ1coaw/XKhzwMP72dBqW4VQCwipZIutSnuZPcN
	NFxg1cOf2vaFBOvV6/ma4kK7gvgdBVSpqnCtJkdsXxOJ4EyFvhneKr+iwWHPp3DmwAjHWcRXBuK
	Y52J6D+D/z5JtHnE8/KdkuJsesvlcnElhwfjFX+GIN5Kr7Q+PqqrdbRWEzh1rBPLmuxQo5xBdJn
	aSo9Qzdnx4vJjCQJG0MeHV0X7VTn9tzEdoheOo8fbzUyNQ93trfAHOrmTQAWtzqf9RS4EfryvLA
	djluqy5jOdlpiovNvGic1vuy3vG/kr72HgO+B0P1Q9ssEk11Aziuag77A/18c9wIVHMUo68wGKL
	InqLeeEMVY4su9ErU5K2GmLwHdHd3AwKx/tgyqXSBCV8iE3YelPohvLStIk3jujrBtE0bX7Hgtv
	FFcBX4bBsPHby6hRy3m9O5n2ydZosij/T+F6kcBd4GPzOBE6KR/pVeFhZioKbJnhAhT/t5Lh7pc
	bqUVqgaCrqduTy8z11r5gBmBpxaJAYZlRDngGqEs0IpFRuLWq9qqklMdDGGhQVgN1/upNV1Iu0C
	KcUVGhn2ChYhwDI7O6o1PfLEiq9aSWOyd0bYhWyvqFuYGQfHG3GEZLUJow1ZWaR5rkjpHqqm7Da
	AJwcv7mBgzz4IfCCYFFWTJc6eKci9kg37Yk53BK4AWbrJhQrS9cZbXI4c/fvZCPQPbmDJVRBRwH
	oP+T
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr4458442eec.31.1795411798095;
        Sun, 22 Nov 2026 21:29:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:29:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 1/2] exfatprogs: upgrade 1.4.4 -> 1.4.5
Date: Sun, 22 Nov 2026 21:28:18 -0800
Message-ID: <20261123052953.3658549-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132789
Content-Type: text/plain; charset="utf-8"

- mkfs.exfat: new options to set the volume serial, disk GUID and
  partition GUID for deterministic filesystem images
- mkfs.exfat: set the protective MBR disk signature to zero for GPT
- fsck.exfat: faster duplicate filename detection, and no more false
  duplicate-file repairs for names differing only in length
- Version output goes to stdout again
- Reject invalid boot-sector sector and cluster size bits

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../exfatprogs/{exfatprogs_1.4.4.bb => exfatprogs_1.4.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.4.4.bb => exfatprogs_1.4.5.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.4.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.5.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.4.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.5.bb
index 294126a350..9429328645 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.4.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.5.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "102bbdfd934776c12c6d83743a31ec648f8c2f1ddfa1832b6e13b6efd09412cb"
+SRC_URI[sha256sum] = "68464a07d90e9fda5475df68800b88eac2bc76076d157fd13cd8d936e0c369b0"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
