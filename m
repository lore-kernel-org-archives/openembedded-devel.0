Return-Path: <ticotimo@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 42F4577F4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 15:22:57 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id c15so153945213ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lHmMug14EXZQe9zWzviNe3syQd52BReQCjzh2r/fUWU=;
	b=UWGghVWMMQFXHN34G9UCQdSF1H4HhBTY8n56Pxd5u9LW1yxVTkt31IggRYfCccpXRI
	gvbj20V2bbK0F59wLPRjKPv6s628NF9D9gNagkoajYO/2IWBHtvUXFiLIud4nFpRf7Ef
	p5rSHPvKipJlKBZqcNookjXa0jJQhgBy5koESNqd77PXM5ejnKh8GUMGCNaMScIvs0Iq
	J31tXF/1PIu6mVI9xqRevGOsx8+AApgsHF/nyTwMLLTBbeKUBM2p+Pf3/HaLGpkRPj9c
	2m+8lQOlmowursORQGyi8JI7jMj1/LSz/5riSNr/j8I+sp7YsZxtUDuRTTUEq/PIP7Nf
	8/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lHmMug14EXZQe9zWzviNe3syQd52BReQCjzh2r/fUWU=;
	b=faap5fvgZmcArOpOvCOeNNjMTW2GzhogqVunx3cwx2HCjpjtxCRKiBUK+zLUDxu1VX
	ChvfI7iSgDX4kPqEepE+/qFQH8c6wmUH/tmhezwjBPvDhzHsuPTwrBhR5stQn+Nxj2Xu
	QcgvgPeQRtPfju0u7XQ2QJQzyums8UZBzpo1H5tH9WlVp6MEZLDsKK1cJsQAuSxZAERw
	TPC0vL7Q2YtwEEqmED0aIkCH6oQQNStxxxjPpm8Umfp8uixvA5cgtr+2c5aMM8kLhoZ0
	b+LMVTRpdDrBYqF8gkMyRLQqtGB3mcGpBTT/7sfG+NQoPGf0YtyAcuC7exniovbM9ZDD
	LHsw==
X-Gm-Message-State: AODbwcAKTpQAfgPF/fPDslkq7tYnrSdFhCeghRtVGp2A/KGlq0e1d3JI
	R9B2tUWFcYnP87GhZO73jMOUa7nTNciQ
X-Received: by 10.36.162.72 with SMTP id o8mr23446447iti.42.1495466579135;
	Mon, 22 May 2017 08:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
	<CAHUNapRhwKpbR0nXyre4nV+fPgC6XR3QFNq4DhtfSO0zzRv7=Q@mail.gmail.com>
	<122c5ac1-7191-17f6-0f88-0a9b4fea64ba@ubiant.com>
	<CANx9H-CbvQnPCuRYXXYxOrJrtg7C-AVDA9COYuFJFAwR5LFqwA@mail.gmail.com>
	<e08a6c25-e743-2274-abe7-bea0b570c04d@ubiant.com>
	<f1c5abe0-313b-5a69-93d1-33e64bc8a8bb@mlbassoc.com>
	<c30f361b-99b8-efc4-1123-c6bdca6edc4c@ubiant.com>
	<CANx9H-B4K049O3dkMTxuOXPxoO7POMaF3gO=TL76x3b56m=vFw@mail.gmail.com>
In-Reply-To: <CANx9H-B4K049O3dkMTxuOXPxoO7POMaF3gO=TL76x3b56m=vFw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 22 May 2017 15:22:48 +0000
Message-ID: <CANx9H-Bfj1Qgcft9hKTksVQW=33m05bUWM4s49d73f1yRyNRCA@mail.gmail.com>
To: Romain Bazile <romain.bazile@ubiant.com>, Gary Thomas <gary@mlbassoc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] rxtx fails to build because of upstream website dead
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 May 2017 15:22:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Docs for "own-mirror":
http://www.yoctoproject.org/docs/2.3/mega-manual/mega-manual.html#setting-u=
p-effective-mirrors
On Mon, May 22, 2017 at 8:19 AM Tim Orling <ticotimo@gmail.com> wrote:

> You could also diff with the GitHub repo:
>
> https://github.com/rxtx/rxtx
>
> And possibly change the recipe to use git instead of tarball.
> On Mon, May 22, 2017 at 8:10 AM Romain Bazile <romain.bazile@ubiant.com>
> wrote:
>
>> I will do that too then!
>>
>> But I also wated to help others get an easier access to the
>> rxtx-2.2pre2.zip file!
>>
>> Thanks guys!
>>
>> Romain Bazile
>>
>> Le 22/05/2017 =C3=A0 16:56, Gary Thomas a =C3=A9crit :
>> > On 2017-05-22 16:34, Romain Bazile wrote:
>> >> Yeah, it just keeps on going online and offline every few weeks,
>> >> that's why I was asking about the source mirrors.
>> >> We have been stuck for a week while the website was down.
>> >>
>> >> That seems to me like a viable alternative to use the mirrors, in
>> >> case it goes down again.
>> >
>> > You could also set up your own local mirror which can also speed
>> > builds considerably.
>> > Just look at the documentation for 'own-mirrors'
>> >
>> >>
>> >>
>> >> Do you know where can I put the request to add this file to the
>> mirrors?
>> >>
>> >> Romain Bazile
>> >>
>> >> Le 22/05/2017 =C3=A0 16:29, Tim Orling a =C3=A9crit :
>> >>> I just tried and upstream was available. Maybe it was just down for
>> >>> maintenance?
>> >>> On Mon, May 22, 2017 at 12:23 AM Romain Bazile
>> >>> <romain.bazile@ubiant.com <mailto:romain.bazile@ubiant.com>> wrote:
>> >>>
>> >>>     The source package is about 1.5MB big, so that's not really heav=
y.
>> >>>
>> >>>
>> >>>     But I perfectly understand the rationale behind it, which was my
>> >>> fear.
>> >>>
>> >>>
>> >>>     I didn't know about the source mirror. This would make perfect
>> >>> sense,
>> >>>     since this is the exact thing we in fact are looking for (having
>> >>> the
>> >>>     sources in the layer is only a fix).
>> >>>
>> >>>     How does that work to get the source mirrored here?
>> >>>
>> >>>     I supposed there would need to be some changes to the recipe too=
?
>> >>>
>> >>>     Romain Bazile
>> >>>
>> >>>     Le 20/05/2017 =C3=A0 17:21, Trevor Woerner a =C3=A9crit :
>> >>>     > On Fri, May 19, 2017 at 11:07 AM, Romain Bazile
>> >>>     > <romain.bazile@ubiant.com <mailto:romain.bazile@ubiant.com>>
>> >>> wrote:
>> >>>     >> Due to the chronic instability of this website, would it make
>> >>>     sense to
>> >>>     >> include the source file directly into the meta-java layer as =
a
>> >>>     zip file?
>> >>>     > My guess is the project would not be happy about a large zip
>> >>>     file in a
>> >>>     > git repository. If a patch becomes too big, or if a recipe
>> >>> needs too
>> >>>     > many patches, the general consensus is to create a repository
>> >>>     with the
>> >>>     > patches and keep the metadata small. On the other hand,
>> >>> exceptions
>> >>>     > abound.
>> >>>     >
>> >>>     >> I don't know about best practices surrounding this, I kindly
>> >>>     apologize if
>> >>>     >> it's strictly forbidden! Otherwise, I'm happy to submit a PR
>> >>>     including the
>> >>>     >> file and the necessary changes to the recipes (in concerned
>> >>>     branches).
>> >>>     > The yoctoproject maintains a source mirror, the best bet is to
>> >>> ask
>> >>>     > that the sources be mirrored there. The recipe will probably b=
e
>> >>>     > expected to stay as-is, and the yocto backup used if/when the
>> >>>     primary
>> >>>     > is down.
>> >
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

