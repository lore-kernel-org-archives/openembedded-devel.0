Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 008A96C3E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 02:18:26 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a203so28749621qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 18:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x79bwq0fy2DIIBjl9b3AEHCR18nyAQaxIWTOP05wU+g=;
	b=NFP+HwrjCqNKbXFwMVHDUHm1wPteKLZhqieLQIGU5T/Q8IvH8Mm37Ce9m/Vfw5aUs1
	YXSOC9EpNQWSlGid56ZtTOZHya4K5nMbNbPyysKoz1ntQvuYXLW3iLkmEX//73ZGKacW
	YauP2OMeV0z+drq7AZj1EUbo8PcCsLNaT0ujJh9FzkzJHKomYY6gFK05y1dVQ8oeb1pq
	Xaxq0o1CbPLnIWkeSU74nxYskVf08eQPzskvxV8blGMo6mw853K8/1Oz9yYQ3O68dJD2
	dCHqB7TMCmnTMxeg15EhPrrbS8ua0jALlpBmcUEvjQYlSNe2VEZPBGeK22rHB43ceOrR
	RYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x79bwq0fy2DIIBjl9b3AEHCR18nyAQaxIWTOP05wU+g=;
	b=HETKj65yGwrrOvdN1aVRDvg3CgwuKW9QjoePP7c+TYH1WPU0xo1ziT3GNE5MiuZLUH
	RnTZ5eXVUc/Q64vYoJO1tDVxmaaIjIrDBZdfUPUopTyni3SLvhcHSqm4U+7QZf9kpo2k
	nXudxxlMEQUB0Dwk2vwMXYI3jJdAChFvYx4zETLuT3Go2T8cEOVt78b00azGJ/rS+WBF
	zsXlnQf9Ok3Kq/dB/4JUD9kd/4+Iyxe/Z/f/WvctGQHTPfcxqpYAwAh85Mlrkt0P5ufI
	YiPCqvM6iM0q4bXgNK+ZtVSyOxsyYLU9HOWYW3kBxQG/UsNuVJGErOGd26t/TWxL3n+5
	k37g==
X-Gm-Message-State: APjAAAWMRf+mdt6mNPwKX9r+D1YMrYaGnSD0qRGJs2CLBIlAQlhikRy6
	0/GrcKzI9N/eIo0/7jj/AOWServV24jgmb3tWsg=
X-Google-Smtp-Source: APXvYqxDWMiXf1ZjMB0tB71977WgvOm7068mvQu5IqVFxLOXImv8pXpaiTed3r9rw1yvES2qUmXeABe9jZ98UqAR5ZE=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr50681534qkh.9.1579486707546; 
	Sun, 19 Jan 2020 18:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20200120003527.1518697-1-raj.khem@gmail.com>
	<CALbNGRTc_pyQHKveimQX7y2jhzXSb+8N=VoOByWrz=XVWCa2Og@mail.gmail.com>
In-Reply-To: <CALbNGRTc_pyQHKveimQX7y2jhzXSb+8N=VoOByWrz=XVWCa2Og@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Jan 2020 18:18:00 -0800
Message-ID: <CAMKF1sokWNutzq-ngDUWihSZqXNufjh6YGM2_ykHFgZFZCxj5w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] python3-pytoml,python3-jsmin: Add recipes
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
X-List-Received-Date: Mon, 20 Jan 2020 02:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2020 at 5:04 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Jan 20, 2020 at 1:35 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-pytoml_0.1.21.bb  |  2 ++
> >  .../recipes-devtools/python/python3-jsmin_2.2.2.bb    | 11 +++++++++++
> >  2 files changed, 13 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/python/python3-pytoml_0.1.=
21.bb
> >  create mode 100644 meta-python/recipes-devtools/python/python3-jsmin_2=
.2.2.bb
> >
> mozjs says thanks :)
>

mozjs would need more love though, firefox bugzilla shows that py3
migration bug was opened
three years ago and despite being actively worked on has not finished yet.

https://bugzilla.mozilla.org/buglist.cgi?short_desc_type=3Dregexp&short_des=
c=3Dpy(thon)%3F[%20-]%3F3&resolution=3D---&classification=3DClient%20Softwa=
re&classification=3DDeveloper%20Infrastructure&classification=3DComponents&=
classification=3DServer%20Software&classification=3DOther&order=3DBug%20Num=
ber

I guess we might have
to depend on meta-py2 for considerable future, I will see how it goes
for a few weeks if no patches turn up
I will simply add a dependency on meta-py2 and move on.

> Andreas

