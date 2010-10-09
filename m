Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4aTY-0007M3-7H
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 16:32:41 +0200
Received: by gxk25 with SMTP id 25so639658gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=0M0jrDpT8Yb7mqe1pvtaybE2+h9VjmQor1idVuF99Os=;
	b=MQg2ObSLeugZTtztlJrICPesUSwqdItNieyfkEeOovJ/xqQaytQukjsm/s0SOF2fL+
	JFg3G9fe8/xEB6OWkrMf7yNCdknIh/W9jrEOPiCc+etcorjN/CBkMYfMzKsKaU3xajPh
	eqPjNb/+lz4nv8AmJQjYI4cHZmCwZIVCNUTA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DkUBBm25QqYZ8gcKFOjgk3EAxVt7EFYe6x5ppwiPLd1VcBbRpPr8gbgIpqJLEWzMlP
	naQ7+fLqGFDl8eDbuycF5lvdmwcZc0yTSuX1FMtmPxMMeRAYYpGQwon40cFLlhMxhZ/9
	Ka65w5L8cMTYmUFcnmci+aLkSBZLiD5Um1nWM=
Received: by 10.90.93.9 with SMTP id q9mr2192384agb.103.1286634732823; Sat, 09
	Oct 2010 07:32:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sat, 9 Oct 2010 07:31:52 -0700 (PDT)
In-Reply-To: <20101009113707.GP3163@jama>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
	<AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
	<AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
	<20101009113707.GP3163@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Oct 2010 07:31:52 -0700
Message-ID: <AANLkTim_=Bg0mP+QjTWfvkdQ-+Xrp86fjg8sq8=bZ4=v@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Sat, 09 Oct 2010 14:32:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 9, 2010 at 4:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Fri, Oct 08, 2010 at 03:21:03PM -0700, Chris Larson wrote:
>> > Personally I'm in favour of merging into head. That way it gets
>> > accepted easier and faster.
>> >
>>
>> Agreed, I am as well. =C2=A0As the new libtool is opt-in, I don't see th=
e harm,
>> and it'll ensure that any issues which crop up with the compatibility ge=
t
>> fixed asap.
>
> Khem: feel free to add
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>

Thanks. Do I have other pseudo acks too in this thread. ?
btw libtool folks are excited that OE is using the sysroot
functionality my patch to libtool is being merged

http://lists.gnu.org/archive/html/libtool-patches/2010-10/msg00022.html

I am confident that any roadblocks we run into the libtool community
will help us
so we are in good spot.

Thanks
-Khem
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


