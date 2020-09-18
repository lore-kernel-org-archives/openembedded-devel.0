Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.10030.1600426010676866497
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KoxQT24q;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id lo4so7454702ejb.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=soj/54MVSzUAHp6jqkUjT7tgImbQ8iFGEABHD2MwE30=;
        b=KoxQT24qS6r/7eCJV8eYrnqpWmizmWrbvgQCZ7X3etQ8xidF6dVtV7+ZrhDuJByjy9
         X0ppG2gW0MPBOHRWEV+2xLJF4VjJaHGfXYxdEjS8Hkl+kE0WSRZITW7VdDvE3KBq9VIw
         4s8svgJQqj7SsowBa7LAvIhcIrQAEKKHO0N7tVAWuOZaIWFXd/bWkRzyD1r68/0kfRjk
         iMW8FYLmhLDGp1cJtzlVgefsv3y1SJLmZIKvvEVj2d923VExT0+Q/JhIkqQ/i6HhBe67
         8E+LNAa6R8GPGxqt/P2qSMj2EERsTZLwd9kliwTZIRUQaOq2qIkMJpJ9Moanl1W8wEpf
         GlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=soj/54MVSzUAHp6jqkUjT7tgImbQ8iFGEABHD2MwE30=;
        b=CbdI7KDAsfUnvy0rXVU2scKB3nw+ACwCRKUkUvypSWDsMADee0dtR0REmhBAPwa5gD
         PZE5YDfQf17Fdp6D4p9Ur2bXgCxwmxHQnFZiitT5NeAOHftHJ98Ewe942PS5lEik9XUo
         75RR5mGZp+IQ1QeP4VoC7BPrhm4rpv9gNPiDHW7LIqOUppan39d5kh0/RwkMl38Xn1nv
         i7T7u0574TlQFoj0bMWZE/6njlavrY4RZCd709ylfrNOtNOlcqMF2YRwb+tJe/pi/+sc
         Hs5Ys25Q8edjAY3/oAA+Snm5F4sdxys6Q+yXrQPEUgB3gH3Vfwulc+jgkf5Kf9hscsUs
         j5CQ==
X-Gm-Message-State: AOAM530kab4YIL1MvdyZXGwlqmgkB3VzJKjyuXd7oGFw8WoFf0U1tlXE
	Bz992Os6brA5kO9B5LB6PEHo/LN4l4Q=
X-Google-Smtp-Source: ABdhPJyIOOKfb2C0Chx3y4pXqEYLEmV88OFaECdkbUZrdHbsvCjwSy9i2GcObQIWMLPmW/nvmL5+iw==
X-Received: by 2002:a17:906:fcc7:: with SMTP id qx7mr37054251ejb.254.1600426008660;
        Fri, 18 Sep 2020 03:46:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m16sm1990547ejl.69.2020.09.18.03.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:46:48 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH] ssmtp: adjust u-a
Date: Fri, 18 Sep 2020 12:46:46 +0200
Message-Id: <20200918104646.374988-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

