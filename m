Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DEAD37E3D
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 14:48:45 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11890.1768402118629873156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 06:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZhC5jyc1;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: awais.belal@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-66106a2f8c0so122032eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 06:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768402118; x=1769006918; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jeAcbW1KJbzxdzdD2oh9q5W6dXAwFCBLhgvd/ZKWutg=;
        b=ZhC5jyc1KABhfTEUEr/c4WsR93x52FqZxCRdXLmgwmxJlNttYvA9s+pgz5JNHzachS
         iev6vHEX2DhAoXk4JqXy3PsLp8s5dxiLC+4LaZTIYaZ/WjeZOut6M8w+EaCpH6D1JCJ5
         DB4WN+0PcoBZ0dOnm3ytsslD4ak3J95JuJZsEFcy5qHPgU0gffpI86NAZPjXvdKExDGU
         mzJCwwmvf6Dsc80IPZsC/dnTb/t0ulxA8ofZaashms6Mur52nbSf3K2zSu9KaZ8BUpte
         dQ8EUC6Q3pxjH1+NoeIDTVuvhPDk3mZ+fNblTy9I7u5XhCH59xtJXokBPN/S3JB20q00
         j1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768402118; x=1769006918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeAcbW1KJbzxdzdD2oh9q5W6dXAwFCBLhgvd/ZKWutg=;
        b=cGDKxPHFDgoevxTK7Utgo2BDf9w9eCS0h9bGMcAqNe6bRocIGc1DM/NBj1scW9fXxW
         CrmorSM+A9A1nJlXmykVrEpXqWgnOw2lZAgo7mP54SqYHUHLKRO7pojawlCGS22ZmLcy
         0p5lZ6RMADW4L3cX+tephWz45c0leHfB4Qp2kgOZJdt8bNOubX8IlTXG5Ga56hQyGJxK
         7STePjbMASjptnKymuCUlmBjooJjOgWvTQoqcbZTwjAiUph1pVjv68euhZBc4EogHZo2
         GaOT/gGflXXZfjkOE1dDTjCpqQ1fN6WUmj4O2ozaU+Bm0g3e2ZCM3gupMmVpvS8D9aWi
         g8hw==
X-Forwarded-Encrypted: i=1; AJvYcCV7hXqVjjq/L6O8FpS3GO7KgdEatxiR/adn8QkVLyuSkuRS41TrQ9aQ6bsz/KjbUdGlmFg+zgz+y5Tc7Usql5HOYF8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywl7YhE9TCa4h6/yCCvbonLf+yFeEC1+rdbGNGcd7qRidKPWwzh
	6SrEk73el+o9JfNkm4rIm9G+pCOlp85lFS0kUOjj5L4jdiJ1kxokJ7FMZ1+HlmmP8zRvD7qJ8Uh
	4dYTDKR2XQVtFqERGwKwYsUomW/laLOQ=
X-Gm-Gg: AY/fxX7RhOOfG3Cp/hV2paIU01KNfbCRAWLwQO7C67uL45VEi7yHhY4TInXATm3bTxe
	OeqZih0u8bmvZDLrT0dLpJu8ZDxWciuTo4BLHlPy0MLgoiBjCSys2eHjswmE1Pnv+gloGkJupvQ
	CcnXOpVGRBKY7tVDA2QGgTsOCBCaqRlXNddAyNom2Aqh/xYc3hDg5dFldM2N9Tik1LwjleKlE0C
	extDcU+H+kcKh58/duUrsix+rALhzlEiOFi2H6jIQsJS3kRA0zoQcBY0Oz6IpNAnIHSLnXo
X-Received: by 2002:a05:6820:221d:b0:659:9a49:8e05 with SMTP id
 006d021491bc7-66100718205mr1911125eaf.71.1768402117818; Wed, 14 Jan 2026
 06:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
 <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
 <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
 <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
 <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com> <297305bc-193f-4fe5-a306-bd05f33933b4@gmail.com>
In-Reply-To: <297305bc-193f-4fe5-a306-bd05f33933b4@gmail.com>
From: Awais Belal <awais.belal@gmail.com>
Date: Wed, 14 Jan 2026 19:48:25 +0500
X-Gm-Features: AZwV_QgTJlLJFakpAhEbZSeqNFCBw9PoE-OD5HhSZOLNYo8QwQbNRWhrE23QvEo
Message-ID: <CAM=5AmaYsT5ULEKPjPTvXusu+c6jo3xmC13nCTHp5_KJg4Sppg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000d7d1906485a3426"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 14:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123480

--0000000000000d7d1906485a3426
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

I did not ignore you, :) I just did not have time to help out. There are
> some patterns of TMPDIR embedding into target packages, but it needs to
> be root caused. If you look through repo, you might find some help on
> what different use cases have been found and how they were handled.
>

Sorry for being so so late with this but I now have a patch for mongodb src
which coupled with the earlier changes I submitted will allow us to build
mongodb 4.4.29 on OE cleanly. The additional patch is to fix the last
outstanding TMPDIR issue that we saw around last time. What would be the
best way for submission here? i.e. should I just send over the patch or
redo the whole series for master?

-- 
Regards,
Awais Belal

--0000000000000d7d1906485a3426
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Khem,</div><br><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>I did not ignore you, :) I just did not have time to help out. There are<b=
r>
some patterns of TMPDIR embedding into target packages, but it needs to <br=
>
be root caused. If you look through repo, you might find some help on <br>
what different use cases have been found and how they were handled.<br></bl=
ockquote></div><div><br></div><div>Sorry for being so so late with this but=
 I now have a patch for mongodb src which coupled with the earlier changes =
I submitted will allow us to build mongodb 4.4.29 on OE cleanly. The additi=
onal patch is to fix the last outstanding TMPDIR issue that we saw around l=
ast time. What would be the best way for submission here? i.e. should I jus=
t send over=C2=A0the patch or redo the whole series for master?</div><div><=
br></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"l=
tr" class=3D"gmail_signature">Regards,<br>Awais Belal</div></div>

--0000000000000d7d1906485a3426--

