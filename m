Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6D8C6D733
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 19:41:01 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz11so2263516veb.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 11:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oNIfCYWDo32I4tig9ODYAFT/y3iOXs339SUEjKCQf1A=;
	b=sxtenSOg6K0dEnEH3QFYXtFWPloKwzaRo7TY5agZLiEC08CHSbEYB4H1MLaP3+9z04
	C/rLQjjnOMSHw31p2NcyxgVp7dp113fdz1lDNXoscla1TNp+RVpgSeR4T6pEoyB7hLoT
	g2ricIYItxd1xUXArUk7bDnWG8loUqbwkB/ghY0j8cCbS3EQFTwJSphAHoW8XQJFUgZM
	eMiF8vLcVcDpz573U+OS3AUUJuJrsO8ZbV+vaNZQiH1LtK8s9CWBeIiSdQ1raBf4W+Cl
	k7wuMiUaIJM4hECoUh/26QPjn1y9KLnBhR0aqeCObfgwORZxpYSPssbvnNtWZG1PMvli
	2DVw==
MIME-Version: 1.0
X-Received: by 10.220.95.201 with SMTP id e9mr590303vcn.71.1384458062778; Thu,
	14 Nov 2013 11:41:02 -0800 (PST)
Received: by 10.52.185.9 with HTTP; Thu, 14 Nov 2013 11:41:02 -0800 (PST)
In-Reply-To: <CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
	<CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
	<CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
Date: Thu, 14 Nov 2013 11:41:02 -0800
Message-ID: <CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libmpd-11.8.17 gets 404 Not Found
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2013 19:41:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Otavio. Quick question - is there a reason not to use the upstream?
- http://www.musicpd.org/download/mpd/stable/

Thanks,

Adam


On Thu, Nov 14, 2013 at 9:57 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Thu, Nov 14, 2013 at 3:16 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > What should be my course of action? Add the new provider to the OE
> mirror,
> > or patch the entire recipe? I can do either, but just not sure what the
> > right thing to do. Trying not to pollute. Thanks.
>
> I'd say both. People may be using an old snapshot of OE-Core/Poky and
> have the download problem so adding it to the mirror is good. Updating
> this is also good so we can check the new path/version/URL for new
> versions easily.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

