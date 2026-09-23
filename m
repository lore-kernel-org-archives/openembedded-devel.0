Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A977C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 17:56:29 +0000 (UTC)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1551.1790186181141806998
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 10:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rAbvqomn;
 spf=pass (domain: gmail.com, ip: 74.125.224.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66f7f72a284so1360865d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790186180; cv=none;
        d=google.com; s=arc-20260327;
        b=Sg6gG2yvJpjsM8xl3gdf2y5/s/cQk9ugCZ/H5S7zyyAsxD6zcAmKHO+nMtXROThs55
         Aq9/T+wlPjt8u06fue+0MMKbBcpvPLRRE8v/4g59xZafI71QYC2K7mf7bMhApox5snHF
         K3HsYIMyui2nwXHNq8dsL7xJNEdRTXQkuvxBhT76+lyWoDzCaDwpgV4XfZOcb42AmeIp
         DpmVIeRrmOrvqeVOl9l7qkEf8SpOUo9b0/hfI4duWIGGoCIlHAktMWMW/1ntIgZHYCXh
         cc2jmasw7vTjBJbv8DRAXBk+wkl59rI4SKR5C0HRhmTU0TwSt2w6opj5IT4SwMtnMuVJ
         sLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gmMiLRgOLPAgYdwLnvtCFFvN28zC1P9M4h9mP/sWit8=;
        fh=ICzdkxSgw1/jrwONQfsgSSin6/i3IISSU2LduP9F8P0=;
        b=Sf8IYAvQ0gPGkq0js9V7KxWXw5eM0s5sgHvNhCVOPLjpzoXNbzA1dTk+saL0FHkwBg
         zSsg/cHYBP99mf6iUm51QduXYu09nJ41KK7Kg0BDqmUzVgbyvhKPqtXtOh+Wl4XbThde
         a5SJYxtR7tTKaLjFs9FwQAs6bI6NM2BDhFY7G/E/j153SbZBJszwOR3mhZQ+Xu3BsqgG
         qs4DfA8mnlCwsz8V0qWItno7Ml7WS/g/tHrUVTTAEkamqAMK8HKCQp1rME4ja2rm3nNc
         t8ZOp00AZBWUS2PKu5sJj9KovWREjaUNJYzOcfhc/aX3CLq8TDE19U1gCECW7ON/27Uc
         x8FQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790186180; x=1790790980; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmMiLRgOLPAgYdwLnvtCFFvN28zC1P9M4h9mP/sWit8=;
        b=rAbvqomnJoExi2hxrqNkyOm/oMSdrFUxghnwFchMR9NDPxdBV47Pt0hMKzJmyNvmez
         Jv1S8NPQXkjrp1kQTfMjpEl/frnOGjFBRB8iBusdRmJFPQCQfZ7vt1o8TxbxK22odeAg
         ZR4Sb8L8crV2rmG6KqebQ/fe8b23JtBVYasnMIk9PKgBYSjPh9R8PaSIaD8kVwRgqeFe
         KDM8+unfEDk6AcORC63ZeL+pxSniHDH8oh9yWc7mybES7IFVR0PPYJBaQOwricTaed5v
         z5uOAR37rIIAnhtvn/GPIKaTLvWKZ38cILhDYucHOsBxyxi4jUoJYiNr1fwKIXl4QJTF
         cAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790186180; x=1790790980;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmMiLRgOLPAgYdwLnvtCFFvN28zC1P9M4h9mP/sWit8=;
        b=rNgOLPF6J8kbPaDju8Ej9Iv/F/tz+x6A81H/YImNcUjAnpBUk87n9Ti2cDSETNGYXu
         RGe3cNqnezz1T03/OkSvbLQXEg0KHbIJZgJtj8tMzBPQNGb4nLJm1uceqg/C8owxHKlC
         XqbYY4S7i18o/x0D6JXLcjaJnMxuS8lronoUHnX/SZ/jSI3fc0QMEnwn0s2O9f+cHPWT
         OQiL7/NjOqJ22iY9XnTnKxQ2di1ykvHqSkONhN4m63a2m7SwYvA78jM6CoxRHh1LpFWM
         M7wQuE8vzN0M9RWVpDEEKx5WcC6BYzz1r/yrQsdzQlTF5Jh50kXNbeHLvuGIlyPsZo89
         QVHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiFcgEark7XgbUzF3BRPU+x/P1O/0XbMoJKdhm1C79/5a4yfwRJcSrrfcPjV/dFSsFAdS+dge9VU5cBaMN/YHpqI0=@lists.openembedded.org
X-Gm-Message-State: AFuF++n+nKFupfytkjCuki6vPu9YeJwKz1sCuLvBphF60mK82eqq0iEQ
	e+U44hlQLov+yebXeFYfOVW+oQ5RKGeVUDaATf2yvJQ/WeKm5cuLMrPJIPscwoBS+60XFLbEOM2
	cjiUlQUYd/MkPTBg00LHLMhEO4P++xA0=
X-Gm-Gg: AYBFou28mZmbyiNN623wnytTEIa+VM87jaeY0oGtY1fU3KHzT6GENdJWJ8+ukXYQNKY
	j63W8VNWwmM0aJWMF7d6KoHB5na7Qyg2Qvh2ZuqY3B9iUpU/ja3r7LRBTLcoQQVHIlR5acwQaFA
	fkF2Q49eiD8gxTdsPxyYzYUaLG9srn9lPoHW9dKkHQTE5FMIdwbr1NEV3TKlmfkkJ5BEsumlDGQ
	TPuPG5Fp8DkG46kZXgGSBKd2TvRLrB8fiGpuzo5hDzSHdrFPr4C8AwJ7VEvUe0H8MRamB8Dn00n
	UYXEaEKrMZU4aaxp+k6dOB8SVMX6k+5dZWLy0OCjOUWgA7jnu6Y8LIq7ooUT5/C1N28ne8lILqY
	i8IKTb86iuPJOIc+ThiSNafOLdC9bFZU4XEaMdMT8Z7hyMxsdUVigl/OwHIPK8iRi3z9jPhevAr
	mARDLChTD9Qox2eXfipBFo0OVd9nfqRExGjNLoO7W5vGG1y0QjRSMyeRojQNI8w641NfDEjTsGC
	LblYgCfyzZ9ZDNNE2if3o4yxAhp0DWMeUN9Nm2RfdyLDybnV/kz9r099tPUObCK8HUds7wey2Sg
	0IwZ2jYbVt1j7ucLPw==
X-Received: by 2002:a05:690e:4801:b0:671:875:f361 with SMTP id
 956f58d0204a3-672d58c54ffmr1600520d50.53.1790186179647; Wed, 23 Sep 2026
 10:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260923012442.3830864-1-csiltala@atcorp.com> <CANx9H-DpC+P=Dn+z7dfTpYzerZGbgjZnF-4SuywLt-SzHGtRbw@mail.gmail.com>
 <CAMKF1spqyYgSRYjhjf0bwZLp0mx=dnXxYrYxCsjeiMXTZLjQsg@mail.gmail.com> <39ad6438-9787-4696-81aa-b0df5b86f027@atcorp.com>
In-Reply-To: <39ad6438-9787-4696-81aa-b0df5b86f027@atcorp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Sep 2026 10:55:53 -0700
X-Gm-Features: AcwNN1UDwCYAwfvUxOU40hBywzANAhT8DdrwBVx6hyuJliKTldcEyxsGG79dl9I
Message-ID: <CAMKF1sr7VLnMrF35Vsc4WnWYNxTxTM=6OPWBcqaSiyfyodzwjA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] bmon: upgrade 4.0 -> 5.0
To: "Corey J. Siltala" <csiltala@atcorp.com>
Cc: ticotimo@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051dc21065c2a3312"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 17:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130243

--00000000000051dc21065c2a3312
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:26=E2=80=AFAM Corey J. Siltala <csiltala@atcorp.c=
om>
wrote:

> Tim, Khem,
>
> Thomas Graf (tgraf) no longer had time to maintain the project and
> transferred ownership of the repo to Jafar Al-Gharaibeh (Jafaral). I've
> added a note to the commit message, addressed the ${BP} comment and some
> other lints here:
>
> From ae973d210d65ce5f06c3502b8c311b5188228c65 Mon Sep 17 00:00:00 2001
> From: Corey Siltala <csiltala@atcorp.com> <csiltala@atcorp.com>
> Date: Tue, 22 Sep 2026 19:01:49 -0500
> Subject: [PATCH] bmon: upgrade 4.0 -> 5.0
>
> Note: ownership of bmon repo was transferred from Thomas Graf (tgraf)
>       to Jafar Al-Gharaibeh (Jafaral)
>
> Fixes:
> - out_curses: use xcalloc instead of a fixed buffer
> - Avoid trying to include <values.h> on Android
> - Fix typographical errors
> - curses: Fix seperator lines
> - Fix build in FreeBSD/DragonflyBSD
> - fix segfault on element removal
> - fix: Fix memory leaks in module_set()
> - fix: Convert usage of strdup/free to xstrdup/xfree
> - Fix compile issue in OpenBSD
> - Fix spelling and grammar in docs and comments
>
> Features:
> - Allow numeric colors in bmonrc
> - curses: Add CTRL-N/CTRL-P for next/previous element
> - feat: Add IPv4/IPv6 addresses to additional info
> - feat: Add configure option to disable IPv6 in netlink module
> - feat: Add ability to toggle TC elements
> - curses: render graphs with Braille cells
> - display filters for TC ingress and egress
> - Add support for JSON output
> - Remove the 'Really quit' dialog and just exit cleanly
>
> Misc:
> - Update to autoconf of the common era
>
> See full release notes at
> https://github.com/Jafaral/bmon/releases/tag/v5.0
>
> Signed-off-by: Corey Siltala <csiltala@atcorp.com> <csiltala@atcorp.com>
> ---
>  meta-networking/recipes-support/bmon/bmon_4.0.bb | 11 -----------
>  meta-networking/recipes-support/bmon/bmon_5.0.bb | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 11 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/bmon/bmon_4.0.bb
>  create mode 100644 meta-networking/recipes-support/bmon/bmon_5.0.bb
>
> diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb
> b/meta-networking/recipes-support/bmon/bmon_4.0.bb
> deleted file mode 100644
> index f47069471a..0000000000
> --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
> -# only works with libnl-0.5.0
> -DEPENDS =3D "libnl libconfuse ncurses"
> -
> -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
> -SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3D=
https"
> -
> -inherit autotools pkgconfig
> -
> diff --git a/meta-networking/recipes-support/bmon/bmon_5.0.bb
> b/meta-networking/recipes-support/bmon/bmon_5.0.bb
> new file mode 100644
> index 0000000000..07c680850b
> --- /dev/null
> +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Portable Bandwidth Monitor and rate estimator"
> +HOMEPAGE =3D "https://github.com/Jafaral/bmon"
> <https://github.com/Jafaral/bmon>
> +SECTION =3D "net"
> +
> +LICENSE =3D "BSD-2-Clause & MIT"
>

LICENSE is using old syntax and should be upgraded to: "BSD-2-Clause AND
MIT"


> +LIC_FILES_CHKSUM =3D "
> file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed \
> +
> file://LICENSE.BSD;md5=3D5c262c13b60ebefe3060aed37d334ab6 \
> +                   "
> +DEPENDS =3D "libconfuse libnl ncurses"
> +
> +SRC_URI =3D
> "https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
> <https://github.com/Jafaral/$%7BBPN%7D/releases/download/v$%7BPV%7D/$%7BB=
P%7D.tar.gz>
> +SRC_URI[sha256sum] =3D
> "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
> +
> +inherit autotools pkgconfig
> +
> --
> 2.34.1
>
> Note also that the BSD-2-Clause license is not new, but was not noted in
> the previous recipe.
>
> Thanks,
> Corey
> On 9/22/2026 10:50 PM, Khem Raj wrote:
>
>
>
> On Tue, Sep 22, 2026 at 8:11=E2=80=AFPM Tim Orling via lists.openembedded=
.org
> <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>
>>
>>
>> On Tue, Sep 22, 2026 at 7:58=E2=80=AFPM Corey Siltala via lists.openembe=
dded.org
>> <csiltala=3Datcorp.com@lists.openembedded.org> wrote:
>>
>>> Fixes:
>>> - out_curses: use xcalloc instead of a fixed buffer
>>> - Avoid trying to include <values.h> on Android
>>> - Fix typographical errors
>>> - curses: Fix seperator lines
>>> - Fix build in FreeBSD/DragonflyBSD
>>> - fix segfault on element removal
>>> - fix: Fix memory leaks in module_set()
>>> - fix: Convert usage of strdup/free to xstrdup/xfree
>>> - Fix compile issue in OpenBSD
>>> - Fix spelling and grammar in docs and comments
>>>
>>> Features:
>>> - Allow numeric colors in bmonrc
>>> - curses: Add CTRL-N/CTRL-P for next/previous element
>>> - feat: Add IPv4/IPv6 addresses to additional info
>>> - feat: Add configure option to disable IPv6 in netlink module
>>> - feat: Add ability to toggle TC elements
>>> - curses: render graphs with Braille cells
>>> - display filters for TC ingress and egress
>>> - Add support for JSON output
>>> - Remove the 'Really quit' dialog and just exit cleanly
>>>
>>> Misc:
>>> - Update to autoconf of the common era
>>>
>>> See full release notes at
>>> https://github.com/Jafaral/bmon/releases/tag/v5.0
>>>
>>
>> It would nice to explain why the git repo changed. There is no mention
>> anywhere that I can find.
>>
>>>
>>> Signed-off-by: Corey Siltala <csiltala@atcorp.com>
>>> ---
>>>  .../recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.bb}        | 5 ++-=
--
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>  rename meta-networking/recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0=
.bb}
>>> (56%)
>>>
>>> diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>>> b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>>> similarity index 56%
>>> rename from meta-networking/recipes-support/bmon/bmon_4.0.bb
>>> rename to meta-networking/recipes-support/bmon/bmon_5.0.bb
>>> index f47069471a..0ceff05984 100644
>>> --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>>> +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>>> @@ -1,11 +1,10 @@
>>>  DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
>>>  LICENSE =3D "MIT"
>>>  LIC_FILES_CHKSUM =3D
>>> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f30=
2"
>>> -# only works with libnl-0.5.0
>>>  DEPENDS =3D "libnl libconfuse ncurses"
>>>
>>> -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
>>> -SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=
=3Dhttps
>>> "
>>> +SRC_URI =3D "
>>> https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BPN}-${PV}=
.tar.gz
>>> "
>>>
>>
> you can use BP here instead of BPN-PV which essentially is the same but
> concise.
>
>
>> +SRC_URI[sha256sum] =3D
>>> "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
>>>
>>>  inherit autotools pkgconfig
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#130178):
>> https://lists.openembedded.org/g/openembedded-devel/message/130178
>> Mute This Topic: https://lists.openembedded.org/mt/121387285/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>> --
> Corey Siltalacsiltala@atcorp.com
> Office: 952-829-5864 ext. 175 <(952)%20829-5864>
> Mobile: 763-333-5985 <(763)%20333-5985>
>
>

--00000000000051dc21065c2a3312
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23,=
 2026 at 5:26=E2=80=AFAM Corey J. Siltala &lt;<a href=3D"mailto:csiltala@at=
corp.com">csiltala@atcorp.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p>Tim, Khem,</p>
    <p>Thomas Graf (tgraf) no longer had time to maintain the project
      and transferred ownership of the repo to Jafar Al-Gharaibeh
      (Jafaral). I&#39;ve added a note to the commit message, addressed the
      ${BP} comment and some other lints here:</p>
    <p>From ae973d210d65ce5f06c3502b8c311b5188228c65 Mon Sep 17 00:00:00
      2001<br>
      From: Corey Siltala <a href=3D"mailto:csiltala@atcorp.com" target=3D"=
_blank">&lt;csiltala@atcorp.com&gt;</a><br>
      Date: Tue, 22 Sep 2026 19:01:49 -0500<br>
      Subject: [PATCH] bmon: upgrade 4.0 -&gt; 5.0<br>
      <br>
      Note: ownership of bmon repo was transferred from Thomas Graf
      (tgraf)<br>
      =C2=A0 =C2=A0 =C2=A0 to Jafar Al-Gharaibeh (Jafaral)<br>
      <br>
      Fixes:<br>
      - out_curses: use xcalloc instead of a fixed buffer<br>
      - Avoid trying to include &lt;values.h&gt; on Android<br>
      - Fix typographical errors<br>
      - curses: Fix seperator lines<br>
      - Fix build in FreeBSD/DragonflyBSD<br>
      - fix segfault on element removal<br>
      - fix: Fix memory leaks in module_set()<br>
      - fix: Convert usage of strdup/free to xstrdup/xfree<br>
      - Fix compile issue in OpenBSD<br>
      - Fix spelling and grammar in docs and comments<br>
      <br>
      Features:<br>
      - Allow numeric colors in bmonrc<br>
      - curses: Add CTRL-N/CTRL-P for next/previous element<br>
      - feat: Add IPv4/IPv6 addresses to additional info<br>
      - feat: Add configure option to disable IPv6 in netlink module<br>
      - feat: Add ability to toggle TC elements<br>
      - curses: render graphs with Braille cells<br>
      - display filters for TC ingress and egress<br>
      - Add support for JSON output<br>
      - Remove the &#39;Really quit&#39; dialog and just exit cleanly<br>
      <br>
      Misc:<br>
      - Update to autoconf of the common era<br>
      <br>
      See full release notes at
      <a href=3D"https://github.com/Jafaral/bmon/releases/tag/v5.0" target=
=3D"_blank">https://github.com/Jafaral/bmon/releases/tag/v5.0</a><br>
      <br>
      Signed-off-by: Corey Siltala <a href=3D"mailto:csiltala@atcorp.com" t=
arget=3D"_blank">&lt;csiltala@atcorp.com&gt;</a><br>
      ---<br>
      =C2=A0meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0=
.bb" target=3D"_blank">bmon_4.0.bb</a> | 11 -----------<br>
      =C2=A0meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0=
.bb" target=3D"_blank">bmon_5.0.bb</a> | 15
      +++++++++++++++<br>
      =C2=A02 files changed, 15 insertions(+), 11 deletions(-)<br>
      =C2=A0delete mode 100644
      meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0.bb" t=
arget=3D"_blank">bmon_4.0.bb</a><br>
      =C2=A0create mode 100644
      meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0.bb" t=
arget=3D"_blank">bmon_5.0.bb</a><br>
      <br>
      diff --git a/meta-networking/recipes-support/bmon/<a href=3D"http://b=
mon_4.0.bb" target=3D"_blank">bmon_4.0.bb</a>
      b/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0.bb"=
 target=3D"_blank">bmon_4.0.bb</a><br>
      deleted file mode 100644<br>
      index f47069471a..0000000000<br>
      --- a/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0=
.bb" target=3D"_blank">bmon_4.0.bb</a><br>
      +++ /dev/null<br>
      @@ -1,11 +0,0 @@<br>
      -DESCRIPTION =3D &quot;Portable Bandwidth Monitor and rate estimator&=
quot;<br>
      -LICENSE =3D &quot;MIT&quot;<br>
      -LIC_FILES_CHKSUM =3D
      <a>&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ec=
da2f7b4f302&quot;</a><br>
      -# only works with libnl-0.5.0<br>
      -DEPENDS =3D &quot;libnl libconfuse ncurses&quot;<br>
      -<br>
      -SRCREV =3D &quot;1b3f11bde315e221474f7d066ce4efb4ff4d39e3&quot;<br>
      -SRC_URI =3D
      &quot;git://<a href=3D"http://github.com/tgraf/bmon.git;branch=3Dmast=
er;protocol=3Dhttps" target=3D"_blank">github.com/tgraf/bmon.git;branch=3Dm=
aster;protocol=3Dhttps</a>&quot;<br>
      -<br>
      -inherit autotools pkgconfig<br>
      -<br>
      diff --git a/meta-networking/recipes-support/bmon/<a href=3D"http://b=
mon_5.0.bb" target=3D"_blank">bmon_5.0.bb</a>
      b/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0.bb"=
 target=3D"_blank">bmon_5.0.bb</a><br>
      new file mode 100644<br>
      index 0000000000..07c680850b<br>
      --- /dev/null<br>
      +++ b/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0=
.bb" target=3D"_blank">bmon_5.0.bb</a><br>
      @@ -0,0 +1,15 @@<br>
      +SUMMARY =3D &quot;Portable Bandwidth Monitor and rate estimator&quot=
;<br>
      +HOMEPAGE =3D <a href=3D"https://github.com/Jafaral/bmon" target=3D"_=
blank">&quot;https://github.com/Jafaral/bmon&quot;</a><br>
      +SECTION =3D &quot;net&quot;<br>
      +<br>
      +LICENSE =3D &quot;BSD-2-Clause &amp; MIT&quot;<br></p></div></blockq=
uote><div><br></div><div>LICENSE is using old syntax and should be upgraded=
 to: &quot;BSD-2-Clause AND MIT&quot;</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div><p>
      +LIC_FILES_CHKSUM =3D
      &quot;<a>file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed</a=
> \<br>
      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0
      <a>file://LICENSE.BSD;md5=3D5c262c13b60ebefe3060aed37d334ab6</a> \<br=
>
      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
      +DEPENDS =3D &quot;libconfuse libnl ncurses&quot;<br>
      +<br>
      +SRC_URI =3D
<a href=3D"https://github.com/Jafaral/$%7BBPN%7D/releases/download/v$%7BPV%=
7D/$%7BBP%7D.tar.gz" target=3D"_blank">&quot;https://github.com/Jafaral/${B=
PN}/releases/download/v${PV}/${BP}.tar.gz&quot;</a><br>
      +SRC_URI[sha256sum] =3D
      &quot;6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c=
0&quot;<br>
      +<br>
      +inherit autotools pkgconfig<br>
      +<br>
      --=C2=A0<br>
      2.34.1<br>
      <br>
      Note also that the BSD-2-Clause license is not new, but was not
      noted in the previous recipe.</p>
    <p>Thanks,<br>
      Corey</p>
    <div>On 9/22/2026 10:50 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22, 2026 at
            8:11=E2=80=AFPM Tim Orling via <a href=3D"http://lists.openembe=
dded.org" target=3D"_blank">lists.openembedded.org</a>
            &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div><br>
            </div>
            <div><br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22, 2026
                  at 7:58=E2=80=AFPM Corey Siltala via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a>
                  &lt;csiltala=3D<a href=3D"mailto:atcorp.com@lists.openemb=
edded.org" target=3D"_blank">atcorp.com@lists.openembedded.org</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fixes:<br=
>
                  - out_curses: use xcalloc instead of a fixed buffer<br>
                  - Avoid trying to include &lt;values.h&gt; on Android<br>
                  - Fix typographical errors<br>
                  - curses: Fix seperator lines<br>
                  - Fix build in FreeBSD/DragonflyBSD<br>
                  - fix segfault on element removal<br>
                  - fix: Fix memory leaks in module_set()<br>
                  - fix: Convert usage of strdup/free to xstrdup/xfree<br>
                  - Fix compile issue in OpenBSD<br>
                  - Fix spelling and grammar in docs and comments<br>
                  <br>
                  Features:<br>
                  - Allow numeric colors in bmonrc<br>
                  - curses: Add CTRL-N/CTRL-P for next/previous element<br>
                  - feat: Add IPv4/IPv6 addresses to additional info<br>
                  - feat: Add configure option to disable IPv6 in
                  netlink module<br>
                  - feat: Add ability to toggle TC elements<br>
                  - curses: render graphs with Braille cells<br>
                  - display filters for TC ingress and egress<br>
                  - Add support for JSON output<br>
                  - Remove the &#39;Really quit&#39; dialog and just exit
                  cleanly<br>
                  <br>
                  Misc:<br>
                  - Update to autoconf of the common era<br>
                  <br>
                  See full release notes at <a href=3D"https://github.com/J=
afaral/bmon/releases/tag/v5.0" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/Jafaral/bmon/releases/tag/v5.0</a><br>
                </blockquote>
                <div dir=3D"auto"><br>
                </div>
                <div dir=3D"auto">It would nice to explain why the git
                  repo changed. There is no mention anywhere that I can
                  find.</div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
                  Signed-off-by: Corey Siltala &lt;<a href=3D"mailto:csilta=
la@atcorp.com" target=3D"_blank">csiltala@atcorp.com</a>&gt;<br>
                  ---<br>
                  =C2=A0.../recipes-support/bmon/{<a href=3D"http://bmon_4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a>
                  =3D&gt; <a href=3D"http://bmon_5.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">bmon_5.0.bb</a>}=C2=A0
                  =C2=A0 =C2=A0 =C2=A0 | 5 ++---<br>
                  =C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
                  =C2=A0rename meta-networking/recipes-support/bmon/{<a hre=
f=3D"http://bmon_4.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</=
a>
                  =3D&gt; <a href=3D"http://bmon_5.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">bmon_5.0.bb</a>}
                  (56%)<br>
                  <br>
                  diff --git a/meta-networking/recipes-support/bmon/<a href=
=3D"http://bmon_4.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a=
>
                  b/meta-networking/recipes-support/bmon/<a href=3D"http://=
bmon_5.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><br>
                  similarity index 56%<br>
                  rename from meta-networking/recipes-support/bmon/<a href=
=3D"http://bmon_4.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a=
><br>
                  rename to meta-networking/recipes-support/bmon/<a href=3D=
"http://bmon_5.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><b=
r>
                  index f47069471a..0ceff05984 100644<br>
                  --- a/meta-networking/recipes-support/bmon/<a href=3D"htt=
p://bmon_4.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a><br>
                  +++ b/meta-networking/recipes-support/bmon/<a href=3D"htt=
p://bmon_5.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><br>
                  @@ -1,11 +1,10 @@<br>
                  =C2=A0DESCRIPTION =3D &quot;Portable Bandwidth Monitor an=
d rate
                  estimator&quot;<br>
                  =C2=A0LICENSE =3D &quot;MIT&quot;<br>
                  =C2=A0LIC_FILES_CHKSUM =3D
                  <a>&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade69=
8e0bcf8506ecda2f7b4f302&quot;</a><br>
                  -# only works with libnl-0.5.0<br>
                  =C2=A0DEPENDS =3D &quot;libnl libconfuse ncurses&quot;<br=
>
                  <br>
                  -SRCREV =3D &quot;1b3f11bde315e221474f7d066ce4efb4ff4d39e=
3&quot;<br>
                  -SRC_URI =3D &quot;git://<a href=3D"http://github.com/tgr=
af/bmon.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps</a>&quot=
;<br>
                  +SRC_URI =3D &quot;<a href=3D"https://github.com/Jafaral/=
$%7BBPN%7D/releases/download/v$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/Jafaral/${BPN}/releases/d=
ownload/v${PV}/${BPN}-${PV}.tar.gz</a>&quot;<br>
                </blockquote>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>you can use BP here instead of BPN-PV which essentially
            is the same but concise.</div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div class=3D"gmail_quote">
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  +SRC_URI[sha256sum] =3D
                  &quot;6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8=
a555459ad73c0&quot;<br>
                  <br>
                  =C2=A0inherit autotools pkgconfig<br>
                  <br>
                  -- <br>
                  2.34.1<br>
                  <br>
                  <br>
                  <br>
                  <br>
                </blockquote>
              </div>
            </div>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#130178): <a href=3D"https://lists.openembed=
ded.org/g/openembedded-devel/message/130178" rel=3D"noreferrer" target=3D"_=
blank">https://lists.openembedded.org/g/openembedded-devel/message/130178</=
a><br>
            Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1=
21387285/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/mt/121387285/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists=
.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openemb=
edded.org</a><br>
            Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openem=
bedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <pre cols=3D"72">--=20
Corey Siltala
<a href=3D"mailto:csiltala@atcorp.com" target=3D"_blank">csiltala@atcorp.co=
m</a>
Office: <a href=3D"tel:(952)%20829-5864" value=3D"+19528295864" target=3D"_=
blank">952-829-5864 ext. 175</a>
Mobile: <a href=3D"tel:(763)%20333-5985" value=3D"+17633335985" target=3D"_=
blank">763-333-5985</a></pre>
  </div>

</blockquote></div></div>

--00000000000051dc21065c2a3312--

