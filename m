Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PeyOc-00039P-A9
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 00:21:58 +0100
Received: by qyk36 with SMTP id 36so5487596qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 15:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:user-agent:date:message-id
	:mime-version:content-type;
	bh=HUyN0neMzFTIh8FSWUn2z4zwT9K2ekBJ4qUkfBuAM2I=;
	b=f/su2myTotbTYnRPdboulAT+P4aa/wGietLl+RaPIjeNQnLzGgIc1wFezm++QsRIKu
	VbGukN0oJEwiggGHthxdq2koa4mqcqNHZPlpFAtotcjBbI2IGyrsJjhE67jiSmdA7g7q
	yRh2iQUBBpME5HFwFS0dXSqGf2xTHKcv0Hh6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:user-agent:date:message-id:mime-version
	:content-type;
	b=VH8XMKl9HJtWwzNKW1Dif7G73kBaWSt+spCwQX/ofNUC/8KLCoOKI6lOYRgBv5D/KK
	iGkKsvt/Hq9Cy4IW4pf/yTC4nmVPFgldyVhbostp8TBtkkLmaaDOlvJt9N0HWS1hD/R2
	QbSvDntdCBedJMH2mMIQr/Cd5I3ddl7mcH+Ok=
Received: by 10.229.81.206 with SMTP id y14mr4125801qck.127.1295306476918;
	Mon, 17 Jan 2011 15:21:16 -0800 (PST)
Received: from localhost (gamari.physics.umass.edu [128.119.56.223])
	by mx.google.com with ESMTPS id e29sm3269189qck.15.2011.01.17.15.21.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 15:21:16 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
User-Agent: Notmuch/0.5-17-g2d1420b (http://notmuchmail.org) Emacs/23.1.1
	(x86_64-pc-linux-gnu)
Date: Mon, 17 Jan 2011 18:21:15 -0500
Message-ID: <87hbd7ruac.fsf@gmail.com>
MIME-Version: 1.0
Subject: Using native package build tree when building target package
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
X-List-Received-Date: Mon, 17 Jan 2011 23:21:58 -0000
Content-Type: text/plain; charset=us-ascii

Today I've been looking at the icu package, which is quite out-of-date
in the repository. Unfortunately, it seems that the latest version (4.6)
requires that the absolute path to a source tree built for the host be
passed to configure.

Does anyone have any clever ideas concerning how this might be
accomplished? Does this mean that we'll need to merge the icu and
icu-native recipes? My bitbake-fu is pretty weak, so I'd appreciate any
help. Thanks!

- Ben


