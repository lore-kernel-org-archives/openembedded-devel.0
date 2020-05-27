Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.210.1590609006043280853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 12:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:49178 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1je23w-00GTFa-8V; Wed, 27 May 2020 15:50:04 -0400
Date: Wed, 27 May 2020 15:50:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] use weak assignments for PNBLACKLIST in recipe files
In-Reply-To: <CAMKF1sr85R8xasLrgaSfO_in12cKPFSqD+xEKZirSeHh1hugmA@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005271549080.7100@localhost.localdomain>
References: <alpine.LFD.2.21.2005251518590.6822@localhost.localdomain> <CAMKF1sq2UQaxxdjZYMQh-jXmG5L-kre=xLv3SuaAEOZfFzu+_w@mail.gmail.com> <alpine.LFD.2.21.2005270613300.5432@localhost.localdomain>
 <CAMKF1sr85R8xasLrgaSfO_in12cKPFSqD+xEKZirSeHh1hugmA@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-872669590-1590609004=:7100"

--8323328-872669590-1590609004=:7100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 May 2020, Khem Raj wrote:

>
>
> On Wed, May 27, 2020 at 3:14 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       On Tue, 26 May 2020, Khem Raj wrote:
>
>       > On Mon, May 25, 2020 at 12:21 PM Robert P. J. Day <rpjday@crashcourse.ca>
>       wrote:
>       > >
>       > > Make sure PNBLACKLIST assignments in recipe files use weak
>       > > assignment, so they can be overridden in, for example, local.conf
>       > > files.
>       > >
>       >
>       > I would like contributions here when someone fixes one of the
>       > blacklisted recipes. This patch will let downstream users host it in
>       > bbappends or other places what is the intended use of this patch?
>
>         i'm not sure what you're asking for here ... there is no claim that
>       any of these recipes have been fixed in any way, only that weak
>       assignment seems to be the default for blacklisting to at least allow
>       for the possibility of overriding.
>
>
> Ok I think that’s fine I wanted to understand the reason since weak
> assignment do have some unintended results but if it is to make it
> uniform I Think that’s fair

  discussion on YP list that inspired this:

https://lists.yoctoproject.org/g/yocto/topic/74460612#49479

rday

--8323328-872669590-1590609004=:7100--
