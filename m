Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QAk1r-0001Vc-N8
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 16:29:47 +0200
Received: by pzk35 with SMTP id 35so1051245pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3pkSNY7mN0jRChnZfIlNa8N6QNmtaX6WRasJOjDvTf8=;
	b=d+q5qXWkUMr7jn/tkKA3K1n9c0OceaV9wVCcKekbKZIMX4OfigmWqSp9A5kezDAwbP
	4FqpUBY2MLxQVNlFqjsR/cZqfBG4u5MWL4SLjLltoUgKjVaM3voVqPUqsJel6K4YfFjH
	6iSFdUPqsvCC9E5fh/IV41KnZvZCZb93RqM5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=j9YsyJLOGOkXwgQLn8Qz2evedwBo8KkzbqyUqjmjxksYX2iUK7g/8Huo0ANSowZ8jT
	sC2qOC/iCDQ39p1C+OoRR+FScW6MRH08+v7doYfOkve81dWoJ+y+9lNf45HzjRy0zBVJ
	AhQtguLHn4oYGZ49ct2AH1ko1meflb6c3iKtg=
MIME-Version: 1.0
Received: by 10.142.212.5 with SMTP id k5mr876321wfg.285.1302877645362; Fri,
	15 Apr 2011 07:27:25 -0700 (PDT)
Received: by 10.142.237.11 with HTTP; Fri, 15 Apr 2011 07:27:25 -0700 (PDT)
In-Reply-To: <AANLkTikBSTnFxn-h+BgD1fcuOmKPsP6Q8bVZ+R7_HUkW@mail.gmail.com>
References: <AANLkTikBSTnFxn-h+BgD1fcuOmKPsP6Q8bVZ+R7_HUkW@mail.gmail.com>
Date: Fri, 15 Apr 2011 16:27:25 +0200
Message-ID: <BANLkTin9DG49DJ6C5M=70_+1UKpnOAtd3w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: mtd-utils - issues with flash_eraseall -j
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
X-List-Received-Date: Fri, 15 Apr 2011 14:29:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 9, 2011 at 1:14 AM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> Hello,
>
> with the previous mtd-utils-1.3.1 I could do ' flash_eraseall -j
> /dev/mtd3' on my Zaurus/armv5te.
>
> With v. 1.4.1 (and 1.4.2 fwiw) I see following errors:
>
> ...
> flash_erase: error!: /dev/mtd3: MTD writeoob failure
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0error 22 (Invalid argument=
)
> Erasing 16 Kibyte @ 43f0000 -- 99% complete libmtd: error!: unaligned add=
ress 7
> 1237640, mtd3 page size is 512
> flash_erase: error!: /dev/mtd3: MTD writeoob failure
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0error 22 (Invalid argument=
)
> Erasing 16 Kibyte @ 43f4000 -- 99% complete libmtd: error!: unaligned add=
ress 7
> 1254024, mtd3 page size is 512
> ...
>
> Anybody can confirm the issue?
>
> Regards
>
> Andrea
>

It seems the issue has been aknowledge and resolved upstream.

http://lists.infradead.org/pipermail/linux-mtd/2011-April/034599.html

http://git.infradead.org/mtd-utils.git/commit/b22f7f386ba37a766aedd8e8cf347=
81a3d1daad2


Let's move to 1.4.4 ! RFC follows

Andrea


