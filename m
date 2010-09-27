Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0DB8-0006Gg-1f
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 14:51:37 +0200
Received: by iwn2 with SMTP id 2so2948931iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8dzIDKqpO6S8iTMBUyFok9kXKAlFzDhkd2dCuC1CM7g=;
	b=KcjYhX9qXlZ4DTE3IOBDrmy+uUC/rsyVoVhBpS1DX2eDAIfFYKqmroy1fLwKBNjYVN
	QXZAes/z64Ow0Dd2hoHXWjE45BTJ2czsphCFYqr8Q4iuW6I5xwmvsdlMeUfq5T+Q0MEx
	jt1eXKVdfewbbQP37DxQVvkN0Cvf5LVfeaawQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oOUaBjwzOI8egvqVo6FeruaQadVUOn335hp2lkXjOvGwfbYIn1oirhxDyQb+CnK/oy
	tOEYhtUi2eNXUUNySO4e6Xh9aG52vGaa/5sd4tc38FvP3g5PJLibHlTZAxrYUlwVgsY8
	GPTVhH2u77b1GJKrIMPKb8KsM072AIk2mxtw4=
MIME-Version: 1.0
Received: by 10.231.157.207 with SMTP id c15mr9002130ibx.143.1285591884603;
	Mon, 27 Sep 2010 05:51:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 05:51:24 -0700 (PDT)
In-Reply-To: <4CA084B6.4070404@mwester.net>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
	<20100926112659.GB6483@jama>
	<AANLkTimQJUyZRsX6a5EA4FruiM5DVVbVD8e676Ri+ARe@mail.gmail.com>
	<4CA084B6.4070404@mwester.net>
Date: Mon, 27 Sep 2010 14:51:24 +0200
Message-ID: <AANLkTiku8QxSPdShCwUgsxphHYTRpf+fg5XE++jBgegW@mail.gmail.com>
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
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Mon, 27 Sep 2010 12:51:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/27 Mike Westerhof <mike@mwester.net>:
> On 9/27/2010 1:19 AM, Frans Meulenbroeks wrote:
>> 2010/9/26 Martin Jansa <martin.jansa@gmail.com>:
>>
>>> There was about ~1000 recipes failing to fetch few months ago, I don't
>>> think this number is that much lower as I haven't seen any changes in
>>> most of them.
>>>
>>> See my download status:
>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/0192=
06.html
>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/0192=
34.html
>>
>> April is 5 months ago. Question is if it makes sense to keep recipes
>> that are broken for > 5 months and no one who saw a need to fix them
>> or complained about them.
>> Personally I'm inclined to say it is a waste to spend any time on
>> these. I would suggest moving them to e.g. nonworking but I guess the
>> people who mix up quality and quantity will disagree on this.
>
> Mix up quality and quantity? =A0That's a gross mischaracterization on you=
r
> part, and I quite resent it.
>
> There are valid reasons for some of those. =A0If it is now necessary to
> make Mr. Jansa like the comments on the ixp4xx firmware recipe in order
> to keep the recipe in OE, I will update those. =A0But I cannot make it so
> that Intel will not require click-throughs in order to download the
> firmware files.
>
> -Mike (mwester)

To clarify:
Things that do not fetch because they require a manual download with
accepting a license etc, I do not consider as broken.
And of course we should keep these (I know the ixp4xx situation quite well)=
.
But how many of those do we have? I know about the ixp4xx and some ti
ones. Maybe there are a few more that I missed but then again, most of
the ~1000 recipes Martin mentioned and a lot of the recipes I listed
above do not fall into this category but refer e.g. to a cvs server
that is not there any more, to a version, tag or tarball that does not
exist etc etc.

For me those recipes are broken. And if it is a recipe that is broken
for a prolonged amount of time, there is apparently no interest in it,
and personally I would like to have this indicated one way or another,
or, even better, move these recipes into a dedicated folder(like
nonworking). In that case the recipe is still there should somebody be
interested in it, but it does not clutter up the main recipe dir.
(and note again that I feel things like the ixp4xx and the ti codecs
etc do not fall into this group).

And yes: we can also try to repair them by finding alternate sources
etc (although this might be hard if someone changed from cvs to git).
Then again if the recipe has been broken for a long time, without
anyone taking action, filing a bug, reporting it on the list, I feel
that there is not really interest in that recipe any more and
personally I see it as a waste of time to try to repair them.

Frans


