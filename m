Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C8DD961185
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYtH28Zjz3K;
	Sun, 23 Feb 2020 19:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582483256;
	bh=ukLQlsDR0y4QFP8shZ83XGRt/N2qLftyW7MzKbjvwBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJIUAh/+aDigHDcyBspRBxBtFGjuWlTiSbi0ExZPq6ycfvQQLvGgRFZT+eyEfTKE1
	DIamy45oxvnJF7Jwc/3Whvwi6Zy+CQtwsCIz8Hnj/6CWn4NPJW4x5FHVTkezAJcmTo
	alT0wB+pEjpGli8DWuwYyZRZ+Ads+bYpZmQQhQ6M/Iqhy4DXhg8gugP4jgUEWX29co
	KnQ0ulnpNAA1/Z5FMpccdjb3mbBbYnCSKAOUCJI00oKcw3C4XS2O4PuMqg8p19WDZ+
	FRC0oXeYoP+U02P4PKvBdPyX/bEEwZGYvaMg3qf/3T2hdOAaGQb6HG8QI8jlHK11M5
	kQFfrGyIdaXdO1q8zwIeokGhvmUtdtxgbbS+hblBXOaoIM+PseJTHlGggypeTbxY1l
	AKxAQhZHmdtWQ8ipyPb57WM1PvfWFgSFLCqcrsa0qajNz18ZQcPel6EXjYOLmenS3l
	9i4RtAyv1qfWTNKMIFha4dVhKD5oA0UqxzttEm5mRd1tdhVUmoflkc8DsssdFbqybO
	cz1ZbZZ3kBNm0Q5m2pbp/saLwFo5QpaQN2lYc/TPfKHkNYqmNNObHrpJOeyG/qvYfC
	76vK9Rt5DA7YQEE2BeLhqaMA9Al3ft108ha0IBaOL6FaJEAAZnbknHho4hEnklHPb4
	Ez+9TlE88XorKgjqjLpX2N4A=
Date: Sun, 23 Feb 2020 20:40:52 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <20200223184052.GA3444@localhost>
References: <20200222052935.19762-1-jpuhlman@mvista.com>
	<55c135f4-f708-bacd-889f-23f7b1e7d889@gmail.com>
	<463ee6f2-787f-b536-229b-9ce4718df026@mvista.com>
MIME-Version: 1.0
In-Reply-To: <463ee6f2-787f-b536-229b-9ce4718df026@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ipmiutil: gzip man pages with out timestamp
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
X-List-Received-Date: Sun, 23 Feb 2020 18:40:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Feb 23, 2020 at 10:23:48AM -0800, Jeremy A. Puhlman wrote:
> On 2/23/2020 12:15 AM, Khem Raj wrote:
> > fails with clang
> > 
> > https://errors.yoctoproject.org/Errors/Details/392235/
> 
> Its a hosttools issue. I was using hosttools tarball that uses pigz
> as its gzip. Just needs a depends on pigz-native. Ill respin it.

Is there a reason why you aren't using -n instead?

cu
Adrian

