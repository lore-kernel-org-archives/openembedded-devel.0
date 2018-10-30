Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF9679C72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:55:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q18-v6so7036187iod.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AQHG3C68k/OAg/Flt119zGefJYBvzIXeqz0T2TroQAs=;
	b=PWgwc+KJd1zs694YnnpWBj/jgKLSO8/MNDceNrqTLtC7ZuTeupGgBFSzIBjoYQQFL8
	O83inWyBjr9N+mn14mxQMQ6cnvonWB2W87StvVSz3YP8+YKOs1EXIaXk03zKLQROr4s6
	d/Hwrx0vyyuFLDEB3wJFUl3evgjAVlJM35gPZQgPkFFjn7T93Bn5o4Lo1KKGvxKvICwR
	WdJknuNoK1mum76XyiZQC6Pi26u/KrBn3Kr8lP9KrCfWBm60tYghez6Ab+xE3PRImuaA
	lH+lugJuyLgiPqJzs8N+A1dc2Xu8evRYcRkCsxhIGBKizLjdtmIvwJBsiZXgZC5r9H5+
	EvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AQHG3C68k/OAg/Flt119zGefJYBvzIXeqz0T2TroQAs=;
	b=Qa2+8lFqzAxCaxzxDxI7Et+76mfgfXrZUTpCZGA7BoFZBY1J1RnEeBYr9iD6fVYMw1
	YChKu8vPOQ5J6iCZ40dNMzPKzI13CqS/s1euIq36UWP6qvAj/nxW7WBdxdMGILdBU+2r
	e/bK6arBT4Mp0xYaoD5zXOJdHjNX7v2KKb3H7AJD5JZ19y6hbaLyJqAu8oc1ubMicPek
	YoIBP43+aojtcCSjSSACjWg2UyKS+tzyfdO/RsIqkoY11qoMn0WEWoLyobNerHAJ623/
	+hOuwNsbrstDY9M1EeE0Dl6AqhM0dtxd2svkQGQxQHfw6g3nx2kr3Y96q8i1xb5UK8zP
	x+oA==
X-Gm-Message-State: AGRZ1gIkQ/jgp//1uMPE4OkQm6t6gHFgSOHWAs3NSXn+os/SZfw+kAl9
	No4H52wvp8y42Z7FLX7Xjrp17QKkVnFXd5QsL2gaWw==
X-Google-Smtp-Source: AJdET5fM5Dhm5naU+w95yB39nvS116p0MRx/ZRX48LmbfyXXYwWRgTUahWouTJ9H0Vu31ugg0I+l7KsCHBSjWBxCguk=
X-Received: by 2002:a6b:b9d5:: with SMTP id
	j204-v6mr10500459iof.20.1540900502307; 
	Tue, 30 Oct 2018 04:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<dd28c909c895c7e30064a9646f5ccbde1414d3fa.1540830650.git.brendank310@gmail.com>
	<CAMKF1srqe7q2xwAp20o-6KP6MqeFNqz105NL4BfyAbgDeQAHxg@mail.gmail.com>
In-Reply-To: <CAMKF1srqe7q2xwAp20o-6KP6MqeFNqz105NL4BfyAbgDeQAHxg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:54:51 +0000
Message-ID: <CAJTo0LYX=5NUyMa9SP5WqfUFgqYpQDH5PCDQJRR8FsRui3DkhA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: Re: [RFC meta-gnome][PATCH 16/16] gnome-tweak-tool: add recipe for the GNOME Tweak tool
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
X-List-Received-Date: Tue, 30 Oct 2018 11:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Oct 2018 at 03:43, Khem Raj <raj.khem@gmail.com> wrote:
> > +LICENSE =3D "GPLv2"
> This seems should be GPL-3.0 as that=E2=80=99s what
> Being checksummed few lines below

> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSES/GPL-3.0;md5=3D9eef91148a9b14ec7f9df333daebc746"

There's also a CCO license file in there which should be referred to
in LICENSE and checksummed.

Ross

