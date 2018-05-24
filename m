Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 88E9274585
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 01:26:59 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id e67-v6so14338907vke.7
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 18:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qwBlI5Mk/zQPKvoFpj2p7AGQWSMqGSXecoer6cbrBq8=;
	b=X6MesZmJFmFZIQoOHeydP4V69B2JelWbnWQlMZvwj10ekG061SqiZ7u39gc4TbzVg+
	mA8nqueae0d2SCotqwNf+jkNwmLCmrQpz9qlrIhLcgD8V6BAIqbn0BRxJGLw2+EQEoqZ
	kpkjHhf6vWlq3IbeSwJenL/nUSbtybfyKNr7wVYAMoVmr7+u1tVbm/mTAwqFT5CBaelI
	ETx74giiQ0nQdL/8DBM7z99g02Y7c76KriYs9PFV5SQiMMobhbL1heYm6axPgny7xDXL
	+k5E1xiksyFXBJI3jppnHzND4mzIXB3H13OalxDqACYi6PFE+2v/CM94tnTxre++YBxs
	/kEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qwBlI5Mk/zQPKvoFpj2p7AGQWSMqGSXecoer6cbrBq8=;
	b=ozFfhJX7GexU3RrGSibW55jUP8ArDMWUBMat50wCkouMRobdv7ZIKqHwsfHpGgVrK3
	eY6hoaA9IJeDiHA1UCygG/vwGZBRWWL47WUhBIt+ODRKbapI3rSs2dYGq5QM3KFsb9vn
	kkk3tnIebXIrTkAbg/C3cR7H3eO9axUss1G6d5t0f34n16jBCtSf1TNtiIEnR4/AWgs0
	VYR34rQlcJWSYGR9lG6IxG+u5rgDTpkbSsO0R4n99vclrmRhh7iLCfEUS2zzwW57CTdv
	4zMRt1yrTENTxL992x2+np0FelmvRjbNwY+NzLLE2TS3mE454ftBISmNpdnRJUbNce3Z
	ppXg==
X-Gm-Message-State: ALKqPwd5pVis72OCGMBvvfMuWtvfe31J8nSvsdcqA8fg3brnVZ3FHz7L
	5zkQ7DL3q2AbjWQQdkTxEqHXHZJyWCfrncaAnq0=
X-Google-Smtp-Source: AB8JxZq0siBfdGo0dfmMfUu68lDMrtfF3MjEiTNmN0myURkec083On4bEKkOisOoTjloK7tJ7s6LExKsKVp1vlWS2kM=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr3086518vkv.174.1527125220316; 
	Wed, 23 May 2018 18:27:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Wed, 23 May 2018 18:26:59
	-0700 (PDT)
In-Reply-To: <CAMKF1spo+S9+NF7W6dkEnBBLDxWQfvrg3L93Rz1jdZ68UL182g@mail.gmail.com>
References: <CAMKF1spo+S9+NF7W6dkEnBBLDxWQfvrg3L93Rz1jdZ68UL182g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 May 2018 18:26:59 -0700
Message-ID: <CAJ86T=XXUE=Thv1Gpq9aC1bJq13qcSmKMt6-RRu3BZ=gsiSxnQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded patch flow
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
X-List-Received-Date: Thu, 24 May 2018 01:27:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 4:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All,
>
> I am writing this to just paraphrase the patch flight process that is
> in place more or less
> and I am going to follow.
>
> We have patchwork instance where all patches from mailing list are captured
>
> https://patchwork.openembedded.org/project/oe/patches/
>
> I am going to watch this and cherry pick patches from patchwork into
> master-next branch

New patches currently seem to be going into
meta-openembedded-contrib/kraj/master.

Is that the branch you mean when you say "master-next"?

> master-next then will be run through CI loop on my own system as well as on
>
> http://jenkins.nas-admin.org/
>
> tasks - oe_world_qemuarm oe_world_qemuarm64 oe_world_qemux86 oe_world_qemux86-64
>
> For layer maintainers
>
> Please review and provide your ACK/NACK based upon your own testing
> and judgement. If
> you want to rely on the jenkins jobs above thats fine too. If you want
> to test your bundle separately
> and send a separate approved patchlist via a pull thats fine too.
> Usually we do not give explicit
> ACKs and provide feedback if a patch needs to be changed. It would be
> good if you start providing
> ACKs if you think patch is good to signal. If a patch is not
> ACKED/NACKED and its passing the
> jenkins builds, I will assume you are OK with the patch for master.
>
> Submitters, please watch the patchwork for progress on your submission
> Hopefully patchwork will reflect the current state
> more accurately, if its stuck in same state for a long time (1+ weeks
> ) send the pings to maintainers.
> you can also check master-next branch if its still there and not
> dropped then its in queue for merge
>
> Since we all have limited resources and time, I would invite all of
> you to test master-next for machines/distros you are interested in
> (keep in mind master-next will get rebased) and provide
> feedback/review so we can include it in decision
> to accept the patch, any help will be appreciated.
>
> If you have suggestions, feel free to share here
>
> Thanks
> -Khem
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

