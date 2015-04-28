Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6771C727E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:00:48 +0000 (UTC)
Received: by iget9 with SMTP id t9so86127005ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=KtyLyNtFGL+LqegVCRx+fWaKWYniZ88Ks7+KPgZppBQ=;
	b=Gw84no+VWtxzikHhhRIAgjYh3vUA2q3ld1/z6YnRXKIPJA/eHFc9+uu+ykOo05hOXC
	kN7K8VGaC0WDqWQApfzhbIP0iBXEWnNnr8o8G0F+5zdUnsqPdA8GQGnNcguD70YWUy8N
	TTDma5i3NGU6K4iGt0I9BilN3ayITWq9x6RLS/1yMALr6Z5m+3i+Rh23CVvWzafwK23q
	8Su43zexPrJMDbjDi4CyHhU3oRfpSGUlOqatwFOeWs6059oX2aQ2TaJA8YunIheLcW9D
	igWVuGnwjfYe49/9g5TqYF8JYFh49COLgiVlUImX4Z2G25+/Vg19UnJHiiOwRrQdqr9S
	ZXWg==
MIME-Version: 1.0
X-Received: by 10.107.33.21 with SMTP id h21mr20249184ioh.1.1430218849698;
	Tue, 28 Apr 2015 04:00:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Tue, 28 Apr 2015 04:00:49 -0700 (PDT)
In-Reply-To: <1430198723-7927-1-git-send-email-b40290@freescale.com>
References: <1430198723-7927-1-git-send-email-b40290@freescale.com>
Date: Tue, 28 Apr 2015 08:00:49 -0300
X-Google-Sender-Auth: TVO5Xhi3-QriFo_kJg1kT5ajDFw
Message-ID: <CAP9ODKpqxGuYYWndomz2VdVrKSm6RonyJKR6O_goXWQAg+kkvA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>, chun guo <b40290@freescale.com>
Subject: Re: [meta-networking][fido][PATCH] lmsensors-config: fix a warning about not existant S
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
X-List-Received-Date: Tue, 28 Apr 2015 11:00:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 2:25 AM,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>   Set the S variable to $WORKDIR to remove the warning about S being not existant
>   (which is true for this package, since there are no original sources for it).
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

This is exactly the same commit:
addfb0b786c90333a70873bb715d84c97412b3c9 so instead of redoing it, you
should cherry-pick it.

Martin, please cherry-pick addfb0b786c90333a70873bb715d84c97412b3c9
and 4a4b9d25db86111872c73daaa2116addfb3d26e1

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

