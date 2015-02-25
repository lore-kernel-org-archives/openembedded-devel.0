Return-Path: <otavio.salvador@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 52F66735C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 18:30:59 +0000 (UTC)
Received: by wesq59 with SMTP id q59so5456571wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=D7/dUx1IjdoX1bQ7k/44ntptOG36uogVDno/uGdGC5o=;
	b=VFueoZEgb70+SI2xwsptKpNwouWCr2SqIiIWEhDd5sAyAuCjwxvePjmZMMx1w//lzM
	opQjKghbHqFiCgJpSbX5xXtg0HF/IciuBwYe4J5ePxL8Z5Y/peaTKluWYXO38Ubh3pgj
	ltibgB0/RvcN9v0L8rY6Dvzjwtz6sEJPkA/v0yUpylt5sHtWnynAQl/VS3o7fLYwsDti
	Rxu2GyHdhbYflGh1te58+HxrAl7CIRDZFkvmcAIwpAAIIGpOS1Y/qgbS3Tx89xF0+bZx
	D4QYopZvV/v7Lb85io8km2Q5epotI8TEFcGseW4A1iS5S3LhHMrgMie81rsx6m1/Cy6Z
	1MTw==
MIME-Version: 1.0
X-Received: by 10.180.104.3 with SMTP id ga3mr8817390wib.66.1424889059831;
	Wed, 25 Feb 2015 10:30:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.27.11.18 with HTTP; Wed, 25 Feb 2015 10:30:59 -0800 (PST)
In-Reply-To: <1424845712-34105-1-git-send-email-biannm@cn.fujitsu.com>
References: <1424845712-34105-1-git-send-email-biannm@cn.fujitsu.com>
Date: Wed, 25 Feb 2015 15:30:59 -0300
X-Google-Sender-Auth: kuUvr55LsIYKrw3twbLewSH-mVg
Message-ID: <CAP9ODKoZi_H04uOF7AiZSpU5F1T32UmFLKtNeM+Y0Vq-90v7Hg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xbitmaps: fix build warning.
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
X-List-Received-Date: Wed, 25 Feb 2015 18:30:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 3:28 AM, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
>  Can't install xbitmaps-dev-1.1.1-r0: no package provides xbitmaps = 1.1.1-r0
>
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

ALLOW_EMPTY_${PN} = "1" would be nicer I think.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

