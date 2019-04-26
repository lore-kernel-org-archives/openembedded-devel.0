Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3164A7D10D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 23:20:18 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y6so4317221ljd.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 16:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gZc5RrzxNNdmpMFNtDQxOMza6Bk3dyUKpU/hKXhQt6w=;
	b=gAavxWwoUZRY3CKlY9QMKkVBNAls+G5qneplXelypoUICswU6W34mQ2tUKLJ0kCjz2
	dklptOkBWgcdgaXvgWt5PWvGI5iVEFUiRE/V6eRZo+KKJph2r96GFHMpRYN1976SELt7
	EdwCZ/rFqkUm5SQrXogCNHzR/gD0iHw00hTe+HQUoFb3hxvCzge73GzK4PLzbYyOHIPy
	m+oXS6e/f+C4qg7f1SOXS3fLN+TrNhL+IE1FoHzHFVMEvVkq/pgJrg+Ge3zh/F8kLi4X
	RQzTO5tqkWElZCVj6/LMLbdja7x9P6t/b7u3ycyjI5zURqzqMDqymFdu4sEfFj+m6FnI
	xOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gZc5RrzxNNdmpMFNtDQxOMza6Bk3dyUKpU/hKXhQt6w=;
	b=rs/QvMB9ebTXlz/m/gHh29sBQNzTit1yec2iyHwZMFdZh01y1/HYNvmH9KwjW7QOXQ
	uHo0JYzT0V9llqB6dyE92QEVBf4eaFihwEZgGxF17eJFI6ptvLIZvaKtRsjwYFoSK1Jc
	qgxGL2Z5/dZ2eKLTgKwyfhxBQGr/rnCzH05YKYjNpGoHwxS6D+ASLFU+1eM4wpA7xpja
	Hrv1fSTAb+pz7jQHgFNzgFRhL8fNEjotUm4oQ3gUD91Mi3GcCM0qlFoQSeMyC5Rzg829
	Sc97kLM7dk2Jo1+oxOeqxAXBIzgQyisCvmMfmMat2JFY1K6mvqB92LydZhBj2ue0cd/c
	bJgg==
X-Gm-Message-State: APjAAAXijNyaal8Zoc7PkubJ58Kc9DueFVCtvrL/Plx0g29clNrdMR+C
	vZOhRoN9d0zi5hEMcBQXqETyuAwSCnKMThdUmAo=
X-Google-Smtp-Source: APXvYqwjLYwEnJdQ10zQFPkIYUdsHPwSxv+knH+ih//O8hX0Z7i2820b2YbgpQ7wlX9nTrvmZ4lyuB9TWpdMrq7S70s=
X-Received: by 2002:a2e:300b:: with SMTP id w11mr7683804ljw.197.1556320818715; 
	Fri, 26 Apr 2019 16:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190411213317.20935-1-alistair.francis@wdc.com>
	<CAKmqyKPqaiZprZwD6nPxpuUEMm6jh4UgJfyPLh+-Fxcu7ZXOtg@mail.gmail.com>
	<CAB2nKc-oX=ATOgmDTswmsdEWaD3yxy-XBoT3-CTLsor4w1pQdQ@mail.gmail.com>
In-Reply-To: <CAB2nKc-oX=ATOgmDTswmsdEWaD3yxy-XBoT3-CTLsor4w1pQdQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Apr 2019 16:18:27 -0700
Message-ID: <CAKmqyKPu47_4iya+4-SCrXm64dpAOjWe3P-t3XbpyXMJi2cyqg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: "Maxin B. John" <maxin.john@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@gmail.com>
Subject: Re: [meta-java][PATCH] layer.conf: Mark warrior as supported
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
X-List-Received-Date: Fri, 26 Apr 2019 23:20:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 12:29 PM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Hi Francis,
>
> it's not that urgent Warrior is not released yet but just in case, I adde=
d meta-java maintainers to current thread, If anyone can merge this patch ;=
)

Thanks for CCing them. Without this master doesn't currently work so
it's important it's merged soon.

Alistair

>
> Best regards,
> Vincent
>
> Le jeu. 25 avr. 2019 =C3=A0 20:27, Alistair Francis <alistair23@gmail.com=
> a =C3=A9crit :
>>
>> On Thu, Apr 11, 2019 at 2:34 PM Alistair Francis
>> <Alistair.Francis@wdc.com> wrote:
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Ping!
>>
>> > ---
>> >  conf/layer.conf | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/conf/layer.conf b/conf/layer.conf
>> > index b03a608..90236be 100644
>> > --- a/conf/layer.conf
>> > +++ b/conf/layer.conf
>> > @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend"
>> >  BBFILE_COLLECTIONS +=3D "meta-java"
>> >  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>> >  BBFILE_PRIORITY_meta-java =3D "10"
>> > -LAYERSERIES_COMPAT_meta-java =3D "thud"
>> > +LAYERSERIES_COMPAT_meta-java =3D "thud warrior"
>> >
>> >  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>> >
>> > --
>> > 2.21.0
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

