Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB12565E94
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 19:45:21 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id b6so10382128yha.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 12:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1X0Do+427v3NzfRcnZWyjZ60q7LPBiKwLNhx98ZWGyQ=;
	b=e/bypqoecqmLef/yU9PxiRG5KO1KtbbZTPg4ESK7jh4AxDPXUiTGo4VtvtH6QAH6cK
	OFRU+Bgd72MMCK3vxWAqwyseN2Q4oJhH2A5gUAePyTwxNwzA+kpC+ziKqb6yn1nmZwEi
	SjikNFRHW/Evm57GSXh1ya7mYhCn7CYyW0xJDN+2Op5YfO+jJS7fVCIJ+9e6c97fhGeW
	5huTEEcZQiNRZwmRm4L5fZvRpLFtK+66HqRDh6aX+rtK2dMwGwWUsZojlgWI6+8XhHct
	oyIcQpP9cITJaIeo1Oy1d/vmYyGkFbiU2fpibGGvgx5NkCXT3RPcNNI1D0cNsRtsSMBP
	NlZQ==
MIME-Version: 1.0
X-Received: by 10.236.15.6 with SMTP id e6mr27124018yhe.43.1408909522259; Sun,
	24 Aug 2014 12:45:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 24 Aug 2014 12:45:22 -0700 (PDT)
In-Reply-To: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
References: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
Date: Sun, 24 Aug 2014 16:45:22 -0300
X-Google-Sender-Auth: rgRINSz8ke5oBQJrO4yW3XQpKDA
Message-ID: <CAP9ODKoDCx4yHcKrfMiZr85vorRm-8fcsy6zG-r+YDxpp17bPQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Sun, 24 Aug 2014 19:45:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 4:39 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The configure script has mistakenly choose to enable iconv support,
> due host to provide it, adding '/usr/lib' to the linking flags and
> failing as:
>
> ,----[ Linking error while testing 'fork' support ]
> | conftest.c:268: warning: conflicting types for built-in function 'fork'
> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
> | collect2: ld returned 1 exit status
> `----
>
> This patch disables iconv support for native builds fixing the error.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Same error exist in Daisy.

I did the rebase here and I can send a patch for it, as it has a minor
conflict due the pkgconfig rework. Martin, do you want me to send the
patch on top of Daisy as well or do you resolve the conflict yourself?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

