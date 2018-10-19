Return-Path: <marek.belisko@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id B48F9748F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 08:50:08 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a13-v6so36550117wrt.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=tIE1rgcefbovnnR/7mbWUqBN+HyqQhihR7O9/x2RzVc=;
	b=ktlTIIBgdxHunU7J7o4k72JAEVBVM5sLHxCU2Jpu/ztyNTzkdagS7uI0dNM5TkGdTm
	LbilVpgBQQ6rdLkYzr+XwQMlZFIa+kHd6xCTs7Oh0o+dbtRd1oGaywjDkidcbKkSI1DS
	tXFNXaN+oA0wAeW40y3xwxfWfApp0s+6VkBKZBdBeU0D9V+Vzqm2cWbxXruSQyjEcV/c
	bci6RTDUBhj1zP8u3DV6Ep8Ja1GLWSpVWtNDp15leIKGAKOLmlmT9vwJefGp0wsz8dSn
	Gapf1OJexd4LDKZlQ17cTe5XjFZJ8fwDmSttf+Vi0sWw/XD75FBbxNPva2b91C5DDyag
	/bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tIE1rgcefbovnnR/7mbWUqBN+HyqQhihR7O9/x2RzVc=;
	b=VnfoMscE7klw+yhc7KoCIt+0AkJdUGRMK0twOjQya9J8+p5MvKHAuTpm5xwMpIsqZe
	CqqDTTnWAa3yb6NV286P7XSZS1nCgGlyR+vdSw1hFKPtmqYBgzFgOV/mOQ1JHJuSU9W8
	vaHHpn5ezrTQa481wqcvSX6TGOw1PYNKaLAs4FvZIjze9a08UgoCPl6ZFhYxsjw1LI6f
	NyjqTDDyiNtvB1vjXw2KvaS89Uo6/9ffsaYxKoblN1mErZuHkB5D3sir8BPsvJHM6PeL
	NAE+mRjm8ys5UWzkbAJkgyDyg6VFrUtL/oG6/7p4oo6MKxpFywpvY0okkdfycGsknK/d
	Zflw==
X-Gm-Message-State: ABuFfojZPi4HtAQB9SFZPL+GcKAKChbSeL04/cesilVdWwWt26n0acLz
	LPkVn6mbBG1uZksvZqcoEbbVHWeTf7pXyJv7I6GCOaZGJAY=
X-Google-Smtp-Source: ACcGV62GY4aI8nBw0Is0ENxHv6HURx6GYWiJw6NqRAKe41vpjU9YZ+1FhDX3+ioVSPNK3WHoU1zqRYIwXLD1cEZ5hcA=
X-Received: by 2002:adf:f28c:: with SMTP id
	k12-v6mr11103086wro.184.1539939008867; 
	Fri, 19 Oct 2018 01:50:08 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 19 Oct 2018 10:49:57 +0200
Message-ID: <CAAfyv34U8xRroCvy1JdoOkV98MB-pjARbrs=AGy5gQfecxyOhw@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: meta-java how to build client C1 option
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
X-List-Received-Date: Fri, 19 Oct 2018 08:50:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

IIRC when building openjdk-8 by default is used zero jvm variant
(PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"). I would like to
build client (C1 - actually this option available in master-next). I
have tried to build for arm - beaglebone (with hacked PACKAGECONFIG)
but getting compilation issue like:

| arm-poky-linux-gnueabi-g++: error: unrecognized argument in option
'-march=i586'
| arm-poky-linux-gnueabi-g++: note: valid arguments to '-march=' are:
armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te
armv5tej armv6 armv6-m armv6j armv6k armv6kz armv6s-m armv6t2 armv6z
armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv7ve armv8-a
armv8-a+crc armv8-m.base armv8-m.main armv8-m.main+dsp armv8.1-a
armv8.2-a armv8.2-a+fp16 iwmmxt iwmmxt2 native
| arm-poky-linux-gnueabi-g++: error: unrecognized argument in option
'-march=i586'
| arm-poky-linux-gnueabi-g++: note: valid arguments to '-march=' are:
armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te
armv5tej armv6 armv6-m armv6j armv6k armv6kz armv6s-m armv6t2 armv6z
armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv7ve armv8-a
armv8-a+crc armv8-m.base armv8-m.main armv8-m.main+dsp armv8.1-a
armv8.2-a armv8.2-a+fp16 iwmmxt iwmmxt2 native
| arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-m32'
| arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-m32'

I have no java knowledge at all so please consider this as newbie
question ;). So question is it is even possible build client for arm
with meta-java? Thanks.

BR,

marek

--
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

