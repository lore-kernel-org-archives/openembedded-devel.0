Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id AEDB7787D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:40:27 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id ay8so7897530plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fRdR+kVru+Zg5mu7G9OUY2ljn323lbTUC6LwVSAQO4g=;
	b=vhbvmVyc4ASHJ0RvESsqps+ST8d7aELbk4qDMsdQnQAlEac8/03EMtzmfW7TAaklR1
	SWsDiyy07UhLywYYWiNwd/mXIuCFJM+eVrcLpTIvvh5MRNa436234OQhJODTV7GfXias
	vRR9hgBxRbgTB+kCdDyrunuAv5djnEjOwdI9Y71KdoYd6jpyF8a0XVEfxE1ZZ9G7bdOc
	6CXvEUdxnVUzwkOl6iy3L7RLln5FvduszUorBFwCdwg0hzn+cUsJlWPtjCKFAOrdU73g
	C9tYOFMpO7By/ZoqhDxfcIszPbIHWZljHIv7vFapibRBpLNOm4e01X5bt9ls5aSM4DgY
	nV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fRdR+kVru+Zg5mu7G9OUY2ljn323lbTUC6LwVSAQO4g=;
	b=C13QQ78Z77nLezvoOc6F7uJUq4zuYgNYjFks+LabSDLH97hvOyLz8qv5xT8qcHQn27
	7jtj0R4RbIvJl+VHWdT0yDynqIY7iokUGQz0poYNpegKIaA2aqn5qQ9NWYUSc8CaeJaG
	DoyeWRIEAGwgkImsOwM3eyC3p84lU5tLmzFHq+Xrvcsaqb3vMnM/cAeBCjSomP2vIqop
	xoYrOaHHnqRIde+Ue1sSX8AjmoDbe+VYJ4krf4ibFrLJAvCtWToMpiWRRMqY0Qgn4mdB
	cmQ3/8OH+ChzpanCPQ2hxFNkIzc+ocsZuHF2Pk6CP8fzshSFIjp6NYcUmQEXpld/L3bs
	nZyg==
X-Gm-Message-State: APf1xPAbjPnIKStEKKxuPouNoWfRVOPQJ5f9v0C0zegLIS+WhEI0OQOp
	sgHaBsf3sRI1RVagFTzxIjpP6SOT
X-Google-Smtp-Source: AH8x224pwzTrOLxW+rk3LPawuNWtJP7IbyDcdARJf9RSJSOhJjilKPD5bDzTQVG2uFvCp4BqYjXc6w==
X-Received: by 2002:a17:902:d205:: with SMTP id
	t5-v6mr539769ply.322.1519152028399; 
	Tue, 20 Feb 2018 10:40:28 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:1018:c2d5:2fd:6d43?
	([2601:646:8880:466c:1018:c2d5:2fd:6d43])
	by smtp.gmail.com with ESMTPSA id
	j25sm65782693pfi.118.2018.02.20.10.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 10:40:27 -0800 (PST)
To: Tim Orling <ticotimo@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
Date: Tue, 20 Feb 2018 10:40:25 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 18:40:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/20/18 10:00 AM, Tim Orling wrote:
> The recent improvements to the Auto Upgrade Helper have made maintenance of
> meta-perl less effort and therefore you have seen an uptick in my updates
> to recipes. I also plan to mass-add ptest to all perl module recipes
> "sometime soon", which will further simplify my upgrade workflow and add to
> the confidence of said recipes. My upgrade workflow touches all recipes in
> oe-core, meta-oe and meta-perl that fit a lib*perl regex.
> 
> I will note, however, that we are revisiting meta-cpan and that may
> ultimately be the preferred perl layer. If you really heavily on perl
> modules, please comment on whether meta-cpan would fit your needs.
> 
> Derek and others have been doing a great job keeping meta-python up to
> date. I mostly jump in when there are trickier failures that need more
> concentrated effort. I would like to see increased testing (more packages
> with ptest), but that is trickier with python recipes as there are many
> more approaches to testing than there are in perl. I am happy with the
> current efforts to keep recipes up to date as a priority. I would like to
> see complete coverage of python3 for all recipes that are capable in
> meta-python.
> 
> I am open to discussion about what direction we go. Individual layers that
> are curated and built together by YP auto builders sounds like an
> intriguing path. If this was coupled with increased ptest or testimage
> usage, our confidence in layer quality would go up dramatically.
> 

I would like to understand whats stopping YP autobuilders to build
layers under meta-openembedded repo and contribute changes as needed.
All changes with test improvements etc. above are a good change and
should be adopted across layers. However splitting layers is least of
the problem as of now.

> Cheers,
> 
> --Tim
> 


