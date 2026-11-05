Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6640.1793913800195311484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MbdQKVLN;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535a54bed9so3138407eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913799; x=1794518599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3LhxCRDW7ejRhMafqTS44jzjbnZZdEr+g85gFvYhac=;
        b=MbdQKVLNLZXRMuugZUUFTozIM9qbsQ/nT57khYPjaYkqK/Q33/+nCtqXiHqDlEIdu6
         SidC9OTk8ckmLgMWTaQq/Dwm3Wi0LlgcLwvx+qG68hKS6xWX1rzCG+/IY5ze6FAFnv08
         1YE+yrjHgqM/ZXjW7UOHFo8Qo2KB0DwfWdPz7OQNw0ZPeWUR+ZaDawIa0HtZoa91oF7Q
         +InegP6O/DtOhC/lINhxZyb1cKbKAIOhJFdxjogeD8+uHV75bB7W/7BYS2/eHbB/C7WO
         vCfMgQzdoLoy0jXkcIS1c4w+8ZUFmmW4RarChHdcPE1u44nUhbVdLbaES/MGB7wUX30u
         KWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913799; x=1794518599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3LhxCRDW7ejRhMafqTS44jzjbnZZdEr+g85gFvYhac=;
        b=mnT+TT4PeEnMNfoBtjRnMYMnGP51RLnyiHZdOm4R7sa0T8xgoeFsaJmKNDdPXsGuV+
         6fkW1CPEoFitDWi1eeYrTcv2HV4CtSq63RMsb4Y3q3i3LZpaxrN77Cw8f6IVXep58U8I
         dDW9XoyaMXnwmX6Wz/hK5PNCqV6MieGTzq9a08l76hUb2fG03DxuworjhojrQwryvPWm
         jViJee+q5xvc6ijvt13olfK6F5zlpc4nwh6I55HmECX9ZkIhVVOcEmuP1LM1Ygt3Jtv6
         6fvFjHDog2RjIv84qc8c+sHmEnDBaRM5TVPOuXU+uQIzghx5HHLu4TqDxEhR+wec50Y/
         wrLA==
X-Gm-Message-State: APuU4Z/IcJ5bXLvU7Xzf+pOOw7hpFd+n1ScaCWWkUC0R1MDJ6OmIMoKA
	IrGU9fkUesFt//byLZZK4mvPd08vZqGify5T7a6yd8pSyw4ggIdTeLFBWyWtEg==
X-Gm-Gg: AYBFou0sURJbH12n7JGAwYfUVSboMGL4Jm8bQLyLuc1lj5Rv2JzP0stXkKSgCUjUowH
	hfNkFzG+fus3Tx2hxzW24QbDh/tApLJoB00fUJAa8kN4ska0MUN1FHXVER49lo82MOvg5bLjugN
	fbZl5YDkWKqDANvkImIm9oy9nylEGZw5NhJrjpAkqSwryTAgl0AlOD0zCGjpRknYL8uBuYPDydR
	XOJEhVXEQJWAwHJn1GZEPdNLXfTPmO3H+i8/tbFeK9spPk9gv8IgIv6hPiLVZ3Txwj3EO/ht6uG
	pbuToOhTxEDfW02l8/2j306srsvo2LkQo2132eGbFvJQZaIjmvX41cqFrYQHjVnC+aajKJNCDPx
	0kBfs8xd2kTCQbRerLyXuGksCudY+4ict4EMuW6SlLSeXcxtcX1U0WhvW10aU8Ydw8FtaZTjHLq
	GkDrytPYaF11Xml+Rz+iu8RTb5q/J+mUrt2O8wjq30PFBRBXT/vUl+uO9Z11CFxSFnIicaNiHX8
	dgCTlhQf7WW/r0lq5bX3rvdK50zyoGBSZAaD3y7CPjQQjLMoIZZOn76bpJPYZ15W7MKyWFQNWqR
	ts+Eaod7Gzwffj3jjEnJiY3DEv/oxROQd8BtWOYvU8Tf7XACR5UZ3r4rk7Ss5w==
X-Received: by 2002:a05:693c:8842:b0:369:535f:4d12 with SMTP id 5a478bee46e88-36f729cf093mr595020eec.3.1793913799379;
        Thu, 05 Nov 2026 13:23:19 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 12/14] uriparser: upgrade 1.0.2 -> 1.0.3
Date: Fri,  6 Nov 2026 10:22:48 +1300
Message-ID: <20261105212250.490188-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131949
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
index d4be4b14c8..3eb4635fa3 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee448c532f53b07f1e"
+SRC_URI[sha256sum] = "b5014a630e61e085787f760c83675a35ef8e719972b05e8f61ff2f48692b15dc"
 
 inherit cmake github-releases ptest
 
