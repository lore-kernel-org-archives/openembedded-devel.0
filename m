Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Me9oF-0004de-4b
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 17:44:15 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1632244qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1Z/vxaNSfT17k9LPzz8EbhnunQd5FsF1kWWOxuvewaI=;
	b=gPEzpupaH6dw8Vd2mf2wILXp9lWMXBZaAhzv7IwsUHFVg0o5PcbTMMqS8Ue7ZdtPeg
	OK4TzQfo7IJ5NW4oKTVEn/BswLLARk566IyVfT5/WCoSzRotwc222fn5oiuzGYirYvwY
	sQrp6sAd9mZZTRCw/AAwgP3AdxL9KHQJOd0gA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=r9dilGhjz1emBm31ErmVbaVx7SxIpymcxPLAiQSnGBlU4J1rA7EHti8sI+i2oJt4PD
	aGkLDaKGYhWmAwsZpmUEb4mrDmqkdLISCHI0vSUX1JeYUpoZmFMMP9nVTbTtrdF+Hu1m
	DrztOu1zp/bFk/9mFZoey90MUEbXcmOyeVQ80=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.2.19 with SMTP id 19mr3120314qch.94.1250782017085; Thu, 20 
	Aug 2009 08:26:57 -0700 (PDT)
In-Reply-To: <4A8D5E37.5010806@atmel.com>
References: <4A8D5E37.5010806@atmel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 20 Aug 2009 08:26:37 -0700
X-Google-Sender-Auth: ef685636991037ee
Message-ID: <b6ebd0a50908200826u31c28b11n81b92a08fd05d630@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Is it possible for a recipe to include/require something from a subdirectory?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2009 15:44:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2009 at 7:31 AM, Ulf Samuelsson<ulf.samuelsson@atmel.com> w=
rote:
> I just finished a nice gnome script which allows me to automatically
> generate SRC_URI_append's
>
> I select the files[1-4] in <recipy-dir>/<recipy>/<xxx>/<yyy>",
> and then run the script
>
> result is:
>
> SRC_URI_append_<board> =3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<file1> =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<file2> =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<file3> =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<file4> =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> Now, in <recipy-dir>/<recipy>.bb I want to include the file using
>
> require <xxx>/<yyy>/SRC_URI_append
>
> This did not work, so I tried symlinking - bad move...
> I'd hate having to move it to the top directory of the recipe.
>
> Any ideas?

include/require obey BBPATH.  As far as I know, the parser should be
temporarily changing bbpath to facilitate includes relative to the
file doing the including.  If that isn't working, you could try
require ${FILE_DIRNAME}/foo/bar instead.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


