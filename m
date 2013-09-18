Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 61757610F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 20:44:00 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3745263eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=5ShwncFqYDnRYRpHzsIWTgPPzcyf+j97v4Jw4ply/Rk=;
	b=NGLjS35GwQuZwYGrcOHuOEaNNuQ4fn0bnp2LOIG+BXQN9HqgXGrx1rPvnMyJIfNq6k
	7wujZaFAda9d05gO0zAraKlnTUpU4woHVJGFC3IpRjjK4WrlLtgqeB3Tfs5W1xcV/kl0
	6x481fMJXUYLNGmQQjxJVEyVw1QqA5lmRim3OK5DymqHp/398A464x4DMUnoYXml8NWv
	GSqUQPvsOZKEJvIy7zj82dsuDMPT0+Ag0kiJ+Kue7EcNtTMeyJMOglw5Yr/aZcthS/zy
	S1VsFTapDdPCQR+3FF+NRu0uqLIRU6Tmpn+YHtSBRw2YLMN8RQ0knrrkKbfCuf/I7Hgl
	5APA==
X-Gm-Message-State: ALoCoQmeRd1w7FUPQJEKxCGue6Bhi+8F8trkf3dYdnWggnVgbZTdQ6JoYCajEW5/0Fc1J8TLuxvN
MIME-Version: 1.0
X-Received: by 10.14.39.73 with SMTP id c49mr5386446eeb.61.1379537040986; Wed,
	18 Sep 2013 13:44:00 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Wed, 18 Sep 2013 13:44:00 -0700 (PDT)
Date: Wed, 18 Sep 2013 16:44:00 -0400
Message-ID: <CALmOhgm8XfD31FZbAARZcpxFwH2arMX7PeNWa1TMhbzmi-pXqg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: qt5 qmake
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
X-List-Received-Date: Wed, 18 Sep 2013 20:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

If I want to run the devshell on a qt5 recipe from meta-qt5, I can't
help notice that if I do:

    $ which qmake

I get

    /usr/bin/qmake

The qt5 qmake gets installed (in my case) to:

    $TMPDIR/sysroots/x86_64-linux/usr/bin/qt5/

Should the PATH which is generated for the devshell include this path too?

