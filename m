Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.39915.1597042010580985964
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 23:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BpDj9qwn;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id y3so7046829wrl.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gU3vJJQUkZYbaz+FHqCiJf+EPDf+u3goWf5CFYoCNHI=;
        b=BpDj9qwnWbtB66wNbR5kpe5++UWTlo7+jL5V3UUe3RiFROXfoCQCNa/Xm1AiCeFwUK
         Zn/WprfCqUc3+Z6xmU/T7QO1MD/3ltIJmbAebwBZFKXk8YeTkYdo9Uz1FaajkcP4dxf8
         GZiUBEB6Nbkj8C+78OZ4qX93ND+S2727uIDFAt4Ew0prKfqqIfRgnoShw1xuMYPzYgJP
         86FQBSi2rXZm0FWlC5706a4zggCqp2ClwrZKLvshsDv06gkOcRpGcHVZ4zs8yri8Bfoe
         JYYiySYrm3opzC+faIMTlVfhHhS7o9hwdGdNW2w3IPHkHJUmKyipWLGNn9MfX/dM6UKS
         hvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gU3vJJQUkZYbaz+FHqCiJf+EPDf+u3goWf5CFYoCNHI=;
        b=pC8qfY7BRQ3Ma+JWRzOh1eyljPpuYrNITsdbcvNFWzLn04UGkRZG59nnXV5EWk5SjS
         kkv+t6LD+d+OLEOVvH8KbD+vNWIZHwzHXiN51rzw7WCSnjXMgjbjtiTwbv//akwSeMPz
         Z30ZrePNrYGv7Fbl7MFDRnbN20CZ+yEsT51otYdM+WpRsZCDhpb++KcaDiSIJc1Vx1P9
         v96vGzIE5VHRYJUoZhmuR94Qzr/r5lJ3Z9dCC0nXskmgS7ojFIkE+LqYXtGjQkcpgvVA
         JgN/4ZSCKw+8Xga8fdyA7zEHauEpVGFdvdID1bw9LH6Q9yuO3iTt+iQ4tJUr5M+5UJXK
         IiAw==
X-Gm-Message-State: AOAM530BOZ1qYohzOxPmtse6xUB9M0vQpUG4Sl04sx3KH03iJMW7oe1D
	AaKwlDPZYPrs1vPnfL9EkdN+xOsx
X-Google-Smtp-Source: ABdhPJwRL9W5UZMEzZTP2EOH9qLpfMheGSRt/NtMmDB7yy9SeSse1SxB8do08040OcVxRVQs1RT4kA==
X-Received: by 2002:adf:c386:: with SMTP id p6mr23008677wrf.344.1597042008885;
        Sun, 09 Aug 2020 23:46:48 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.82.145])
        by smtp.gmail.com with ESMTPSA id e16sm19410479wrx.30.2020.08.09.23.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 23:46:48 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 4/5] dlt-daemon: enable some configurations by default in PACKAGECONFIG
Date: Mon, 10 Aug 2020 08:46:32 +0200
Message-Id: <20200810064633.20079-4-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>
References: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>

From: Gianfranco <costamagna.gianfranco@gmail.com>

such as udp-connection dlt-system dlt-filetransfer and if systemd is enabled also:
- systemd
- systemd-watchdog
- systemd-journal
- dlt-examples
- dlt-adaptor
- dlt-console

rationale is:
all of the keys above are not that heavy in building and running,
and dlt-daemon doesn't take more than some seconds to build.
Not building them by default can result in a lot of missing functionalities
to the end user, such as the ability to talk with the dlt-daemon via
bash script or Python.

The end user can still change or disable something if needed.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 2bb210791..e7a194ac8 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -23,7 +23,10 @@ SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES','systemd', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-console ', '', d)} \
+ udp-connection dlt-system dlt-filetransfer "
+# dlt-dbus
+
 # General options
 PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF,,dlt-daemon-systemd"
 
-- 
2.17.1

