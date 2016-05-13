Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2092570179
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 07:15:53 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id v145so157337582oie.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 00:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=rN58zt7lT5hmiSTx53yp1GrND/Cm/4r+2V+sX5ty6Po=;
	b=dkDWbWYGuFUAijI+WEFbqOjJ8PpQyv00Ohhh9xVmiEfskMJI4GQXmwgcFWsf+tjk6s
	qepN2uNSC4KdZdhRih3iS3KcCAwD2p3Q77QaThV7/+2l68u8SKSwNFvY1JpmXdeq/br5
	ILLzst9ohR0IkkBiqOJcZm4lnlkIFlUPQlVFtF6JrBlBZawgbUGFchvsxeuMjf7cA/vX
	/PBUWJlI0lnzxtA5fZsBrfDiHTow34YoVOgMByC4DcuNBGhb2GTd9JHHmYX257YPYLK1
	y4QzLT+vvLXmFMIPbYMDlqXN1yugBqzWnoBhYMgVghBFpVw6He8VPhrlIAJi2l+HoMLC
	81XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=rN58zt7lT5hmiSTx53yp1GrND/Cm/4r+2V+sX5ty6Po=;
	b=GQ2LL3I70+nqBewIjzqbn5Rvx6rbx8u/gkS7mndshNLVmmDii4HnlMnXr5amUGKm7f
	wus06M8S1BqKeor8mootP2f/ddgCy6IYDXdg3cL5ZvJBBXYFLDNeUwfgC01wVxjIqkYm
	rw4IjACvReF1nZ/VZfreP0H8LXRgM5cfxKkAO8LVaTaFKhU/nQBBqXkiktAbAjQMUpw/
	DAh9ifANmMYmxJnm13JfsUd2D+r2fa4kSyLo6apis+S1+7CbnSuIl7D7E1+9gPbwxJTb
	3xHNDkDekgvvTIJfEYSJ90jugBYhHDzVEY7/P2WLDUFta301Q6Mq+puxlilfZlYqi/EV
	obWg==
X-Gm-Message-State: AOPr4FVl46u1nGrcQ+C+HlJ0ZTTQZpVIUv1YBQHWJXQqIZEx64VFLAX2yd20rUyUFx5tzIaYWf6G/0T9OeV0MWPk
X-Received: by 10.202.197.70 with SMTP id v67mr6851909oif.63.1463123754110;
	Fri, 13 May 2016 00:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 13 May 2016 00:15:24 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 13 May 2016 10:15:24 +0300
Message-ID: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: augeas: oe-core removal warning
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
X-List-Received-Date: Fri, 13 May 2016 07:15:54 -0000
Content-Type: text/plain; charset=UTF-8

Morning,

I'm considering removing the augeas recipe from oe-core: it has not
really been depended on by anything since Danny (rpm has a non-default
PACKAGECONFIG but even that is accompanied by comments about no
testing) and we have nothing testing its functionality. Please speak
up now if you think augeas should stay in oe-core.

There is one reverse dependency in meta-oe/meta-networking (netcf) so
I'll propose adding augeas there before the removal happens (other
suggestions are welcome).

Thanks,
  Jussi

