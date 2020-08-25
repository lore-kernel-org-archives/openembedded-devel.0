Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.1621.1598380802606561061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qBABNsEA;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id p4so11972483qkf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6d48A7dORcJMZkWLWJb53TmnseKJCfQ6aEF3pBewDwU=;
        b=qBABNsEArVZZJrVpfrfOuIU5ZOKpVrlp4OfzNEVwmPMuTZPO8PMBT/Fwdqvslux0dP
         ysDpJK3CZ9fEICKIJlq/X6jhLUZWaS+9zooyoy5A3QAEQEf1eQ+ZbfOKYzSfb96doT/P
         viMDBFvYkcwU58Hj4wmI6kivSNWigc0V75KYc61iH1yKdrKMoxiyPAlQK0/4s52yxfXX
         ta6q0hqgigXCP4tP+gtCRbScHodoAqME2/EF4SdRVS/jmCgBLnqy+hliz/BSGbpv2SLu
         1tk986g2fHpdknKjpFv4VvWXfNK4KXfAKTcAIC7AnTK4w+1PIG15xq2H7TFfQDlDTX7f
         UROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6d48A7dORcJMZkWLWJb53TmnseKJCfQ6aEF3pBewDwU=;
        b=ZaZF/1BziNmhz/63BdMDmOHue6HMkFoKPw9+72UhfxGOejvzQF28W9pToKnHE3B0R+
         STeoPSPycwVvwjFoHvJzLpGHLzVAfsreK4hA+MVkLkJTk+3QUVqv9aiS7CAkbto3/LqY
         34ttRCysnKrx3/uc2GiRwySAoCHUfXCQi0mXU4HfCXR9VSH6++XJBELVG4noRBwxcGK1
         MAetJBIAXIl/sLeL4zdSN42p9Rszej/IrvOCd52niw8B2+2XJIR76VNaRuTDUsOjhK8W
         8quY1CqjuHV+NF9Pf0kkgKfj84115tUMK9rghracgHuOVVB0k0knKnBEuHRazmKFQ1Wm
         h/Hw==
X-Gm-Message-State: AOAM532LX8X0MDouzK43cRAn/6MbugDk/fDKLmGrtHpizcAyFRdW3cP8
	UXNiEMZQT+swGI9vdmqu1Vf2rXoKdEod9iDCvzU=
X-Google-Smtp-Source: ABdhPJycbXCU96DhIHYfN/BTAVWBcD42M/karPCQUU9Ho1kZtA0fQYyibSdBp02mQ2+zaZALONr0aYYNsJbYCzR1B18=
X-Received: by 2002:a37:9e91:: with SMTP id h139mr10211568qke.71.1598380801676;
 Tue, 25 Aug 2020 11:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
 <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com> <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
In-Reply-To: <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 25 Aug 2020 11:39:35 -0700
Message-ID: <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Diego Rondini <diego.rondini@kynetics.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 25, 2020 at 10:59 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> OK, I've overlooked that it's from gitlab, but are you sure that gitlab archives aren't re-generated from time to time like the github archives are?
>
> Or are you sure that https://gitlab.com/libeigen/eigen/-/releases are developer uploaded archives? It looks like gitlab creates them automatically:
> https://docs.gitlab.com/ee/user/project/releases/
> like github does with tag archives.
>

while it fixes the issue it is trying to fix, it would be better to
fix the non-deterministic archive issue as well while here, I dont
know if gitlab's archiving is reproducible perhaps a question for
gitlab, but it would be ok to switch to using git fetcher to avoid
that suspicion. What do you think?

> On Tue, Aug 25, 2020 at 6:36 PM Diego Rondini <diego.rondini@kynetics.com> wrote:
>>
>> Hi Martin,
>>
>> On Tue, Aug 25, 2020 at 5:57 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > Doesn't this trigger src-uri-bad QA warning? It would be better to use git fetcher.
>>
>> No warning because this is from git*lab*.
>>
>> Also, this the URL of an official release tarball taken from:
>> https://gitlab.com/libeigen/eigen/-/releases
>>
>> See also first comment here:
>> https://patchwork.openembedded.org/patch/161360/
>>
>> Regards,
>> Diego Rondini
>>
>>
>> >
>> > On Tue, Aug 25, 2020 at 5:45 PM Diego <diego.rondini@kynetics.com> wrote:
>> >>
>> >> Bitbucket is no longer the official home of eigen, which has moved to
>> >> gitlab. Update SRC_URI to download releases from gitlab, fixing:
>> >> WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
>> >> https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2,
>> >> attempting MIRRORS if available
>> >>
>> >> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
>> >> ---
>> >>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
>> >>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
>> >> index f638848d1..9c3d962f4 100644
>> >> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
>> >> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
>> >> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
>> >>  LICENSE = "MPL-2.0"
>> >>  LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
>> >>
>> >> -SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
>> >> -SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
>> >> -SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
>> >> +SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
>> >> +SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
>> >> +SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
>> >>
>> >> -S = "${WORKDIR}/eigen-eigen-323c052e1731"
>> >> +S = "${WORKDIR}/eigen-${PV}"
>> >>
>> >>  inherit cmake
>> >>
>> >> --
>> >> 2.26.2
>> >>
>> >>
>
> 
