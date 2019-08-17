Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD9B7F352
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:04:16 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id o13so4364427pgp.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rjawey/D6dC3EVjqR6bZqVgQ/vVq78nsh433CIDfdr8=;
	b=G9vQBjUAcw/epJ1AnKwlgHigx1OoIjK7FgS+H6lAvC+0p1sKWqWneFSCIhYEqMB5Fo
	hvxoPcqK2LrVUUSV82NEHQKK4/nSKCwMAN1XHzoPKGsvGNk+6rdzJ4AnauJ0mgH3wEti
	bw8Mg6Fhh1IlRllLzjqisuX0qum1LcCMd/S8tIk5Ch/Kik/+3AzCfR0+a66I/8YjFtBj
	NekgRLGZjQtL0MAYWSnYTuuYQvimCgvYLDvpDSlY5bYh9LHoVJAGXdLCHWBzoAwJftVW
	D5JuudXYHTPT9rMtswKkG7Q0vtAACCmvhPT1zSYB9TNylOBBX4aneXVox6neDDYUpx2+
	JpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rjawey/D6dC3EVjqR6bZqVgQ/vVq78nsh433CIDfdr8=;
	b=VTSW0vLO0P/hGKY4ShJ2UD8T00wGjTAqsLIMdBEorJlRz8sHDBbOf51hqwAmJbUKVL
	8YT15j5S4lRg0VcrvrzO2oxU47c9kGUKk4HKhuW2LYZ9OOqMKVQ2bcjO4AP6RS++aNde
	Z2R3wO7qU1Et6V0wjai/RuaxuRlazpn/jcgoYmYu6ucH0COjvdXadVUKEXyzwppNpM7z
	PG4bMSPCVTnXo1MAUpcclkAS2K4QOHD3Ff3fLUsOrrot8csXKq6Pp8YF1wExTdJ43Lta
	428yIroXZEDKl5hHGutggGAjFNuTPP8vUvheWzVyBQa1vAKSxbxwipRXBKiTLot7PASO
	lfgQ==
X-Gm-Message-State: APjAAAWpGkg+HlB+aaRwAehcQnztU3iBTfN7qCLYqiv+NprawIgj+Hvj
	bcO2OUE5EdBrGiPTAjEC4jBRnLpYcYI=
X-Google-Smtp-Source: APXvYqxEX4MFEZT75Fx6LO6zbUHAqKm7748RYCbXhM3vcmeFq4yU56z+NemAMHfRgdb2Vu+BlKJTnQ==
X-Received: by 2002:a63:ff65:: with SMTP id s37mr11894351pgk.102.1566050656842;
	Sat, 17 Aug 2019 07:04:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	22sm10988546pfv.134.2019.08.17.07.04.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 07:04:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 07:03:57 -0700
Message-Id: <20190817140358.17988-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190817140358.17988-1-raj.khem@gmail.com>
References: <20190817140358.17988-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/3] webmin: Add perl to rdeps for modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Aug 2019 14:04:16 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: webmin-1.850-r0 do_package_qa: QA Issue: /usr/libexec/webmin/ldap-client/stop.cgi contained in package webmin-module-ldap-client requires /usr/bin/perl, but no providers
 found in RDEPENDS_webmin-module-ldap-client? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index ce9bc92805..d54d6223c8 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -160,8 +160,8 @@ python populate_packages_prepend() {
         elif os.path.exists(themeinfo):
             themes.append(mod)
 
-    do_split_packages(d, wadir, '^(%s)$' % "|".join(modules), 'webmin-module-%s', 'Webmin module for %s', allow_dirs=True, prepend=True)
-    do_split_packages(d, wadir, '^(%s)$' % "|".join(themes), 'webmin-theme-%s', 'Webmin theme for %s', allow_dirs=True, prepend=True)
+    do_split_packages(d, wadir, '^(%s)$' % "|".join(modules), 'webmin-module-%s', 'Webmin module for %s', extra_depends='perl', allow_dirs=True, prepend=True)
+    do_split_packages(d, wadir, '^(%s)$' % "|".join(themes), 'webmin-theme-%s', 'Webmin theme for %s', extra_depends='perl', allow_dirs=True, prepend=True)
 }
 
 # Time-savers
-- 
2.22.1


