Return-Path: <ian@boundarydevices.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id F0FCA77E76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 21:44:00 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id a16so1854859qtj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rd30OJ9ee3abFKGDwllULwNd3VL7O9ZI9dUIAQcrlFQ=;
	b=PDQE2WklMPMkDTlStUHIOYkQ6VD6wrYjyc09FsBtp6jXivC7g28nBkE3H75/g1WLum
	ECei8aazNquwyLnS5/V4wkI0VZ/L8AFFJUbaPvVfjemiHAnphP6GBwHk65Vki80iUbmx
	Xfqsh6GJ/QE8ysZ+tpDnFeadny+eSSyH6gByfInpEIsxjlZzYYC3ABLsV7q2zBoU/0gK
	JQB8itPpoUGWdrU477BFZs3kK4t6LLtR6vgwONE7xpON1dup2XovpZoOWaJq5ZPqEcyk
	RQ5/3zMvqnaUv+z0hgFEJtX1UwHjKSg0N1hIxzncPZQZjxGXdr4UA2dM0Um/mp2Xz/5D
	H/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rd30OJ9ee3abFKGDwllULwNd3VL7O9ZI9dUIAQcrlFQ=;
	b=Qj3NynYG4U+TMijIyPCUmkl+rhMw4V8OgHFXW7p26BaD1A6mVE2+Glq1G2qiq3yqQ8
	ZNK4yYoUMjcuepNTvb04hrNUw4oukGr2WHYq5Tizcgphxuz055aizBFg3S4wHbU9Y8gm
	yfX0yhbQjJ8cccwR2UL11uBqun/exnWCV16D5wr3f8d4YEBlXjhcNY3xGOBcoCXCxHmz
	lHHFjvrA5tr/yfqhCYV0/P0pYYaVqE2+HSdOhgNMmtj2vPirkN3eBOiVZPmN7IKrQ/OQ
	BHfVpS+H4mi2XOKPvHrfW+tfRvNhMld1ZmQhGNB2SKcRAxmBggZH/Bz3S0umzZ+M5iDK
	5Rdw==
X-Gm-Message-State: AJaThX4QdXVO+LLcklTR0LA6W5Arv0esXd5dI/guDfOdN/5svf6TjtBG
	buPJd9dsIYq6qIfsYe+OqTNMRIwK9sF6WNOkh9l9PA==
X-Google-Smtp-Source: AGs4zMZum3gqS9h0BKYaEuZr/+ND9ZEdqou92k2kHSsaWuMClEr8IEB1YzFCNzGXf4Zj920QBLi860JoYYY6JFHKEUo=
X-Received: by 10.200.45.93 with SMTP id o29mr1204401qta.22.1511905441765;
	Tue, 28 Nov 2017 13:44:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.55.124 with HTTP; Tue, 28 Nov 2017 13:44:01 -0800 (PST)
In-Reply-To: <CAP9ODKqWJAzn4o_=MwJfMNN6+MY4cMP+q068Rs80H9YKJpUA6A@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
	<CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
	<CADseiPmvSsqCQqjbU-VwGMhp=y97d0AFx5R2Yrnmw5zf_kji_g@mail.gmail.com>
	<CA+-BmJaRAePpM1UfwLOTPS0NPuViq5mQGD51BNwZrtES5XgzOA@mail.gmail.com>
	<CAP9ODKqei-6juaQQOZ04mpF5Er8n1Op8s_Q6NfR9J2STY8fqsg@mail.gmail.com>
	<CA+-BmJbzMoPd2bEyzJkrHN=+RvUmJu0F0XVFmPSSCJcKcUPe7A@mail.gmail.com>
	<CAP9ODKqWJAzn4o_=MwJfMNN6+MY4cMP+q068Rs80H9YKJpUA6A@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
Date: Tue, 28 Nov 2017 13:44:01 -0800
Message-ID: <CADseiPmKgfXRPbtQfVw5e1D4SKV-gLu-y9fBpVGOtKYY2GmZcQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Tue, 28 Nov 2017 21:44:01 -0000
Content-Type: text/plain; charset="UTF-8"

The chromium-imx patches don't apply cleanly since chromium52. Also
patching chromium52 properly to compile and use chromium-imx on Rocko also
has it's issues, I've got a build for that currently but SSL handshaking is
broken somehow. I need to debug it more but its a large task.

On Tue, Nov 28, 2017 at 5:05 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Nov 28, 2017 at 10:47 AM, Ayoub Zaki <ayoub.zaki@googlemail.com>
> wrote:
> > Hi Otavio,
> >
> > that's a shame :-( thanks for the information.
> > are they other browsers that are well supported with GPU acceleration on
> > iMX6 ?
> > what about Firefox ?
>
> GPU works, VPU does not. You need to pass some params to ignore
> gpu-blacklist and like.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

