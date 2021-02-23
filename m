Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.3322.1614115878958406126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 13:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=LEBCtTzj;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 232635C00D2;
	Tue, 23 Feb 2021 16:31:18 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 23 Feb 2021 16:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=QsEovNSqacpkFtN8ELseyrq4pt2GQaA
	C/2HKoZ4f78A=; b=LEBCtTzjCi14vXtMU/tabzoIy3G0BQUeYfkKaPZGq67CLKp
	gWzOH8GkNLuQweK985vWHqHUyzAfF1VtplW7mtH2rmW0GSqpGZQjul4ZvVIw72Q0
	Fs81STRUU9syuc+EeDfsqqpufbwno3TeyiDj1Em9EBRSErXD6xequluikbv8QPzl
	XP/n7sFB6p9j2o49RVFlwQHSXnGl4X88LiL7Kj9JnrYAOYfKkVBRcFxExLQ/u0Xz
	heYRefRe6Iipn6iwakgeoR441oA7h4bDVAF8XVhgydhKe7e6SubbgN8/dI8IMIGw
	OpJADvf7knpzSY4MPWxDPdY4g+8MKLB845kcbLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QsEovN
	SqacpkFtN8ELseyrq4pt2GQaAC/2HKoZ4f78A=; b=Cb6FWCcht4tZzgkC7L3o9t
	TtVnu/sefEk13BHhEUZFMBHy4FJK5h/lq7BpC0mw1jnP3f3nc3NxzbQpON3FWnpi
	FF2Mi+49QJsMEGGZgRvx0DRyEz0+0qaZM60ZdTWU8M537wys7+wUEgZVMhRF4cmL
	j8YBv3L4jV5EAOfDjpCatlBqpcfeUQxKdGerDUKmuKJxS5eFUE72rOgQcLZB229g
	RpNPJHkfMRiBh/P/qihbUgHYOsnanYB+0NmAFL8tudO6XvbTj9AlLc+W7ksb1iCD
	qDCVebwt9IxZ7UCdxH3u3AqenH2tK3n4XjPbUoCgL9HdWprRkQbtaBpm6OMrVluQ
	==
X-ME-Sender: <xms:JXQ1YOsspRlc4PExUv5Su6YtRVOj_nTeo02JHYRgpv-zdlrhlHAJSg>
    <xme:JXQ1YDdeScwHReMQAuUexbmfbrTWzdeQ_zlLTbJkKfjIRxXqAGAiYEDsNs2ba8gDa
    XD5CG_wyYggAKdslTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgddugeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeelgfffvddtjeeivdehleefleejfffgleeffeeguefhvdevkeef
    ueeuleefveeutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:JXQ1YJzf9mnE-as-uNljOILBNpc_wKrAFt5pEXaDRrQSZYbYxA5j0A>
    <xmx:JXQ1YJPJtpu8P2HRWhrJsJSOXmYHIj6uoABL7M1GTOdS5Kgo6y2woA>
    <xmx:JXQ1YO-ptQ9DLwLZ9fetfYCQHJgXFhL4ZNG6IadhbMm8LU-B_cRFjw>
    <xmx:JnQ1YDHUjVu11KWkGd2ZNSiR0OAGdGKx59HAHE35iZuUK-h5R_Cc-g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A2800160792; Tue, 23 Feb 2021 16:31:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <4deb9ec4-605e-431f-95f7-1b6f9e948635@www.fastmail.com>
In-Reply-To: <7a1bf385-91e5-4076-bbee-b5d14b7c1e54@www.fastmail.com>
References: <20210223162705.2595483-1-andrei@gherzan.com>
 <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
 <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
 <20210223173002.aydz4xm65ylvgy4k@jama>
 <7a1bf385-91e5-4076-bbee-b5d14b7c1e54@www.fastmail.com>
Date: Tue, 23 Feb 2021 21:30:49 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: "Khem Raj" <raj.khem@gmail.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Content-Type: text/plain

On Tue, 23 Feb 2021, at 17:47, Andrei Gherzan wrote:
> On Tue, 23 Feb 2021, at 17:30, Martin Jansa wrote:
> > On Tue, Feb 23, 2021 at 05:19:16PM +0000, Andrei Gherzan wrote:
> > > On Tue, 23 Feb 2021, at 17:15, Khem Raj wrote:
> > > > On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> > > > >
> > > > > On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> > > > > > From: Khem Raj <raj.khem@gmail.com>
> > > > > >
> > > > > > We are seeing warnigs with gcc-10 even on target builds e.g.
> > > > >
> > > > > Do you use gcc-10 in dunfell builds?
> > > > >
> > > > > dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
> > > > > backports or the warning is reproducible also with gcc-9, but I'm not
> > > > > seeing nss failures in my dunfell builds.
> > > > 
> > > > I think its the native one he is running into issues. Perhaps he has
> > > > newer build host OS which has gcc 10
> > > 
> > > That is indeed the case. I'm running 10.2.0 on my host as of now.
> > 
> > _on your host_, but why is it needed for target builds which should use
> > gcc-cross-* 9.3.0?
> 
> Good point. Let me take a deeper look into it and come back to you.

I have taken a look into this and I think the conclusion is that your builds are not running on hosts with gcc-10+. The target build compiles a native tool: check nss/coreconf/nsinstall. This is why, as part of the recipe, we are passing the NATIVE_CC (as BUILD_CC) to get this pointing to the host's gcc. The Makefile in the path above uses it for compiling nsinstall.

```
ifdef NATIVE_CC
CC=$(NATIVE_CC)
endif
```

So this patch remains relevant for builds where this patch is not applied (for example dunfell) and on which the host provides gcc 10+. 

--
Andrei
