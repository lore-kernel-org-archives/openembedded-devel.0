Return-Path: <stephanoc@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 28E1E60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:47:50 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id uo6so422998735pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ic775UcZd5Cx6m8tlqWGdbiYEO8y3dtVh5MElEjGBkY=;
	b=NUnMby9Q7MHGbhS6aCaYIgVugANjJBJaY2+/QXbyt8QhyGxiWGPss+Zd5TmMfuC8hD
	bl7Fvblipy1YrzkOVXUwEcYTTpHDTwN/mZWOin3aEQVBOTtvX1SSksMvnDP7CxU2NPx5
	m1jEPysuCn+JL4Pg/IgtTR3OZxUqtY/kx+meC/9xyJu1e2zLWsQas3gME5RONNluWWgF
	Ibxs4a8wqatEVRuIouzTaM65w7WQJNrgybUrMYU5saJBFPJQjaVlZHIy0WvLXqSZE+z4
	/59jor2WjhfNSg+tENDDX8XIbNmAJ164/Fu1r5+6gSvl3W06YFrV9ISbh1EQWgxTdYRE
	MmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ic775UcZd5Cx6m8tlqWGdbiYEO8y3dtVh5MElEjGBkY=;
	b=SdJ8xhuiasdPUTzZVDuWsgsV9obY61EeQLI9KbzeyyAfbqUZ6b2iUgU76EDe238cBv
	Rfun6KgAQYBLpRRmU/V3fl4HUOzypjQzcNjhQEMMOJiXU9GGbbCCpmWfB0qWCcXLwRBX
	nujEq6r1kj8IrmzP0MD119pNLWiuvhgpenogcSFopKIXYwE8fBwHIgKCFIFTumnAT/qh
	z6+pzJBElOUuIl0k5qpYYSPu5MuZbxRKXMhffFpZcvkLXaGQ03QCG2dmrzMIBF0JbknC
	6+ZCzhGQrBqLehnwb/pLVVQV18tN4KNkQO/PfAxpU29hFgQaKyE9/G0hIk7xWsG1y7+b
	hmnQ==
X-Gm-Message-State: ALoCoQnyW3lBsjHp/yWLfBm70U3fasIx/moB8wD5WJxTX7kNN/Qnapi3n4gzPOrDvALKzDtIkEEBGpWB3NPaMUrz7pylWkamog==
X-Received: by 10.66.255.39 with SMTP id an7mr36662181pad.101.1453139271194;
	Mon, 18 Jan 2016 09:47:51 -0800 (PST)
Received: from mail.spox.systems
	(ec2-52-11-37-43.us-west-2.compute.amazonaws.com. [52.11.37.43])
	by smtp.gmail.com with ESMTPSA id
	11sm35379289pfq.87.2016.01.18.09.47.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 09:47:50 -0800 (PST)
Date: Mon, 18 Jan 2016 09:47:14 -0800
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160118174713.GB28347@mail.spox.systems>
References: <20160118171933.GA28347@mail.spox.systems>
	<569D24E2.1060209@gmail.com>
MIME-Version: 1.0
In-Reply-To: <569D24E2.1060209@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Require backport of patch to jethro branch
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
X-List-Received-Date: Mon, 18 Jan 2016 17:47:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Perfect, thanks.

On 01/18, akuster808 wrote:
> Stephano,
> 
> 
> On 01/18/2016 09:19 AM, Stephano Cetola wrote:
> > I'd like to backport this patch to jethro:
> 
> Getting there.
> 
> > 
> > http://cgit.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb?id=9546714d2464b950e91d0eaf330865e482450113
> > 
> 
> This commit is in jethro-next.
> 
> http://cgit.openembedded.org/meta-openembedded/commit/?h=jethro-next&id=e4c37719db7bcab08b0bce63c268b604252a43e3
> 
> - armin
> 
> > Without this samba does not install init scripts correctly when using
> > sysvinit.
> > 
> > Does anyone see any problems with this?
> > 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

