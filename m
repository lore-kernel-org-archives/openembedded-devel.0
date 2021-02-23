Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web09.203.1614100777266269290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=ECyK2DSh;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 931B35C00B5;
	Tue, 23 Feb 2021 12:19:36 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 23 Feb 2021 12:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=aVIJePY4AGg2oRdnPXJM3REXGZwUQen
	CdbVKLMdJLGE=; b=ECyK2DShwMLXC9wWbMzLrTFEGGsfxg2rUwIqIJPK3wWfFks
	uAHroE0bMTPQlJlYvQ+2MAn9JkWpfAVcgB5Cs2wToYpfZsYlwCRPglnKnQbA0Axf
	GrJw9y+cpt3JkXEZD/tD9OJ4nP4wmlYvn/fFG1yDoLSj/swK76swufxVW1nuNl7a
	LNWJvdWlEpIDUM08IcQGCSttXkOr/fTao71l46cC5mQ/1Le81WwlrhQ3jvpWdVN5
	zBvvb1XBAu/9DliilOq6EawAMBRkg+j0bT8rRDoi+WpwqCB0/H6ibLFslBlhv3WK
	X5MsmpSKB2+MzCpv79BWXHwS7p9dqJI/qJUgOwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aVIJeP
	Y4AGg2oRdnPXJM3REXGZwUQenCdbVKLMdJLGE=; b=f3hYz7ZZkbYqJfittzCa7n
	jKEteBNmyE9+36ERVjlV2F7J/LbdYeH+eZ1LpBCyDeQQqxg2NrMbvh4KZn6sW2Vh
	mYz5z//Zf02cjOUs+upHcXsrwTuFD7u9Lttb6ovXML7cvJW007r6nf5KxOllRX43
	SvoDH9ab5FmTmZEdVx92RDhRRKf+bGzbzSBatpV0xXbB+T5KPNNsMDReQlkwMJ17
	MEnsG2r5NmCZ0pR2587RXNpdS+gz2NcPXSw0lUarkIu8RYJNp2ZdPKo3btAWTUcr
	f7JwPzDi6i0wuSEPZkeJJeNW3rmPyPlGG6kl90sRjna83FD03rkgyWM1iwA8xxCQ
	==
X-ME-Sender: <xms:KDk1YO-yamE5sAwsm3_YbANV-3FTOrERPcudosHhub4AHwloXLiQUQ>
    <xme:KDk1YOsFe9VNHm37RncHZEKFioHkWRxPoR9ZEysb5CKhhyWCTbMlTRnEUVCwhL0Gf
    kNPU9R2GUwKsqa5JwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecugg
    ftrfgrthhtvghrnheplefgffdvtdejiedvheelfeeljeffgfelfeefgeeuhfdvveekfeeu
    ueelfeevuedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:KDk1YED_tqLeA5kOAnLzGzJpDl_jDAvnOvzwPqp8mp8yufw7Iieb4w>
    <xmx:KDk1YGeaIcVD836xuXRl_PMywLj_zN92fKzMIzvuaEqOmygob5cLNg>
    <xmx:KDk1YDMMPwXc1SUgCbNmBM_XMFfff1GqjRXJDFJzOmpiIXCFnxzsVw>
    <xmx:KDk1YFXErG7BMdNnifsDDQ8lfjn5PLv4Q6PK2GRumez30F9HMiFjnA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 30D0816051E; Tue, 23 Feb 2021 12:19:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
In-Reply-To: 
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
References: <20210223162705.2595483-1-andrei@gherzan.com>
 <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
Date: Tue, 23 Feb 2021 17:19:16 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>, "Martin Jansa" <martin.jansa@gmail.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Content-Type: text/plain

On Tue, 23 Feb 2021, at 17:15, Khem Raj wrote:
> On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> > > From: Khem Raj <raj.khem@gmail.com>
> > >
> > > We are seeing warnigs with gcc-10 even on target builds e.g.
> >
> > Do you use gcc-10 in dunfell builds?
> >
> > dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
> > backports or the warning is reproducible also with gcc-9, but I'm not
> > seeing nss failures in my dunfell builds.
> 
> I think its the native one he is running into issues. Perhaps he has
> newer build host OS which has gcc 10

That is indeed the case. I'm running 10.2.0 on my host as of now.

Andrei
