Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S12Iw-0002Lr-4G
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 22:03:50 +0100
Received: by yhfq46 with SMTP id q46so1342608yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.145.230 as permitted sender) client-ip=10.236.145.230; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.145.230 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.145.230])
	by 10.236.145.230 with SMTP id p66mr7937224yhj.27.1330116926932
	(num_hops = 1); Fri, 24 Feb 2012 12:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=aB0vvLKYwx1aw80OAgAgj5G3Kc/BYY9Jv149ZriMCkU=;
	b=n1RpXvSDY8i4dweJFHpzp3IjOcHo/nQJGy0DsjgrFubZU05aokE5uZzmspd6YQNmYY
	s31StGicQGMYyWWq84iiT9F4V+C06Fu3NEStKz7UHH7OhRT0NQbsJBPEtmb1jQGouQbM
	/FKIFb6XxuPwv7DwJHrNT28r62u1tQi1HQXYg=
Received: by 10.236.145.230 with SMTP id p66mr6015179yhj.27.1330116926830;
	Fri, 24 Feb 2012 12:55:26 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d66sm15203291yhh.12.2012.02.24.12.55.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:55:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 20:55:15 +0000
Message-Id: <cover.1330116875.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/2] Pending patches from O.S. Systems' tree
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 21:03:50 -0000

The following changes since commit 2eaec194016ba357bb02db8859b2b3737d759865:

  meta-multimedia: initial add (2012-02-24 13:53:17 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  openbox: add missing depends
  systemd.bbclass: do not mangle PACKAGES variable in native, nativesdk
    and cross

 meta-oe/classes/systemd.bbclass                    |   72 ++++++++++----------
 .../recipes-graphics/openbox/openbox_3.4.11.2.bb   |    3 +
 2 files changed, 39 insertions(+), 36 deletions(-)

-- 
1.7.2.5



