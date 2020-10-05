Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.26879.1601867966706679267
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EF4SPHqe;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id kk9so4651218pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=27waVxqB8eXu8k0WbLWrWea1LCkAUwUDq1NoAUIbA80=;
        b=EF4SPHqeox2+hKGAAZd0yLPfED1tDalgcjxL3wTjqfQt9g9rm5GAwl2YWWNipDYVMS
         RTeLthAunVjcA1hNwrrRlED1RiX7V6VRUtJyyYP67qKwnAF/ZoVXbxe5QkIR414SVZCt
         tSTpBUj6MDKJuKMEy6mJDXshrALi9ALHtEpVjHoZz/LGbc8NWszuC+g9FsnuFKumXbsg
         UIvhMtrvcf5bnEWa/p0MBwPL07pv7hnE0O/Abt4km/BzsCze1yTnGiil8Ixpa55ao5h7
         w+e1KENrWQcuajTp0cGvVU3YRcCf7TvpwoFanY76c1mb98Uqew9nHjoAdG8Saa+Hv5CT
         6X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=27waVxqB8eXu8k0WbLWrWea1LCkAUwUDq1NoAUIbA80=;
        b=r9fFBUsJsbm3a1idC8wgJ+M8158VUdl1pkC6ztmSqVKY6N74QL2FUMO0hbtonQxciw
         nxgBmvsPJwWQSHQsIeVKH9mMJP9g3pMYiibrzwUqe6aZAJNmHJMCmCl4mgp7HajuEOXQ
         /jIQKUsREAov0MYytxp1aZnqAreLfffvN5a/4BP7EJaTIUcqDFCxvMTRcZelEiFbziWg
         1htw/oegbY131o2S9IZrH2K4At1wkCwZDOomwCkBA/i1MyKxe54/L+iNanKRteBfZVjV
         gYU0UW3hHxzcwqK9nVn1opCVvayF8L2ZdNiiDGf/qXWd6futIFSEz2zRLShtkM9MQSdI
         v7UA==
X-Gm-Message-State: AOAM533aK6FHEQXkfYKwFaPymVhQgGqmADyqjKqv3sZK6FrMJwoz4u6b
	fyU25Q8qZEbtYHTSrW51xDqN/pEsKBY=
X-Google-Smtp-Source: ABdhPJytRKpKxw9mjPaGBBXAcyt0gKkzHsKJxaEIt/ytoTfdvoZgmrMxL4aLytzShDFxRTp6kKOhsQ==
X-Received: by 2002:a17:90a:f698:: with SMTP id cl24mr4800036pjb.59.1601867966067;
        Sun, 04 Oct 2020 20:19:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 4/9] ssmtp: adjust u-a
Date: Sun,  4 Oct 2020 20:19:14 -0700
Message-Id: <1a65d7a0ea21c26b8bc8b4b93d0841b257f73472.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Martin Jansa <martin.jansa@gmail.com>

* it's newaliases not newalias in sbindir
* drop u-a for man pages, because only ssmtp.8 was created which shouldn't
  conflict with esmpt

In my build I don't have mailq, sendmail, newaliases as man pages, but binaries in sbindir (and the sbinbinary is called newaliases, not newalias)

tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man/man8
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man/man8/ssmtp.8
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/mailq
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/sendmail
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/newaliases
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/ssmtp
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc/ssmtp
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc/ssmtp/revaliases

this added u-a is causing following warnings:

WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target (/usr/share/man/man1/mailq.1 or /usr/share/man/man1/mailq.1.ssmtp) does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target (/usr/share/man/man1/newaliases.1 or /usr/share/man/man1/newaliases.1.ssmtp) does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target (/usr/share/man/man1/sendmail.1 or /usr/share/man/man1/sendmail.1.ssmtp) does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target (/usr/sbin/newalias or /usr/sbin/newalias.ssmtp) does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide /usr/share/man/man1/mailq.1: /usr/share/man/man1/mailq.1.ssmtp does not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide /usr/share/man/man1/newaliases.1: /usr/share/man/man1/newaliases.1.ssmtp does not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide /usr/share/man/man1/sendmail.1: /usr/share/man/man1/sendmail.1.ssmtp does not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide /usr/sbin/newalias: /usr/sbin/newalias.ssmtp does not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target: /usr/share/man/man1/mailq.1 == /usr/share/man/man1/mailq.1
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target: /usr/share/man/man1/newaliases.1 == /usr/share/man/man1/newaliases.1
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target: /usr/share/man/man1/sendmail.1 == /usr/share/man/man1/sendmail.1
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target: /usr/sbin/newalias == /usr/sbin/newalias

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bdb964c907bd7d6972e09992505a0c4bbbda8fa4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index 3739c496a5..bae29aa80e 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -36,13 +36,7 @@ do_install_append () {
 
 ALTERNATIVE_PRIORITY_${PN} = "100"
 
-ALTERNATIVE_${PN} = "mailq newalias sendmail"
+ALTERNATIVE_${PN} = "mailq newaliases sendmail"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
-ALTERNATIVE_LINK_NAME[newalias] = "${sbindir}/newalias"
+ALTERNATIVE_LINK_NAME[newaliases] = "${sbindir}/newaliases"
 ALTERNATIVE_LINK_NAME[mailq] = "${sbindir}/mailq"
-
-ALTERNATIVE_PRIORITY_${PN}-doc = "100"
-ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
-ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
-ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
-ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
-- 
2.17.1

