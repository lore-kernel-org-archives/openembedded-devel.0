Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id D1BBA755A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 14:44:53 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s190-v6so1087541qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:message-id:in-reply-to:references:subject:mime-version; 
	bh=0MOyZ6n3WCbt8KYKui4yla9FApaHDFHAHQlABDVpwm0=;
	b=NfShN9r8Jp61F+esmx+pYm9JFv7JYHN4e68gp4XoNOnmWuziQgjdwVjvYkas5/qz2w
	qZENZKTcViNKg0EcHNeGdFPXca79/8S2X9BPJQYGFh5zm9+tklEUzDDqhzD/cC0uA0w+
	CskCCjzBZ9M3wNvYTbMvrDhlhsBoHovpMee8PuttpdJEQhpC35OIVpEH8GixHYTXgM98
	Y3r6UHXD/tegDjjEN7Btl1jfQj/ghh9P5x4Ml0csh0fmGiMNfY/NmPhT8naY07dLB65q
	vdR2/nuIuUy4FCBhtntm+x+brfBvknlDjTpZuoGkJubroXiQMQ++ylbAfcJfg3a9gf6p
	nQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
	:subject:mime-version;
	bh=0MOyZ6n3WCbt8KYKui4yla9FApaHDFHAHQlABDVpwm0=;
	b=AUsLqYqW0t6incNDb7hGj+PnvlIJWtNxBtZZkgrFmQSmzjk3Gt6LEi2D3wA5jTaBY/
	hcvH+QdJuioYm64plSv4iFaXhIeOEDlTPDXcmzSqGlFdYQvalvbT+yw2vtzPZhD8EClt
	qHa1afijN+stY6NZ7E2BWRuF9q2kKobnX45UWv0OMGgui1Q8qvFQffLKlcgFZ0CB0WZ7
	WhsagGMnfsohuw7UsmE3aQIzmwSYu+DYR2beQI7J+EEp/xHqdloCXyfKhTSMM6VS2hbK
	AZ3/RahK3LwMGWjivaEQOmimKvV+acmlQ/uqvOPAqmj6Stur85+3O/DUQ5i+xsIMHZ0C
	gs+A==
X-Gm-Message-State: APt69E1BNRks95XH5Ok2kAtW6tUmyluugyhFoeRBA8Xr/VQheeZ9M5xA
	2+xS00wB86QPu75D5T5vql4XA5Xm
X-Google-Smtp-Source: ADUXVKIz1RGDJXJv47fjTWfJYc/fZ2Yvmy/9e4GXAEEekHR8W+rJJqGxxVMLEj5R2dIYirHz6ixRbA==
X-Received: by 2002:a37:6403:: with SMTP id
	y3-v6mr17577818qkb.279.1529505894477; 
	Wed, 20 Jun 2018 07:44:54 -0700 (PDT)
Received: from [10.0.2.110]
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm2007630qts.42.2018.06.20.07.44.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 07:44:53 -0700 (PDT)
Date: Wed, 20 Jun 2018 10:43:25 -0400
From: =?utf-8?Q?Maxime_Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
	<openembedded-devel@lists.openembedded.org>, Philip Balister
	<philip@balister.org>
Message-ID: <07ebb4fa-fef5-4427-a460-54785b1c5902@Spark>
In-Reply-To: <64e3d700-0d95-353d-040c-c246e14c378b@balister.org>
References: <CAE=T-s66aNwCjWwWfMkZNrw+sUAak3Hg=T2SCjSeNkX8vu_w7g@mail.gmail.com>
	<64e3d700-0d95-353d-040c-c246e14c378b@balister.org>
X-Readdle-Message-ID: 07ebb4fa-fef5-4427-a460-54785b1c5902@Spark
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: meta-python/python-scipy
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
X-List-Received-Date: Wed, 20 Jun 2018 14:44:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Without the crosscompiling and building for x86-64 I was able to reach fa=
r into the compilation of scipy.

I have issues with how libgfortran deploys it=E2=80=99s file so that scip=
y can see them. I found an OpenBlas recipe that I use to configure/build =
scipy with the site.cfg file.

I skipped atlas for now.

Max
On Jun 20, 2018, 07:38 -0400, Philip Balister <philip=40balister.org>, wr=
ote:
> On 06/19/2018 03:24 PM, Maxime Roussin-B=C3=A9langer wrote:
> > Has anyone been able to have some sort of a breakthrough to build
> > python-scipy=3F
> >
> > I'm trying to build python-scipy on a x86-64generic MACHINE and I rea=
ched
> > math-atlas fun...
> >
> > I couldn't find any math-atlas recipe... at this point I think it mig=
ht be
> > a lot easier to build an ISO with a preseed configuration that instal=
ls
> > python-scipy for our purpose.
> >
> > Has anyone worked on it and would share they work on the contrib repo=
=3F
>
> I just spent some time working on getting it to build natively on a Pi3=

> successfully (failed about 85 for 3500 tests). Next step is see if I ca=
n
> use the same trick numpy does to get a configuration in place so it
> cross compiles.
>
> The configure phase of the compile is completely broken for cross
> compilation since it is collecting information about python from the
> sysroot, which is not going to match python on the target.
>
> I skipped atlas and built lapack. Atlas has similar issues with cross
> compilation.
>
> I'm coming back to this, but not for several weeks.
>
> Philip
>
>
>
> >
> > Thanks.
> > Max.
> >

