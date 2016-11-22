Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 33A6B6060E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 18:07:01 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id q130so36753428qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 10:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=qEtYbJLqHpbtdfzmv57s0q62ug7FQiUYmsUSNOXX88I=;
	b=O1m8npenWpo59QfGJUAcnJhi3yKYGlZwAgpSmG3IX6cgmqoBkU28VN7LuX1LGXxl/z
	vzBdJnWT1DxrGxfADP9dQMmJeBc2Rxulow6RC83tmCtr+vMu/fqUyWkE74fWhcuU7MXD
	b/WL+k0vbd6VO51cSTzFXYHLkNfjzFS/8Gl9ZkZ3ooDerudMLIgIZwCG0dNx9Y/k8kBL
	sN2dxvgyjRK7Kwfk4AuZLcHlqno1WNPc3ci1LQ/e7BQ7HlFAZRBTKqqh4v4ZSImh+Pd/
	qAmyzyu6pxlqoh0J2Rfo0/ZH/ByVzxERVBYVFGWB+svSQLLVVqxQOIAvUB6OAvojOUjD
	Ae2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=qEtYbJLqHpbtdfzmv57s0q62ug7FQiUYmsUSNOXX88I=;
	b=kZMV+6E79zBqdPc/8LkbYfrfUTrUaS8B+QJJKFXiujn1Ng5s9G3Ya9ye9SOl7VjYLT
	IZQGjB+oPecEt8PkiVPxELUufF11MfiF04u886/E0Fe59c2qlt2f1q0jzHfA3E5uf1gu
	B6i3SVfjqDfpSC0gLQEEzDerPY9vzLPVKoTIx1DA35v5hONb0KhhYc1qeD3ltd/uqOxV
	+IrVoUDEa/jepiLIM7C38zpyDW/BDQA9j0xxCjd88AgP/KMkMHuAb08JDJ3PVaZRH0Mi
	TqILz5hetcStjV47a2msDHQi8yjmOGAx+wYDxsstzSKTuHX9OJ6u4/T7qA1csQ/+Mf1j
	7Zjw==
X-Gm-Message-State: AKaTC00irtRZfYSipDtu+HePen9knyEpSKPllHdk0Kidm+MMRjjgoi0Iur/ZCIuEI+EzeSfbSAJQrf80h9N/yA==
X-Received: by 10.46.5.150 with SMTP id 144mr11937076ljf.45.1479838022750;
	Tue, 22 Nov 2016 10:07:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.39.210 with HTTP; Tue, 22 Nov 2016 10:06:32 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <20161122165203.GC3348@jama>
References: <1475714017-9205-1-git-send-email-akuster808@gmail.com>
	<20161122165203.GC3348@jama>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 22 Nov 2016 16:06:32 -0200
Message-ID: <CAAPZna3Gw-FmHrZe-5pSD7Hsp=W-UntZ4PiOr=+aOLWfWsGXsQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2.1
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
X-List-Received-Date: Tue, 22 Nov 2016 18:07:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

I fixed this issue in libpcap recipe and I'll send a patch to oe-core.


On Tue, Nov 22, 2016 at 2:52 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Oct 05, 2016 at 05:33:37PM -0700, Armin Kuster wrote:
> > Restore PE
> >
> > includes 2 security fixes:
> > wnpa-sec-2016-57. NCP dissector crash. Fixed in 2.2.1.
> > wnpa-sec-2016-56. Bluetooth L2CAP dissector crash. Fixed in 2.2.1.
> >
> > see https://www.wireshark.org/docs/relnotes/wireshark-2.2.1.html
>
> It didn't last building for very long, now it seems to be broken by
> libpcap upgrade in oe-core:
>
> http://errors.yoctoproject.org/Errors/Details/104702/
>
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  .../wireshark/{wireshark_2.2.0.bb => wireshark_2.2.1.bb}             |
> 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >  rename meta-networking/recipes-support/wireshark/{wireshark_2.2.0.bb
> => wireshark_2.2.1.bb} (93%)
> >
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.
> 2.0.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > similarity index 93%
> > rename from meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> > rename to meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > index dca3be6..a5fb7f6 100644
> > --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > @@ -8,8 +8,9 @@ DEPENDS = "pcre expat glib-2.0 sbc"
> >
> >  SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2
> "
> >
> > -SRC_URI[md5sum] = "c7de0997f74934f25b456846cf75cb81"
> > -SRC_URI[sha256sum] = "a6847e741efcba6cb9d92d464d4219
> 917bee3ad0b8f5b0f80d4388ad2f3f1104"
> > +PE = "1"
> > +SRC_URI[md5sum] = "49a1023a69ac108ca089d750eee50e37"
> > +SRC_URI[sha256sum] = "900e22af04c8b35e0d02a25a360ab1
> fb7cfe5ac18fc48a9afd75a7103e569149"
> >
> >  inherit autotools pkgconfig perlnative
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

