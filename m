Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11827.1795763026635855371
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=e6F9eQuh;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f048476ab9so54205595ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763026; x=1796367826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8qKzQvXgEo+bbs+uOt4zzXvbZ8NY0jxQABybFpuxB0=;
        b=e6F9eQuhSkFEQBS2vcfoWLRDiwTCYsSApp+SZFN9W5B7LTuVDA+g+9+rjQ9A96PZJg
         +nJAwXQQ4TRX4oDyOuRglmTJ1T32PiY6grhiH+X8vWOdKg1EWsUNEs+lQ8qPyLRJbSnq
         Wf1q1yvyV1sEhOKjDyKVxF6zVDqlNPyeUJloH81Ni7eWZ1Wkg7ZZ3BeHVm+DU9Cer6SX
         W8E3rwqgMTBsaNF5F39bg60xCOoFLu1cdg+E6Ii3j85+HUr4E4ZfzOYEuunnU9/Sd4ii
         3z0ySn1Gvzh/hzlcZfvajK4/9+rkMtovKDr4MFFvyC3InyQHL9RwvCfrs3iDDqMvGVCr
         8yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763026; x=1796367826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8qKzQvXgEo+bbs+uOt4zzXvbZ8NY0jxQABybFpuxB0=;
        b=PRltBKqlZLd+Xtjs8epH1ugEk1HqYFDK/oojx4E20emc1Q0GMH3UmN2urnSxyGPZUa
         3eCMPPIbijOUwTSGf7JeXh+zlpzbRjF6aqO9kWOl9vFdUp0Db9Gktbu5y7Z8stY+p7ZQ
         V2lOvdQ19uzcPsF8Bq+4JpFAExaiDxAtX70KFZMmQ9qIz4MoosvoArtU2qlnu5jO2oxq
         qAV5cDYO38D9IPujea7TwxFmUzY4a4WaQHFgUnU7PUConng1Hhz1zHq+PmxjYP5teM3+
         /5jwnoalnSrGHxb44vIBLNqXrIMwo3YerRwKXa8aCzHdQWT/FWG95nQ3MXAvZe4tkffa
         F1dg==
X-Gm-Message-State: APuU4Z/7IGF/WMOwwul1QmoEf71g2lOrSjDCn8o6p4CH54MOPLVFpEVI
	/pPTVUpt3M0LhY4+3fUnfopieBj9EAvFzI1wCtwyATHXt0Xep1MtjQn0TH/XAIRn
X-Gm-Gg: AZFdTZeDaGtB0S5M5vKXh6hsPY22O/sXU1Yhi/H+YEENBlA3JuY1nYIxYM4lBuu42vX
	XMjMGIdbP59quZCPt9RJ78LoSKSTSJiZRQFhOl+VyJeOTjPfrWSj6Nz98ZiW9iht5G1rs3aIbfA
	zygAeTRTt3/QMGvmyuxMNXqCcVXPMaDCDlEB2qbpKGoghvIZmtLNiWzTD9oy5z6RSxy5LtCJHM7
	pTWb1arjcngHWVVGvGmu/4C0XcTTmPcHbDiGbEV3fzAkHjaRHOguwc0SR5MI2OukiNy3yo7vsft
	WZw+0LxJSAUOa5+rGCLPTrVnSLj9GWNHvbAed+ypBh/QVy1xc6a9Ka3XzuEDHBEv7lY2WOIEgog
	UmUHqfkrWXbV8GmsvdMgDMJ2BTv7hX6rE7luv36Y3DddTanc/txsxQeNy/I0hXvWDvrMSn7Qprz
	fh3JpJ7vIxOfz8m9qnWse4Zoq2RvR3S8TzmBIADpXc9gavwC0B87A3Y7F4q61Z5qcFkWNrcCcLT
	zwZFBT1+2Hn+nj3KlVAl33i8902iDP/hwWHR9oX8HFrIfSjdJnI2Lb5zbZwMhXE/bhGm3Nglmu+
	ScUZ/2VSALTWQ73nqh91ZK1phvX2t/EgETODx62CdTbrzGMZLDWunr1wSD8udcw0N1jciG6bE/r
	BTIVBDw+ZScE0VotWfd9qSr5zRUckf2M5tYb2U9ma2er19+HFkqbaMCanooNNzQUH2EQOMgFtH1
	VccyPbyCwMvf+EnHul6+8492ttnG4FTbh4WeA+/JTuM9hvGqWwBynu5O0qCUQymL3LwNEOCGYZZ
	3MTUyHGs8pcWEoRtST/OPQMtTRNK6FiydoSBdEL9J4yAshzQ7NyKlTbWWJqe6zeuoODXy5wBgLn
	reGJ
X-Received: by 2002:a17:903:1a68:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2f03f0fdad2mr252017135ad.16.1795763025931;
        Thu, 26 Nov 2026 23:03:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm112292155ad.73.2026.11.26.23.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 1/4] webmin: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:39 -0800
Message-ID: <20261127070342.2403582-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
References: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133365
Content-Type: text/plain; charset="utf-8"

www.webmin.com/download.html no longer links the release tarballs, so
the check finds nothing. SRC_URI fetches from SourceForge; check the
webmin release directories there instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
index 79b20bfe74..c6647c310f 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://webmin.service \
             "
 SRC_URI[sha256sum] = "617af07a890bea18a83dca5c9d7168de1ad4d5f3076d8a1df3475f123748dc21"
-UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
-UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/webadmin/files/webmin/"
+UPSTREAM_CHECK_REGEX = "webmin/(?P<pver>\d+(\.\d+)+)/"
 
 inherit perlnative update-rc.d systemd
 
