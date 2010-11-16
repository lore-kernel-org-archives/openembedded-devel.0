Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIUXP-0000hP-Pm
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:02:08 +0100
Received: by gxk2 with SMTP id 2so821248gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=W/sJLhJL9p8O+h5elU4f68INxmFrwq6NYjXOQcTAmP0=;
	b=Rry/vdH35ne5viQJ96oevyTd1x0d1y8HhlAtGnlvkAhKzlkLDfhzCNmQNf3VhSKXnd
	kWNbJETEFA4imCgF0gR6OaARP7ECb3sdinZnEFSBHQGpf7VWIFvqJHiJpR9zN2xJR5+I
	iWzkVict+chPhMrX6XWQzP8soNwTo9E2C23Sg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IeDowbHUV7xRNaHVQdbI3tZfr7oOHrai8tuID/jJ8Yx/UnFpsn9e+T/i7pkrBm9TTD
	ojRBPN94yWT6l7gxH8K2DwybHUmkriUHSUoBIdYtzSnOPxo+3TjLQuAX8dVfOLtQ6YJn
	Hj/gQrcqYHTwjOZicUzGYJypAsHsR5BMGi8HE=
Received: by 10.91.10.21 with SMTP id n21mr10498011agi.75.1289948461628; Tue,
	16 Nov 2010 15:01:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:00:41 -0800 (PST)
In-Reply-To: <AANLkTim2Q8BfAx=z3=RLSCQkFo-Wk6HFnbBnF562NGDM@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<1289947184.11873.3.camel@mattotaupa>
	<AANLkTinuJ6bx+iHNq-4VLKNkaHbwaPitm7f6hZ=VM9az@mail.gmail.com>
	<AANLkTim2Q8BfAx=z3=RLSCQkFo-Wk6HFnbBnF562NGDM@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:00:41 -0800
Message-ID: <AANLkTin7+WQY-gmfye=U5pFJ4QfOYRY-Da93oBTgxvV2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Tue, 16 Nov 2010 23:02:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2010 at 2:52 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/16 Khem Raj <raj.khem@gmail.com>:
>> On Tue, Nov 16, 2010 at 2:39 PM, Paul Menzel
>> <paulepanter@users.sourceforge.net> wrote:
>>> Dear OE folks,
>>>
>>>
>>> Am Dienstag, den 16.11.2010, 10:20 -0800 schrieb Khem Raj:
>>>
>>>> In order to get to the 2010.12 release, I would like to request to
>>>> stop pushing any changes to master until release. Please keep your
>>>> changes in you local tree ready for when the window
>>>> opens again after the release.
>>>
>>> would it be a good idea, to either have each developer with commit
>>> access create his/her own =E2=80=9Cnext=E2=80=9D branch or to have a co=
mmon next branch,
>>> where those changes could be published, so that work is not duplicated?
>>>
>>
>> Either way is fine. If its posted to mailing list then it goes to
>> patchwork and after approvals I will sweep them
>> if devs publish a pull branch thats ok too.
>>
>>> [=E2=80=A6]
>>>
>>>
>>> Thanks,
>>>
>>> Paul
>>>
>>>
>>> PS: Khem, thanks for taking the lead in getting this release done!
>>>
>>> _______________________________________________
>
> What about new recipes?

Depending upon how they pan out. Suppose if you add a new recipe for a
working recipe
that has implications if it gets picked up by default so need to make
sure it works on tested sets.
some entirely new recipes should be ok recipes for version upgrade
need to be watched out

> I have a few new tasks and a new image that I was planning to add
> tonight, but didn't get to it.

post them if you think they make sense in release and do not involve
other meta recipes.

> Also I will have a working uclibc++ recipe by tomorrow or so. (the
> current one does not build for me).

Post them to ml.

> I feel changes like those are pretty harmless.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


