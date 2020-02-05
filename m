Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id B749660BB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 19:11:33 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l4so2854304ilj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 11:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kQ8z3BsXZJZaxy5mBIy4lRNkAiSimxdiRLYOuqs1NUY=;
	b=iR39bDMsBNyEZkKR9eVs3YWJy3kP2p+YC0JN+Wu8PSZCEY18mwi90qcN4iKybvtz+Q
	/F2avL0vpaPTbvZxxFtVAYZcDP5grUt8y+pJqKM2WOultECkZcXugvxCmGSgDF61EjIK
	V7PFbg5ozhf84d5CgOPm4Z7mCzuwQMLpuJbCUXumbVmZJRe9yQoG3leCPnlftotqG+nq
	hwfNsDl7eiearnFe8YD6vAK0bqxesylKd1WvLaiLBgxyZ4sxJG79ImHqzYVdyR+/0LWb
	BI81M/pGgNes6I9CfOSh4JwzfrPhbARKignwV9hPClq3GMWC2VQghLtdyrRa2igXNtCH
	XFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kQ8z3BsXZJZaxy5mBIy4lRNkAiSimxdiRLYOuqs1NUY=;
	b=JXjoe/c8iIY5iOP7N4SZBUs1d/0V0pbtmXXtgtlqhmxvExRGDrSBdfV3u29PeLhhUy
	Ra9u5bzm79v49M45WtDYpvtYRccGsz6aqW0xduC5/xllJmNK66fc/Sr4oCxVjehdu/zQ
	qPedpOknqn/zQA+N8ydW9vfgD/WInLGlaHpQFtx7oOynRKA0z+37rZHi0MFw22Ei3Gz7
	SNtY5xByqCzro20BYTLrEIWgMk2PsFOLQZw1mVYc6UKEh4xJb7HTpRUAzoUC3uU9VOYF
	6lNbvjPhEXrKh0jhwxtFT7AzJZOK5w1nV5WOybQbTNX1iBCAoFb52HzrslU3AAG6ydS2
	c1RQ==
X-Gm-Message-State: APjAAAWZPkhaKgNmP5dVixTGYT8JIjYw1onVrqDEjaJKtAEd1J4rhIdd
	2Gwfdta+f4HGsKrYWK5MpDu3H1TQ2xXGjOFQN/HOrg==
X-Google-Smtp-Source: APXvYqxjzEjGcHEzdtKrmyFWTTs+Kob9tyxiFO/n8QBNrZcMkIP2mX4Yf9rZTNycoEMzUv1qayQ6EZSJFaJ+vj6zYjI=
X-Received: by 2002:a92:5a86:: with SMTP id b6mr36653374ilg.108.1580929894713; 
	Wed, 05 Feb 2020 11:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20200205092500.23165-1-schnitzeltony@gmail.com>
	<7ba13841-f2da-b42c-e25a-7cb00c8a53d3@gmail.com>
In-Reply-To: <7ba13841-f2da-b42c-e25a-7cb00c8a53d3@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 5 Feb 2020 20:11:23 +0100
Message-ID: <CALbNGRRSwXK1ObJHHMu2b8zdz1jTgwwFW1-X6GyvauM8LVSTJw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][zeus] libldb: upgrade 1.5.5 -> 1.5.6
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
X-List-Received-Date: Wed, 05 Feb 2020 19:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2020 at 4:57 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/5/20 1:25 AM, Andreas M=C3=BCller wrote:
> > From: Yi Zhao <yi.zhao@windriver.com>
> >
> > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > (cherry picked from commit 2b3fd534874aee125a6c79c70c93b1aa498fda3f)
> >
> > This is necessary for zeus to fix samba build as reported in [1]
> >
> > [1] http://lists.openembedded.org/pipermail/openembedded-devel/2020-Jan=
uary/204168.html
>
> I already have this
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable=
/zeus-nut&id=3Df64c2d691ea597aa6221e3d7706a4d022e07bfea
>
> thanks for sending the patch.
>
> - armin
Perfect - thanks - did not find that one.

Andreas

