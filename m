Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7B96C6BCA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 07:47:27 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so7116103pbb.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 00:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=QMqx01qMH2BWE/cFjf1pfqOLaFIJ4u2b5M3atb5Obo4=;
	b=Md4OH0H8hK9i46qb5wn4zaJ8Kd2y1JfTjPVWe8Hl9zfcZH544OcH6irfhSyxFb4hmG
	fKVJAMurzVmgPkm1fcq5bfXY9kHEsgGRJ03TIa9/vUOaAh/iR2KoxYE1NsQoT4jKQ8n6
	nAsP2CuB8UOky2Pf3H8ABrQg9dqpyhJS4ug5naHw5zMfTvqJiAMpqpO0JY7Sa57L+MMe
	m87xrWHuDERYNxUCU2sJv55u3hR7NgOCPOygod9dJwPtbEkSoU+bOCco/oWptbRPvNmN
	ms4bKH+EzVo3zBzsFngQN3+Ng4x5gtL/z5HcP6VpfwcMbej0lKghpMG8Y+h57F2cjPtD
	WdMQ==
X-Gm-Message-State: ALoCoQlfdYtN/IyIAksC6kJUyi7f/7N6aulTX+klYv44jFvruvbz6hMbps6ZvjeqioJBqDJ+ThC4
MIME-Version: 1.0
X-Received: by 10.66.192.132 with SMTP id hg4mr1832511pac.84.1378280849291;
	Wed, 04 Sep 2013 00:47:29 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 4 Sep 2013 00:47:29 -0700 (PDT)
In-Reply-To: <1377198452-1546-1-git-send-email-lpapp@kde.org>
References: <1377198452-1546-1-git-send-email-lpapp@kde.org>
Date: Wed, 4 Sep 2013 08:47:29 +0100
X-Google-Sender-Auth: Dz28vGZhdjmZvAdCiQh6CJ-v-Yg
Message-ID: <CAOMwXhMtW3qDpMr7Rcsg+16zKvn0gHTHbBHptWiDpND2dNog3A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] stunnel: Add 4.56 version
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
X-List-Received-Date: Wed, 04 Sep 2013 07:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ping?


On Thu, Aug 22, 2013 at 8:07 PM, Laszlo Papp <lpapp@kde.org> wrote:

> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14
> ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-networking/recipes-support/stunnel/
> stunnel_4.56.bb
>
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bbb/meta-networking/recipes-support/stunnel/
> stunnel_4.56.bb
> new file mode 100644
> index 0000000..0ee8cc8
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "SSL encryption wrapper between remote client and local
> (inetd-startable) or remote server."
> +SECTION = "net"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
> +DEPENDS = "openssl"
> +
> +SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
> +SRC_URI[sha256sum] =
> "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
> +
> +inherit autotools
> +
> +EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
> --
> 1.8.3.4
>
>

