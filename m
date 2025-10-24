Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70DDCCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 05:12:17 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web10.2555.1761282733922797456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 22:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y9H/k/UD;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63e330a1360so1723524d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 22:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761282733; x=1761887533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qwT8ebldtUWpazDSgADNAq+W0HUxyKgrKi3OTI/HuMQ=;
        b=Y9H/k/UDOVQ2TsKTn4RFycFhHwvV9TgbL43BcpvnPluLFSlv3EO4Doc4T6U4jBfutW
         4EBFbpuUXf6+yvWelK4txQONRnqrV27JD54NxjSXy+9qiXEAip/CBSyvrlfGv7uNtXUb
         etUonR7Yo4rOUuq8NCnWQXa/VeD9809vlJMORS2zLPwGImif2jFejLxbGsbvP85jreR0
         qbmj6plhKAPLaXt838pFww+ijbN8LM9wa5Jx8a+KtgduhE3VGs58dj5Sw+EhdkKuXK0x
         mzKsYYwm2ZtqFgLskDVWEsCwuaVoVvCK78Bh+Ym0sFKo1MWXP9tzWD/u3KcvxTBbc/8E
         t3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761282733; x=1761887533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwT8ebldtUWpazDSgADNAq+W0HUxyKgrKi3OTI/HuMQ=;
        b=rs681RL/uPKdXOLcOL+Vsxyvrmmms/YeUOoSaSzHRNr90FPvAqpHk4+6os9nJTdv8B
         zDUKPP/jJd9zozgeF3t9/ElfAz0c+QQ0VFmQh6W9fuwY5QJzLxoVf79ktGRc+rfXgwOE
         tsTC+4EZz/oSV36iQObaTMZ5fZQFEvBV34azfAIzWkuK9+hlA8zVYKcgm3qj0bkA9tDU
         S9DqbLmn+adrPH8gq64D0swLENR2IHFfxsfktiNzh/dbRX56siEYNqqpQ8tIePQGaB9C
         yR9+88YBbttXqTV3Je1GkR/CQyCY10iWlhCl5mEsvBLHvQ+ZHlitLM+1yOz1dkgEEL7e
         FMWA==
X-Gm-Message-State: AOJu0Ywr3JOsXmy+Cuq6XLpGfEnLn0Iovfd8a1DRfskSbBchlqR3pNBW
	wBwtNdbyzrkpgAKv5JVe5KP90qplTFLrSWR+IEMbosW+ACi7kW31pMpl5sqXCnUH
X-Gm-Gg: ASbGncvhP0ArwQ0PYGzEZ9AfQ3CUtgNPBhv3/rs2+nXo8VQWIx4YCinhtEBbNDGZ6iB
	peo0M30o7TfHqbgY8NKAdvdP2V+mw+PSJe/nUEvigQcfPMffA4q7OeQqzVZvEg0z0h8laFrPiT4
	tPTBDhKbHdOK00lbALU0K3Q0eqfRk5Tb6hikk9So2J8KUYwRE9cSqnvABsmPEVp4GcEZFXF7FbA
	Jl1h6+IwACa7TbQL33MYd/5XMHAuyGQuAILfQjE+QIKiyEbFDRQj/azu7VK4zQb3ef8+Lx2K8Xm
	SkgX3UIvTE8mfKtpO0/YXrdGRCKDt+VORa6uOytrBEb6snZ6KZturFuKUd6C223fUQBjB4a6Brg
	8z0pCHmpLq7s22jy8DK+9+SzCp3t155TGC1ko4Ja5qj5SNVEYG1c3V6g2WyGSeebT8pw06jEgRA
	j1PQf/rVHXjLRLK6pdOKcnCsPPzv6Brhfn6bT7KMn1Zg==
X-Google-Smtp-Source: AGHT+IH6IIis3e0RpZZ0Iu6NPvSH7CIE6Mt6IYW/kOpGvOY6EOk+D1UdHOmesXVKcIsjFby9lWStEw==
X-Received: by 2002:a05:690e:d03:b0:63e:33a7:cdd8 with SMTP id 956f58d0204a3-63f377d2778mr4214700d50.10.1761282732408;
        Thu, 23 Oct 2025 22:12:12 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63f378da831sm1302392d50.5.2025.10.23.22.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 22:12:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.300 -> 2.303
Date: Fri, 24 Oct 2025 01:11:51 -0400
Message-ID: <20251024051151.533828-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 05:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120945

net-generic.patch : lines changed order in the new version

disable-version-check.patch : additional code to be removed from the
  function which is being deleted.

Changelog: https://github.com/webmin/webmin/releases/tag/2.303
Changelog: https://github.com/webmin/webmin/releases/tag/2.302
Changelog: https://github.com/webmin/webmin/releases/tag/2.301

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/files/disable-version-check.patch     | 16 +++++++++++++++-
 .../webmin/files/net-generic.patch               |  9 ++++-----
 .../webmin/{webmin_2.300.bb => webmin_2.303.bb}  |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.300.bb => webmin_2.303.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index 46b1f7c7b8..3315aa579b 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -9,7 +9,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 --- a/webmin/webmin-lib.pl
 +++ b/webmin/webmin-lib.pl
-@@ -1170,38 +1170,6 @@ my %miniserv;
+@@ -1234,52 +1234,6 @@ my %miniserv;
  &get_miniserv_config(\%miniserv);
  &load_theme_library();	# So that UI functions work
  
@@ -27,6 +27,20 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 -	else {
 -		&read_file($realos_cache_file, \%realos);
 -		}
+-	my $new_real = $realos{'real_os_version'};
+-	my $old_real = $gconfig{'real_os_version'};
+-	$new_real =~ s/\.\d+$//;
+-	$old_real =~ s/\.\d+$//;
+-	if ($realos{'real_os_type'} eq $gconfig{'real_os_type'} &&
+-	    $new_real eq $old_real &&
+-	    $realos{'real_os_version'} ne $gconfig{'real_os_version'}) {
+-		# Only the minor OS version has changed, just silently update it
+-		&lock_file("$config_directory/config");
+-		$gconfig{'real_os_version'} = $realos{'real_os_version'};
+-		$gconfig{'os_version'} = $realos{'os_version'};
+-		&write_file("$config_directory/config", \%gconfig);
+-		&unlock_file("$config_directory/config");
+-		}
 -	if (($realos{'os_version'} ne $gconfig{'os_version'} ||
 -	     $realos{'real_os_version'} ne $gconfig{'real_os_version'} ||
 -	     $realos{'os_type'} ne $gconfig{'os_type'}) &&
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index 65e1d77629..cd9a522bb6 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -5,15 +5,14 @@ Upstream-Status: Inappropriate [config]
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 --- a/net/module.info
 +++ b/net/module.info
-@@ -1,7 +1,7 @@
- version=2.300
- longdesc=Configure boot time and active interfaces, DNS, routing and /etc/hosts.
+@@ -1,6 +1,6 @@
  name=Networking
+ category=net
 -os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
 +os_support=generic-linux solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
- readonly=1
  desc=Network Configuration
- category=net
+ longdesc=Configure boot time and active interfaces, DNS, routing and /etc/hosts.
+ readonly=1
 --- /dev/null
 +++ b/net/generic-linux-lib.pl
 @@ -0,0 +1,2 @@
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.300.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.303.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.300.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.303.bb
index 1e46384465..f65898bf93 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.300.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.303.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "1405dfd1f452c502169e07f00fb856fe31af122e484df03e1ac549a7eeec3001"
+SRC_URI[sha256sum] = "1317935427aa893159b2dae52a2860adbd9ba5482522115abd2422a4bb27c983"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0


