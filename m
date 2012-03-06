Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4io4-0002SF-8w
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 02:03:12 +0100
Received: by eaae1 with SMTP id e1so1348012eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 16:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.133.198 as permitted sender)
	client-ip=10.14.133.198; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.133.198 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.133.198])
	by 10.14.133.198 with SMTP id q46mr12175902eei.64.1330995277159
	(num_hops = 1); Mon, 05 Mar 2012 16:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=7sHwHQ43zPsFkY56w0eGy06seTU+AdXrXB5SiNU2yT8=;
	b=HWw2oElceFwo0jFhzTR599kJBZ+s/jWYxl+upz6byPdanwJe2jA4MryDZvMFzgUwbx
	Ptf7NMdLjG7WaVVHtwuMhr9GxEp+e+Ut19U8KND7ceDXvoV3Sx9XxD5g5Vt+5Jx/AY3P
	XJy2XPes57DIIZvPaNmlGY7VOBrkt02Q5/yS9dPAEfr5ebMY4LV1vspvoVeQjn5FFV0C
	btgDo45pI+KuO4EzKafXdkoYn717Xt4pqox/J921oF6lpj/YKtY1Wz1AIWOORbBict09
	Aqctkacg6jXilRzPm/gYXdJyxsCbwGBKRI0rW1WfMXXxNDaMl11sKXuPOHVyullofNeq
	mF7A==
Received: by 10.14.133.198 with SMTP id q46mr9236886eei.64.1330995276763;
	Mon, 05 Mar 2012 16:54:36 -0800 (PST)
Received: from localhost.localdomain (p4FDF114E.dip.t-dialin.net.
	[79.223.17.78])
	by mx.google.com with ESMTPS id s48sm67842976eem.0.2012.03.05.16.54.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 16:54:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 01:58:14 +0100
Message-Id: <1330995497-10440-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe, v2 0/3] gateone / networkmanager cleanups
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
X-List-Received-Date: Tue, 06 Mar 2012 01:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1-V2: gateone: rebase

Andreas Müller (3):
  gateone: remove unneeded systemd code
  networkmanager: inherit systemd
  networkmanager: cleanup

 .../recipes-connectivity/gateone/gateone_git.bb    |    5 +-
 .../networkmanager/networkmanager_0.9.2.0.bb       |   47 +++++---------------
 2 files changed, 13 insertions(+), 39 deletions(-)

-- 
1.7.4.4



