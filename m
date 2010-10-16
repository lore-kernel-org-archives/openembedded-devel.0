Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7Ehb-0004yC-LG
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 23:54:10 +0200
Received: by yxt3 with SMTP id 3so896945yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=JBubwrH8nP3Za7cv+KNxuYK9PGo/8z4cYm+cKp/4nMM=;
	b=vOUAmgJqpNyqu/BjVFO3LYiTplXDp27Xn//rfz1uLu3OTqnofP4g88DFDp3KDAiYSo
	La8+wwaWdpAZZaVeCjvGclhmyXUvRzGNuCtgtrh/ccOOyq3k9W95YoHMRmPFAAxWAHe4
	IBBz8GTqn7HUslNRm3zx2Iv6uwm0wpAzabz5E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=swq6psjsCd1JPMUn5U1wmoYP0mp4obBreLSfF3xgpbLyKxvcHfYk+xs4b3/OvQdkRF
	XRTOGJETu/T5pdXCjjJyeGVpSyA+kua/JWGO3kOCiqEWTI0eAXOtn1k3plaJcPB2gOBP
	gzYuoeuRaJv0mSbidiBDD2QNXFRJ1Ai7sbrXg=
Received: by 10.90.51.1 with SMTP id y1mr894625agy.7.1287266009641; Sat, 16
	Oct 2010 14:53:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Sat, 16 Oct 2010 14:53:09 -0700 (PDT)
In-Reply-To: <AANLkTi=xV6_7_sYi4Wf11QsFOc41PaWLdtfhycu4zZGg@mail.gmail.com>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20101016183152.GA15103@gmail.com>
	<AANLkTi=xV6_7_sYi4Wf11QsFOc41PaWLdtfhycu4zZGg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Oct 2010 14:53:09 -0700
Message-ID: <AANLkTikA9LTDdDgUkRJSm9ncNxBbcFyQ199YNDY0vjQL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Sat, 16 Oct 2010 21:54:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 16, 2010 at 12:25 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/16 Khem Raj <raj.khem@gmail.com>:
>> On (16/10/10 13:56), Frans Meulenbroeks wrote:
>>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>> Good job Frans. I knew this was better solution but chose the inferior one
>> as it was easy but this one is more elegant and libtool version
>> agnostic. Thanks for doing it. In fact this should be how we solve libtool
>> update issues w.r.t. libtool 2.4 as we go forward
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>
> Thanks for the ack, but the credits should go to Henning. He did put
> me on this track and I used his patch as example.
> Couldn't have done it alone, being the auto* and libtool n00b that I am.
> It was solely because I could stand on the shoulders of a giant, that
> I could produce this.
>
> BTW: the following recipes seem good candidates for doing the same
> sort of patch:
> ./binutils/binutils-2.20.1/libtool-2.4-update.patch

we do not reconfigure binutils as it needs specific versions of
autotools so it may be needed

> ./gnuradio/gnuradio/libusb-libtool-2.4-update.patch

I am expecting Philip to commit his gnuradio rework soon and then this
patch will not be needed anymore

> ./libsdl/libsdl-x11-1.2.14/libtool-update.patch

this could be looked at.

>
> I would prefer it if the recipe maintainer gives this a stab.
>
> BTW, maybe a better solution would be do do this in autotools (we also
> discussed this in irc) and allow for aon overridable directory
> variable (with default value m4)
> I feel not comfortable enough to author such a patch though.
> Note also that gnutls has three dirs with generated m4 files.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


