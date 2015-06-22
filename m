Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 78BA573D2F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2015 10:43:36 +0000 (UTC)
Received: by qged89 with SMTP id d89so51103468qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2015 03:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=lMjklm5lh+yYmX27vm7kfpmgcb6qnK6GXbHm68LVo4I=;
	b=XKP+89fp10u/J5cWzvUNn9U13qOrAfq/Kflcm7P0iN5Di87K60sRMVUKr5zziFLOcj
	INs4VmIm6lgMj0hmc/DQOYS1xzm7Q91co2ukbOecV/JdIlXhX2IOJh5TntpOKykNZx/w
	qZsq4BkVBeYTXF7m27QnPwRvqjEg1gj5xqcUJKELzm13Bv5QTPL7Xa0oKG4L8y5GyGnP
	3/pkYsZh+LXXCkP/8IYBoh59B9/tuX3fjwZoQ7DnzRz+gR+/yHQayYUZ9S71g6w6lsU0
	QW+FaNnlAw6oQMuSYxkpW9u+dTI4EYTXk8+buSr7NyS0sokbN17ofonyALXWBsfZv8Z9
	8NnA==
X-Gm-Message-State: ALoCoQlP2ZZDcqjW8wLG1H+cTkETyT1fNXBX3s3y703K03bM31y+pefE15268Mlx1+pjCw/k+vtH
X-Received: by 10.140.89.104 with SMTP id u95mr36390434qgd.15.1434969817130;
	Mon, 22 Jun 2015 03:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 22 Jun 2015 03:43:17 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jun 2015 11:43:17 +0100
Message-ID: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Future of Qt4 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jun 2015 10:43:36 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

So, Qt 4.8.7 was released last month[1].  Support for Qt4 stops at the end
of 2015, and 4.8.7 is planned to be the last ever release of Qt4. It's
still mandated by the long-awaited LSB 5 but I think it's fair to say that
the majority of developers have moved to Qt5. So, what should we do with
Qt4 moving forward?[2]  I see several options:

1) There's still lots of people using Qt4 in production, please keep it in
oe-core!  (and revisit in six months time)
2) Move Qt4 recipes and classes to a meta-qt4 layer now so that oe-core 1.9
ships without Qt4, and anyone wanting full LSB compliance or Qt4 will need
to add that layer to their distro.

Personally, I vote for (2).  Any other comments?

Ross

[1] https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7812

