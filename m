Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEBC71A1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 20:17:06 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id v84so204325739oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 12:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=6vLonW/YA3bqrI9PcrYavWZUI6IIws4jEw0BMlzqys4=;
	b=MhCy+Pa3duVYMjGKyn6oZLbr2cbVjnVBVKeC/pvJCef2YtsEHjEZbD7OITkTEI7sSq
	lyAyIhHOpRCbAcwFNy0JwKmcG9uHWS/1KDVP5ezhSYpUG8lMLlTVqpFUPQFu40mqP5kr
	gCr8I2u3jXIN3De7tfIZAXqzw4jzTWkSUVfTdEtPFaG3UpJ3Quzj8GB0N0HDbEXcsxYx
	7p7O+bfdapA9unMX60ZASl2BNMMewY7CQaAKz8OS0wAZ9rmL/j9xIi9WUu56II4H0SWr
	ctGp7VQoXmvzfc/JeVfYokJkoeXKVWzeg8U9UpXy7RjXnXdQ0J+p+D7Ima6ZyQmCE/pY
	KXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=6vLonW/YA3bqrI9PcrYavWZUI6IIws4jEw0BMlzqys4=;
	b=XW2uqpQnnTk84lZk6vOpmuHNLQICvH2yNdXOMx9catmvB7nDU2M1wzQRD/akJ6eZs1
	Xd58obSKtYQ7xM8Byzs9OOVub4C6sOcdiY55reQ3Hq94nEJJy8BfU+fPG6dW0uxbqU/a
	+3v1TEnXsLSjR0cobWEzEpiL7xFAEqATkzo64BwIijsfix36+IPXXlN1wWDcITKWdP8R
	zpP54djfVcmBpcoDyUMB7n4G4F1WUfv31HEcUSurajuxfoNK3owKfxBhuiYa6RAWVncx
	vP8X25SpDAnmM9Q2GPvF5eZgaCe9zdgCxMrasJ/GDYYVZBPMDgJh33LzzKJwC6lVidjB
	BzUg==
X-Gm-Message-State: AKaTC01HpZtD/2+tWNMF+3rS43eGM9F34oUtWvetiW5pq7OiUHucuk3is7dQTvJVtsJIAqrP28A5oIYtIoZhYg==
X-Received: by 10.202.89.197 with SMTP id n188mr16516039oib.156.1480450627800; 
	Tue, 29 Nov 2016 12:17:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.14.20 with HTTP; Tue, 29 Nov 2016 12:16:47 -0800 (PST)
In-Reply-To: <20161129164817.16671-1-dev@codyps.com>
References: <20161129164817.16671-1-dev@codyps.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 29 Nov 2016 13:16:47 -0700
X-Google-Sender-Auth: Mlnv4m2QspJFFCOB62idOR_0LBo
Message-ID: <CABcZANkz-QEg-+rLr0q-W8BD5K6Z=UFs3MUpZHQXRO+T2xF2hw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] move from bb.data.getVar(x, d, 1) to d.getVar(x, True)
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
X-List-Received-Date: Tue, 29 Nov 2016 20:17:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 9:48 AM, Cody P Schafer <dev@codyps.com> wrote:

> bb.data.getVar was removed, need to use the modern mechanism.
>
> Signed-off-by: Cody P Schafer <dev@codyps.com>
> ---
>  classes/java-library.bbclass              |  4 ++--
>  recipes-core/icedtea/icedtea7-native.inc  |  2 +-
>  recipes-core/openjdk/openjdk-7-common.inc |  2 +-
>  recipes-core/openjdk/openjdk-8-common.inc | 10 +++++-----
>  recipes-core/openjdk/openjdk-common.inc   |  6 +++---
>  5 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
> index 144cd2f..58d5a40 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -23,8 +23,8 @@ def java_package_name(d):
>    pre=3D""
>    post=3D""
>
> -  bpn =3D bb.data.getVar('BPN', d, 1)
> -  ml =3D bb.data.getVar('MLPREFIX', d, 1)
> +  bpn =3D d.getVar('BPN', True)
> +  ml =3D d.getVar('MLPREFIX', True)
>

If you=E2=80=99re working on master, even the =E2=80=98, True=E2=80=99 is n=
o longer needed, FYI.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

