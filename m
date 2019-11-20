Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id DFFC760234
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:39:49 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p20so29162380qtq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7nJy4WsSlE1i854Z3wyF46oAnI9dPo7/DpEYsqld8/s=;
	b=pUCbCRjMyHsQ6pYl5KBZLiNzg6htL+hEkUGiDdIVAfrwlb/EsuR7wnCLeYsIpAJwAD
	y3Jrc61qdfNx204vDKbggs/Myeh5W2vNeQ1smCbEE0qISaXVsqDdq5Yzvyco31RsOzLw
	Dk60cWHfRyT/OSenKFPlKCo6+P2tzjcy8kwAdz1l2LxK2Whj6PC2fRbrj/f9xTsiPy7k
	lpwpp/HNp/jw66EIkDWb5PIylo5TV8YgHLgsyiJzxXoATIacqs10ESySsFpHYgouQHLX
	40K6OT78DKABlPoATSl/wwcHRfUZvWZ6UkniV61/wdtajqntXNZ5sD/m5448Sk2Vzvqn
	ZCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7nJy4WsSlE1i854Z3wyF46oAnI9dPo7/DpEYsqld8/s=;
	b=Cq/Y+yciZxhZ2RTa1BkpzUCJNhhJcuiPn1753Eh7C/daSwpOqADmG4ricuQfVoqxpp
	1Tqlgn4GFxFM20Cgn2fgFbbCIIrVLl581vWOZw8h44xgKkQa6lm0dOwKoC7g0ogcggGk
	gFZSwfQFPM1Qv+I6v5njlHfwcHFNaKf5o54Q8KyV07uqCANQKKrWGhZJm60AIYBqvOPx
	ugxTrXKT/+TKesUTgo4iaV79mD8qovyeFsoLsUhye4/XbACPXvMOoVzes70yjwWZjXwS
	yXkI3B3MfzvS/B2Ntt3PG9qpRSoGMICcN5cTNzpsKyAEdf59PPj7Lo3Tc2SwFZeMIHIN
	4aPQ==
X-Gm-Message-State: APjAAAULeZnBNAYKKicVDLqtNZyfi4uVBZdPGmHIJDEqGoEtr03jGtJK
	7Bk3zDePK+7BT1wc2kWirNwoYv/YRxH4/JxkAUg=
X-Google-Smtp-Source: APXvYqw/0PZ8tWY1n88aEpEBZQu/CR+RE8lq4UqLkwkVSv65WfyfF4XbPqVpv0IU+6sm0Rl8U4eyMqNSsOLObtT2nXY=
X-Received: by 2002:aed:2724:: with SMTP id n33mr2899628qtd.194.1574260790517; 
	Wed, 20 Nov 2019 06:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20191119154539.22200-1-pdmorrow@gmail.com>
In-Reply-To: <20191119154539.22200-1-pdmorrow@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2019 06:39:23 -0800
Message-ID: <CAMKF1sqkHJK9gv-=TrCV=HSTwbdS7WC1G6jSReVxQtj_ZHyZuA@mail.gmail.com>
To: pdmorrow@gmail.com
Cc: Peter Morrow <peter.morrow@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] chrony: install chrony-wait.service
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
X-List-Received-Date: Wed, 20 Nov 2019 14:39:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 19, 2019 at 7:46 AM <pdmorrow@gmail.com> wrote:
>
> From: Peter Morrow <peter.morrow@microsoft.com>
>
> Any systemd service which needs to wait on ntp synchronization before
> starting can order themselves after chrony-wait.service.  It's useful
> to install this service as part of the recipe as it saves needing to
> install it via a bbappend file.  Note that even if the service is
> installed no start up delay is introduced unless another service
> orders itself after the systemd target time-sync.target.
>
> Signed-off-by: Peter Morrow <peter.morrow@microsoft.com>
> ---
>  meta-networking/recipes-support/chrony/chrony_3.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-support/chrony/chrony_3.5.bb b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> index 7c6356d26..fa11c443e 100644
> --- a/meta-networking/recipes-support/chrony/chrony_3.5.bb
> +++ b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> @@ -103,6 +103,9 @@ do_install() {
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
>
> +    # systemd chronyd synchronization unit configuration file
> +    install -m 0644 ${S}/examples/chrony-wait.service ${D}${systemd_unitdir}/system/
> +

thiis needs to be packages as well something like

FILES_${PN} = "${systemd_unitdir}/system/"
> +
>      # Variable data (for drift and/or rtc file)
>      install -d ${D}${localstatedir}/lib/chrony
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

