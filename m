Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7013.1794520739710039062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dWiGspAS;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso826584f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794520738; x=1795125538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4hAGVYafDNi2X+pXqluR312b1LonI2PQPj6IjITtgo=;
        b=dWiGspASQeB5iwKc+kZ67SSZzivs66iAvnPztjGt0dQyiisvLkaZCW6akiEoBcYg95
         IVKGrTZrAv2r2LHJfdF/YaTl7F7O/h/InAdaDahSJia4DS5s9QEi4rMmjIfVCIzXMIbS
         UE23MaeHIVdejIR1oiDa/lJSxjHC8ebyTKpxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520738; x=1795125538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4hAGVYafDNi2X+pXqluR312b1LonI2PQPj6IjITtgo=;
        b=Apfap04WvNZYpG7akFu2N5TTkDVjiq2Gv3AjP+INNLDKpSRW9bjWM7ivyzgw3x5KKv
         5UDX7S+AOe4dcnNYvK1suczjp/T/94kwTFgegOQ0la3OsQxbCOLQH7ZYgpNONaUqS2ah
         v/VBWJJjA0x+W151EoKR1I88SQ8quE8qAjEg9INORHHvSIeSlrRdV97DGX57Eli6Fwcs
         zWX8hN2l5aVveS0CxJpla1BOaAEWxUbGLyXSKa04YCMk+PwxN7lTZtzINgWDiSIVlN71
         C7eBMqPLs3kBqpGRr2vfL3vtffEnyhwyg+a9j7ldatjfXsOC1nqU/sehmeQjTFAtDYbP
         FH7w==
X-Gm-Message-State: APuU4Z8azhLKJhwzDrVDTeHZBFgJ6xZU+aLy1q4sxyZyt/s+qBde6PSZ
	A/0hYsm95bEYX3Obg+kpW8d6fsDM+e38yAc0CwcQEX11/83l4mi5ttVc793wG2nDSa5eYCCNm5b
	gDVpe
X-Gm-Gg: AYBFou1CUiMzYWdDlrtYFyd9cKUzDxYUcdvBfeE41klw9sdm0Oj38ruWJLvowkBEyCO
	q7SEE00vpSbj0HgK2iJbbKtvTMQp8oY+HAseziCuC5nuhY6elWfZB+GH8nPotU1x/3uzl6IFkl0
	LBph9bTzLum9Q7HfZlGGlUWVz2byZV9j/PwndyPRPnK93QrPaITY9s8Mt4Tyeb0C32JdhqDWBVS
	a7qbyU+T31c0vAfm2NZTx8oSF36lSoOEkVjPZvlBtScUdrSHPaUw0pIpfU65xts0WF9XfDLTl1K
	576wPDB2CbkZ/kK/wXc6uzfPT7LkZRppCbb/jujBh3c6iVGjJI+BK+dEnkpNjDDsrsH4Y4tDSN9
	5elJa4flTSjjfItyPqdmn/KUjLP8weIYsfCuqw2zODVua7A4sHCo6aUKuLcI3jJflJndrNBWmav
	OXS/7i63+z3iz33hQA4tf7lzMdUEw3LgKRFcp/DlB9AhOayzVXWzK3tGsniQtqE5p1TcSJrYl3H
	H4oj2tag0s+QxRDPBGfMGanUCdO0zqTV57lrU6D+/dP9lJaOV84HHVVUd7P1DsPoGiJhjeT7JXF
	mvjCjE/KZd6furLc55S6r+b2xiu+wrz1hpVIZ2kjzW/ROslEXWaZM2+HpdaYPvx2wioRWkebJgI
	WJ3+NnT6hlcmNjxLF2kJXDYs3q7fiq0cQT1wgS6jOjdcaXGBP2XtPTQ==
X-Received: by 2002:a05:6000:288c:b0:49b:f7e8:6f3d with SMTP id ffacd0b85a97d-49bf7e86f6emr5041166f8f.18.1794520738060;
        Thu, 12 Nov 2026 13:58:58 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm1043896f8f.18.2026.11.12.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:58:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cmd2: Upgrade 4.4.1 -> 4.4.2
Date: Thu, 12 Nov 2026 23:58:50 +0200
Message-ID: <20261112215852.3336380-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112215852.3336380-1-leon.anavi@konsulko.com>
References: <20261112215852.3336380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132219
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.4.2 with security fixes:

- Fixed shell command injection through file names in the edit
  command and Cmd.run_editor(). A file name containing shell
  syntax such as $(...) or backticks was interpreted by the
  shell instead of being passed to the editor as-is. On
  Windows, run_editor() now raises ValueError for an editor or
  file path containing a double quote, which cannot be passed
 safely to cmd.exe.

- The persistent history file is now readable and writable only
  by its owner (mode 0600 on POSIX), since history can contain
  secrets typed as command arguments. The permissions of an
  existing history file are tightened the next time history is
  saved.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.4.1.bb => python3-cmd2_4.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.4.1.bb => python3-cmd2_4.4.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.4.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.4.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.4.2.bb
index e3e8d075e6..577eaff41c 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "e8ef3f9bf2fb8f72acddaf934b97c49d14c6ae2be7271c547b97593abdea6c1e"
+SRC_URI[sha256sum] = "677696e293a1a6a310425d3d52e470518078918585d650fa7eff10635ef4256a"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3

