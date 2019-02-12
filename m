Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id B2AD86B06A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 13:59:33 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id w4so3027401qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kH9ITvjsEEkKDJIaCyTxfB/Vfq12pmSMDQ7EE+olTfM=;
	b=NHv6goo1j7RVkQSB9+I9rr/qtg+lq2v6I2V1ickcZ4HTAmbH+w0iG8wO28TftCUAk0
	BPH74wpd3bP9IkxYcYkp1wxZTO70apLH5z+tf8OWAjw+YvEuNPI5PoV0/riYZHV5MiFx
	92Q8SzVea/Op74bp1eaMoo/ZSVaQ5W6rAzIG/+1X7+nnUH5xnytgy65oU/jd0bvfTeXD
	0XWPjJYpmefOxfVTNLNMyHBl9dNd+FWaiZxVNxqgA0RZGVsZl2kJuoRaXrlTxdcqzR/g
	+Cf//IUz8CLC3gh+YpnHdZvihN3CMjxwQiUvh6MjUjjc1D3mbcgF1WwO7kjY8jsoqOgp
	MbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kH9ITvjsEEkKDJIaCyTxfB/Vfq12pmSMDQ7EE+olTfM=;
	b=jnuZZh2/xR6Zf7R6VzYlhcHMo8OhJucJ6w25D3LQO+w/UQ0JbRm+nu9fMP1pnDIPyf
	860Gr8zE/MKLWwsgBIgtSnDxsqrkF5n1Pg/2sHwOACCJgsDNgkE+PjIkQS7PDD8Y6qUb
	Fa6pJFcN4V46c3G9x7i250g2/g1Cc7bakajAtNhCEEFQ1OYijskL6oau+7KP5Y35I70c
	qJDuWasZpUyKqV0SH7drCnQC51JrfToyMPxYu9UYgf7bXPI2OmyXN8kuJwDLxJINTQVI
	lZ7ouGgRTKyHZ4SoPifaTLKrMr6rbMV1fjWKcbRjVoGjRUSxzxJW9CdUayEFhHZK4htZ
	I/jA==
X-Gm-Message-State: AHQUAuZAWVbIVIngFcFzkMV35tBsYfsZNgdMGvfA0szS6ms9+866KBxV
	MEaRFi+09vWhvd9NJCNi7GnM6hpojrTom1JJULk=
X-Google-Smtp-Source: AHgI3Ia1ru1RtIqXjwnxtM+kI+i85jnmp0BFTnj6awfTOpMC5QTn4kD9HIdoFSQBAqdtyYKugtMbXpuuQVIBgaY+Byc=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr2653834qvd.224.1549979974229; 
	Tue, 12 Feb 2019 05:59:34 -0800 (PST)
MIME-Version: 1.0
References: <2d621cbdb1134320a6218f37871269c0@XBOX01.axis.com>
In-Reply-To: <2d621cbdb1134320a6218f37871269c0@XBOX01.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2019 05:59:07 -0800
Message-ID: <CAMKF1soGJVjBYCba3UGUyCtSrtcTj76XkbWRsXfmfZdpjH_5zg@mail.gmail.com>
To: Santhosh Nadig <santhosh.nadig@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Santhosh Nadig <santhosn@axis.com>
Subject: Re: libgfortran license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2019 13:59:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 11, 2019 at 11:58 PM Santhosh Nadig <santhosh.nadig@axis.com> wrote:
>
> Hello!
>
> It appears that libgfortran.inc does not have the license set to"GPL-3.0-with-GCC-exception", whereas libgcc.inc has it
> (http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/libgcc.inc#n24).
>
> Is there any particular reason?
> Can an exception be added to libgfortran too?

yes. Send a patch

>
> Thank you.
>
> Kind regards,
> Santhosh
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

