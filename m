Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20117.1589567984463483117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 11:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FF7740AF3;
	Fri, 15 May 2020 18:39:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BA7a_mVrxwtT; Fri, 15 May 2020 18:39:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7376840A46;
	Fri, 15 May 2020 18:39:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8D3101730D6;
	Fri, 15 May 2020 14:39:41 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-python][PATCH 0/2] remove pycryptodome(x) and pyelftools
Date: Fri, 15 May 2020 14:39:38 -0400
Message-Id: <1589567980-26597-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

python3-pycryptodome(x) and python3-pyelftools have been moved to OE-Core.
Remove from meta-python now.

OE-Core changes are still in master-next, so may need to wait until merged
to master.

Denys Dmytriyenko (2):
  python3-pycryptodome(x): moved to OE-Core, remove from meta-python
  python3-pyelftools: moved to OE-Core, remove from meta-python

 .../python/python-pycryptodome.inc                 | 29 ----------------------
 .../python/python3-pycryptodome_3.9.4.bb           |  2 --
 .../python/python3-pycryptodomex_3.9.4.bb          | 10 --------
 .../python/python3-pyelftools_0.25.bb              | 14 -----------
 4 files changed, 55 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb

-- 
2.7.4

