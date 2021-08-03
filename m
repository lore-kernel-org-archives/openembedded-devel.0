Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web09.130.1627960595393909809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 20:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XBK9kpCx;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id r18so22779568iot.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 20:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=734TsBB2Ont57/Ja5CRPreBnpQyDNfVrLgTv4jKytmg=;
        b=XBK9kpCxLG2FdWsvVN4tfXyb1ACcWDtyb0YALkFZZcc7jKqdggXQ//wFTPmP+rOK5r
         YStYlNetfQI2PQzSZTTfgZCObgjNiZ2GycHFeJL6qwRcSB1tomKDfIjAu9QzPhNK/Fyz
         E20RuqKkYtX1kIJEatpGiwZCt02f/ivDo1zDqiPSgDG62aNW4uoTTcpZmjSRPLDNi4By
         9wio6+JExd3649E+PalMVjAXAE6U4rXYxGRcHDYo9CktmAQg9jRuQT52bKLU5dF+v4cq
         LS67TvECaJ5zhuOngA+fEzAbMOPUF5ev2yo8pAa3HH9evBzvvFAegz3Q4UY2JgIICm+p
         u5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=734TsBB2Ont57/Ja5CRPreBnpQyDNfVrLgTv4jKytmg=;
        b=aELzC+VSCaR3fYT4gZcawwKNpgO1vhy2V2fs/A3ZselR5kIurSi+yaS1gimjQdaoIV
         QJX9I0qzdusm3xiUtxV7xzU/dcGKZIiH7HKSgPLfWrkHLIdY9OdfRsavcbQ9qiuX5lwP
         lzd8manhsRsT/yWFGnJDjVFV+Hp2/97g5+ffL5YD6CQI23rSkIJ6NdiGoffkNKHAV9WT
         FmpxBc3Zb7EgHHMvCK7Vxavxa2tTHg9hBrhaR/X3lYpZEyV/9A43hZ1l8M/VRZab3Ere
         MLsWrjmjeNcO5nBCGWkzPhFLLi480cdAFpgU4eQX7f2WB0HqmH9ge8kgK1gT4PMtm/Bd
         u1AQ==
X-Gm-Message-State: AOAM531Aa77fOT74N6STHQji7XgNFhxh35LNQgVvQVANoYE3y57SM52I
	xIY1x52o/HiqFunnnhlWDhxccXw+8QR7zRLkrUVEMwAuEBCX1A==
X-Google-Smtp-Source: ABdhPJy2tWjU7fweJFS4tHW5Y4Foudf+gAeaC8QJIBWTzxFay8NbwkLWsn81H8cWUbY65+umwYaK8HJtej1sooljcKU=
X-Received: by 2002:ac8:73c9:: with SMTP id v9mr16561657qtp.214.1627954601160;
 Mon, 02 Aug 2021 18:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
 <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com> <CAFZh4h8r3XOuNWA-3h9yraUZ+U7PLnPd7hxDLcyEQGiVM6EqrA@mail.gmail.com>
 <CAMKF1sosZLX7Ha7N23c+x=coBbzaavajL=+vmiXFXmZ86oDZTQ@mail.gmail.com> <CAFZh4h-oyyAdWC-vceBEJuUgZMEL7h7f5CRRO3f6yx6iY-zs7Q@mail.gmail.com>
In-Reply-To: <CAFZh4h-oyyAdWC-vceBEJuUgZMEL7h7f5CRRO3f6yx6iY-zs7Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Aug 2021 18:36:15 -0700
Message-ID: <CAMKF1so85_HpSoqt=ZBvgf_jYoJJnnBtVXUjPZfsJdupHa6_zA@mail.gmail.com>
Subject: Re: [oe] Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: Brian Hutchinson <b.hutchman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 2, 2021 at 4:14 PM Brian Hutchinson <b.hutchman@gmail.com> wrot=
e:
>
>
>
> On Mon, Aug 2, 2021 at 7:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> I meant build an image like you do and then add cryptsetup and do a buil=
d again this all after enabling build history then check build history repo=
 and it will have the information on top commit about what changed and whic=
h all packages got added and how much are they adding to size
>
>
> Use both:
>
> INHERIT +=3D "buildhistory"
>
> BUILDHISTORY_COMMIT =3D "1"

yes see for e.g.
https://github.com/YoeDistro/yoe-distro/blob/master/sources/meta-yoe/conf/d=
istro/yoe.inc#L49
https://github.com/YoeDistro/yoe-distro/blob/master/sources/meta-yoe/conf/d=
istro/yoe.inc#L93


>
> ???
>
> I've never used it before.
>
> Do I have to smoke /tmp and rebuild everything?

No, but perhaps better to do so. You can still reuse sstate

>
> Regards,
>
> Brian
