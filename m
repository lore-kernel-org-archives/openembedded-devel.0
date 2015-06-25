Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 44AE165C9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:25:32 +0000 (UTC)
Received: by paceq1 with SMTP id eq1so42723990pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3IwyfTYSHgK0Yjpm0NETNHKkMssZ93uV+bfcW3QTMPI=;
	b=Mk4jrJDpVV9FiRYEFqGWNTJHhRLAGT1IQqtrtLMNCF3LTer9fiWmg6AVZj2i6clwj6
	O9m2ytXglAos0tPItLDwpt31bt5Zrk4cYlbvRYCbhVGSLbyPTCT7EIllMSqihcbaS6Ck
	4OGoJhp+5x/c5Waf/LOafVzxZAMyY/liBEFsQc74n1usNDbYarEf+hybwgUi4b/23xtN
	8vZwxpuXNsexAjSD+A+UCwaUwBFhDf+o0rgt9qxZqnEbspFD+dhFHWluN4ZD/xHaRzJH
	iUDQdv/1iXJw7eJq+kiZfyG/jmFN0dv2K1KkTwOYPuSPAZykV1cfqJ5/58GfY8014yLC
	y3LQ==
MIME-Version: 1.0
X-Received: by 10.70.101.3 with SMTP id fc3mr17899862pdb.167.1435209933749;
	Wed, 24 Jun 2015 22:25:33 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Wed, 24 Jun 2015 22:25:33 -0700 (PDT)
In-Reply-To: <CAK8F28mMAiCFLv3S_WNF-osWSX98kEw=YaB6aeisbnnPXQNx5Q@mail.gmail.com>
References: <1434982373-23401-1-git-send-email-schnitzeltony@googlemail.com>
	<CAK8F28mMAiCFLv3S_WNF-osWSX98kEw=YaB6aeisbnnPXQNx5Q@mail.gmail.com>
Date: Thu, 25 Jun 2015 07:25:33 +0200
Message-ID: <CALbNGRTSLyeKMhq6hybTyPER7Lijv9nmpk7+gMy-e8--Y7b0aw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-session: ensure ip for machine is found by adding to hosts
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
X-List-Received-Date: Thu, 25 Jun 2015 05:25:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 25, 2015 at 1:54 AM, Ash Charles <ashcharles@gmail.com> wrote:
> Thanks Andreas.  I gave this a try and the patch work for me.  That
> said, I don't see a long hang in any case---likely because
> systemd-hostnamed is taking care of providing this resolution.  In any
> case:
> Acked-by: Ash Charles <ashcharles@gmail.com>
Funny side note: This does not happen on all machines - some - e.g
overo - work without issues.

Andreas

