Return-Path: <williamdelacre@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 660B3746E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 12:28:10 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id t4-v6so198778vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1V6O1UIMt0SvzHSJ+gmC+/TKbjV8c61o3GnS4WGRLUI=;
	b=XE5D+5GS/JmAwsnVOY2n7TiS3JzJliBzevRxz2AC9jfycA/zPeVL7RyTSP3PIoHqSO
	XHu80A6HDvn6mx7n9TrfAoq2XjZ5yUzb2SFSb3rbCSNJQvkq+3KgJZ9cijEAHJ3hzVbJ
	kkeLW96K3g1q6+WwxeiUeXF/KdULR+TSsUcLah5u9ohqm8Z3w+h1D7kvRDXOrlbm32sD
	myo3YUqCGS282l4kJK7cDvJcrF9ydhYtTN28/duNzPPYYHOHEWjjhyF1bZ+o7lH//cVp
	3TsfuT93EHTvxCgaoKJO7hPwGLFNy5E+5zVfXfP6eRh8X99eQ+KqoCqw7ltzzaP1UDLt
	oNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1V6O1UIMt0SvzHSJ+gmC+/TKbjV8c61o3GnS4WGRLUI=;
	b=aMe8hxSLNA3QL8LiAf9tWntR9eJ8R3EmbdtyILhhWM/Ht9sQhR+5fkO+YgtxXSOaR9
	fykvMCtMd/rQ5IYtpfc2LUAy0oE8JSXHyjgbsLciZ7Lom+86lIXSy14W9pkWwGgDS1/i
	yH68HXC9zIB6xje7K0Y9vS9ZyMRJAecmTyv0mJzqUjPyYsX+hXc6ttORHsY4ebtaEzX0
	F1uf9O178Pkl25nYI6fpytMjvDWPLln9+77un7ZyI+3qRo0YcUTeVRun6NPoLpwVYRMY
	H84Pc6oSTS5WEOA+kgeF0PCYvS7/xrUT8uTtRZ8+ajMvjHTPduShLnMYEmexnBoq07YP
	6Bpw==
X-Gm-Message-State: AOUpUlF3v/snu4LLa4QeWYnl1cOyVTC5T+PZtwICSLpDyFPskEFPiv49
	grER8LlhkL5fCKRiEy1zpBNR/vegX1itlqF3paNgdw==
X-Google-Smtp-Source: AAOMgpecXUhhu7625PvA7ygXqd/EGYgKryKC/1LDtUgLIeS7kwEU9Ir2miwwqQGJyTJfEoCHjSeEw7fuVwo80UeGhns=
X-Received: by 2002:a1f:81c7:: with SMTP id
	c190-v6mr7417916vkd.96.1532348891122; 
	Mon, 23 Jul 2018 05:28:11 -0700 (PDT)
MIME-Version: 1.0
From: William Delacre <williamdelacre@gmail.com>
Date: Mon, 23 Jul 2018 14:28:00 +0200
Message-ID: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: (No subject)
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
X-List-Received-Date: Mon, 23 Jul 2018 12:28:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ! :-)

I=E2=80=99m facing issues when trying to run =E2=80=98bitbake python-twiste=
d=E2=80=99 (do_compile
error)

Log says :
=E2=80=9CDownload error on https://pypi.python.org/simple/incremental/: [Er=
rno -3]
Temporary failure in name resolution

............

distutils.errors.DistutilsError : Could not find suitable distribution for
Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=80=9D

First of all I=E2=80=99m not connected to internet, so I=E2=80=99ve pre-dow=
nloaded all the
required packages (twisted-17.9.0.tar.bz2 & incremental-17.5.0.tar.gz are
present in my build/downloads folder)

It=E2=80=99s the first time I have some =E2=80=9Cdownloading issues=E2=80=
=9D and I=E2=80=99m stuck on it
for a few hours now..

Any tips for me ?

Thanks in advance !

