Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id A12E878945
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:35:52 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id y127so10567371vky.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+lVEoVDDRNXk2G9zVIf33VGi3qnPNnx5E+KetIOb/BE=;
	b=fvATNM0FzcBVEZRGgXzEKVFRITp2ghrTgLghyjO4ZT05islrrvq0pju4aI0ZEsj2mj
	+SDAqDD09F0VNK2KihHtwBR465OODh4X/tMXEfV/NgSBswUreUix0IGYpaSuzdul1zp6
	0+lPmTHuzglhY1fQwVDq3n0FBlEQUe6ZhSLsQCxrZzrvgGYWAFALAgrX4hAoz2Ofu1hd
	4bQ2PpjeNaQXzTjXA3Hc4Ezao0GhIY/VGHEWBV78SAv5SY8iwP85iWVTCbHvPO1Z/x8q
	1TmI/bVBrRuRVEDnBZi9i3AZAVWsBcjuxgx8eUPdYX9tBfHJbAd8VIW79sS3/QKcxMBo
	K37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+lVEoVDDRNXk2G9zVIf33VGi3qnPNnx5E+KetIOb/BE=;
	b=uJLTmowTiTkazp+rBk9859ftBmtbb7jkpwJhBWYRB/QVAGTfpSG7Tso0TpOKk6+D+Z
	mHMUcmz40R9XqVQdshz4UMRIbtmycPjQrz5VPTFydFejutbuLNhks8Gmt7AZKMtnfX+0
	IuAJWhz+TpEnAxLvEiOMOIWxMVBOA/G77DrF/yXx4OTGn4te9PiFQOUqJkQR+XvBibIT
	OIEZ/rkOY84xd+Q3y0WyCvbb8JphoX1ymbloHgv8uf2ZTf/q2XaHLt5rEGuCfRDiHK8p
	sNL9JhhaHQHzs5QOtY/BnPNnR2dhuGLvWHDzOkHP7tKli5jUkyWv3aumV6dBXgbBDgnX
	7H0A==
X-Gm-Message-State: AElRT7FU2j+BYGip96FCDJFRIn2/1o5TlEQtMYVs69QOWUuumEqQsZQH
	5mOe0yst3nXVnl0YXDMGFI5qRugRDPiCC6HE4rk=
X-Google-Smtp-Source: AG47ELuAt1KZnCZ+HHYIQeef+4mWZNwjq5wfC9F8ec8c7N3dMo/0+kNXS5bjeCKcPe/4fZdgs2L/rxzYYEaj2EKABU8=
X-Received: by 10.31.76.4 with SMTP id z4mr8493832vka.63.1521473754056; Mon,
	19 Mar 2018 08:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <CALw8SCUwyJA29Ytmgo4rOL+cyVDDZyOePFWnVp-H2Y03BWDYkg@mail.gmail.com>
	<CADNbA1pcjD7BjF20VrXGOF5Qe7tj_kj6Jr8bGfNcKj2tSTgLwQ@mail.gmail.com>
	<CADNbA1o0SFW-QkcV8vsBTN8i9pC-MV6Ycff_j6iVgLZ_+6YHVQ@mail.gmail.com>
	<CADNbA1o5minKhZgwfG6kisd06S9t2hgJ8AmfphThdwSD-Y6FYg@mail.gmail.com>
	<CADNbA1qPB1h3bepgbxnMpSXhW+Gyt9C5Ona5=NwnBfuz6ySF_g@mail.gmail.com>
In-Reply-To: <CADNbA1qPB1h3bepgbxnMpSXhW+Gyt9C5Ona5=NwnBfuz6ySF_g@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 19 Mar 2018 15:35:43 +0000
Message-ID: <CANx9H-BNkVEyRkab3r1f9wFcZj2d=eyCTqx3tvpfU5qs2ipUEQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mirza Krak <mirza.krak@gmail.com>
Subject: Re: meta-python/rocko
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
X-List-Received-Date: Mon, 19 Mar 2018 15:35:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for jumping on this, Derek!
And thank you for catching the issue, Mirza. Extra eyes and hands are very
helpful to keep up our quality.

=E2=80=94Tim

