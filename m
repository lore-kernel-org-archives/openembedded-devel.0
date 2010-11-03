Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDjcR-0008FC-S2
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 21:07:40 +0100
Received: by gyf3 with SMTP id 3so867119gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 13:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=kcX7cOEFNX8kNTzKuhpStWZwiar5EwvCwLbcaGSs5W0=;
	b=aG3u6eqdkecpY29rknOVwDlT7TbdYzV+ZnnaE9vxOYM+3vUEadORpq236TCDKleoE5
	B3G8x5KCq8YrWJ/I42E90EJhAwFf7v1fbm2GQxvLLIJrQpKagnnYH7RkqIPWdrdIk4Q2
	jlfJGdsbiqkEu+Sj3zA4ORK94j1maDo/2X32I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=B9l1rhKm1fy9v7e7v/9OPy7Tt922xs+Cmk1/Ya1LGB056IdpywyfjXRazg375QzNT1
	YIe2jGCUF4uNTWq90txoSZ/VbJo+FE5hMFUOpjPELujMVuA1/jIplZKB9t5J1hy2qhr2
	DkCgQ4SqYzJVhktXAyMcsU4QFqE36/WCXrzzY=
Received: by 10.91.153.10 with SMTP id f10mr1448003ago.172.1288814807758; Wed,
	03 Nov 2010 13:06:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 13:06:27 -0700 (PDT)
In-Reply-To: <AANLkTikcC1DKQ8ADas78qPZRMeGF09MXY8ph7qoZT=1Y@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
	<AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
	<20101103154735.GE3440@jama>
	<AANLkTi=d_G9A0Mf2zMzG-9zmec06vYNaB1pLrkDQnyvE@mail.gmail.com>
	<AANLkTikcC1DKQ8ADas78qPZRMeGF09MXY8ph7qoZT=1Y@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 13:06:27 -0700
Message-ID: <AANLkTimcum78VPKqr9YiFYUdYf84Hnifs9Phs9uUAQt4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 20:07:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 12:04 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>
>>
>> yes a more detailed solution is better. you have to go through the
>> configure of every
>> package and understand the behavior then act upon. As I said before
>> its a tedious task
>>
> I'm well aware of this. That is also why in the infrastructure thread
> I suggested using automated testing to find misbehaving packages.
>
> Btw there are 355 .inc files that contain the word autotools and 1899 .bb files.
> Of course there are lots of dups in there.
> And maybe for the base recipes we can convince the yocto people that
> this is a serious QA issue (and they have some people employed to work
> on this if I understood properly).
>

numbers means not so much when it comes down to this. I don't know if
any distribution that even does that
so I take comfort in everyone being wrong.

> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


