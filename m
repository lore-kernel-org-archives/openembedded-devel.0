Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDsub-0002nV-2Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 07:03:01 +0100
Received: by ywo7 with SMTP id 7so569203ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 23:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NQxAB8aX/gk+FEQ1Y+sN0b9410I9IpYUrka5pctvIfI=;
	b=rqWqyMWIEgvdVlHZsg7JdKRMo6aPMNeYq+rHQNodAF596lNx31aEmrzXpmFGZzd9SQ
	Tuo5PDPjaAIHBfTax7DMUEPKmgvpTyDJ8C3iJyMG64EG6hgX8ucPikuwdy+e/Mjnjitq
	N1YC21rfsGZY51k9MCR/REipuc3RA8LFhHZ9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LcmV5yLgdQvK/eZKAqRwgfq85rfGiQyP1gfFhMr19h71CIPbsZUKb88xhNi2GWkDTl
	4FIqirZ5JNMo7V+IzNMF+XuYKzwCU6Ge6h9izTGLV4MZi+xTrGmuNachm5dgmXruN654
	1Icj9YU4dveenO0NZcOQT1UwbWiKuAcYjsZt0=
Received: by 10.91.11.6 with SMTP id o6mr646815agi.91.1288850528199; Wed, 03
	Nov 2010 23:02:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 23:01:47 -0700 (PDT)
In-Reply-To: <AANLkTim6PdzTRY-9zANa5t90dcYaSTrCudCKYNWsUV--@mail.gmail.com>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
	<20101104001342.GG3440@jama>
	<AANLkTim6PdzTRY-9zANa5t90dcYaSTrCudCKYNWsUV--@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 23:01:47 -0700
Message-ID: <AANLkTinPkXnf0iSakku7hkMHge_NqXPW_7WS1DHsqjHu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Thu, 04 Nov 2010 06:03:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 8:06 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Nov 3, 2010 at 5:13 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>
>> On Wed, Nov 03, 2010 at 04:55:52PM -0700, Chris Larson wrote:
>> > On Wed, Nov 3, 2010 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > > Currently we report wrong revision when we build from branches not
>> based
>> > > on master because we only fetch the HEAD value which is remote maste=
r
>> > > This patch makes it to report the HEAD of whatever branch one has
>> > > checked out.
>> > >
>> >
>> > This doesn't make sense. =C2=A0The HEAD ref always points to the curre=
nt
>> checked
>> > out commit or branch, it is *not* specific to master.
>>
>> No it does make sense, because it fixes my <unknown> METADATA_REVISION :=
).
>>
>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> in my R/W checkout I have it right even before patch
>>
>> bitbake@jama ~/oe $ git show-ref HEAD
>> b3246d96069fd11caee42ec6ebcbf6dca2d62449 refs/remotes/origin/HEAD
>
>
> No, this is broken. =C2=A0It shouldn't be determining the METADATA_REVISI=
ON from
> a ref you don't even have checked out. =C2=A0Right now it's pulling the H=
EAD ref
> from upstream, it should be pulling the local HEAD ref. =C2=A0So NACK on =
this
> patch, the metadata revision code needs to be fixed to either not use
> show-ref or pass the necessary args to not operate based on a HEAD of a
> remote.

whats wrong with this patch. or what is it that we need additionally.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


