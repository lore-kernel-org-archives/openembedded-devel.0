Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6551660557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:12:16 +0000 (UTC)
Received: by igfj19 with SMTP id j19so21319347igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Xa6yCPVwmI5esbfttnjrOWKsjwWVGR1zXeNLIN2bi7U=;
	b=TP3qDxv1Z4Qwt2cssJsW0/gSKBK3d212S7CGvbEjLa0jnDDY4Uvb13+VobwF5YSEAU
	GKKPvdigwG37va+SCvBqozrHYn/VVIna5Mr2NiPSnzmEt+77MnM7MNkrtdkAxAiqB7BB
	Px6PDHSxr5k3eS6lSKKARS/wpu5hljJyDFw9r5wPoK6YBYZn9LYb6E0NHUMdbEh95LeP
	uRyeVoe+YCnjPXLtOb0+I6lAecjy7SBILWBGVFRlg8gTpkRL2VNM9CfY/Kv8zCt6lX5L
	xGfL6hloEOd90ndk/H3AnbTmL7ahX1KT9/dgxPwnc+annv51zbOEu9/Hmuk/t1zR9z9Z
	9EEg==
X-Received: by 10.50.93.102 with SMTP id ct6mr2883418igb.75.1440173536578;
	Fri, 21 Aug 2015 09:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 09:11:47 -0700 (PDT)
In-Reply-To: <1440151198-47613-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1440151198-47613-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 09:11:47 -0700
Message-ID: <CAMKF1sqHy4aVmiY_VcpxM+=0xMw4P5OFocngvV_YeERfHoj6Sg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openwsman: modified SRC_URI to git
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
X-List-Received-Date: Fri, 21 Aug 2015 16:12:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 2:59 AM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> -SRC_URI = "https://github.com/Openwsman/openwsman/archive/v${PV}.tar.gz \
> +SRCREV = "f523bf1390c7ea23946bb9159978a4d7c198f1ba"
> +PV = "2.6.0"
> +

why redefine PV to same value otherwise computed by bitbake?

