Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF5E79559
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 17:44:52 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id r37-v6so21727689qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=53AQXOxVWEYKD96MKxyAoVsp5uDH+vy3LjyM5lHp8pM=;
	b=tKSmEX4cEvVS/A0nqrDtciRr50gW1DSPwJSa+a0BXmtYfxgD5IkzeJYR0RQuXqrzix
	rsi4+zF9FcDTkzsaJpKWWw56FD5YYXhCxkQ0frSGYPUCPq1rRaO525gSHiurHcDkLIg3
	qjStlL/sv9Z34x4Lyrfr3j6en2vOjLMpdV7riVzcWyIr7K7nGsRWIP9+TCOmKrC07b+j
	2PxO4PDHwNRaw+W7iMM5akryw1I5n4FsIqAEpT518zoP8/2T84uYdRqn8YF4YPMXHmvi
	5XOUcj82tclWKDGP3PJPG2n1ZJzlKO19yMaFATaFSiyczx5PeZWfoOWKFaW3qiAjtvpH
	1ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=53AQXOxVWEYKD96MKxyAoVsp5uDH+vy3LjyM5lHp8pM=;
	b=m8iTLVIgK5jkxxvb7Xqb1cNFZ4ghqlf4N/I76/5XTuBA4uOv7ZkqebbAXcHWbpZBPU
	MbvUwigONIBvoBH4QjxrK/gaxJdBeNxUtRCvHR/PEaQl1XPb/x1FbPc1ty/xG3sWmTES
	TjvSCW6lFfosMSbMN2HvMuabCXK/cRnprcLdQtSpTMiLgDkoMk0lHDfz0XXXihjPZ51V
	f66b53QTjwbLiTRCqH7mX3i9Okvzqf2os3whBYFQ4/MclTAwOgzKxXAB0gH3b5i/WckR
	tGGhIukG/+SrgF2hXDswqmCM7Nk8EmRYm+6SkkhiyZfIV/eWj4ZvvydQnwNXKZHYjK8a
	n+3Q==
X-Gm-Message-State: APzg51DHqoAgPNmofHMapsP7ys9XVA0lnVftO16/qr3W0FDy/BXlnpI5
	TRRb2Xot7L2UdX9N7Txe+gJYqt+oF+E/GN5Yvss=
X-Google-Smtp-Source: ANB0VdataQtesMNS8eyrgV8v+Q27KhYCCpcxIip4KjC5NGnX+56oCkIROTBljPYLyfSLtXGguA/FFKGpLoEwnxNDrg4=
X-Received: by 2002:a0c:f208:: with SMTP id
	h8-v6mr12171826qvk.55.1536515093339; 
	Sun, 09 Sep 2018 10:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.7483.1536390700.1670.openembedded-devel@lists.openembedded.org>
	<CAATN8PUr0-pam4S6CgHT3t0iKiKjyC-pmPrxS=3uosuFkO0MRQ@mail.gmail.com>
In-Reply-To: <CAATN8PUr0-pam4S6CgHT3t0iKiKjyC-pmPrxS=3uosuFkO0MRQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2018 10:44:27 -0700
Message-ID: <CAMKF1soGgYc8XBr0xNkmYxKwW3=bvuz0x_H3uAPniFjN6B839w@mail.gmail.com>
To: costamagna.gianfranco@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/5] wvstreams: Depend on openssl10 and add patch to build with openssl
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
X-List-Received-Date: Sun, 09 Sep 2018 17:44:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 9, 2018 at 10:27 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> Hello, can you please consider keeping openssl 1.1 as default and apply this patch to the package?
> https://sources.debian.org/src/wvstreams/4.6.1-14/debian/patches/wvstreams_openssl1.1.patch/
>
> We fixed in Debian this openssl incompatibility some weeks ago, nobody tested the patch deeply, I only reviewed it, but the package is in testing and Ubuntu since some days and nobody reported regressions so far.
>

Thanks for  reviewing it and the pointer. Test this out and apply it
if all is ok

> (and I really think we should try to move away from openssl10!)
>

yes me too.

> cheers,
>
> Gianfranco

