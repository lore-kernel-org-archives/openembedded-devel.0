Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PDHl6-0000gI-Rk
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 15:22:45 +0100
Received: by ewy2 with SMTP id 2so3273403ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=0kwgKecMRfC2DFo13lrytoS4OxD13NqnA3ShFjdQHYY=;
	b=iLTldZaG2A1a9UAYCUbM+dDaTAmIZeRnv69B/oAT+t6JJm1yQTF+51RQygsi3uSpmq
	Ei+ihPekd0+54yKKCgAI2ymX5/wUYmURUD0z3yxFAIIQ0VyuUTDlLFFzFq5u6Td6O77k
	ayPAyZOjI9aj41/G5cHjdp3M+IkJOwA7mUzOc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=BgCSB2Tt/qRMmTX8oZiGPGSGcaGNwTyL/kPiwYy2/jWJL085UybaC5u0/Q5YGFK1yQ
	Ur8ElUg/wCm+OtphvTgAqveFccIvXMOOF5DU+TCK/64xP2nwVDjJzIQyj3+zSBfnBcCT
	ujOW8iS2J+ARQH5fItm1yZNhaL1B3LKaYf/BY=
MIME-Version: 1.0
Received: by 10.216.11.205 with SMTP id 55mr17037430wex.51.1288707713708; Tue,
	02 Nov 2010 07:21:53 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Tue, 2 Nov 2010 07:21:53 -0700 (PDT)
In-Reply-To: <20101101195748.GB12018@gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
	<20101101195748.GB12018@gmail.com>
Date: Tue, 2 Nov 2010 10:21:53 -0400
X-Google-Sender-Auth: F51WHHIKGxCSRxy6sxGVqHWRPbo
Message-ID: <AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Tue, 02 Nov 2010 14:22:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 1, 2010 at 3:57 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (01/11/10 15:54), Zach Frey wrote:
> > On Mon, Nov 1, 2010 at 3:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > >
> > > Well it built fine for me on minimal distro with libtool 2.4 and
> > > machine=efikamx
> > > you could try using angstrom-2010 and see if that helps as it also uses
> > > libtool 2.4
> > >
> >
> > OK, thanks -- I'll report if angstrom-2010 works for me or not.
> >
> >
> > > other guess ...there could be build host difference as I am using
> ubuntu
> > > 10.10
> > >
> >
> > Is Ubuntu 8.04 "supported", or is it old enough that I ought to expect
> > problems?
>
> I think till the new LTS 10.04 release it was used by quite a few people
> but now few of them might have switched to 10.04 LTS but it should
> certainly be usable as build host IMO
>
>
Thanks.  I do get the same results using angstrom-2010.

-Zach

