Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDieW-0006YB-US
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 20:05:45 +0100
Received: by gxk26 with SMTP id 26so789371gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CtsC2JcwFjsZ4qz7gsocRMukx1hk17TxcZsTqszSM9A=;
	b=aRZiFfPHLdxdJR4PTNDlxjyU53y5J5c0tZNkjMXHAuyWatsbwrsFKigTIBJTvpjTR9
	TaNguzNiGitgEiglWlUcftcTi5ZtKSqpauS99P/sbNODgXkhRLqcob86nDWObR5jtPjh
	fR4bJzbZ0kemBLw27GuQ5qzkmt0BvNcC7hDws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=uBGZq9firFD5cHumMq1w9GTSF5CgUDUgufRkEzpZtzVzQYYS7v8Hdq1t7xHbCp8YOp
	4nAoWMgQh9505NBP+KxTNBmmrqLWdg/vtBOGSNfsI0wu1yWyj4nLqudBT0GDzy/uNCZ8
	dslrEj3TeD6vvybxeZm0R8VBoRCwg0hGWwOg0=
MIME-Version: 1.0
Received: by 10.42.157.199 with SMTP id e7mr764638icx.67.1288811092312; Wed,
	03 Nov 2010 12:04:52 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Wed, 3 Nov 2010 12:04:52 -0700 (PDT)
In-Reply-To: <AANLkTi=d_G9A0Mf2zMzG-9zmec06vYNaB1pLrkDQnyvE@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
	<AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
	<20101103154735.GE3440@jama>
	<AANLkTi=d_G9A0Mf2zMzG-9zmec06vYNaB1pLrkDQnyvE@mail.gmail.com>
Date: Wed, 3 Nov 2010 20:04:52 +0100
Message-ID: <AANLkTikcC1DKQ8ADas78qPZRMeGF09MXY8ph7qoZT=1Y@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Wed, 03 Nov 2010 19:05:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/3 Khem Raj <raj.khem@gmail.com>:

>
> yes a more detailed solution is better. you have to go through the
> configure of every
> package and understand the behavior then act upon. As I said before
> its a tedious task
>
I'm well aware of this. That is also why in the infrastructure thread
I suggested using automated testing to find misbehaving packages.

Btw there are 355 .inc files that contain the word autotools and 1899 .bb files.
Of course there are lots of dups in there.
And maybe for the base recipes we can convince the yocto people that
this is a serious QA issue (and they have some people employed to work
on this if I understood properly).

Frans


