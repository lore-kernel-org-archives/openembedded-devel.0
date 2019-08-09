Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id EE6D07F2E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:13:34 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id q20so129890507otl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7dwuz7B1nxqii4PbEiFX11MNn7GOTLSJfgFjQizDjaQ=;
	b=UGL9BE3J7cTxQIw+Q8g8AukPSKjN2fiD0fOw2c0G3qX38rh7IFKx7ZlCorwz3VBjTT
	t7N6cskj2Fw+VSFtXdEwajMv3u9gm5KjUvKY/0DkTBaVtjqHnClPHcO8emE+FrdscNq1
	xwpsc1dBiU1Ly4XB/j8Df/Itfa97HGT0+Iao9WPlr/qH8DhUpE8lpsFFvxX6qZUSIoKo
	ELJOod75q4NmRb1aCPwrp4iZdupAEV6Nnmrnpa1f+8P0PF6S+s1hj4kTJnd3KxpxNtv6
	c+fAWhRuEtLskAU5WNlbrKYyuaMxTWaCurq3KjkYrz4hOdqZOYShvmjddn7uSgn/r8ad
	YQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7dwuz7B1nxqii4PbEiFX11MNn7GOTLSJfgFjQizDjaQ=;
	b=LhZ5ZwA+28quSYeIXH59awbNwTzc2iVsCpIfdArmMSuYTAr9SZNzIlp7m6UEuha8fU
	hVWqJ6TPIzOUC9HLvItwfPbdJgVkV8ETJt7hAefkpV0sKi3KClA6pL6hWTs95hb0o4dm
	quEvX8kVD9/11PY+jJA4ydSHdbJK80I/ahgnXWxM69JrNHUmcDYSCyFl7IojoiJHQgnV
	Nb1zF15joSyoQfUWCGTNjanA+xWqVyGptNce/QF5DD6ofyNROVAE/gHjnL7tN8EtRqJ1
	jIMQo5JBHE6Mj9AAsmgwiK6rjAlX2cSuX2o9232Fvy5bbeEbalfH+RulOBfY6e0ElLAb
	EH3g==
X-Gm-Message-State: APjAAAV4Rm3Z7sUKuNW+bmjjIqMgfpeNZufEN5XLJhlWJUXCSR5JWR4U
	N932pb/fAJMWzHervfXgIYIbfYKJrvNxzQjylYj80GUSBTjbYA==
X-Google-Smtp-Source: APXvYqxrstOmqo4H+f5E5zHz8HowZxqgyHW2acSZ9cSfNn/1/uUqEUQbWzuUdb7wK85Jh2e8beLj81XA81eVN8zsIec=
X-Received: by 2002:a02:cc8f:: with SMTP id s15mr21042971jap.94.1565342015835; 
	Fri, 09 Aug 2019 02:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <1565340356-11073-1-git-send-email-vincent.prince.fr@gmail.com>
	<20190809090349.GA6295@localhost>
In-Reply-To: <20190809090349.GA6295@localhost>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 9 Aug 2019 11:13:24 +0200
Message-ID: <CAB2nKc8grxuzC9u=CTVDb0wi2NzJGrDP+rQy6ZUndX6UMar69Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] mongodb: add mongo shell as a PACKAGECONF option
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
X-List-Received-Date: Fri, 09 Aug 2019 09:13:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

"core" target includes "mongod mongos" as before plus "mongo" (shell) so it
is intended.

Regards,
Vincent

Le ven. 9 ao=C3=BBt 2019 =C3=A0 11:03, Adrian Bunk <bunk@stusta.de> a =C3=
=A9crit :

> On Fri, Aug 09, 2019 at 10:45:56AM +0200, Vincent Prince wrote:
> >...
> > -                 mongod mongos"
> > +                 core"
> >...
>
> Was this change unintended?
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

