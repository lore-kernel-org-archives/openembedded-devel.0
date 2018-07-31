Return-Path: <williamdelacre@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9652578DC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:30:30 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id y9-v6so7301745vky.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=SLYBbd6WXdzAdEv3Hngfu8TF2oBspBhsrR2UxDJeYM8=;
	b=r2kcrxyh+4x9Qa8x8TDELVJ583u6t0HBerJiCx+L6hE132l2yrj05nNqm2MLOYNOrq
	7yoyiQ3xknJ65LPg8ntC0PQZcCI9bwHo7eT3q45c07cc+O0Y/FTQD4BlNMPiUM+rDH9h
	TzLnB1RkWuxjA0ZdFKgEhexHms2vZ8QJzfMVbMTFgTRInGc7S7ucS1SZxrrDlkUHD/r6
	m4yUw9i7tZGWTUfjyFlD4nRkoSUaEy+A3CHPdFNXpiYQZn9x2Jso+XAGlSJeVsz/JL8x
	BcyG4y/UjnzJQnGgQeo1z6ivFFuVZWgyixcdQ532zgFnuX4yTjROA9clzwN/ufiGhYOp
	8VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=SLYBbd6WXdzAdEv3Hngfu8TF2oBspBhsrR2UxDJeYM8=;
	b=cC/2as+IgRxfHYnbXl16+IMVtEKUsil2D/65DiGzPbZNAdaJquiDuHSAx/N0NDo4W4
	eBwszSqXfJGUCPyxkDwKEFbJVVB4gp006uC5R8NCdjTW4TsIXJaGvVB4Dz051U6kQ1sX
	lpzyuK78WdBsQMYpNlIbeRPHSoBY1b1qnKeCBvQHSlL5VmLK3I82lIIBgn8jf4ql8JMk
	/GVXYZXLlmQ+07/NhW5egLtYUD756ZaDTwQviKGhheugxTjaabhdlOLfFH4P7m3ZT0zi
	SbWSfLpzUIQKGcLjLDwSFLM+gQRWXSVrNTKQhnP07H0ZsHGW6wJ0bB5w3Sdxd9+yqFnQ
	d73Q==
X-Gm-Message-State: AOUpUlESduRAlX1wBRNF3gYPfT47lFHhoA+75VZsYxPXXKr2zoPDSB/r
	opvJXkHgV5XW7VckxtmDQPyEeJ7Iv7RSc2CWT5yUXg==
X-Google-Smtp-Source: AAOMgpcjJ2aC3rbZNHAg8l4oGBZof4H8KmYwwfXXiIhLIPkx36OGjA9qklKFnckZKcqBSCk3T0FNM/0FOKQt5wghjpY=
X-Received: by 2002:a1f:186:: with SMTP id 128-v6mr813872vkb.150.1533036631397;
	Tue, 31 Jul 2018 04:30:31 -0700 (PDT)
MIME-Version: 1.0
From: William Delacre <williamdelacre@gmail.com>
Date: Tue, 31 Jul 2018 13:30:20 +0200
Message-ID: <CAOnRZEJNvxFjXZ6bogtGYs7Y=yMVgSevRJ5aLbYLgZpnp=3rkA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-python/python-twisted
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
X-List-Received-Date: Tue, 31 Jul 2018 11:30:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I=E2=80=99m trying to install both python-twisted (required by python-txws)=
 and
python3-twisted (for gnuradio) on my target machine.  The problem is that
as the 2 recipes use the same source code, there is a conflict during the
do_rootfs task of the image because the 2 recipes install binary files in
/usr/bin

I first tried to add this to the python-twisted recipe :

do_install_append(){
      rm -f ${D}${bindir}/pyhtmlizer ${D}${bindir}/tkonch
      .......... }

Which drives me to the following error :

- nothing provides python-twisted-bin needed by
python-twisted-17.9.0-r0.cortexa9hf-neon

I was wondering if i could make a symlink in this case but absolutely not
sure about how to do it...

Any help would be appreciated ! :-)

William

