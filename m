Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.72792.1629394094785040831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 10:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLU0A2cl;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id k24so6542993pgh.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zipEX9o2aZskpsGCTS4hmIgTnTx4xS5JgVCAFjAsGjQ=;
        b=hLU0A2cl/CreF+AgMNkL9ExYHyhwDS6808MARnO+PYBjIOBVL+g9zx3zG8BZOznt2J
         MIq4xqGBNzGHK+MV5Ls59QwBv3OB3Tb3jC77klN4rwKI69drQcZKoCbNC/c6kNWW/rCy
         FDqm+o5GpYwPn0GsKd7HV3CZ6az+0GUsPTpVrFUt6ISvbAZ+KgtUBG2raETHKMkEt15x
         7th6JOr0i1WkVxnlpiGmUCVhFjx1XZbU6LfNt1EC9OOC3TKE9s3jxKLsS+/KNRL8seLu
         2njksV+dGxo8T4hvm2W6TwlVU74+qJz1vVS7zsgblFbQulezbgp259JkojpArZVzrbYg
         qs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zipEX9o2aZskpsGCTS4hmIgTnTx4xS5JgVCAFjAsGjQ=;
        b=m/Ew4B5x422bvuIL1Q4IrVN5jDlcgvibcvj/w5lUct3EFcqy9+vkDSS0JTTuzJNjQH
         6ueRWT2xUDaOYzUySXk2Hjs7CxcZtM6okvQS8cnNkTBLKiNx4pKnnI9DedpeQiGLBU9c
         VKRsQtwVeeh92kpR67tKF2UbWRDvImNeNSleEHDIZqzbgCplB5/RFJWiHvye0q5zsjSs
         otDT47kd5yZqBBEt1pQOzyoNh5iPUnyJ3ouMMnElXEIPvCJjgBipygWazaW3QDzN5e/q
         jbewggNUMt8rsz1xHRAoIFLLCPy4ynLezNLKw+eCdo2kMDLaXMoo7cJq+3EstSkMlkvO
         oCNQ==
X-Gm-Message-State: AOAM532jQNcCLypumKoCEHgJIr9x8jIdI5CaqQaXZcXn9YY6Vp4JJ7qC
	wZJHmX6GuxkRr7Bc0LZ5YUNeSRc9zw9+PGXlwJA=
X-Google-Smtp-Source: ABdhPJxdaiS2GuMLQMwHc3VbJx6rtjhIsf6eIDPvru9UsQqglX7Jv+sD1/KYGLnxvVi3nDxkJyG+rXbMdM2Cmn/xKKk=
X-Received: by 2002:a63:20f:: with SMTP id 15mr14547382pgc.319.1629394094347;
 Thu, 19 Aug 2021 10:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210819110248.3505349-1-schnitzeltony@gmail.com> <CAMKF1srH-YoTsww_ZjNgY11U6CwG+cycvAMWmU8EZvbNAs+E4g@mail.gmail.com>
In-Reply-To: <CAMKF1srH-YoTsww_ZjNgY11U6CwG+cycvAMWmU8EZvbNAs+E4g@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 19 Aug 2021 19:28:03 +0200
Message-ID: <CALbNGRQXVLjRLO6NRtEoeEAvm4hV0GZaNF_8V_4iCwTz73MixA@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/5] fltk/CMake: Do not export executable 'fluid'
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 4:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, Aug 19, 2021 at 4:02 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>>
>> It does not work for us: The executable 'fluid' is not installed in
>> receipe-sysroot. So fltk cmake config contains an invalid reference.
>> Consumers of fltk using cmake will fail during configure for this invali=
d
>> reference with something like:
>>
>> | CMake Error at <...>/recipe-sysroot/usr/share/fltk/FLTK-Targets.cmake:=
129 (message):
>> |   The imported target "fluid" references the file
>> |
>> |      "<...>/recipe-sysroot/usr/bin/fluid"
>> |
>> |   but this file does not exist.
>
>
> Do we get it from native sysroot then ? Or is it not required at all for =
cross compiles
Hi Khem,

Native fluid is supplied by flk-native (and I have recipes in
meta-musicians using it). This patch just fixes invalid cmake config
and leaves flk-native untouched. In my opinion this export does not
make sense anyway because fluid does not export re-usable libraries
and just calling 'fluid' will work because it is installed in standard
bindir folder.

Hope that helps.

Andreas
