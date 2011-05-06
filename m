Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIUAz-0002e6-VI
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 01:11:14 +0200
Received: by ewy5 with SMTP id 5so1113156ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=r/Xx8BQaBdkGlbRxK1hVnQehvD+gNXdtgp365nk1Kbk=;
	b=daJezFLXla8SHSZDvpQGDihiD2kdjGThij+qIGG9JZNGDt2scTZM7u7WFcONlwO28b
	Eo3C6woGV/ttQy4KrrNqo2wC2dhvY48/8I0VzgeH6fPCr9M0GVUV3eOppLrgqmtXorGt
	3qqm7++XrBI8RqMYA28+/MEt/HvjFe0ogzne8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=GvgavjwMgq6hZv0LUv9zYC8cYJd43uFlgXD/zaJP6gyDpsOGEID/37EQspTy4B9Wxh
	+8iWODjt6XgT086X+MYvgkOZGQF2C+M7+uEt9/xblJRc8TnzsKv775xDIDpFQa+AYFqi
	nD9NpVhtAwAhuLJBfAj2cfRLiLOT+zKg4P+QI=
Received: by 10.14.41.193 with SMTP id h41mr2074708eeb.48.1304723312250; Fri,
	06 May 2011 16:08:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Fri, 6 May 2011 16:08:02 -0700 (PDT)
In-Reply-To: <4DC477DF.8070702@mlbassoc.com>
References: <1304719828-22697-1-git-send-email-raj.khem@gmail.com>
	<1304720740.3928.26.camel@mattotaupa> <4DC477DF.8070702@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 May 2011 16:08:02 -0700
Message-ID: <BANLkTi=M-yBPrXamcTYkkr7uSmOU8RDRBQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [meta-oe][PATCH] conf/layer.conf: conf/layer.conf: Document the operation on BBPATH correctly in the comment
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
X-List-Received-Date: Fri, 06 May 2011 23:11:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 3:36 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 05/06/2011 04:25 PM, Paul Menzel wrote:
>>
>> Am Freitag, den 06.05.2011, 15:10 -0700 schrieb raj.khem@gmail.com:
>>>
>>> From: Khem Raj<raj.khem@gmail.com>
>>>
>>> Provide additional commentary that should help a bit more
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>> =C2=A0meta-efl/conf/layer.conf =C2=A0 | =C2=A0 =C2=A02 +-
>>> =C2=A0meta-gnome/conf/layer.conf | =C2=A0 =C2=A02 +-
>>> =C2=A0meta-gpe/conf/layer.conf =C2=A0 | =C2=A0 =C2=A02 +-
>>> =C2=A0meta-oe/conf/layer.conf =C2=A0 =C2=A0| =C2=A0 18 ++++++++++++++++=
+-
>>> =C2=A04 files changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
>>> index f019337..272fc04 100644
>>> --- a/meta-efl/conf/layer.conf
>>> +++ b/meta-efl/conf/layer.conf
>>> @@ -1,4 +1,4 @@
>>> -# We have a conf and classes directory, prepend to BBPATH to prefer ou=
r
>>> versions
>>> +# We have a conf and classes directory, append to BBPATH
>>> =C2=A0BBPATH .=3D ":${LAYERDIR}"
>>>
>>> =C2=A0# We have a recipes directory, add to BBFILES
>>> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
>>> index 6e8ff28..902ab8f 100644
>>> --- a/meta-gnome/conf/layer.conf
>>> +++ b/meta-gnome/conf/layer.conf
>>> @@ -1,4 +1,4 @@
>>> -# We have a conf and classes directory, prepend to BBPATH to prefer ou=
r
>>> versions
>>> +# We have a conf and classes directory, append to BBPATH
>>> =C2=A0BBPATH .=3D ":${LAYERDIR}"
>>>
>>> =C2=A0# We have a recipes directory, add to BBFILES
>>> diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
>>> index 006b6af..6c018b1 100644
>>> --- a/meta-gpe/conf/layer.conf
>>> +++ b/meta-gpe/conf/layer.conf
>>> @@ -1,4 +1,4 @@
>>> -# We have a conf and classes directory, prepend to BBPATH to prefer ou=
r
>>> versions
>>> +# We have a conf and classes directory, append to BBPATH
>>> =C2=A0BBPATH .=3D ":${LAYERDIR}"
>>>
>>> =C2=A0# We have a recipes directory, add to BBFILES
>>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>>> index 36137e9..d5c2a17 100644
>>> --- a/meta-oe/conf/layer.conf
>>> +++ b/meta-oe/conf/layer.conf
>>> @@ -1,4 +1,14 @@
>>> -# We have a conf and classes directory, prepend to BBPATH to prefer ou=
r
>>> versions
>>> +# It really depends on order of the layers appearing in BBLAYERS
>>> +# variable in toplevel bblayers.conf file, where bitbake will search
>>> +# for .inc files and others where bitbake uses BBPATH since it will
>>> +# search the directories from first to last as specfied in BBPATH
>>
>> spec*i*fied
>>
>>> +# Therefore if you want a given layer to be considered high priority
>>> +# for the .inc and .conf etc. then consider it adding at the beginning
>>
>> =E2=80=A6 then consider adding it to the =E2=80=A6
>>
>>> +# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
>>> +# the recipe contention so the order of directories in BBFILES does
>>> +# not matter
>>
>> Full stop at the end?
>>
>>> +
>>> +# We have a conf and classes directory, append to BBPATH
>>> =C2=A0BBPATH .=3D ":${LAYERDIR}"
>>>
>>> =C2=A0# We have a recipes directory, add to BBFILES
>>> @@ -6,4 +16,10 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb
>>> ${LAYERDIR}/recipes-*/*/*.bbappend"
>>>
>>> =C2=A0BBFILE_COLLECTIONS +=3D "openembedded-layer"
>>> =C2=A0BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
>>> +
>>> +# Define the priority for recipes (.bb files) from this layer
>>
>> Add an extra line to make paragraph more clear or start with a capital
>> letter below?
>>
>>> +# this should be noted when you use this layer since it has
>>
>> Note sounds strange. Use =C2=BBdefined=C2=AB again?
>>
>>> +# to fall into the correct layer priority order that you have decided
>>> +# for you layering model
>>
>> s/you/your/
>>
>>> +
>>> =C2=A0BBFILE_PRIORITY_openembedded-layer =3D "6"
>>
>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>>
>> But please wait a bit before pushing it. Maybe a native speaker will
>> read through the new comments.
>
> The corrections look fine, but I think that last bit should be
> worded more like this:
>
> =C2=A0# Define the priority for recipes (.bb files) from this layer,
> =C2=A0# choosing carefully how this layer interacts with all of the
> =C2=A0# other layers.
>

thank you. Will redo it and incorporate feedback.

> n.b. I'm not convinced of the worth of layer priorities; I don't
> see what they gain and to me they only cause confusion...
>
Thats a different story :)
We are documenting what we have.
> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


