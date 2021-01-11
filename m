Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.38169.1610387327356789008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 09:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c52IiGJJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id j18so37255qvu.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 09:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNT+mzSu+8/TmEinXhCXf6CjXgnWTkPjgMTpylsT5k4=;
        b=c52IiGJJJqaLUOOYMEFGJt1mBWgGV3kbQetdP9TN2zB26i9hvR3UL1J65uigsN6bjb
         4STIgHl96hi0vefeIBCGZc3rKLCbK7ixGWmHYwSVz5OXSpasJkiI2TRrJYECuDlb1XBr
         dRxN6Wmp7XyGCbUOrcFuvqHTtPEXT/EKS6qP4E+GwBxo0jsNiWvHhfTS2vfSCFdw4I1L
         nidw+k+N3Jq+f4BOU9MBdogbWOMHX/z30IdEUCL4xE0pQPHCneL+TouRkqxqt895naVO
         SyWbwvH6ydybC8aWh0utKdEEfJuatqzjZ14odtLx1k/v5BiB6MTF9lVe73uLKGwRIHp4
         06jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNT+mzSu+8/TmEinXhCXf6CjXgnWTkPjgMTpylsT5k4=;
        b=rg78wPutsQtklxgTspdq356tp5SxsR/gO40JgXTBJSWP5P1XFeNqyHpro4Ne8qgzJt
         nv3Dr+d2vFlLxYzYwsNCSaLOh7yJXGAYo2lnaqhFl5Rpa8FRF7TLfO4i01jrGeWsb8W2
         Ryr9onfKuP8XShzgQ9q7dQiqyrvLrHm+xloXf0/FPL/j2eDcAfnCbxRjTcy9Szat9FyF
         /rkxHUBEaVlQFaApX+yclvVoiK2JCdL47wo2TjbPKeKbHJ0yhmN+mbWkcfP7JFcnWbmw
         UOSXR4uJxKOy+hcwO5GX2kXwtbtnoe7tStR/oDe3wUVpLNh7b3dOWaS1s0Gc2Sa/l/lU
         baCw==
X-Gm-Message-State: AOAM531we9BzVVnOkNlcAPT0SzbA9mWN6+9Qsnt56eo8lZ6d5x+sLfs0
	Z2SJ8hKNNib3IJ5QTBgZR7iEq59Dweouly0SPGw=
X-Google-Smtp-Source: ABdhPJxLmYkSbnbpotk5t4Yfyr0s0VOTEgIQYjKp85qZyNKtIDXnphIMgOAxHuoMt6cUjcAWpPYGph5iXHtpZ044UjY=
X-Received: by 2002:a05:6214:28f:: with SMTP id l15mr659865qvv.38.1610387326452;
 Mon, 11 Jan 2021 09:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
 <7ef6b205-3759-737c-6c16-677556062757@gmail.com> <DB6PR0102MB26301088AE72EDF1F07AEF5088AB0@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DB6PR0102MB26301088AE72EDF1F07AEF5088AB0@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 Jan 2021 09:48:20 -0800
Message-ID: <CAMKF1sr1UwbLOoVk2U_OsS8SbSF_QofV140ZZ3XHDVYX9_+6kA@mail.gmail.com>
Subject: Re: [oe] [gatesgarth][meta-multimedia][PATCH 1/2] gssdp: Upgrade to 1.2.2 -> 1.2.3
To: Diego Santa Cruz <diego.santacruz@spinetix.com>
Cc: akuster808 <akuster808@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 11, 2021 at 6:52 AM Diego Santa Cruz via
lists.openembedded.org
<diego.santacruz=spinetix.com@lists.openembedded.org> wrote:
>
> > -----Original Message-----
> > From: akuster808 <akuster808@gmail.com>
> > Sent: 11 January 2021 15:47
> > To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>; openembedded-
> > devel@lists.openembedded.org
> > Subject: Re: [oe] [gatesgarth][meta-multimedia][PATCH 1/2] gssdp: Upgrade
> > to 1.2.2 -> 1.2.3
> >
> >
> >
> > On 1/7/21 10:37 AM, Diego Santa Cruz via lists.openembedded.org wrote:
> > > Dependency of gupnp 1.2.3
> >
> > Whats in the update?
> >
>
> From what I understand from https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.2.3/NEWS
>  * Bugfixes
>  * One API addition to support the fix / mitigation for CVE-2020-12695 in gupnp
>

adding a new API should be ok.

> --
> Diego Santa Cruz, PhD
> Technology Architect
> spinetix.com
>
>
> 
>
