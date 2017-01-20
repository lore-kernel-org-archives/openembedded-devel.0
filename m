Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id DB07071DEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 02:07:38 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 65so6196947otq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 18:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=aByg4MQ2i9UbGb9U1jsq+BekEhP751KA47sPEFLxPaw=;
	b=vR30B9kfzAf86ITG38iobxQWWbu8/iOt+FtYhrRe1YKlwgDqWw4WQ0KGUPxOZkQaH1
	yhlQGuMWPNRtSIBxI+l7spn4XqzxFWczzXU0PIptt4/PR0FtyPjW+ItmwuZBdw9Q0bTv
	BGI8WwZXS5Mt6ekUKetgdn1b23kqX4t0JLSRgRVvp9zVoevYXGPplXBCt631p8zXANt/
	1CIYLxOrmyFSBrtP0A5Xia+eseLjxOF6tqj0n7qHGlPCNMkftwZb490AN/TOlLGeCywP
	I/6eWajXrwXP5wBaZMHctf9VUlkUrXQuGvFTHIbQS2EehHDM5G3bBjp1lNby3AQcraOb
	sn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=aByg4MQ2i9UbGb9U1jsq+BekEhP751KA47sPEFLxPaw=;
	b=j7mIS1yqnESseKnConMZQFNmHbZBrK6pwTkoi3zBFJsoW35J4PtLVYYB8APF73C2qD
	yTwwzqH2Sl5s9GDAqG/nHqgORy4kQoFNpxuuemJB3bd48LgvNEqDdWBvzkYmEk5R/xLd
	zZcO3bRJ+5kgu2GGpNfOejmQk98HEoCY2uhqMWlm3rmpnywi5fAagUmzCHYWxusAX3jv
	0ndA2ViwaaY+fl3bJewrFjg04tMIhnvODf5rbOJvhT5MzuDsPUxfEE0rkttrhgOxVu4/
	x98obkoOF0xtf3djb1nQPN0afapXVdooSuN+cdQTwEQZmrbQar7F5r9Z9g+tqJE4/EmA
	SVrg==
X-Gm-Message-State: AIkVDXIiNgcqDGpdaBqMQTrhEWKHpOmJqhNjHKe9ghMHOpw1mFNWAhBdQU3Q4n1k4vHj3/zVtLBfaI/QwLfXfA==
X-Received: by 10.157.44.153 with SMTP id p25mr5472730otb.27.1484878058751;
	Thu, 19 Jan 2017 18:07:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.5.8 with HTTP; Thu, 19 Jan 2017 18:07:18 -0800 (PST)
In-Reply-To: <20170120001516.1625-1-marex@denx.de>
References: <20170120001516.1625-1-marex@denx.de>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 19 Jan 2017 19:07:18 -0700
X-Google-Sender-Auth: JvkhWWu2vxrlZ3jL-so9y7rKnPw
Message-ID: <CABcZANnpob1SagRbdCuAo7Uy=uZeqgYvTAfna_ZTC4g2hv1Wcg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2] picocom: Fix build
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
X-List-Received-Date: Fri, 20 Jan 2017 02:07:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2017 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:

> The picocom complains about missing GNU_HASH from the binary during
> QA stage, this is because the picocom Makefile overrides CPPFLAGS,
> CFLAGS and LDFLAGS. Fix this by passing those as an argument to make.
> Moreover, since picocom 1.7 now accepts VERSION variable and the
> UUCP_LOCK_DIR is set to /var/lock by default, drop the CPPFLAGS
> override altogether and replace it simply with passing VERSION
> argument to make to precisely retain the original intention.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> V2: Use EXTRA_OEMAKE instead of custom do_configure
> ---
>  meta-oe/recipes-support/picocom/picocom_1.7.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> b/meta-oe/recipes-support/picocom/picocom_1.7.bb
> index dbee65609..ca0b8f419 100644
> --- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
> @@ -9,7 +9,8 @@ SRC_URI = "http://picocom.googlecode.
> com/files/picocom-${PV}.tar.gz"
>  SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
>  SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9
> a2348c89e02a84935517002b3bc2c1129e"
>
> -CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\"
> -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
> +EXTRA_OEMAKE_append = "'CC=${CC}' 'LD=${LD}' 'VERSION=${PV}' \


I'd suggest ditching the pointless _append while you're at it (just use =
or +=). Besides, the use of _append was missing a space separator, so the
CC wouldn't be obeyed.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

