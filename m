Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB376700F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 22:27:04 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 3so42004056oih.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=z0msrt7yJuP3Wz09Bo1Ez3JaEHN0/w/+Oh4Vnd8509E=;
	b=j7bTDktA1UOLvhfRkNuzghD+P2kM/M0EJ5scV4EozTyYYJ08P9h3y+2mi1maCSz0KZ
	IlyXWpfNvSJYIhbfWXTkjDKbFdexxa+jWoXBrmd3n4JLfm19iAE6cVzsG6WVf6RMChDm
	ycDs/qLoobS0CzosNiq62T+PoLkZide3wPOGHthVCtWyUiCXY2cHZQR1r1CuXKMDsOcq
	3GJdm+Mi67Ri8VpMdftHMJkNWqr6vklECclKMKEJQ6CLSYacsRLiJ+ADMysnQsuRbdlc
	CbF2DYSJRTm6e8UZgt4anaxw/Ubvgj6dcTIKuEWTF2g4anUKjwj/CHGb0ByIVCOsjuzK
	JdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=z0msrt7yJuP3Wz09Bo1Ez3JaEHN0/w/+Oh4Vnd8509E=;
	b=mVucCQVzvsPV+v7qEo9uOQdXzNZd5vCaTzn8zv9xrueHhmnYjIRuS+95IhYk/FtSrc
	6sKyqB0McINzb9sonvVIzioRgC5zHw1PW2K8YpVUcepwYGZBcg7fQ1ziLR+30E4c6l/l
	9hpi4nHZOzygkN3PgmAuKb9wc3zv+JjyOY1nmaWwevbiQF1IFZXAbo3WZ1BJ9DX0g4YH
	AICTjZJL/W7lg8bHpYWtNlx8ee1uQrnTn9VFekgyNXxSxR3aSUsjOsiwfwAqmSIJeyIl
	8hrGLBn1F+6IsdFhsTqBnHOS/EIUEPWDmLoriytBFkGQn2aLNWNUOMda6Bf3PGD+/wKM
	j+UQ==
X-Gm-Message-State: AIkVDXIqBgfguC0ZEeJvuDsRk04PHzpdBx3WdPPb12ceoUUWFmNjUBqNraXhQ16qVqMSU4qpd8mZx7+GcE+ysw==
X-Received: by 10.202.228.139 with SMTP id b133mr3688726oih.111.1482359226063; 
	Wed, 21 Dec 2016 14:27:06 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Wed, 21 Dec 2016 14:26:45 -0800 (PST)
In-Reply-To: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 21 Dec 2016 15:26:45 -0700
X-Google-Sender-Auth: Nl-5c32uifrdL1x6Rd7hJp6X4lw
Message-ID: <CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [meta-webserver][PATCH] apache2: the download has been moved to the 'archives'
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
X-List-Received-Date: Wed, 21 Dec 2016 22:27:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This release of apache2 is no longer found in the main downloads area
> but has been moved to the 'archives'. We should uprev apache2 but for
> now this will at least get the builds working again.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>

Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIRRORS to
automatically fall back to the apache archive?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

