Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzbcL-0006Ec-US
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 23:21:57 +0100
Received: by eaal10 with SMTP id l10so1991169eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 14:13:39 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.189.9 as permitted sender) client-ip=10.14.189.9; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.189.9 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.189.9])
	by 10.14.189.9 with SMTP id b9mr11506696een.34.1329776019888 (num_hops
	= 1); Mon, 20 Feb 2012 14:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/RP7xJJb0idPTS8hI6l1ZVHF1C297HEsDBXvFUy7C5Y=;
	b=xaC1LJr9fgQxbEj9Tw4slRLAzO9UC7zlwXnQgHLLKKZlPhGTuEK23ZhyXc6h4OJhXq
	JmVJ73ZsSx8fVziftqJ1Lg8difNnSGpDUKpFc9FRyxOEFmCxsCjPQhTPJxVbvaVIDpoY
	gm3KWEEOaEkOCECVGTQXAuKx13biyJT3o91oI=
Received: by 10.14.189.9 with SMTP id b9mr9167083een.34.1329776019489;
	Mon, 20 Feb 2012 14:13:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm82332531eea.5.2012.02.20.14.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 14:13:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 23:13:30 +0100
Message-Id: <cover.1329775974.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][meta-efl][PATCH 0/2] polkit and task-illume fix
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
X-List-Received-Date: Mon, 20 Feb 2012 22:21:58 -0000

The following changes since commit 143367e4f584ea7054dca2a466f410a46d02e6b1:

  busybox: create /etc/default on do_install (2012-02-20 22:55:28 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (2):
  polkit: enable and disable systemd/consolekit support explicitly
  task-x11-illume: change default ETHEME from e-wm-theme-illume to
    e-wm-theme-default

 meta-efl/recipes-efl/tasks/task-x11-illume.bb      |    6 +++---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 +++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.7.8.4



