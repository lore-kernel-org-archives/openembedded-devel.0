Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnB5t-0001PO-RC
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 18:09:21 +0200
Received: by eaal1 with SMTP id l1so3572795eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2012 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JFyS8Zhscqt+kuiD/i4lYmq02B413qEBd/ZQLJT1HRw=;
	b=fFQo0LnY6OSdIenaaRphY+iIuvjLkNTQj9zzAdUTHPFZUf7yZPX0RNyQhHU7EujhX6
	TpINxEh1jKgTsAinO5TMw+mT1yHQCrHZ+r3h11OEvvf2GaxLiE4rL/YQ0um6KF4XuIHD
	iKwqqr2Fgf+5qMcwxAdWDq09+CDzutzvGo17+QQ10ZmgzbJvAexS513oQRUU97wDWwqO
	+XGgrxR2+Lv68EN8jTKmltZ7DLoubcI6Fan5/0eu33LZh07mldw12Igqg55oi2LEDZV+
	B9wteZpS5j/7UVnfKKtw+tn0n1cTt2HqVGhAY+xY86u6AOk+8b73jsnpSUAWYltaK9He
	znXA==
Received: by 10.14.99.201 with SMTP id x49mr5822658eef.142.1341590296161; Fri,
	06 Jul 2012 08:58:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 6 Jul 2012 08:57:45 -0700 (PDT)
In-Reply-To: <1341588382-17688-1-git-send-email-msm@freescale.com>
References: <1341588382-17688-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2012 08:57:45 -0700
Message-ID: <CAMKF1sofwemm9LTT5_GW5JvuXxEvro0trn_-=EmoUwDU-ASiuw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cramfs_cvs.bb: fix compile step so it can be rerun without failing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 16:09:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 6, 2012 at 8:26 AM, Matthew McClintock <msm@freescale.com> wrote:
>
>  do_compile_prepend() {
> +       unlink Makefile || true
>          ln -s GNUmakefile Makefile
>  }

why not just ln -sf ?


