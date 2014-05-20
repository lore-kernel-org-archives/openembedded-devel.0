Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (unknown [209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 382CA65FDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 16:18:12 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id l13so940252iga.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=if9zrvfZkAGo2ACBEOFPxOOsGudwnscCTeHF9dcNzaI=;
	b=x3GtRYvJJZBZvko2u5oH4QUjHRfhpCWVdeFMbq0Txhks/GuzISbxszRSAJlo2mXGhB
	3UtgQ12HpNgQPtfDX5UkYn27mFdZ5cwz/VMNLyg37h0nc8cJXzijdG/j3hbt5Wlxc/4m
	4fKfNeaLXRRwgNwkRAYf+FGw26o+ZaXtZtoQnVqWeepc0AX+a0JK0/SO1t1VPkT/jtWP
	IAKPv6AZ0y2L8fyWVHPS0kWbQh0mm04n9z/iB80c2Xi+tWo2Klt5rf3OPRKoLMHy4t8L
	K8dN92kRP5cN1IbH2NkqXFandzsZ3RsFdEkurdPcf/S5kHP0m9k4hKwdkXynJS/rE+WU
	iP8w==
X-Received: by 10.43.62.204 with SMTP id xb12mr41061852icb.51.1400602693961;
	Tue, 20 May 2014 09:18:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Tue, 20 May 2014 09:17:43 -0700 (PDT)
In-Reply-To: <1400590576-21418-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400590576-21418-1-git-send-email-Matthieu.Crapet@ingenico.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2014 09:17:43 -0700
Message-ID: <CAMKF1sqfoiANL7jcnVA3Q7sWz8mzjcUfkCNE5FxQFweWd905Rw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] faac: fix S!=B failure
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
X-List-Received-Date: Tue, 20 May 2014 16:18:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 20, 2014 at 5:56 AM, Matthieu Crapet
<Matthieu.Crapet@ingenico.com> wrote:
> -SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BPN}-${PV}.tar.gz \
> +SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
>             file://build-fix.patch"
>
>  SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
>  SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
>
> -PACKAGES =+ "lib${PN} lib${PN}-dev"
> +PACKAGES =+ "lib${BPN} lib${BPN}-dev"

these changes should be mentioned in commit message too.

