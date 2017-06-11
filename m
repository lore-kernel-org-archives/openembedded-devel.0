Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3D3601D4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 16:01:14 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id v104so73507830wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D+8fEQj4Bg1igz6PHehn9LKO7LRd2L2STMIACFm5cN4=;
	b=IDCTaFCFMcK53C5KdGyXRXF1Dgp2LgGoPjgivNeM9/wiQCwlCWUDf79b1ITijKwtzy
	cwSuXEzg3lu6YVw+dQpzfHkw9D2mtIhQqY020zZ5n/OoJwBLgzXc3F5TwkCJyUi/VB+Q
	iq16Gk51OdHQG+21/NTdRDN6xHH3+2Kp1LnX17Go3fRBtwAqo4vIXn0vYB+5YI9k66uG
	RltAzwDxtZrt+ocrX4ZSj0OHMjujHWFwsTJR/GkolMWP0MvXqe5ZNrjV/6EGFQYbXdxJ
	J/XBKHRFUI9HpEjv0ftb2xXho/dVbntuIfeCigBbHwHYVOrl+EWhfrnb9CDhrgxh4wI+
	W/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D+8fEQj4Bg1igz6PHehn9LKO7LRd2L2STMIACFm5cN4=;
	b=d7l4O5nhsyucXpekZU4bZPX7GdgoKtaNCz97EKASDSIpPGYdnzNzAFrvkE+MGuGudT
	uIs+XNSPEWOKFrFo4e/fBcWjgmENSIXz2RZ5jWy/mIrt05aztoQEPhCDk/jR3VAWydqq
	VnNajaJDijrLo0ibGoIPRhKju99o0pY/t2k3G930NIGkDPSR/6+Lait+qUBmfeRNLP7g
	3eBztUWTQR3dtb5bh90brQQYWqEG4HtjMS1bgY1TBdzXqrHSX3OTQFn7fES9BHJd0wMm
	IeoKJgbmeGOJ8ebIS63yLBpZXcIWSWNeyIxCtrxCUHdNHqnHBMA3M2IF12vSjyasf9Tp
	g+Qw==
X-Gm-Message-State: AODbwcAj1tkYEjUpiFmPmvA7xgGX4Mrxj9Bo1UxNyYFB8MVEYdwvtkty
	+N+AtEVrcJa+9h6AWpMBKkCbpmO04A==
X-Received: by 10.80.144.68 with SMTP id z4mr25508038edz.143.1497196875163;
	Sun, 11 Jun 2017 09:01:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sun, 11 Jun 2017 09:00:44 -0700 (PDT)
In-Reply-To: <1497194825-16654-1-git-send-email-maryan.pricak@gmail.com>
References: <1497194825-16654-1-git-send-email-maryan.pricak@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2017 09:00:44 -0700
Message-ID: <CAMKF1soPKfwffcWP2F72xt1JCtZ+iuUwSwEZ_ka+g0Un54xh-g@mail.gmail.com>
To: Marian Pritsak <maryan.pricak@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 16:01:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 8:27 AM, Marian Pritsak <maryan.pricak@gmail.com> wrote:
> +do_install_prepend() {
> +  export PREFIX=/usr
> +  export INSTALL='cp -r'
> +}

can you explain why these changes are needed ?

