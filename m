Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6BC60616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 16:37:57 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id bi2so55709565igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=W/zw9QK16HnpwVCoNwI8oFZdXZ7K/OwBhe+NiPu0NRg=;
	b=NXhPjEZsuefVQKjERoiBHNqO6FHnvXSn/KcVdrOHk5C9Y06ekLNtnvf6R2zuZAbxDu
	lu8obzaeFYLvU/Z6JhcEK02IijpkO+1KM5MmtN2y4YkvPEVgOF4+JEspe/HFLzwdIp4o
	3zv1QVpOn7OB3tyWTAolr0XV7aoCrW6tANq08XbBS5Pz+HME6ToC2pv/Rq5l3am0TAam
	1f8Xya5nu6Ghm+C3GAj6fyzg6l19AZKKbDg7GiNBUeLSLTRb0WtAmMiMadaMz9bWZ8vs
	5IaiAinXfdQedZ3NbWcSdodHGI8G4hzgtmENvZQIBWNd0hIGsJNHte7nIVIz/O/OKZpY
	0IYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=W/zw9QK16HnpwVCoNwI8oFZdXZ7K/OwBhe+NiPu0NRg=;
	b=rdRaDfXT9uqcU4Ahty/sYS8/Yq8a28ltVgWVvbZez98Wkvep0yGZnYlNt8hbnR9ZLt
	Jbd4ivR8+Y6zv8lSBLyPzE2b62j6StYsOhRVa+ol7YIzkUFgVK+9BGyAkps9sl3gBD9E
	6FrcHUqYeXw2qu23gtOghYFqIkrsLn3jNVwq4vtxsCu0DtrAhzyhC/3ZL0++S+/xB1E1
	rVO+HSP1r2jw178ANPCZOCVpKPeAo6Hx1JPOrC/Cll0CQedEJFFmDT4uPLCs+Rh3EAiF
	VIF+vakzkKkV6zvtdHwrYmsxptujw4FVaDzUpuFHqCrlWsdKbzQ3kXgRwKwcnIUT2sHs
	Psvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=W/zw9QK16HnpwVCoNwI8oFZdXZ7K/OwBhe+NiPu0NRg=;
	b=Xi2TYDa4YLQ+Q0/nJ0Xl3pVDbT8TscggZPBBIfxhxxQL8jUb3AaUG7C1bMsbSFTJYS
	jIVhwkDA/RbPAhb4t6XJ8tpZbyIKlh2XX5aDVdbapMBGF+1iLpdKLLhRHO+zyXKyKMRu
	uR5Q0w1Pb1fj+akRq+3XkB0LeiMWuPbEEdh8TGQqLgRqcTRUOX1vYIKuvwrX2cYL1LYV
	tNf4PEHvRrJx3T17w1uAkw+pNSDcxsH2UXkYOqqWSN19Yz9D5Q16KARnbhIou5m1Ag8X
	+wzfYmjgfa0OcW3b/yETjyhnx0/jX4BgFMctjfl9rDGZYzYR/ebN7hxOneD5LgQGzu2Q
	9ABA==
X-Gm-Message-State: AOPr4FVwW91KY5cy5PsKBx06VSBZK1fbLieNesBzpaGPMMaXeZeh1NiR8WvstmoCGldMLUOU9N51xm724ZhSjg==
X-Received: by 10.50.123.161 with SMTP id mb1mr19323307igb.20.1464107877718;
	Tue, 24 May 2016 09:37:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 09:37:38 -0700 (PDT)
In-Reply-To: <365E1805BC95084CBE82381A0B8699940127D133B7@EU-MBX-01.mgc.mentorg.com>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-3-git-send-email-gary@mlbassoc.com>
	<20160311131752.GA2555@jama>
	<56E3A074.2020509@mlbassoc.com> <56EA7828.4030606@mlbassoc.com>
	<CA+chaQcnUGp3=ovW17O+-6Do_fimaOST6BeprK6L+=++Rh0_oA@mail.gmail.com>
	<56EA7CB3.30002@mlbassoc.com> <20160317144519.GD2553@jama>
	<365E1805BC95084CBE82381A0B8699940127D133B7@EU-MBX-01.mgc.mentorg.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 24 May 2016 09:37:38 -0700
X-Google-Sender-Auth: RTcWdsm6FGAcQXfIFk8o80066tw
Message-ID: <CABcZANkWcZ3bgbckV_MxyRUdPKFxA+2DcFXt=WCEgN+MpPCXmw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3 2/2] mpv: Media Player
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
X-List-Received-Date: Tue, 24 May 2016 16:37:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 21, 2016 at 7:49 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:

> Hello Gary,
>
> Are you planning to send updated PR for MPV?
>
> Noor
>

Any news on this series?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

