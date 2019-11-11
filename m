Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A6DB67FA3E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 17:20:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i17so4902106qtq.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uKIHYO6SR1l+Y2pZ2yub8+A1BPl+cYgsGl/UE+bYhN8=;
	b=ZkcPYvFiPKkrRpZ/pyAV6CLyd8PIzdSC5btdqPq++WQselHVX66Ykh2VKfezEXbMX8
	WyvmEruGWspJtI+nJA9cMOVDahUuA9cixuZmE/GvU8kF6DZpOG31LS+Uhgi3aJ1FnM0+
	Qu7XY2bnIOci84Cg+Ft8XdYg32MoNwREQYScFLnqZOEpLqmeTJKEJimWFD6a5n8KaHcg
	sxwX0jv0rOfoNEVZaTtGLIKevrHKmDaDJhWmdY4O5RAwsj1llYziWwKzHbCEPRHChxKv
	eAvoSG4fdEb3a4WVsldrisvwOdawbsQPmh25jEG0b8H+JxPSefxru4kPy4pXReVjsT0p
	+CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uKIHYO6SR1l+Y2pZ2yub8+A1BPl+cYgsGl/UE+bYhN8=;
	b=ZuZQ0YPWTteM9JpzmPAKxWAEYnMdb5twwPNDBXw8D5mNiylPtJWTLA3R4M1U7X69sN
	JZtzD31L9DngE8fOG96tIWg+pOwTz1VFwpIqZUuOXQlyJlya+slHBZV3flBxFi3XTlZh
	E24MtNi7/CyGBxVBE525IVjG7q86aMs/CN3CHeHlGNsJrQZlBybMBQul+qeqrVohlprE
	FugqVccYfzBMz9DMI5v4K4mV4ApG/5lfeCsUb7tvgJDQflTY2cG+TGzNXZegrQolcfiI
	ufjACAVKvpEYS1W2QV2+8deUpS1LGv9AEfsZBLFt7pe18fRSYbaaIg9zgPP+TtWUDB21
	1tJQ==
X-Gm-Message-State: APjAAAW6+SSfXamqXE0lw+z0vzOUZIpaKmSIGdi/nVCEvNkPwA9zZ4G8
	ReJU1ceYQzNjf5JUzOSfV8z2UQ3wFtCpUVGv3DnlH48I
X-Google-Smtp-Source: APXvYqzHz62xFMXgjJdYbOtbxxEeAX3fFDR2HZC6wSTmXYUds1zb97qDbIrIKzNIaZSwz7FaBWZCNE3KBL+KM/bshj4=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr26235638qtj.80.1573492804152; 
	Mon, 11 Nov 2019 09:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20191111160535.547773-1-raj.khem@gmail.com>
	<20191111164026.GI28797@localhost>
In-Reply-To: <20191111164026.GI28797@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Nov 2019 09:19:53 -0800
Message-ID: <CAMKF1sq+zujuwnVE4iywYQ6zCN8sFTggpgsCkcMF8_yNDB_LSQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lowpan-tools: Blacklist as its deprecated use wpan-tools instead
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
X-List-Received-Date: Mon, 11 Nov 2019 17:20:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 8:40 AM Adrian Bunk <bunk@stusta.de> wrote:

> This should also be removed from packagegroup-meta-networking.


That=E2=80=99s right thanks

>
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

