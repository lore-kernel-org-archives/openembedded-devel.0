Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1RzxBb-0000Tf-2D
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 22:23:47 +0100
Received: by iaby12 with SMTP id y12so10191019iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.140.101 as permitted sender)
	client-ip=10.50.140.101; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.140.101 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.140.101])
	by 10.50.140.101 with SMTP id rf5mr22421083igb.27.1329858927073
	(num_hops = 1); Tue, 21 Feb 2012 13:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zWIiBQXxsseDEDwAv2QMmPAyWYSCxwiKCux7Zk1osJM=;
	b=e2Rpk3vvslrftNmdVZYYL7KLEhc60T3h5PioRzCRJNb8Dq2Ii5AXKcdd/AxJ6S3sA5
	Dapfuf+I0pQ9mL9KZKAJTNzIXGJTqtA+1Mr7waqLamrS1jteaG0w3I8Aqr+GYaVDmpuS
	LJeZOayE6beWN/ihJenNTywhQjYzZcV27w+WM=
MIME-Version: 1.0
Received: by 10.50.140.101 with SMTP id rf5mr18127914igb.27.1329858927013;
	Tue, 21 Feb 2012 13:15:27 -0800 (PST)
Received: by 10.231.183.67 with HTTP; Tue, 21 Feb 2012 13:15:26 -0800 (PST)
In-Reply-To: <CABcZAN=c1Hi9B5WL96XaDQScypRO4ETF9GtKKdPdZ=Gxqmfq5A@mail.gmail.com>
References: <CAOHjBZvHtGh1v0LSUkDA=o9F0cHxD1TZ8CtrOQdzeXy8yZk-Dg@mail.gmail.com>
	<CABcZAN=c1Hi9B5WL96XaDQScypRO4ETF9GtKKdPdZ=Gxqmfq5A@mail.gmail.com>
Date: Tue, 21 Feb 2012 22:15:26 +0100
Message-ID: <CAOHjBZtEx8atBFuAji1ba7Lurda4fqG-HTiSOmn8W_w1Yp76jA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: CONFIG_SITE usage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 21:23:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Il giorno marted=EC 21 febbraio 2012, Chris Larson ha scritto:

> On Tue, Feb 21, 2012 at 3:48 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com <javascript:;>> wrote:
> > I'm in trouble trying to set CONFIG_SITE to allow my build process to
> load
> > cache from a given file. I've understood CONFIG_SITE can be set from .b=
b
> > file, but I'm wondering if it could be set on local.conf or
> distro/machine
> > conf file to be inherited by all packages.
>
> CONFIG_SITE is automatically set for all autotools recipes. Read
> siteinfo.bbclass and autotools.bbclass.


Yes I know this but I'm wondering how I can overwrite the CONFIG_SITE
default setting (made by autotools) for all packages in one single shot. I
mean, I think that exporting CONFIG_SITE =3D "my *.site files" on one of th=
e
.conf files I can say to the system to read those instead of the ones set
as default by autotools.
Isn't it?

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

