Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67077C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:25:44 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
To: openembedded-devel@lists.openembedded.org
From: "Jasper Orschulko" <jasper@fancydomain.eu>
X-Originating-Location: Berlin, State of Berlin, DE (84.147.247.12)
X-Originating-Platform: Linux Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 May 2025 04:25:40 -0700
References: <7c39f1e3-7f53-461e-be59-711a72292b5a@gmail.com>
In-Reply-To: <7c39f1e3-7f53-461e-be59-711a72292b5a@gmail.com>
Message-ID: <23053.1746530740696323333@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0sVOtRhuk8wz88Ur6jST"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 11:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117348

--0sVOtRhuk8wz88Ur6jST
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I stand corrected. :) Thanks for the info, I was not aware of this change!

A bit OT: https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bit=
bake-user-manual-fetching.html#git-fetcher-git could use a update then, as =
it still states:

> =E2=80=9Ctag=E2=80=9D: Specifies a tag to use for the checkout. To correc=
tly resolve tags, BitBake must access the network. For that reason, tags ar=
e often not used. As far as Git is concerned, the =E2=80=9Ctag=E2=80=9D par=
ameter behaves effectively the same as the =E2=80=9Crev=E2=80=9D parameter.

https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-=
manual-fetching.html#git-fetcher-git

On Tue, May 6, 2025 at 01:17 PM, Gyorgy Sarvari wrote:

>=20
> On 5/6/25 13:10, Jasper Orschulko via lists.openembedded.org wrote:
>=20
>>=20
>>> And add tag to SRC_URI.
>>=20
>> AFAIK this is not possible / bad practise, unless there were some
>> recent changes to OE that I am unaware of.
>=20
> There were some recent developments[1] in this front. Now tags and the
> SRCREV are matched to each other, so you can be sure that the SRCREV is
> correlated to PV, and they are not randomly set.
>=20
> [1]: e.g.
> https://git.openembedded.org/bitbake/commit/?id=3Dd591d7633fe8d739ec00395=
920e44910b0b77e27
>=20
>=20
>=20
>> You can either specify "rev" directly in the SRC_URI or SRCREV, not
>> both. So if you set rev to a git tag in SRC_URI, you cannot set a git
>> commit hash within SRCREV, thus you lose reproducibility since you are
>> now only referencing a floating rev. See also:
>> https://stackoverflow.com/questions/78127309/how-to-set-srcrev-for-git-t=
ag-in-yocto/78127354#78127354
>> .
>>=20
>> So setting the git commit hash in SRC_URI as rev or directly in SRCREV
>> is the way to go.
>>=20
>>=20
>>=20
>=20
>

--0sVOtRhuk8wz88Ur6jST
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I stand corrected. :) Thanks for the info, I was not aware of this cha=
nge!</div>
<div>&nbsp;</div>
<div>A bit OT: <a href=3D"https://docs.yoctoproject.org/bitbake/dev/bitbake=
-user-manual/bitbake-user-manual-fetching.html#git-fetcher-git" target=3D"_=
blank" rel=3D"noopener">https://docs.yoctoproject.org/bitbake/dev/bitbake-u=
ser-manual/bitbake-user-manual-fetching.html#git-fetcher-git</a> could use =
a update then, as it still states:</div>
<div>&nbsp;</div>
<div>&gt; <em>&ldquo;tag&rdquo;:</em> Specifies a tag to use for the checko=
ut. To correctly resolve tags, BitBake must access the network. For that re=
ason, tags are often not used. As far as Git is concerned, the &ldquo;tag&r=
dquo; parameter behaves effectively the same as the &ldquo;rev&rdquo; param=
eter.</div>
<div>&nbsp;</div>
<div><br />https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bi=
tbake-user-manual-fetching.html#git-fetcher-git</div>
<div>&nbsp;</div>
<div>On Tue, May 6, 2025 at 01:17 PM, Gyorgy Sarvari wrote:</div>
<div>
<blockquote>On 5/6/25 13:10, Jasper Orschulko via lists.openembedded.org wr=
ote:<br />
<blockquote>
<blockquote>And add tag to SRC_URI.</blockquote>
AFAIK this is not possible / bad practise, unless there were some<br />rece=
nt changes to OE that I am unaware of.</blockquote>
There were some recent developments[1] in this front. Now tags and the<br /=
>SRCREV are matched to each other, so you can be sure that the SRCREV is<br=
 />correlated to PV, and they are not randomly set.<br /><br />[1]: e.g.<br=
 /><a href=3D"https://git.openembedded.org/bitbake/commit/?id=3Dd591d7633fe=
8d739ec00395920e44910b0b77e27" target=3D"_blank" rel=3D"noopener">https://g=
it.openembedded.org/bitbake/commit/?id=3Dd591d7633fe8d739ec00395920e44910b0=
b77e27</a><br /><br />
<blockquote>You can either specify "rev" directly in the SRC_URI or SRCREV,=
 not<br />both. So if you set rev to a git tag in SRC_URI, you cannot set a=
 git<br />commit hash within SRCREV, thus you lose reproducibility since yo=
u are<br />now only referencing a floating rev. See also:<br /><a href=3D"h=
ttps://stackoverflow.com/questions/78127309/how-to-set-srcrev-for-git-tag-i=
n-yocto/78127354#78127354" target=3D"_blank" rel=3D"noopener">https://stack=
overflow.com/questions/78127309/how-to-set-srcrev-for-git-tag-in-yocto/7812=
7354#78127354</a>.<br />&nbsp;<br />So setting the git commit hash in SRC_U=
RI as rev or directly in SRCREV<br />is the way to go.<br /><br /><br /></b=
lockquote>
</blockquote>
</div>

--0sVOtRhuk8wz88Ur6jST--

