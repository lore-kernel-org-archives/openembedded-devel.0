Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C98E07385B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:22:32 +0000 (UTC)
Received: by wevm14 with SMTP id m14so32292508wev.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 02:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=t7W8AD0Qi4uZ1dQlfe0Qhg4uEgDDq5zRqGLtLbxsgqw=;
	b=Id6BAE15GY83N8WErKmR/OuiovLfxUXXffKFSp93c4c/KMRpK1Rk36hce175nZI7pC
	4lEkIoN12jAhTgy56oQIQ2M9yDIVP+rqIoE5MTjFB50PaZgRiE1s4siuNCQ6Xw+0Ljn6
	NElAvI3AB96lI1WWlrFGFCWf7PlR2h/G7BecCBuBbSc25pQVSGuxccV4qtkD3W1SIFCI
	C5frLob/PWRnca2Rl3LEON3VsqGnVyAyNM5XjQJBnp7wp3QnrYcF/g1G/lqakqAKRZgw
	5TIQGciMP5VeU7bnTVgqh7g6vNJOA0PZTBBZG18gF7ka6n5xMFr16f+lbcfkTtXGmf8w
	L3lQ==
X-Gm-Message-State: ALoCoQnpJjvajOex7/3myFedhzl7/e+54QTvWdP8S7XghWrgXd4Ceot0oKRussirrCAJ7oSdG3Ra
X-Received: by 10.180.198.101 with SMTP id jb5mr33409436wic.92.1425291753739; 
	Mon, 02 Mar 2015 02:22:33 -0800 (PST)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	md8sm15398435wic.13.2015.03.02.02.22.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 02:22:32 -0800 (PST)
Message-ID: <54F439E6.3010906@dominion.thruhere.net>
Date: Mon, 02 Mar 2015 11:22:30 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1425283365-19326-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1425283365-19326-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: import recipe from meta-luneos
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
X-List-Received-Date: Mon, 02 Mar 2015 10:22:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 02-03-15 om 09:02:
> * useful to run our qemu* builds inside VirtualBox
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../vboxguestdrivers/Makefile.utils                | 43 ++++++++++++++ 
> .../vboxguestdrivers/vboxguestdrivers_4.3.22.bb    | 65
> ++++++++++++++++++++++

> +PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf
> kernel-module-vboxvideo" +RDEPENDS_${PN} += "kernel-module-vboxguest
> kernel-module-vboxsf kernel-module-vboxvideo"

Please don't ever RDEPEND on kernel modules, even when the recipe will build
them, it sets a bad precedent.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU9DnmMkyGM64RGpERAu+jAJ92mQgg4UU7QBoaClZcMsh7Bd/8+wCggBRt
iXq6vplV1z4aJMxG2xY9+nk=
=SREn
-----END PGP SIGNATURE-----

