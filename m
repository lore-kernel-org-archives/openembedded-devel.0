Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 731AF7FA69
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 11:45:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4702NN4ZSVz6W;
	Fri, 25 Oct 2019 13:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572003910;
	bh=ElzUKDeHR5QmBGwbSU1tRbzLtLyfD7p++idT/L7rkF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSX3EYgCXYJPm22Bn4reh8nE3wNwJOCxkQKbvsYbXcAFgTO7VbVxVVm+/f8vozU8O
	CWZcdKRLFOhMdK5BgqTTMh7fgyp7xcsGpNC8HTFlSewVng5+GT0JLrm832N0ODVOES
	UUjLmg6+8yEUqOIErv6y5dMxWW8se7+Jc78qBLLwVO0Fl/qxM1WJPgvJD+Y99DtxCz
	34Z8WaCPLaxZgJYHPR9ooty9273d9nQFhDXTmaoPIJNxiGFywDTWAzJ/h6Z98OIf/s
	RoOcNKsyJH9WnHnRLW3AkC3mQ+N844d5IfK9Mt3nRaWxZ33uld527odmjvCKGcp9T+
	Jet04dq8TfPCOuLnOZrxXig2hn/WqKbiNWBPzjUg3nz3ICTj8wo23DhnbPsa86Ykba
	GBh8e47RYtLJ96RjIZ/eJU2aCkzZ+s+DG16Exf79pDiLCaAcj1GdvBMw3H8Pzj7m1o
	6qFn4/gSCbe4S9tLQ3jHoMuA8pWT9zPxLVwcQkZ+hm2BC1ZR7lOHdeuzEl0jJDqSRm
	+zDGD6rc0AKAQ1odRixiKnThVqRTCj2HfXX2N+pq/P5rFp4UttwMO+Ahuo3/Om5adr
	Mj9R+XaOTnVTVGqUjMzxdXGw1HjgmWKH/DySUsWJLnHbrkz3oFaVY0Ze9COclCU+9y
	x58IkQnaI8qnhvego0iUgM7o=
Date: Fri, 25 Oct 2019 14:45:06 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20191025114506.GA24586@localhost>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<20191025072113.11172-10-schnitzeltony@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191025072113.11172-10-schnitzeltony@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/15] zenity: pretify recipe a bit
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
X-List-Received-Date: Fri, 25 Oct 2019 11:45:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 25, 2019 at 09:21:07AM +0200, Andreas Müller wrote:
>...
> -SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> +SRC_URI = " \
> +    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>      file://0001-build-don-t-generate-manual.patch \
>  "
>...

This should also stop overwriting the gnomebase SRC_URI, replace with:

SRC_URI += " \
    file://0001-build-don-t-generate-manual.patch \
"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


