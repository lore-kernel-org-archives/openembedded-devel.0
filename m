Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4D590AC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 17:01:06 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id g7so819337vkl.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 09:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jtpOnFzcvRbgugeAAVb1V18dKqw9mzHWzk3j+Fxty3o=;
	b=EPBnLaBBGuXhuiYuRVNqZxbandjmhvcyIJjhRDvSzvxFHfJiPiPl3nDuEYs8FXgaMe
	PlgGddJiyUS2tdHTtvnXqCOXm4+Njrj0soSiXaTEG6uR6b9vtGgrbhA4wYMHxDuv9oJ4
	PJow/3a/C89pgPkx/70H5nqhR5dxT/wiyAoQJPQ5KvH5NTLDmvqTLcvvEVfeW1Ff9Hju
	3saMh5lJBChGttYjcUte6dnrt8lM8EqanL7ccIxV0Atw3WA2cFy3jdXcQTEgRt9jrpGz
	Y39XTZakxHML2xblL6awkeJi9ZbDGOc9EcW0v01J29r9kFA+6VIPJzx4IRZnTQobg+aY
	HXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jtpOnFzcvRbgugeAAVb1V18dKqw9mzHWzk3j+Fxty3o=;
	b=J1SN6w5LFV8Z9m7vt7ISOFnODnQRetAE0NOontH0RHLdmPfuhRzAfLG691J79bfXGE
	6LzfuQ+6uCTNo7Nr0iKRrNsEIfEq+L4lv92hq3uWh9bT6m5HyEBD+fiUJRkyy7ehULvH
	u1TDaAP+zZujO6HZ1oAhTAVHCWhi8kleE7y4n03C/IQA2guqrcLLQ3lZLaE1h8dkIe4+
	N+1Rafvs47n+0C8QhMUzr+36fGOQjEMjhTDBqJ8XqKmamMna5NfetrD3hXUEMjxqLbNN
	LdCqI73/oySVJtPF5zFTbk4+2lluQRDZ/Ul36fIBf+e2rlh5D5Ak2Q5/cS/zohybAKTD
	3n4w==
X-Gm-Message-State: APjAAAUnELk3SY5E3CcUDQF1nDyse+DilkVLd0+W6VTHFc7QoLZ6hZwO
	2xra6j21+KF9ZYa6wFy56XRbjPulWGYKMxHIfKM=
X-Google-Smtp-Source: APXvYqw8gc42/j7wq+qsP7ee3Wf4ndhQzhH7/cuV2q6UDH9aDa8hq5LWWnTXgwwLtJCwJexAKtUNHEBk4AieZUHNy6g=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr2549303vkn.0.1576688467425;
	Wed, 18 Dec 2019 09:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20191218143106.128574-1-alex.kanavin@gmail.com>
	<20191218143106.128574-2-alex.kanavin@gmail.com>
	<CALbNGRTvSNapgjBavAE7S4N0ETWpthMG3XPv=g7_sekCE3vnmw@mail.gmail.com>
In-Reply-To: <CALbNGRTvSNapgjBavAE7S4N0ETWpthMG3XPv=g7_sekCE3vnmw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2019 18:00:56 +0100
Message-ID: <CANNYZj8ir8Btnhx_Fthd-5O9455aqSEHpRarPTfG+ZHHa+Lqng@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sysprof: update to 3.34.1
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
X-List-Received-Date: Wed, 18 Dec 2019 17:01:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Dec 2019 at 16:01, Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

>
> > +On uclibc elf.h does not have GNU extentions but we need this define
> > +so we define it locally if its not getting it from elf.h
> uclibc is long gone. Is this stlll necessary for musl?
>

Actually it altogether fails to build on musl. I think we should leave the
fixing up to the interested parties, or mark the recipe as incompatible.


> >
> Maybe I missed something but the only (optional) dependency left is
> mutter. Shouldn't sysprof go into meta-gnome?
>

This decision I leave up to you :-)


Alex

