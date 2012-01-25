Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqCOo-0003qL-DI
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 00:37:06 +0100
Received: by lags15 with SMTP id s15so3365527lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 15:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Erg0enzDEzL06Y/4DDHUqNiw06OStyoJrQJJR+zWfGQ=;
	b=YnnZmBQjvUwztKhDcbn9IF0QoqPvyqPnE6xosv5smhz+7Zc4XQa0bKNngF4CXqy6IK
	upWboZxkdg1aemTFQHpQetaEHQkM6AJ0vXOFtkHBU0fBKct9Y06UAsu7/LNuUiRk6vzy
	06vhEq5rGKe4BGMc0Wi4kRWcFJJLHjkjiIw98=
Received: by 10.112.32.1 with SMTP id e1mr1296600lbi.3.1327534159231; Wed, 25
	Jan 2012 15:29:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 15:28:48 -0800 (PST)
In-Reply-To: <1609637.uEWkOuPr02@helios>
References: <1592899.mTy93uB97i@helios>
	<CAMKF1spT9TgXmqQq-D+r1jnoXuv_+koPs_Rr=VhVzZkro5V1Bw@mail.gmail.com>
	<1609637.uEWkOuPr02@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 15:28:48 -0800
Message-ID: <CAMKF1sppVL76FTbbvLyTn-HkWQaG_2D0n0nBfCSnAkat_dqoqg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 23:37:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 10:39 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 25 January 2012 09:49:14 Khem Raj wrote:
>> meta-oe was started to fill in gaps that oe-core would have for
>> existing oe users =C2=A0since oe-core will not have all required functio=
nality
>> and so distros could migrate to using oe-core and not loose the bells an=
d
>> whistles they already have.
>
> Sure, that's totally reasonable. I think we've built up some experience i=
n the
> time we've had so far that we can apply in order to improve the structure=
 a
> little though.
>
>> Plus its an umbrella layer which has many layers underneath.
>
> To save confusion, I speak only of the meta-oe layer within the meta-
> openembedded repository. The meta-openembedded repository itself is not a
> layer of any kind, only the directories within it are. (I really wish we =
had
> chosen an entirely distinct name for the repository, but I guess that shi=
p has
> sailed.)
>
>> However the problems it sees right now are that there are pieces which
>> could be considered distro specific and ones, the new untested recipes s=
hould
>> not be an issue if they are pinned properly.
>
> So there ought not to be too much distro-specific in meta-oe; obviously t=
here
> is some at the moment due to the small number of distros actively using i=
t.
>
> Unfortunately this pinning (I assume you mean PREFERRED_VERSION_) can onl=
y
> really occur within a distro that already includes meta-oe, and then you =
need
> to buy into the rest of the policy that that distro provides. If you are
> starting only from OE-Core or your distro does not typically include meta=
-oe,
> it will have no such pinning.
>

oe-core does have policies see default* files under meta/conf
however anyone who is using oe has to start with some policies iow distro
if its a custom one or if its predefined one

>> recipes that move our of oe-core I agree should be hosted in
>> a meta-deprecated or somesuch
>>
>> I am happy to move out toolchain bits as well into a separate layer
>> under meta-openembedded umbrella
>> that will clarify it a bit and should not be a big hassle.
>
> Sounds great!

toolchain is nothing but an example of conflicting recipes here.

>
>> I think real issue people suffer from is 2 and the duplicate recipes
>> in meta-oe which has different configuration
>> in oe-core.
>
> I agree these do need to be well-justified, and should avoid being just
> manifestations of distro policy. These are gradually being ironed out whe=
re
> appropriate, we just need to continue with this process.

yes this area needs some attention and I would request everyone to
clean this bit.

>
>> So meta-oe meta-toolchain meta-deprecated could be created now we need
>> to find maintainer for these layers.
>
> It might be a bit presumptuous but I would nominate you for the toolchain
> layer ;) since you more or less maintain the recipes that would go in it
> already. (I guess meta-toolchain probably isn't the best name since that
> already means something in OE.)
>

I think right now eglibc 2.12 is one of deprecated recipes that moved
into meta-oe
and I know angstrom currently depends on it. Sometimes if there are no more=
 than
one layer who depends on a deprecared recipe it might be better to
move it to that layer itself.
so some careful decision would be involved when moving them around.
meta-deprecated may sound
like deprecated but it should actually be a maintained layer.

> As for the other layers I would be happy to assist Koen in maintaining th=
em if
> he would like, but I think he's been doing a fine job with meta-oe alread=
y.
>
>> All said if it was possible to handpick versions from layers and use
>> bitbake -g output pn-depends.dot
>> to generate some manifest so indicate which recipe is being picked
>> from a set of recipes from different layers would be helpful.
>> since there always will be some duplicate recipes no matter what.
>
> The bitbake-layers tool is supposed to help at least with the reporting s=
ide
> of this, and it does report where bbappends exist and recipes have been
> overlayed. Right now however it does not report anything if a recipe is
> overlayed but the version number is different; I'm looking into fixing th=
at at
> the moment. BTW I'd appreciate feedback on bitbake-layers as I've not had=
 a
> lot since it was extended - feature requests welcome.
>

hmm I have not used it but I will try. Its I think very important that
user knows
which recipe it feeding into the build. Especially when there are
multiple recipes
in the layers he/she is using. Second thing would be .bbappends as to
how the recipe
was bbappended.

> As an aside, we also still have to consider Richard's proposal for versio=
n-
> independent bbappends (i.e. using % as a wildcard in the file name). I do=
n't
> think anyone responded to that yet.
>

We should discuss that in separate thread.

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


