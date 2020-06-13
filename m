Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.17233.1592082718459092762
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 14:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oxAGnhIx;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id 9so11927176ilg.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 14:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0h8OTsbqtvfpFxJJmyM9akkTbZzawH4/PcD7OFxDZpg=;
        b=oxAGnhIxxIB7NcqVah7fEH01p2CwaaH1S7hFTtWR2nVgyrhmR8TPWhAS8ZxjAIpfh2
         BpiFumSZwzJjyg4n1w9j0rYVubhlpTTDwjlwKjQsJS1vmGr17x8qvqOVUCa+CA/b3+WK
         hbDohgLPF67i3TB/7p0W0tm8Tr2qbYC9mTiPQ73eao62IXAthTYit3LfXFvixZAhCdyP
         mxmC4f739oWeLsOsesJaRWqVuGUCT/jp+nOEDCYi5i42Xxa7R4x40uankStiN62wCKkV
         YHIvO80tB0bSFBLg8X4FiL2jyHOjMXN2pH3jvG7vryeRlmJkj8fGqrjqKXa/JHTSAEEk
         4UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0h8OTsbqtvfpFxJJmyM9akkTbZzawH4/PcD7OFxDZpg=;
        b=kVl02nFrQ1a78XR68GN3WI6AMVIa8opgdw8PYewPlGTB1jaKgwsgX9foER19J9kKTC
         1j8vh7crA1THKtubDulfWOrUeN0bCyoa0QdvHOuoOceSL+7fDyOopyhFS1fFTywT0SVn
         RRUc0pYmY1QzfzoB/gWqp0ugmnV/WXlA7nDkmOyI+v9jd5OwKHf0kjUiomxM8w3dCrde
         Mvsn5f7Z2z2MmzVmTmP/N39AsYO/rdD67x8ENedbWzNsYyjesDsZxesQ7cc03RQTr1Mj
         ioJuZtlU3t7R35MBzxfl4L42wvqb5+h69zMq7KlZm5irlVCKE2thNz2MVVIP2Y/mnsaJ
         MNMg==
X-Gm-Message-State: AOAM530AtHcnscr4lkIu+eB+IbdB2gQF+qOJnd8Tt8w/m6kl+llRMcfc
	5GxxIRn8t3Etl8ahKkt+cH/8fG379Hc/A0aX78Q=
X-Google-Smtp-Source: ABdhPJwD0RkA7AkLmfzWxwOXgAw3+nZRhdlbxqOq6vknwEag1C7dMv+IQcdo1cHH9KQ/1EDuiHudHtyv9HO8HKEiYL4=
X-Received: by 2002:a92:d691:: with SMTP id p17mr19835320iln.299.1592082717720;
 Sat, 13 Jun 2020 14:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200613183645.22689-1-liu.ming50@gmail.com>
In-Reply-To: <20200613183645.22689-1-liu.ming50@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 13 Jun 2020 23:11:44 +0200
Message-ID: <CALbNGRRd26tfWNK5wcifdoisN8Fid0j0kwRh0WZFU=6ijg3yag@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] packagegroup-boot: drop recipe
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 13, 2020 at 8:34 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> It's duplicated to packagegroup-core-boot in OE, let's drop it.
NAK - it is not a duplicate - packagegroup-core-boot completely
different recipe. And by the way this recipe does not hurt anybody.

Andreas
