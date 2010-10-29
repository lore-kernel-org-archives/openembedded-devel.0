Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBdvU-0004jF-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 03:38:45 +0200
Received: by gxk26 with SMTP id 26so281616gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 18:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=9sh5L5RpdcB11tww8ggOQ25kVFRHHIRQ/epEYRSUJuU=;
	b=V7eTT4dL9PwomZL4SjKC0J8Fs7XFzMYtuAxjVhLnXoJAe6kS8R1Pn5Rp+aJqagmRB0
	YQ0pV0dyPDJgJ7CvoatUeYrGxXCAmTC4+P5rUFHiKBqwHt9wSpH25KpoTYUpJim3y1Gh
	ufQPt5TfQ4i4OYy6aRAwlvFj2qsD5LM0NYohU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=sVt/9LLAq9TrYtmtmpmnPsdeJHTuzc+t3N9y5i1RztDp8a6IUl4v77dVilNqw20cMo
	MyifviZWRsybSf0iyuWvNIP9M9CemDa+eDCUkF9Hi7AMghaaewLXk3KHKKb1/+tUzSaq
	uQ/bhLn+swoge6OFuZR0dUYB6M1xr1Cy6lb9M=
Received: by 10.90.41.10 with SMTP id o10mr3553530ago.103.1288316274949; Thu,
	28 Oct 2010 18:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Thu, 28 Oct 2010 18:37:33 -0700 (PDT)
In-Reply-To: <7CA724BF-0546-44EC-BE42-A042B0CBEA7B@saaworld.com>
References: <7CA724BF-0546-44EC-BE42-A042B0CBEA7B@saaworld.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2010 18:37:33 -0700
Message-ID: <AANLkTi=asQK7HgCNGEjo4wo6pYBd85AY_k65fxr9OOb-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: koen@openembedded.org
Subject: Re: Missing space in patch for "linux.inc: add knob to turn off cortex a8 fixups"
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
X-List-Received-Date: Fri, 29 Oct 2010 01:38:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2010 at 6:14 PM, Scott Anderson <o2e@saaworld.com> wrote:
> Hi Koen,
>
> I was looking in =C2=A0.../beagleboard-angstrom-linux-gnueabi/linux-omap-=
psp-2.6.32-r90+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869/temp/log.do_com=
pileconfigs.25634 today and saw it complaining:
> =C2=A0.../beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r90+gi=
tra6bad4464f985fdd3bed72e1b82dcbfc004d7869/temp/run.do_compileconfigs.25634=
: line 679: [: missing `]'
>
> I believe this change:
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded/diff/recipes/lin=
ux/linux.inc?id=3D88335ada413098838c3c8315b90183eef1ccd0d3
> should have a space between "yes" and the closing square bracket.
>
> Hope this is useful,

Hi Scott,

Thanks for reporting it. I have added the required space.

-Khem


> =C2=A0SAA
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


