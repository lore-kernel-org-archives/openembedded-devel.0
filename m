Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4YsU-0007xa-Ji
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 15:27:06 +0100
Received: by eekc1 with SMTP id c1so1195396eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 06:18:32 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.85.199 as permitted sender)
	client-ip=10.112.85.199; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.85.199 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.85.199])
	by 10.112.85.199 with SMTP id j7mr9996231lbz.26.1330957112038 (num_hops
	= 1); Mon, 05 Mar 2012 06:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JMTB+i0BHlYHNQ77Tn+bAOVhwKSwDxR+AZeJAZrLFyA=;
	b=mLFuRuuUTffDgVMLPAEbEDJQGwMDasQ3ssnT0xvB83poMMic/eIIrq+ZGC2M6eUcEU
	ILVifAWFKXJr1956prbKq6cWsAioIhm8fmBEEQUdVU2C6KXXFfG8eWfcGTLWaQYiSvFL
	Xk1S9r3b3TAgDuTHPEmyMFOF3MYzHEUWsyJ6GgDN1FRYrgdjW99j/RBRTN/IjyQqqb4H
	iT2TVsvtMJbayoK1k29aQDVPQx80qn01QTqckZ+0VjBrbkVrciVjtjgJLTwSY1d4xE9F
	TDgVWZjR7sOXMlsG6BqjuhgSZuP11MwVGF7LzIB9Vx4VJ8tH8p08Jsv/0F/2lH8kZuKW
	/W+A==
MIME-Version: 1.0
Received: by 10.112.85.199 with SMTP id j7mr8229057lbz.26.1330957111904; Mon,
	05 Mar 2012 06:18:31 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Mon, 5 Mar 2012 06:18:31 -0800 (PST)
In-Reply-To: <4F54C8C2.5020003@mlbassoc.com>
References: <4F54C8C2.5020003@mlbassoc.com>
Date: Mon, 5 Mar 2012 15:18:31 +0100
Message-ID: <CALbNGRRNwFXh0Ppwr1JrUWp4TwsJXELVM74OxfpVY=X5NpVU2Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla] Can't access any HTTPS page
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
X-List-Received-Date: Mon, 05 Mar 2012 14:27:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 3:08 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I've added firefox to my platform by adding the meta-mozilla layer
> (and it's requirements). =A0To include firefox, all I did was
> =A0CORE_EXTRA_IMAGE_INSTALL +=3D "firefox"
>
> With this setup, firefox works, but not with any SSL page,
> e.g. trying to access https://google.com/mail gives me this
> error screen:
>
> Secure Connection Failed
> =A0 =A0 =A0 =A0 =A0 An error occurred during a connection to accounts.goo=
gle.com.
> =A0 =A0 =A0 security library: memory allocation failure.
> =A0 =A0 =A0 (Error code: sec_error_no_memory)
>
> =A0The page you are trying to view can not be shown because the authentic=
ity
> of the received data could not be verified.
> =A0Please contact the website owners to inform them of this problem.
> Alternatively, use the command found in the help menu to report this brok=
en
> site.
>
> Did I miss something? =A0Has anyone else tried this?
>
> Thanks
>
Is the time of your system valid ( if I remember right I had similar
when system time was unbuffered initial at 01.01.2000 )?

Andreas


