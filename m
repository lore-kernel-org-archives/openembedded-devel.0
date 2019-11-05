Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB1867F9B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 23:41:52 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id f201so14323455ilh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 15:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pzMyiILXXnuBETGvKofF4GMBQZyqIV9awS5gLAjpHP4=;
	b=ppG9WGDfLYKsS+c+XPDNY4C/Ht1Ty+tUH2r9pXKizgmJ9n+xKU9bmYirTfZebju3Tg
	cDgWE1fp6R15a2ktpIlK+Mt20JqA9DfMfOk58KVYKsXOHsAsoxRBaKsgNd3BGmJl0zYJ
	8zJO8WFVGba80RPfHWDxm66pA4GkDjVPxUPSzZdc0Ck22wcwtGxYU0lWpC4vQAFz6ZWE
	7wkomeQ0W9vDDs21L4QHSTy+QAyN9UtrakQQ9Y87OwMnR8t7roioTVhMqE0XHt58RmAE
	3wnHTqiEq2qiskOIQPrfOzTjl+Qen05u2X8Nlp9nlJRnmd+zQi/AGKng7CkORAlf1JLV
	kqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pzMyiILXXnuBETGvKofF4GMBQZyqIV9awS5gLAjpHP4=;
	b=eLOBZ+UZDi1JTmYSfLvdn3aawGPvexh2PQ2I6MmNmJCFSXLbzZ2OzPBYFa5aU4n48H
	Fh42F/HYfiwI10gWJAvzphK1EG6TywVtQgSVZqJNY0F8qefka8no/zrsXjJrLGxM+a6u
	v14eG6TZmcvObvBcoDAuQql1/MDkGDuxIB9HUbAlZthgj2NLVU6zm6BvHMnkZU/m2lun
	MF+EI0ld9KhqyGLD83mi/lVP4OpozOSlMz0T8e1jRb2Rx6I7VcLSn2BRtoEOpgYwkGYX
	3zQofZYCs7ymY+0PFfPWCKG403TGLxK3WF/YbFxrgGqY3lCOW/yGatMisN5E+6W6OdPy
	TjkA==
X-Gm-Message-State: APjAAAXrMsR0dmXvxtBMnom9/KniwetjUk7zNvoLhR+zhY5RH7XWlI+I
	ZKDhQfDApCrDdqVaW941xvRu6DxGKarxF+qX/Qs=
X-Google-Smtp-Source: APXvYqwg+2cuOhU4HE/RfVF3IptbNMHdsQLAkoc+vGaA4GsvXU0v52vK+fZujgO27Y1ujKMLCi4MvP7R/gm4TZlCVWU=
X-Received: by 2002:a92:c9c3:: with SMTP id k3mr4068436ilq.299.1572997313601; 
	Tue, 05 Nov 2019 15:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20191105074104.24378-1-schnitzeltony@gmail.com>
	<CAMKF1sr+WRrR8xkF-+SDaZFoa+eZtr=QkxNG8oqzvJbL_ya-Ug@mail.gmail.com>
In-Reply-To: <CAMKF1sr+WRrR8xkF-+SDaZFoa+eZtr=QkxNG8oqzvJbL_ya-Ug@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 6 Nov 2019 00:41:42 +0100
Message-ID: <CALbNGRTjNUbiSJBXo0u2=WK6v0CQYmiBBW-q+yUAN2wiQdgRbg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Add gnome help packages to image according to IMAGE_LINGUAS
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
X-List-Received-Date: Tue, 05 Nov 2019 23:41:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2019 at 8:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Nov 4, 2019 at 11:41 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>>
>> In case
>>
>> * 'helpfiles' is in DISTRO_FEATURES and
>> * PACKAGE_NO_HELP_SPLIT is not set to '1'
>>
>> those help packages matching language selections in IMAGE_LINGUAS are ad=
ded to
>> image automatically.
>>
>> For more details see:
>>
>> [1] https://github.com/openembedded/meta-openembedded/blob/master/meta-g=
nome/classes/gnome-help.bbclass
>> [2] https://github.com/openembedded/openembedded-core/commit/3a9e9585aeb=
67234901b2f842113dbe20c3801b3
>> ---
>>  meta-gnome/conf/layer.conf | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
>> index 862d622ee..996f4f64a 100644
>> --- a/meta-gnome/conf/layer.conf
>> +++ b/meta-gnome/conf/layer.conf
>> @@ -8,6 +8,8 @@ BBFILE_COLLECTIONS +=3D "gnome-layer"
>>  BBFILE_PATTERN_gnome-layer :=3D "^${LAYERDIR}/"
>>  BBFILE_PRIORITY_gnome-layer =3D "7"
>>
>> +IMAGE_LINGUAS_COMPLEMENTARY_append =3D " *-help-%s"
>
>
> This should be dependent on distro feature and here it=E2=80=99s uncondit=
ional
V2 is under test

Andreas

