Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 567626A596
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2013 20:29:58 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id uy17so14067303igb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2013 12:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=SwIC/CUiFcPQg0b89ydZ48rirPP2DDLzx7f4cUK8q4U=;
	b=InytnWS2W5mz6PiKJ0PhOn+tBma3bx05DW5mFRdVOT1kGNyX4SO/+gn/o/e2eTyTdO
	th6FKkofCLq8lKBV5Hi8xJRvEmDCKAkZm4v3eJC7HanSy3tyVCcaEoAeHBuNe9lM6w5P
	YiHXMmqum7yY/y6ZZg3nY70tONMDKmKt0oaX+4bif0FKXNFn0QjjGqa7aB+VdCVmo3dC
	4HPIG7NmYqNDMc3Ho2cAlHVhO4dVgEFKJF1iIv5DEv+X5SnUN6lDalTmlRp3/s6tbqlq
	XZSgD01cRuyRnbUh7SvrDw8Y5v2e1kqzm5dCyf5k/ALzXbM8twkfifXh/1wuCylTWV5Z
	a+zQ==
X-Received: by 10.50.49.11 with SMTP id q11mr22999789ign.1.1387830599368; Mon,
	23 Dec 2013 12:29:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Mon, 23 Dec 2013 12:29:29 -0800 (PST)
In-Reply-To: <CAJTo0LbvjK-4j5dDzZuMk=osskjktH8doWfOERpo6BsRsC8m+g@mail.gmail.com>
References: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbvjK-4j5dDzZuMk=osskjktH8doWfOERpo6BsRsC8m+g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Dec 2013 12:29:29 -0800
Message-ID: <CAMKF1sroEz4wbfPn=mvxaOM8Qoc15sqUn5+oyBFbxv6_2tDUgg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-systemd] connman: follow oe-core to 1.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Dec 2013 20:29:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 3:14 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 13 December 2013 10:45, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com> wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../connman/{connman_1.19.bbappend =3D> connman_1.20.bbappend}         =
     | 0
>
> For trivial appends like this you might want to start using bitbake's
> support for wildcards in bbappends.
>
> http://cgit.openembedded.org/bitbake/commit/?id=3D31bc9af9cd56e7b31892486=
9970e850993fafc5f
>

Its a good feature but for beginning
I would keep it this manual seeing amount of layers we use in
angstrom, I like explicit errors there are so many bbappends
in play, it can easily bite us back.

> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

