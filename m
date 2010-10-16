Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P76dU-0002Cc-LE
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 15:17:21 +0200
Received: by iwn2 with SMTP id 2so2007059iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+AVrndks3kHuAqrzSediW3gw1PozrG4pc+VrvYF40xM=;
	b=mktHY7SqPUxa1JTL7u+blCRRpJ/43kpXQaVqTEwRKx6njt3YPoum0mCw+K+mwgpyM6
	syrvPSGi+gyl6CIQAkaDrhMXJYsOYrpU+kKfrvc+GTJ7gTXEGzhFZTjC6iwQF3LShw1O
	+rWuJt0froC2RPk+LEyHzc+LsRMOGRewh1SgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wjiJ3jzG52uzZgdKgkVpcloNP8kVWSAcxlKR51B2qEapWe6V9U1NRKYkajiD+LLC7i
	GHEbei/io5E4uwkgutdurigJxPZkbxEA23JFEykJDOyGIcsgBPIA3Za5Dp7gIQ6qM9kq
	NbeGRhIdKHBosdSBGdE6s6XIhtnYD/Gt1UOw4=
MIME-Version: 1.0
Received: by 10.231.14.2 with SMTP id e2mr1664740iba.160.1287234986319; Sat,
	16 Oct 2010 06:16:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 06:16:26 -0700 (PDT)
In-Reply-To: <4CB9A189.7060402@freyther.de>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4CB99A9C.2060507@freyther.de>
	<20101016125032.GA32732@rhein.zuhause.netz>
	<4CB9A189.7060402@freyther.de>
Date: Sat, 16 Oct 2010 15:16:26 +0200
Message-ID: <AANLkTimNeL_4EMGnrtDC452ySEkHGBALbLi=57O5eNSN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Oct 2010 13:17:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/16 Holger Freyther <holger+oe@freyther.de>:
> On 10/16/2010 02:50 PM, Henning Heinold wrote:
>
>>> I think that appraoch is wrong. autoreconf --install --force should call
>>> libtoolize which will copy over new files. So we should delete the libtool m4
>>> files, run libtoolize and hope that it works. Did you try this?
>>
>> *g* Did you look at the patch? Frans is doing what you suggested.
>>
>
> Well, anything of that size is hard to read. I got lost in reading the diff of
> a diff. Anyone knows if there is a git format-patch option to not print
> removed files? I should have seen the dirstat though.
>
>
> BTW: Title should be gnutls and not gnutols.
>

Yes, Paul already pointed that out. Will fix that.
And if you both agree that the patch is sound, please add an ack.

Frans


