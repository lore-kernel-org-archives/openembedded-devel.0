Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1136.1792543042998698957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 17:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TnAu5vAh;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso286818eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 17:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792543042; x=1793147842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2RZofVJNAfGBcbbdf7koszn4mqyWx63dVMMHtv9Txxc=;
        b=TnAu5vAhA1YHPA71RwUwbHAsnMb/lhFwlf1Pn3FWtgbNWHlAYahT25XCsAwwxJM0D+
         viXYGHmxl+hWrE76UwLBWZjy/YYTeCPUa87O9LSf8rplsZhxKccjvC6wHTifDcTUzbaX
         7/O2osJfnNOMccWSVShZvd2vC/CUsmyRHTXInhuXgKBF3lZH3igfQUw9CvtH+kPnTbzJ
         jSpCVJJnENvMbzvSSLA3twp01UAp9fgYIxMHFL2XRJG1yyF/O334onA8DPkbH3x/A7Un
         vhePypmOb9JeFvYbmuqxem9ATeutvt37S2OWRWg74xnB2QEbNWsSvWxqBm9ZgW5LESj+
         2vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543042; x=1793147842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RZofVJNAfGBcbbdf7koszn4mqyWx63dVMMHtv9Txxc=;
        b=b3xEk6XIgWOcIF2e8MiQg0umVJ64+wp5SVxkC2JWdJ8yB7xuX+Ew0acORBtjaA3Eim
         2JBGO+Zh8guvagMqdREzvLNJZ/ydWd47BscLPZPTGBGaZbHDgSnAsxpeWR+v9S+VpORS
         oG5WeWg0ihvdQAo9sIqH+X6za4kc7S/LFfD/iKmEDyd7/NJSdGG57TMvg4unstlQweJA
         g+Ep006y5ou+xwIUOKyXsj7NdwO2Bizw5zKVN8cy7JN3HQcv2Jh2ghFeYFUC9WJ7PM8J
         baldGAcayLinNzDYR6FHA1nIdS8NfvSynhPtA2R8mWcFLfZWuEbXmyJLiAdObBUQKFYw
         aAfA==
X-Gm-Message-State: AFq9FYL2sHrT8G9yif4/LPKv6hd1UiCcbRne5y18npQ5YTnj5kU7WmjC
	3muoQtzjzAkftdaLWYtsQ7UxOt2R6rJWG+yzcy8/Ss7FnY7XQZTp8TCdhVrRdw==
X-Gm-Gg: AYBFou115oSKmqtGQRNZ9m63LwlgaXd8+ypsVcPUzZx0+lzef4aXEh8hHEX6dKZgj0/
	cleq31yVpG6JFjsl9z2sNLqZVhzkNN2oeaROqXBzH7wYK4sSEYCpCd1ijom+c7hwsXzbs6SvEl3
	j7OwE0QUFIbbWKKhmRa6BRWpGD8XldF+mKRndG9kA9Q0WWS+nkK8h0Rbyj3vlgVyizbjFvGATU1
	2HZyNxOKwQp+NVbvIE3Unqi0xskgmJSH6YMQDy9Pv2NX3gjrwe9daEHQAE/GZJgrTPwpEhBKUJl
	3R/sD8F5kHTl/5NPsccO/okWfXkh4e6MgWpwOI0hyfQ2VyHRnSjIXFZuFUWJ67pHZUBY+c1QJrI
	NBsBiTbeecTiTvIbNG2B34tK0/zQ/J1WPtVTkhf21huBHX0rnP3jf/i+byocQErI9kIWl2JXsvm
	JD57HAsrTcOjxiZedu60FxnehVrHsNE5VkhBiBIM9uNuRPpvPtoTUpx3mkb7CV/YGOfrpUcQJM/
	twAB1uUiqUWT/Brw+1IhgsxiYKMAj9AXBIcZ2PaqGlEn7K+PtcxjS+w6itRBr3b87NPjwlZoqrp
	OszJJcfxe9e5Qx55oDBtlE9gFsC5oQM=
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr661238c88.37.1792543041773;
        Tue, 20 Oct 2026 17:37:21 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm1648124c88.2.2026.10.20.17.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:37:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/5] cifs-utils: upgrade 7.8 -> 7.9
Date: Wed, 21 Oct 2026 13:37:11 +1300
Message-ID: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 00:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131179
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

* mount.cifs: validate username derived from the passwd database
* mount.cifs: reject option delimiters in username and domain

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cifs/{cifs-utils_7.8.bb => cifs-utils_7.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_7.8.bb => cifs-utils_7.9.bb} (97%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.8.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.9.bb
similarity index 97%
rename from meta-networking/recipes-support/cifs/cifs-utils_7.8.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_7.9.bb
index 7fe76377e1..6c6edf9f68 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.8.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.9.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "be9d47cc3c8f3842e8c6418885525130eeae87ed"
+SRCREV = "0f211c3b9a7ebe326abea12d306f621067b62f29"
 SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master;tag=${BP}"
 
 DEPENDS += "libtalloc"
