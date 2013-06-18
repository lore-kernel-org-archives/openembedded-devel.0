Return-Path: <net147@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4111C60071
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:35:06 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id ib11so2711612vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xUnjoXrNl1I6ZtPNEQ7Reb6AEQfUXB/GcdLNC8+a29c=;
	b=SQh+SpyzKL4YV7qqRwe1uCJR9gx2w93Qcw+OOEDmJnhdDXbOOBJo63XWa1Q7EYPK2x
	W6bUjr8Spo3KvNydhqGaRq34NPF6iyPjH9vvaF5Mh3/0WUZR2GxB2YcxH/1v4MmuIfEz
	Qapy0nzn7jzFDhCjNBQFDGUIKwzn3hYWyygQ2CtqrhhNRBbsaCYEsd5H1RC+raaa3ULm
	msgpe6tBCGfCmlrOiwHWTOtrnH7kLyV9gGiyxlI3aassKqZex9DTqq5XIAaF3DbrNhp8
	84g2KMXfmn5s1n1rZ7YjqyI5pWxCg2VmlBLH9N6Eqb3o2W4sGVyXN5GBNstbEAuv7TvF
	HSAw==
MIME-Version: 1.0
X-Received: by 10.220.169.146 with SMTP id z18mr4835158vcy.80.1371540907115;
	Tue, 18 Jun 2013 00:35:07 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Tue, 18 Jun 2013 00:35:07 -0700 (PDT)
In-Reply-To: <1371541531-3744-1-git-send-email-net147@gmail.com>
References: <1371541531-3744-1-git-send-email-net147@gmail.com>
Date: Tue, 18 Jun 2013 17:35:07 +1000
Message-ID: <CANwerB0pc0vOXYn6feQwGoe3J8Qg_5YbDcCO-QtSxWDd28ZRWQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] cyrus-sasl: move plugin *.so symbolic links to cyrus-sasl package
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
X-List-Received-Date: Tue, 18 Jun 2013 07:35:06 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 17:45, Jonathan Liu <net147@gmail.com> wrote:
> From: Jonathan Liu <jon@zydex.com>
>
> The Cyrus SASL plugins are loaded without their version number so the
> plugin *.so symbolic links need to be placed in the cyrus-sasl package
> rather than the cyrus-sasl-dev package.
>
> Signed-off-by: Jonathan Liu <jon@zydex.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Wrong email. Please use my patch from gmail.com.

Regards,
Jonathan

