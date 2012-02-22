Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S09c7-0001Yv-3e
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:39:59 +0100
Received: by eaal10 with SMTP id l10so2560024eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 02:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.29.70 as permitted sender) client-ip=10.213.29.70; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.29.70 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.29.70])
	by 10.213.29.70 with SMTP id p6mr4085715ebc.78.1329906699190 (num_hops
	= 1); Wed, 22 Feb 2012 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8IemSVl4EuxIXKAgxUMP1b33vrCMD0+72dL65n3sqV8=;
	b=VSv7GZtgbIwsD2GE6V5YEX9sbv+LRtDKI48fjO242GZ4ULgbqw7XsVTWySEIFdt8hm
	MaX2aWH0lEHDakEd1+0H65+2V5F1pm5J9fmVeB/ftiZO7tVQIqQ2/XvLuTW8AmOFwoZF
	hwruyoyg4jKFCSW+cmTXwkb6lnFwXPOGJZJmI=
Received: by 10.213.29.70 with SMTP id p6mr3258449ebc.78.1329906699040;
	Wed, 22 Feb 2012 02:31:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm101127251eeb.7.2012.02.22.02.31.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 02:31:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 11:31:30 +0100
Message-Id: <cover.1329906639.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH 0/2] PACKAGECONFIG for polkit and foxtrotgps upgrade
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
X-List-Received-Date: Wed, 22 Feb 2012 10:39:59 -0000

The following changes since commit f89d930201725d0427b0c1e881cff929c5a8ef7e:

  vsftpd: add new package (2012-02-22 09:45:55 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (2):
  foxtrotgps: upgrade to 1.1.0
  polkit: enable and disable systemd/consolekit support explicitly

 .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 ++-
 .../foxtrotgps-1.0.1/remove.unused.header.patch    |   40 --------------------
 .../{foxtrotgps_1.0.1.bb => foxtrotgps_1.1.0.bb}   |    8 +--
 3 files changed, 8 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
 rename meta-oe/recipes-navigation/foxtrotgps/{foxtrotgps_1.0.1.bb => foxtrotgps_1.1.0.bb} (61%)

-- 
1.7.8.4



