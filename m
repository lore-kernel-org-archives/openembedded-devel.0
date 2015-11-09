Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2286C75EE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:18:54 +0000 (UTC)
Received: by igvg19 with SMTP id g19so23337371igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=b7NCrmhIGANkyyEH+sjNGuGyWZPll0UOSfGFF+gVJTo=;
	b=gvaWkvaoo/gkhKo0ecttnrs678VdCnVpnlwVg/G3gi3Ybk5c8JQpfspAzQ5uwIhUot
	xSz+Cncv9YgbswAovP5Fk6xbYHGevjUECa3vv/d2v2JcFB+ZcddKa5DMl12t9i3JUZhS
	0QrQJknGDQ6N4LISdM3uAyscMTjDBL86Khy3RJ6a7+w50oe9ZqDotQVMceN7/zDHFAfv
	kIixDzqNMJltNU9CthM4EhrICO1MwEwq5ZUvmkkk76jKs+460PtJ0xXTgv8+cDpOSRvX
	reipAXtLKnYAxyuwNBa7wG1y13mdJKh7SVIcqMU98k/0CNToYvEptuVHd4OWR6qkLrwE
	7Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=b7NCrmhIGANkyyEH+sjNGuGyWZPll0UOSfGFF+gVJTo=;
	b=escmG6AyVj6fA7qsxjt/ZTGI71ygq9j0mFJVwaxnr3xmHW2CReWzDS8lhJj4UhRgGX
	jOPW4WLEayCtHFk6dS5vh741IOYdrtX97xydNNj8s+9UmxLRLRhydmYgt2Illa3IP788
	bebDSvViZlQIN39Rt+6xm2cFIVjeoMZ5RuZ+ICSXFHL6RUjeJr/QpjJjd8/fq3UlNUlq
	9S1bCXAgu7HyWyB4F2j/AkMzpb/z0tY9ATlsFLsnO2CNZfGFal+0E+0Rr2QyUrloE+bU
	ZhNdwqtgPrccNBxVsILg7uqiLTegZlMDXYeUjhA4VT+MoUWQSWaYEWVTwRLj61pziMs5
	zfFA==
X-Gm-Message-State: ALoCoQljSPE4eVXW2ruagMAHQXsdUfQ7/LHG5f/yDnYqtIW59FYJEqqWQBg65D1S7woJnH8IVq7e
X-Received: by 10.50.4.33 with SMTP id h1mr20492509igh.24.1447064334706;
	Mon, 09 Nov 2015 02:18:54 -0800 (PST)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170])
	by smtp.gmail.com with ESMTPSA id d9sm4677469igx.10.2015.11.09.02.18.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 02:18:53 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so181131466iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:18:52 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.151.131 with SMTP id z125mr1973417iod.192.1447064332570; 
	Mon, 09 Nov 2015 02:18:52 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Mon, 9 Nov 2015 02:18:52 -0800 (PST)
In-Reply-To: <17C19527BD855F428F22685986FD58BEA33E02@IRSMSX103.ger.corp.intel.com>
References: <17C19527BD855F428F22685986FD58BEA213D3@IRSMSX106.ger.corp.intel.com>
	<CAP9ODKpP17FSRs+iNU=nne4empeDXCJbVq07ydq-6MoGAmO+yQ@mail.gmail.com>
	<17C19527BD855F428F22685986FD58BEA33E02@IRSMSX103.ger.corp.intel.com>
Date: Mon, 9 Nov 2015 08:18:52 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpg++24j0UJhMCKQ2fGVo9woixSD8aM1-Uh-WfrB9rTTw@mail.gmail.com>
Message-ID: <CAP9ODKpg++24j0UJhMCKQ2fGVo9woixSD8aM1-Uh-WfrB9rTTw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Sporadic segfaults when compiling jamvm-native and classpath-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Nov 2015 10:18:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2015 at 6:10 AM, Kaaria, Erkka <erkka.kaaria@intel.com> wrot=
e:
> While the workaround would leave the underlying cause unfixed, it only re=
quires changing one line. Since the cacao-initial-native is only used brief=
ly during the build process, I think small workaround is better than large =
scale changes to the old codebase. I also didn't notice any difference in c=
lasspath-native or jamvm-native build times, so the performance impact is n=
egligible.
>
> On a related note, I ran the clean\recompile script over the weekend and =
saw no segfaults, so I think the workaround works.

So please cook a patch adding the workaround and add a proper comment
in the recipe with FIXME so we are aware of it.

If possible, consider the possibility of packaging the staging
repository so we could use a newer release, after that,  and likely
drop patches :)

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

