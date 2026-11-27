Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8056.1795739677801827275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DXXKn3An;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so10996640eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739677; x=1796344477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zGRG8NvlOcdHEywB31ZSP9RID+84SWDWVSuibCJJYU=;
        b=DXXKn3And94dMVKSmD3j8wMd4rWVp6XPXNZN+Ppgr3LroeYb3OcM9hy0gFJ8wjviRd
         tzog8ESPUxCNqEV7HQxUHvdBEJOGYhZkfGQqI79WX6XQJtDo5LTimVAc+CzUrRF/NxWW
         G+bU5EP91kn5L/qVnm7FXAotM/9J9uWTXod5MvVzkUgUh7sHADusfsJVN/JfVGMuNUhG
         2wugptI+WsDK8iwamIcx5IupQgEE/QLvw18lIlcx9v+bAtc//Ee3Z5lWoGtagFoZFvf0
         uuyVVuRKWewITQH9GqFTDhrf7DMB/DWNRiNaN5j5rkgDRtItuwxnra4mKyNJj8brbC07
         I1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739677; x=1796344477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zGRG8NvlOcdHEywB31ZSP9RID+84SWDWVSuibCJJYU=;
        b=UnkE+HsvwsOdA0UOayqUrKG1LoGLw0yOwOeUhnv/CN2OMqUXqngwMG5ZnQ2o1aKP/1
         AZi81bcwoDWzQFaOABGhQkD4+Sd7RPuPdBtWf/a9boIsOE4NimmispsUx+nNP/ZFE9s4
         UIS0aaQeKPTLzLzyr8Gdwbs5MdHcvY79pSTgC+YVomitJQ6ci0Bqmz70V4RrDme+EXCQ
         jtGEFz3kdVTfWnFcf5SYwT8uFagVnVEK3A3LiTiVoHZpRFRdWROrUhUg9Tdu2tMI/E6y
         yMNpLs/ubqPGY9lpn8oSudJQORMoiEYX8JavAjBiKEAM2VI5aRswnLrY35DczifsDp5S
         L0Gg==
X-Gm-Message-State: APuU4Z92Ko4rHZ1qAj/X7jyzNIGYY0tyBIOVLYAkY2bc0haW2kKJZSth
	hBtqPd1MLZ987EudsfwMTGVkW82Jm8pS8drMrTlWEhuoWarU73oKPjya0J74nomU
X-Gm-Gg: AZFdTZeR4nmUUP8vH4/qC73YNDEIoxvwr+EvVoVTd2rSZpmp6TPWtWN3Vu3peiUpzfK
	1N7NPLwA2fQLgALy6nGJigwxaRK4ESs8V5sJHPaxa1y1vLnVnkPGTeVtVYXIl9njDaGeU60to61
	etz3KsLxYk9nQDpmdT795GGjqGp3kwLxagLtLLvi7eZlvkso0kjmh8ddUZcv769HKcgY7SJ8Ovi
	v9g9bmIhkeHjeNN4yGWWWaDh9acc6BXOWC6txtvMoHgljGcUag0s1oJdIceFtZiXESfriJj4ZTc
	JDS7C6asDmYi2FOegLYt/Pvi87WPcZt62ejBxD5n2HT1UVLG9bkC6zzo9QKwD7kbcn74vZOATtq
	9/O6jfRnmwdwDwC7+BvnMscKhJ3Hg59RkHCKA45+2SRjBNX+zVGWC+FcdDYF6RN9Rps7K45c5dd
	r1V/iJNbytOokRVYK02U1OGITbnCdem/8ccQkr7Pjj5GMxx4I3RtUWBI83ludBlezdCyYqxGMq+
	E5sKkgkCoVCeNQCpQUEypJ/fXk4nGpjvEzbImiUB5NFbn+GmMGVfayt2ARnYZo5q9N6dSA6epkS
	SPc9qvn+/cGg6+cZ3xoSXnhuCexxxyAkXIvopRb/3LPd+iWISzo8Lxn4I1HPCsxmhmKxTfymRJJ
	ZaGy2TDHgQyxs8ibxKdtDgOA3rNE+af1aZwZJHrsLNC4xdz8Ysi5VsQc9zci25h5fXjduSbnghh
	zXRY97kBBL73rA9Fem87Xtv3GjFwRXaPpKAwC0Pwh49bUtCQtAYHDySdK344C4XQvkuAsjdQtfE
	8DmVTLQ25oUGd88W6uDaEb+BB2T4vJqhlaEOLAtN6q32PSiWTVFsN3YscIYdCXufEEjLgaEUrmx
	Ql0+
X-Received: by 2002:a05:7301:1402:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-3856fe564admr25698796eec.22.1795739677067;
        Thu, 26 Nov 2026 16:34:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/69] luv: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:22 -0800
Message-ID: <20261127003425.2166632-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133106
Content-Type: text/plain; charset="utf-8"

The SRC_URI directory is a GitHub release download path with no
listing, so the check found nothing. Check the GitHub release tags
(X.Y.Z-REV) instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/luv/luv_1.53.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/luv/luv_1.53.0.bb b/meta-oe/recipes-devtools/luv/luv_1.53.0.bb
index 1611b31366..5cb148ba35 100644
--- a/meta-oe/recipes-devtools/luv/luv_1.53.0.bb
+++ b/meta-oe/recipes-devtools/luv/luv_1.53.0.bb
@@ -7,6 +7,9 @@ LUV_REV = "1"
 SRC_URI = "https://github.com/luvit/luv/releases/download/${PV}-${LUV_REV}/luv-${PV}-${LUV_REV}.tar.gz"
 SRC_URI[sha256sum] = "569b488d5d31609ea466a6c70e008a42661ec773ea1584d3d766d46280ab7cf4"
 
+UPSTREAM_CHECK_URI = "https://github.com/luvit/luv/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)-\d+$"
+
 S = "${UNPACKDIR}/luv-${PV}-${LUV_REV}"
 
 DEPENDS = "luajit libuv"
