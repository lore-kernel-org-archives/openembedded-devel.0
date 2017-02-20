Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7B70F71CB7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:51:49 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id x75so60975305vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 04:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=d7W1dPQpk9clNXya645NcXG0Y/WYpQI8s4NpxvH2YpI=;
	b=fbFe6L+0ZQWvuDuSeCR3quSKkEyarkIUBsPhsz8EVxoyOPp2ktX6DWLS1QCpcxFpmV
	toMuxRgtChGe1d8GqnL2I5iEgPB8sx3yJ4mD0pWC7dNwS2v5/hheI6P7gDsWzCtomgMX
	GFskccu0LotgTMqMl84YwE6EYxzWWcfbJON0WR7pOZ/fdDBbZvW1p6gVgeb5Rmj8NlS3
	9t/MB3cixSHh1tjzo4uc+yqd3BT6p0dj5DIUDJ5K/Llz9kOikyb6YXfbD84uvBx0kvso
	rtq/vMO/eCmMlDCHesVL15qrIKFAHjkDe43P49pXaoFh+DZbvxPBDoft5SFUh9zOPTaG
	Iv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=d7W1dPQpk9clNXya645NcXG0Y/WYpQI8s4NpxvH2YpI=;
	b=K4iVr4s3qFzLH4KMYb9iY+xYIIeQlx1ipDcm7cONsBO/+/S7191Vm6tF7ETTmsgXwQ
	r11u0Vu3ts1LF0ytWBna0flWp3EUfnGu9TlS2s14hu7r7vyMmifpYJaKgTCkCKVQcvjf
	0BDtnTBVJcSsIXQKiM2iBsvqMnNpsqG2cEoiLOUdMDJJ7semp7Zk2YdpbGNo+58Pm2cv
	X0MLlPmCmiMDAxQT4jCYoq8aOIwR4jeVvL4Mi5a8z+1I+iMsOgL2P7TdzdaM3zat02N0
	jXzMHeGQ1Sht1/ulC5HiAJvpC34RxQ+jDAd/Bx8xxKKW9pBRnshhKiiemLfu/qzDiKB8
	lFsQ==
X-Gm-Message-State: AMke39n7b3KUuqshXBOo1H3JUy2EanCA6vV5fS3X/nd+AbBrkZpFU3OiwBuXOTmafIkwEO+OtkzXQGNwOrN1iA==
X-Received: by 10.31.8.147 with SMTP id 141mr10729766vki.111.1487595109996;
	Mon, 20 Feb 2017 04:51:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.72 with HTTP; Mon, 20 Feb 2017 04:51:49 -0800 (PST)
In-Reply-To: <20170220121752.GB3266@jama>
References: <20170211141745.3380-1-gyurco@freemail.hu>
	<CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
	<20170220121752.GB3266@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 20 Feb 2017 13:51:49 +0100
Message-ID: <CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Mon, 20 Feb 2017 12:51:51 -0000
Content-Type: text/plain; charset=UTF-8

> In last build I've noticed only this new issue related to samba:
>
> ctdb-2.5.6: ctdb rdepends on samba, but it isn't a build dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
>
> Maybe this dependency was created from samba being libldb provider in
> this build.
>
> gvfs and whole meta-gnome layers is still included in my world, maybe it
> didn't fail because some gvfs dependency was already failing or one of
> samba related changes in master-next is fixing this one.
>
Some background: During last weekend I prepared a series based on
master-next unblacklisting. First target is to build a xfce-image
again [1]. Last step yesterday evening should be rebasing against
latest master-next and run a test build. That failed for gvfs - so I
stopped sending stuff. Now I know why gvfs fails...

How do we proceed with this patch?

[1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2017-02

Andreas

