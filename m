Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6855F71995
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:40:34 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 23so7456811vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 09:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=536Ng3HGTvdgeoW2idk+tXqieHPIfowecLkwp8QA7hw=;
	b=ZfQbiRdn8/j7IqkaGQoxwBzoM7OacPpThKlGVwP/HO4rboplGWdBM5dURsk46mpcR3
	vPuF9fPKy1cxN2G1StwlACx+gGUMHZF8nfzCqYStdO3fIoM86JSZpJgfsNAKUev1NTO+
	NGTAgmLseOhn62S8DLA/ckQYyWwjOk00a6OoewjKALCJHAZowEoYsdg5hvNH6fD3bXb5
	gUYfYOMCtoJZzAZWn6Q7WFHIrbQB6IBmqgDZcHOeVJpS7EjuzA2RuFmbpqAQghQZbh0l
	+PbGnhGh94+vpcunGiextfdr5znz0beI5Nn+BGRwiUwMwkZTxodY2/MHX9Jg5CTGSY4N
	th5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=536Ng3HGTvdgeoW2idk+tXqieHPIfowecLkwp8QA7hw=;
	b=GU1zAlpZDFkobXkVS4+1XPf/30mNLomvvVkIB9/1f5usovYgaRsAMDng0/TLjieKbq
	03ltqMGwFmxOLLImRIUrrojVHFUK9Y2LcV1WguIJAnTXIkLkzWNGND3lBEfvVlneXFbp
	WeKaSQHjha7GJkMfWcTGmvVM/8WA8YDgt4cOFusg8XJEwjDrRUQYQ9M/5/iTLEMLInM5
	+4HaIOQkCvFN2J/9gIQptM8ZEjIegnsYFFtSHgf5TS6uStZQBtNuwYHns2uXS/PgOgCe
	n6RzBMAFx/xw669kuIekn3re0QieggBos3gcNtEKQNo+xWJYlQRMjw4o+RQ5ejlISmtl
	sz1w==
X-Gm-Message-State: AMke39mRp9IUlem5undEhICSsvR0yMv6CSSLXZ05ya79Gz69dRbExkewlsMIWCTi5c8FhGHmggAHF7zUjep8UQ==
X-Received: by 10.31.41.73 with SMTP id p70mr4953173vkp.68.1486402835230; Mon,
	06 Feb 2017 09:40:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 6 Feb 2017 09:40:34 -0800 (PST)
In-Reply-To: <CALbNGRRVcvt1JdHiaL4AswX1UUSTCjHgUPJXbXtUmQdRRQmUag@mail.gmail.com>
References: <1485374763-7114-1-git-send-email-schnitzeltony@googlemail.com>
	<1485374763-7114-2-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRRVcvt1JdHiaL4AswX1UUSTCjHgUPJXbXtUmQdRRQmUag@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 6 Feb 2017 18:40:34 +0100
Message-ID: <CALbNGRTbQ5xN+Y+NvyVZRd_MTN4ofosx=Of3i+=sLwj=qm=UnQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: Re: [PATCH 2/2] fluidsynth: add ARM NEON support for sample interpolation
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
X-List-Received-Date: Mon, 06 Feb 2017 17:40:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 10:41 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Jan 25, 2017 at 9:06 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  ...e_dsp_interpolate_4th_order-make-use-of-A.patch | 158 ++++++++++++++=
+++++++
>>  .../fluidsynth/fluidsynth_1.1.6.bb                 |   5 +-
>>  2 files changed, 162 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/=
0001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch
>
> Sorry but I get the feeling that this patch does not accelerate
> interpolation. I need to write some performance test to check (don't
> trust optimizations without performance numbers) So for please ignore
> this patch.
>
Just saw that this is still in master-next: Please take care that it
won't be applied in master accidentally. I could create a test case
meanwhile: This patch is crap and slows things down instead of
accelerating.

Andreas

