Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id EB95B7526F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:01:36 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id k190-v6so17209005oib.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 00:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sIhn4TZF7yF34Dxgt4RvmErCD8QIqDBpE93MQsJ3Hn4=;
	b=ROX2SiyORbOOqDo/m8pDoDdCq/u58NWN0rYPf4pxXBJuKnXeaXEKWYUNF2eZD5ETTr
	I83lbxOLTOnyISKAhN6pNuSDGVuUxQ59YrP97uGqCLrvmiURPOZzgcMO/qLe//niZAnV
	y28q9NYbLeUkqI9CLA6hMvC74ZFKshL2OtxKPEYybVKSbcJRxfYcYfk9PD/o3hkuWC9O
	JRBNiUPA0A9t2dO/nNCfL/MlD7+UtLuPNKcVunnbmXNycDKb2S7V/i24i9Ca/MJaQ+D9
	tjtuKwZSt+2mTCMq1NlZOgrd//YMz5tY2gKIm8joEuJ+LVjh7Jk/d9SyCsc13UAAfcMS
	h1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sIhn4TZF7yF34Dxgt4RvmErCD8QIqDBpE93MQsJ3Hn4=;
	b=NdE9klhnXkxp2tdmymONPw1gcRkyarNsZ2Qd1vxJQe9RUnYkwslK/VR6cUQDiucqEF
	Ejl+xp+jmnmtgEwSs5KpTS08HpkwVvXss+biDc44kRb4Xl6VUZZcaXrO72qIWXSHXjiA
	dolOaUPHkJeBa9AGFIW3ON8WOxN9Q6AoYi8Tez/fblquLo3VX/2RtZVKsvJs9FVn3QJh
	axx+suufl/tftTJkrViEosDAWxffa02TCBr4rPgXiMO3jkSarK7IryOcaTXTiGt1Kzdw
	mD+yD24T9PVPLsRA7J2nAq8XUD4JXLIUB/SQXK0d8foj2T57kVqlJlcsEIyAN4nBRLx1
	ja+Q==
X-Gm-Message-State: APt69E2SfKk+yoz1R2Xg3q8SY/waRuz2kwY1/fwhItnAHjuzvYC2YQTb
	JERYXCy7qzmmiMGwpetiWrCwvYr+H7g/B4QrdOY=
X-Google-Smtp-Source: ADUXVKJdpe6R0ofoTTqd+3iko63yTS4We2OUi/1KsZ0Ag6X8gKPhg8vH0W/VxJf4EOg5A9HhUWYG21X4KXQenX+WMUU=
X-Received: by 2002:aca:55c6:: with SMTP id
	j189-v6mr8117025oib.53.1529391697867; 
	Tue, 19 Jun 2018 00:01:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 00:01:36
	-0700 (PDT)
In-Reply-To: <1529364363-19274-1-git-send-email-mark.asselstine@windriver.com>
References: <1529364363-19274-1-git-send-email-mark.asselstine@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 19 Jun 2018 09:01:36 +0200
Message-ID: <CALbNGRSMthmYSCx4J1-d_pht5yNT=5ycUV_1xqE+SPZ0yzePpg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4: package libtool files if they are installed
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
X-List-Received-Date: Tue, 19 Jun 2018 07:01:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 1:26 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> This is a partial revert of commit 2ad5ceafa53f [various classes
> recipes: Remove FILES entries for dbg/dev packages] to restore the
> packaging of libtool (.la) files. It is generally recommended to
> include 'remove-libtool' in your distro features to purge libtool
> files as a do_install postfunc for all recipes, as is the documented
> recommendation for handling of libtool files (unless the .la have been
> determined to be absolutely necessary, in which case a recipe can use
> the REMOVE_LIBTOOL_LA to prevent the cleanup). However, if the
> 'remove-libtool' distro feature is not specified we need to ensure
> that if after a recipe completes do_install() and there are libtool
> files present in the image, we must package them or we will hit
> 'installed-vs-shipped' QA issues.
>
> NOTE: that even with respect to libtool files this is not a 1:1
> partial revert of commit 2ad5ceafa53f, adjustments are made according
> to the current state of the build today.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> This is follow up to my original patch submission
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-June/1188=
96.html
>
> As the discussion concludes we need to ensure that using the
> 'remove-libtool' distro feature is in fact optional and that means
> either libtool files that are 'installed' must be packaged or deleted,
> the former being the preferred.
>
I think this is the best compromise currently - Thanks

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

