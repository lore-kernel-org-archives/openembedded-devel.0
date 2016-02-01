Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id C0973770F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:26:59 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id e32so126305603qgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 10:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=UORgrQz5xa0Jny9yyoFvic22T/nBZVtpuOMlCqkaRp4=;
	b=i6MdROGYt9ACcTYkRdIizy0tRF+kvy9oHi7ezcLVGQCU7esxnP2Ywj4eeXNsUufo0G
	eAJmxtldWQwzLBSzGH91juUZeXVd+qxuISmK9KBJkEW1Y2ICcGNQQZphWBaKLui8qhJB
	Kgw8WyUVYVoNVFteAEc2Ah+YzDTSjE1Gx3VhT7dnfT+LtKlY+Its/PqvvI6u+RfjRHjw
	TUtSWKIw9LlyqK9BEIKoDG45ad7UefFL2eGt3zHKgz6C6kX7t6ZOj319z0F1czd/bPWX
	KHoSgQOAzpjhblGZaDpkiAgkBvHDlChIpTDB2OQo46oqmCBcWNh4uxmVYIUgxZ4okqzd
	R4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UORgrQz5xa0Jny9yyoFvic22T/nBZVtpuOMlCqkaRp4=;
	b=d4hjzj+eI06qX7mxBBlmPz+A4TvEIJau7zBOII98ijayVd+PjRWTKk4BEAKMaVPkO1
	iHc4HpX9AmwMep+D1xkTiU1IcaxSY4EGTEHUJEp60+nFg8cQQ5GRXlezzXNTz1S8pe37
	jNPJA3SfeO2CgRsTREeM7zVsMJq4+d4T/ssGQwQSvcXPqw0YbZ3E7E8o7Be30Z5tzSpX
	Qsn3s4q29OjBzJu15l8snebHgw6Ic1PZsMiCEQWUQz2+nyqU+Bdy/lRySbqJHgb/XFHc
	lkq8lE2ta2mS24sTWwm7YU24oqwNRC7jzunNfMc7RC/FxjG8ul/RVFxlYJNQBWWTXP+R
	3WYA==
X-Gm-Message-State: AG10YOSnoiBO12l35Wf/6K7d0VyTzUn+fgsv5E2D0b5yN5HePVcbmryrZsHR/vWwwXLDmg==
X-Received: by 10.141.4.139 with SMTP id g133mr31706906qhd.34.1454351219967;
	Mon, 01 Feb 2016 10:26:59 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.127.6.77])
	by smtp.gmail.com with ESMTPSA id
	s130sm14000685qhb.6.2016.02.01.10.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 10:26:58 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Feb 2016 16:16:15 -0200
Message-Id: <1454350575-1028-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH] python-daemonize: Update to version 2.4.2
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
X-List-Received-Date: Mon, 01 Feb 2016 18:27:02 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
index e10c853..2c6a8c8 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = "\
                python-resource \
 "
 
-SRC_URI[md5sum] = "f08ad971573a1d83d2d4adab13f59448"
-SRC_URI[sha256sum] = "2fbe8a4af6bafb3f53d64b8c05c073bfff6c8bc829b83563f5774b0052fc656e"
+SRC_URI[md5sum] = "bb5b341b94abc15d6788002cafaa9da4"
+SRC_URI[sha256sum] = "c21a94cd676d3fbb718af62e6f22209afc7000a9588169b6fb779d62b04e2378"
-- 
2.1.4


