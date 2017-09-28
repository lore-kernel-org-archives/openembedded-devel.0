Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9F96B7198E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2017 04:49:27 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id v23so288102pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 21:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=MMvFPcvdQR/rrBu2Xnlyxs4iIewbvfc6KtLEhxPB90M=;
	b=iW10zd4S7PZnabWZz5cmQZWLN1FsaXbt/yDun5ln2lKyYVkwaAunqJoK9X+D8TamhT
	+06Rm/ErginMNbD8ZX46GtGVr/6lJEi4mPo8zGaQrbJnqWWND/J8jr42gvvGZM1X+vtB
	mRvSuCCoQk1VP4loIzWdJFwXnIPtv/cbWWRic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=MMvFPcvdQR/rrBu2Xnlyxs4iIewbvfc6KtLEhxPB90M=;
	b=FVSiQfjZq2Jk833gaMPRqTn5fgeObOG13/gKhPMJ+J6Z4BVAuM8ilJtFfmcJL8336L
	j1OID0yRjUdAgxnJOnVPvu2V5k6KSlKzQOQMG2fi4fzj80FM1tfevjKNkWOTjZ5gxnNH
	UfMUnpnjNTvH5olju8DXf7Iujx5OthTU12RoklJywyFlMjHVvhAJ4XUwylrMx4EoVHC6
	HC8dfo+kckVw4DpzfepZnZm2u1JshVVv8dUaIVooNA5TqfwKOVGiFz5O6IJK7TbkHC/5
	DFz55V0t/mDnZ+1i6YWo2C8aRL5p1HxfyMevmsHKlt+DpZO75OKj4o4vpt752dzz1emT
	STcQ==
X-Gm-Message-State: AHPjjUiDIR6Lcs/eW7+ANJqdZlRl7ePtJFpNQ7szPWfcErf3ZKjll/rp
	FUeNfkc6xtjv9wtlI5rNOqgo851Vm+o=
X-Google-Smtp-Source: AOwi7QBx0C2cB5SA14eycUN592WrZeMIms55lqXHfJy0GZuffW81w6yBld5RxO/m5mdlSc+LD4ymxw==
X-Received: by 10.99.117.81 with SMTP id f17mr3262523pgn.314.1506574168255;
	Wed, 27 Sep 2017 21:49:28 -0700 (PDT)
Received: from yct-lpt.lan ([172.58.40.225])
	by smtp.gmail.com with ESMTPSA id s27sm756049pgo.59.2017.09.27.21.49.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Sep 2017 21:49:26 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <b38b99b3-9090-a99c-06c1-396ce3baab26@linuxfoundation.org>
	<CAHQecY5WmsyfQTpEj_ipqMVsak3LcJtr=JonpsikKW8N94eCxw@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <d65a22dd-7d21-4e2a-412b-07d99cb5b515@linuxfoundation.org>
Date: Wed, 27 Sep 2017 21:49:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHQecY5WmsyfQTpEj_ipqMVsak3LcJtr=JonpsikKW8N94eCxw@mail.gmail.com>
Subject: Re: [infra] git domain name updates
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
X-List-Received-Date: Thu, 28 Sep 2017 04:49:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 09/25/2017 05:38 PM, Tom King wrote:
> I would like to do this with the OE Git as well as I see several large > spikes everyday where the server gets very busy and this would help:
> > git.openembedded.org for read-only access > > new
push.openembedded.org and ra.openembedded.org for those with Write >
Access. >
I agree, the same improvements are in order for OE as well. The new
domains are available now.

Please update any ssh remotes to point at either push.openembedded.org
or ra.openembedded.org. Make sure any git:// or http:// remotes are
pointing at git.openembedded.org.

For example,

git remote set-url origin
ssh://git@push.openembedded.org/openembedded-core-contrib

Then we will be ready to accelerate OE's read-only git access when the
OE tech committee approves.

> Tom King > Infrastructure OE Project. > > > ---------- Forwarded message
---------- > From: Michael Halstead <mhalstead@linuxfoundation.org> >
Date: Mon, Sep 25, 2017 at 5:17 PM > Subject: [yocto] [infra] git domain
name updates > To: yocto-infrastructure@yoctoproject.org,
yocto@yoctoproject.org > >
> Hello,
>
> As Yocto Project continues to grow load on our git server does as
> well. We are going to make a few changes to our git infrastructure to
> allow for more growth.
>
> All read-only git operations should point at git.yoctoproject.org. For
> example poky can be cloned from the following URLs:
>
> git://git.yoctoproject.org/poky
> https://git.yoctoproject.org/git/poky
>
> If you have repositories pointed at www.yoctoproject.org,
> git.pokylinux.org, or any other domain name please update their remotes
> to git.yoctoproject.org.
>
> Read-write operations via ssh will use a new domain specifically for
> that purpose. I've added push.yoctoproject.org and ra.yoctoproject.org
> (like ra.kernel.org).
>
> Read-write URLs should be updated to the new domain names. I've
> changed mine like so:
>
>
> git remote set-url origin ssh://git@push.yoctoproject.org/poky-contrib
>
>
> This is all ready to go right now. Please update your remotes.
>
> We will have to make these changes required before we can start to get
> performance benefits from them. I suggest November 1st 2017 but I need
> more feedback before we can set a cut off date.
>
> Thank you,
>
> -- > _______________________________________________ > yocto mailing list
> yocto@yoctoproject.org > https://lists.yoctoproject.org/listinfo/yocto
-- 
Michael Halstead
Linux Foundation / SysAdmin


