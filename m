Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NvJZZ-0003ew-1q
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 01:08:17 +0100
Received: by pvg13 with SMTP id 13so1407780pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 17:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=eZ28XS1uOQHhnFpiUoMer2q/nGMB6BSH5zRGdqm8VFI=;
	b=B0cAoI2C9ThmXuEZerokQcia6pP4hA/exy66liHiitcYBauIEUjAOU//zYIyorMVyO
	nX3o+w72AcuGCHuIDhBB7Dq2nmW65wSKLFmdNhskGeOdJJsqZyZIENQXU4zf34ExfQwc
	v2E1NUSJuXg1613r9BBL9KIZEErDGl+FN8J5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Fhs1daaOPclHhMWzaBUYMA84IWnIzUVz+AiC3NfgeyWDgnBJEUw+vR/Urj8t2HZJZf
	+3tcSKW6J5m78qChQtGZqBbqyXNnLqppoVNVslvFOCW6MAaP7RHi1c+pWvqagahaJ9Io
	+JmoMK2Bx43NxJ0rLHkhojUTbVdSk1R1/RMIU=
MIME-Version: 1.0
Received: by 10.141.34.13 with HTTP; Fri, 26 Mar 2010 17:05:04 -0700 (PDT)
In-Reply-To: <1269556538-3020-2-git-send-email-andrea.adami@gmail.com>
References: <1269556538-3020-1-git-send-email-andrea.adami@gmail.com>
	<1269556538-3020-2-git-send-email-andrea.adami@gmail.com>
Date: Sat, 27 Mar 2010 01:05:04 +0100
Received: by 10.140.251.9 with SMTP id y9mr1670379rvh.276.1269648304392; Fri, 
	26 Mar 2010 17:05:04 -0700 (PDT)
Message-ID: <d1b08f941003261705k1f97e489wa30f59d684b69a38@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] zaurus: unbreak build of initramfs-kexecboot-image (thus others too...)
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
X-List-Received-Date: Sat, 27 Mar 2010 00:08:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please revert this bit:

-IMAGE_FSTYPES += " cpio.gz"
+IMAGE_FSTYPES = "cpio.gz"

I forgot that in stable the insane installkit is generated...and it
needs tar.gz initramfs image.

Proper solution would be to full sync zaurus-2.6.inc et co., but
personally I think we should leave it as 'memorial'.

Regards

Andrea


