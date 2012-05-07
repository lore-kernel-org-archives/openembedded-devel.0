Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty@dasty.net>) id 1SRMg6-0001IB-7X
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 14:04:34 +0200
Received: by bkcjm2 with SMTP id jm2so3934178bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 04:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dasty.net; s=gmail;
	h=sender:subject:from:to:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	bh=V4AXtLlgF5ZY06OY4Vfnxg2GwnRK0hpGRDpY8m1MPBM=;
	b=jZUPc5vJD+dDPtA5RR7BXIayWK7ZNRMpwwRm75TiS4SPIliLI9I33D3vl11FnhzGjy
	Bt+yQhBYIao+bHzRZe1Mp3qMfgQm1Z+63RDyOpzmrD7Abka2/IsHkBu/f2uK1JOWS3bD
	RVAqcZDwBZkd89pGqBJyY0m1HBVDMqJBIBPpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:subject:from:to:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding:x-gm-message-state;
	bh=V4AXtLlgF5ZY06OY4Vfnxg2GwnRK0hpGRDpY8m1MPBM=;
	b=eiLuo4sLx474u37cin9O8z+gkQRJ0/bZuMHIYlzu6uBwiwfsocAlgwXf3LzZNqNGfi
	rrEEzv3ejtsZNTO0aXDrkZXdEsqnOV+LII61+El+8Yt3BrpN6hN3n8X+yFFKml4yKaN9
	HejC3ZaLtTVKfscStuWdQp9sEFi8Bmd9F8VhJxybN2c3agaKo0C1QBoSMICMzP02bvmi
	jDLJ/UCTjMC2F1hJNj2GB/dBk49x7iweomvMfZ1SFY0DpG5ik5TpT6HZqqdaIbCUCxZF
	ccFeGIzbEX6pfVSqB5J494hs9lZSZR0aKnL5s/eXWEfWqjw7k2l5GA3sW5Siii7Tb3bp
	mVWQ==
Received: by 10.204.150.76 with SMTP id x12mr825184bkv.97.1336391683933;
	Mon, 07 May 2012 04:54:43 -0700 (PDT)
Received: from [192.168.1.111] ([81.89.61.168])
	by mx.google.com with ESMTPS id gm18sm31936332bkc.7.2012.05.07.04.54.42
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 04:54:42 -0700 (PDT)
Sender: Radek Dostal <dasty@dasty.net>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 07 May 2012 13:54:40 +0200
Message-ID: <1336391680.3417.7.camel@dasty-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3
X-Gm-Message-State: ALoCoQnxi0EBzS/zwVjp3WGPR8tzO6J+wpUgVa3+vn2OPCxzAdbeG37M46KztH8WFt5buu4e7l2x
Subject: Simultaneous build of two intree packages
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
X-List-Received-Date: Mon, 07 May 2012 12:04:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Dear All,

I have three intree recipes A, B and C which are part of the same layer.
=> B depends on A
=> C depends on A.

There is no dependency between B and C. Only important thing is that B
and C are not build simultaneously. This is not a problem unless I use
configure BB_NUMBER_THREADS > 1. Than builds B and C starts to collide
and produce mess because they are both intree builds.

Is there something like a mutex/lock mechanism in openembedded-core,
which would forbid two recipes to be build simultaneously?

Thanks,
Radek



