Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C73BC61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:24:05 +0000 (UTC)
Subject: Re: [meta-oe][scarthgap][PATCH 0/5] libssh: Fix multiple CVEs
To: openembedded-devel@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 01:23:55 -0700
References: <20260819111047.44043-1-hthakar@cisco.com> <CA+s=J=wUKLeAd2UNi-krDvXyyQG73H_XXcm9oLU4D1jQeTwf8Q@mail.gmail.com>
In-Reply-To: <CA+s=J=wUKLeAd2UNi-krDvXyyQG73H_XXcm9oLU4D1jQeTwf8Q@mail.gmail.com>
Message-ID: <2992798.1788251035800302150@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MAJU3ZSvfwddu8XQavbm"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129619

--MAJU3ZSvfwddu8XQavbm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 07:07 AM, Anuj Mittal wrote:

>=20
> On Wed, Aug 19, 2026 at 7:10=E2=80=AFPM Hetvi Thakar -X (hthakar - E INFO=
CHIPS
> PRIVATE LIMITED at Cisco) via lists.openembedded.org
> <hthakar=3Dcisco.com@lists.openembedded.org> wrote:
>=20
>> From: Hetvi Thakar <hthakar@cisco.com>
>>=20
>> Backport five upstream libssh security fixes to the 0.10.6 recipe on
>> scarthgap:
>>=20
>> - CVE-2026-59843
>> - CVE-2026-59844
>> - CVE-2026-59846
>> - CVE-2026-59848
>> - CVE-2026-59850
>>=20
>> Carry these as focused backports instead of upgrading libssh because
>> newer releases include API and functional changes outside the security
>> scope.
>>=20
>> CVE-2026-15370 and CVE-2026-59849 affect libssh >=3D 0.11.0.
>> CVE-2026-59842 and CVE-2026-59851 affect only libssh 0.12.0 and rely on
>> code or features absent from 0.10.6. NVD correction requests have been
>> submitted for these inaccurate affected-version entries; therefore, no
>> CVE_STATUS entries are added.
>>=20
>> The individual commits retain the upstream fix provenance and advisory
>> references for each CVE.
>>=20
>> Testing:
>> - Applied all five patches to libssh 0.10.6 in series order without
>> conflicts or fuzz.
>> - Package build completed successfully.
>>=20
>> Hetvi Thakar (5):
>> libssh: Fix CVE-2026-59843
>> libssh: Fix CVE-2026-59844
>> libssh: Fix CVE-2026-59846
>> libssh: Fix CVE-2026-59848
>> libssh: Fix CVE-2026-59850
>=20
> 3/5 is adding unresolved merge markers to recipe that 4/5 is then
> removing. Please fix the patches, rebase them on current scarthgap and
> resend.
>=20
> Thanks,
>=20
> Anuj

Hi,

Thanks for pointing this out.

I will fix the unresolved merge markers, rebase the patch series on
the current scarthgap branch, and resend the updated series.

Regards,
Hetvi

--MAJU3ZSvfwddu8XQavbm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Sep 1, 2026 at 07:07 AM, Anuj Mittal wrote:</div>
<div>
<blockquote>On Wed, Aug 19, 2026 at 7:10=E2=80=AFPM Hetvi Thakar -X (hthaka=
r - E INFOCHIPS<br />PRIVATE LIMITED at Cisco) via lists.openembedded.org<b=
r />&lt;hthakar=3Dcisco.com@lists.openembedded.org&gt; wrote:<br />
<blockquote>From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br /><br />Backpor=
t five upstream libssh security fixes to the 0.10.6 recipe on<br />scarthga=
p:<br /><br />- CVE-2026-59843<br />- CVE-2026-59844<br />- CVE-2026-59846<=
br />- CVE-2026-59848<br />- CVE-2026-59850<br /><br />Carry these as focus=
ed backports instead of upgrading libssh because<br />newer releases includ=
e API and functional changes outside the security<br />scope.<br /><br />CV=
E-2026-15370 and CVE-2026-59849 affect libssh &gt;=3D 0.11.0.<br />CVE-2026=
-59842 and CVE-2026-59851 affect only libssh 0.12.0 and rely on<br />code o=
r features absent from 0.10.6. NVD correction requests have been<br />submi=
tted for these inaccurate affected-version entries; therefore, no<br />CVE_=
STATUS entries are added.<br /><br />The individual commits retain the upst=
ream fix provenance and advisory<br />references for each CVE.<br /><br />T=
esting:<br />- Applied all five patches to libssh 0.10.6 in series order wi=
thout<br />conflicts or fuzz.<br />- Package build completed successfully.<=
br /><br />Hetvi Thakar (5):<br />libssh: Fix CVE-2026-59843<br />libssh: F=
ix CVE-2026-59844<br />libssh: Fix CVE-2026-59846<br />libssh: Fix CVE-2026=
-59848<br />libssh: Fix CVE-2026-59850</blockquote>
3/5 is adding unresolved merge markers to recipe that 4/5 is then<br />remo=
ving. Please fix the patches, rebase them on current scarthgap and<br />res=
end.<br /><br />Thanks,<br /><br />Anuj</blockquote>
<p class=3D"isSelectedEnd"><span>Hi,</span></p>
<p class=3D"isSelectedEnd"><span>Thanks for pointing this out.</span></p>
<p class=3D"isSelectedEnd"><span>I will fix the unresolved merge markers, r=
ebase the patch series on</span><br /><span>the current scarthgap branch, a=
nd resend the updated series.</span></p>
<p><span>Regards,</span><br /><span>Hetvi</span></p>
</div>

--MAJU3ZSvfwddu8XQavbm--

