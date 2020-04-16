Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.9526.1587052166439466751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 08:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AylHVAxt;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id g74so21707287qke.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BL41+vcW8TNSDb+sAcqbC8rXVB8A9Q2UbrHTDG3hqYA=;
        b=AylHVAxtjb2aQCbguhbNQQl7CFhKG5qgB3x9bJ208T0/kkJdV19LX+za4TL35hmjZl
         Xct0ranCs2qNm3Tcfae3YFmxMwHzRJ3kjwvX+cvcT9u/SVIeQBeQg/89THe7i4N+U0zu
         l2JG+TwNFOx5zqMdswKWPoVJxvpVXDFnJ4n3sJ8Fb+e4aLYU058sZNCIiDNAR4YAfU1O
         NdUqEB5RPKuB4weijHEp/oqqsSZA4D2FInyifLTmQuwmGxoTcPFx6ByGRZF4Sp1bY/gr
         bKOrIhsTqRESGiGW3uoBTcjLx0qHRmH/laqN+6nYb6yWzmWjkJWXhTkCP/w4gWKqkLH7
         cwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BL41+vcW8TNSDb+sAcqbC8rXVB8A9Q2UbrHTDG3hqYA=;
        b=HsSRRM21hF//NQXC5akcIG8Ajv+672tqWPG4E5bgbwkhhBTe2530IVSapQl65TQ7eW
         FaQ7gbthPKNXK2tZ6s3bKRABG4DmoJTfYZgo4K6hre7ymtMXEpEQKrTQbCN4BoCWeENv
         qRmC+hn8cNqHetLLKQYf44coC6ubniST7d3Ae2kLPf8linI42MfuB/fM5R+VRxuhAaRU
         TUIfO1g9+FbsVYVgX3c1t1/zRV7DmY9TcM8WUfzQQrJGAQm/SoKEERiWx4e64lG/8Fpe
         /S1GDDLZiNgyEeHTUj1rLqD2cE4OzknYd1jBjLL5wN9ND5b/AEMvb6RCVAOAJVZ6J009
         lCtg==
X-Gm-Message-State: AGi0PuaccLqpajZcdCRShq8724FVQBGkfM667QbSdeg0Yqy72+4P2IYP
	oNe50bkB7WHZH+L+A8eHihApcPphcZrphBBq2mM=
X-Google-Smtp-Source: APiQypKEXrvUd/ScFQVkN5NPWL8gfIGZAGxJgWhxiSRu8wDXFnMwKobp3LnXXXUYF0N2/kmFwhYWRAM7Bl7briqBRKo=
X-Received: by 2002:a05:620a:16aa:: with SMTP id s10mr7811941qkj.225.1587052165362;
 Thu, 16 Apr 2020 08:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
 <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
 <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com> <07865a3bea714ee88fb74d336ab10831@XBOX03.axis.com>
 <3a8a31f8-893a-0fc9-505c-f3bc389d0b31@windriver.com>
In-Reply-To: <3a8a31f8-893a-0fc9-505c-f3bc389d0b31@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Apr 2020 08:48:59 -0700
Message-ID: <CAMKF1spSh1aZGfaEkfeqFS5ERPwbTgksJ83ZQ0wtf9D=HbNDug@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 16, 2020 at 6:21 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 4/15/20 7:02 PM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-devel@lists.openembedded.org <openembedded-
> >> devel@lists.openembedded.org> On Behalf Of Trevor Gamblin
> >> Sent: den 15 april 2020 02:10
> >> To: Khem Raj <raj.khem@gmail.com>
> >> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> >> Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 ->
> >> 2.4.43
> >>
> >> On 4/14/20 6:38 PM, Khem Raj wrote:
> >>> apache-websockets does not like it
> >>>
> >>> https://errors.yoctoproject.org/Errors/Details/403771/
> >> Thanks, will take a look at it and re-send.
> > It appears they have added cross compilation support to apxs, but
> > it clashes with the changes done in OE to make it support cross
> > compilation. I tried to solve it by basically removing the OE
> > changes, but it was not as simple as that. In the end we worked
> > around it with this quick fix:
> >
> > apache_sysroot_preprocess_append() {
> >          # Disable apxs' built in cross compilation support and rely on what the
> >          # recipe sets up.
> >          sed -i 's!$destdir = .*!$destdir = "";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
> > }
> >
> > However, I hope you can come up with a better solution that
> > actually makes use of what they did upstream and thus lessen
> > the changes that have to be applied by OE.
>
> Hi Peter,
>
> Ironically I'm seeing your email just as I submit a v2 reverting their
> cross-compilation changes. I wasn't able to find a better workaround
> than just reverting the destdir stuff that they added, but I did it via
> a patch file instead of within the recipe itself. I do like your
> approach better though, as it avoids adding a patch file that'll have to
> be maintained. Do you want to submit your fix in lieu of mine?
>

yeah I think revert is last resort. So lets see if we can fix it

> Cheers,
>
> Trevor
>
> >
> > //Peter
> >
> >>> On Tue, Apr 14, 2020 at 12:49 PM Trevor Gamblin
> >>> <trevor.gamblin@windriver.com> wrote:
> >>>> LICENSE file was updated due to a typo fix.
> >>>>
> >>>> Note that this upgrade fixes two CVES affecting versions
> >>>> 2.4.41 and earlier:
> >>>>
> >>>> CVE: CVE-2020-1927
> >>>> CVE: CVE-2020-1934
> >>>>
> >>>> See:
> >>>> https://nvd.nist.gov/vuln/detail/CVE-2020-1927
> >>>> https://nvd.nist.gov/vuln/detail/CVE-2020-1934
> >>>>
> >>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> >>>> ---
> >>>>    .../apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb}        | 6 +++-
> >> --
> >>>>    1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>    rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.41.bb =>
> >> apache2_2.4.43.bb} (97%)
> >>>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
> >> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
> >>>> similarity index 97%
> >>>> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
> >>>> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
> >>>> index a34734c20..2fff153fc 100644
> >>>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
> >>>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
> >>>> @@ -24,9 +24,9 @@ SRC_URI_append_class-target = " \
> >>>>               file://volatiles.04_apache2 \
> >>>>               "
> >>>>
> >>>> -LIC_FILES_CHKSUM =
> >> "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
> >>>> -SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
> >>>> -SRC_URI[sha256sum] =
> >> "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
> >>>> +LIC_FILES_CHKSUM =
> >> "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> >>>> +SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
> >>>> +SRC_URI[sha256sum] =
> >> "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
> >>>>    S = "${WORKDIR}/httpd-${PV}"
> >>>>
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>>
