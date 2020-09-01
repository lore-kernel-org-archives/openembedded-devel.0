Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.4330.1598927165900109424
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 19:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QO8XSFkM;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id b14so8206754qkn.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 19:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COaEytyA/D8qKY+FebCClUJPtGKqiWV8rwfr2HsuF9A=;
        b=QO8XSFkMhSV+14FP+mehcUpAtfpEduJjmJi+Whw9xP8Db8G8VnET/nkcHYJTOxF7VR
         MC2YaJwg5QjodwUhxtHbhfosO5h/pZt85OsIiKyIDjAAD3z7qPIOunkogZ6GtWZ+IaFV
         ijJlRxw7Vm0qLMg7aRAVmAuMWb+6v5ALbA4gd6kjG4sFhUVYyehj2o+Th/BVR5ZQo0dp
         fqwCz++xqmATeaAq8fGbc3TCIydTCzZ/ZODr4SUc0ND3Iq9+d3dnARVhyCvkz9BLPIwU
         7/CZTg92yhqRBzHJkzD2kksMZnY8de9j7YI4v1aetmrgTfKVwMHAtyePe2bRnhKp87Vl
         cxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COaEytyA/D8qKY+FebCClUJPtGKqiWV8rwfr2HsuF9A=;
        b=BOfrHPCHSuUYwJsXNmtVHU0yr+9FKMKJSnY3vFLw3DVb4LLi9yBNFCZVr8vH2t+wUw
         6o2q4JREyY+jrfqsanq5lBGvlE2QwLpJhclK947SnL7egmozbC32aapyRgxO72jKcBs1
         jm7kmIEdzJifEpCbuzkuwuNauFhlhQFbL1nOvdUY0j9Gkd1z2qLnfdTIy57XTC9IZMWr
         yOYBlcRJrjEcrSSRsl9KICSLIhcWKa3zH8DRE7OBExWQ8cRTasbYMrxLCy/lSyjgct6I
         YNh4kZXIYy1TXx/l9d6R9gCQ0JLeScCMJ0YGw13RZw7Wwst1sYWpb3mZ2pilJ0fuvR3/
         fMRQ==
X-Gm-Message-State: AOAM533lg18D9c39JWyYZIVlJGlKXE2bIK7OTDUotyc0toKu2fiWqKFc
	EiZJEJvFgiWfBmjyUmnoIExmyeklBelOiyjPMn4=
X-Google-Smtp-Source: ABdhPJxssEbw51bqelHi076x23IYqkWMENYVRvqMjED90yC8LJRd/LUe0uEmNB/RUVeubvZw/LjZCUXkbfzRpBVn8UY=
X-Received: by 2002:a37:c408:: with SMTP id d8mr4293612qki.71.1598927164947;
 Mon, 31 Aug 2020 19:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <DU6o.1598926318374495688.aMm2@lists.openembedded.org>
In-Reply-To: <DU6o.1598926318374495688.aMm2@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 31 Aug 2020 19:25:39 -0700
Message-ID: <CAMKF1sodAsUxSE6TDT61mTgG=PjdeOs9WDzVWE-aEp_3xvTRWg@mail.gmail.com>
Subject: Re: [oe] Iperf3.7 SRCREV and License file MD5 #oe
To: sri.deep07@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Look at this from zeus release

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb?h=zeus

On Mon, Aug 31, 2020 at 7:12 PM <sri.deep07@gmail.com> wrote:
>
> Hi OE users ,
>
> how do I find SRCREV and LIC_FILES_CHKSUM from iper3.7 source? I would need to build it on OE using BB recipe.
>
> I would appreciate to know general procedures to find that out.
>
> https://github.com/esnet/iperf
>
> Thanks,
> Anand.S 
