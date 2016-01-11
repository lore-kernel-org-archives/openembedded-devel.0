Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCB06FF7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:47:32 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id t15so102134662igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=O3LozgnmFXO8wUQ1iPowhmAmHdqTUgsidslW8emnOzI=;
	b=WFwmrvgiHHQ9EqzB/FWALLrn1HMBtFqQmT5ynU0KrUt44zh/3P/8HpkiVpW5Z2BGVa
	0M7U+UQlhILTySY9eFndH7aj6p1gcdQ8iTY7OGXn17JgJvKLaT0AejTkzSoX5r8sn7kF
	hhSm7hvT3oTcVhQJokNIVjyUe1bgIE3Ki5Pl30I8JTozrSLh5i82lPWdKTJmmRrhees6
	Tm5mufhsLVpu1GEnL/LrOeoH2OQXTfaZ7aZyToSrY1v2ysZxoTd1PDaY5m7OHh5E4mXk
	mg53cTPQV6l9rnSGsoF30Zg4emJB0LAECOyqnyhjv/Q64nO9wNhKgxDyQf4phhwHv7P5
	q8dg==
X-Received: by 10.50.141.226 with SMTP id rr2mr12090196igb.75.1452538053772;
	Mon, 11 Jan 2016 10:47:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 11 Jan 2016 10:47:04 -0800 (PST)
In-Reply-To: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jan 2016 10:47:04 -0800
Message-ID: <CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Mon, 11 Jan 2016 18:47:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> error: expected identifier before '*' token
> |   return bt_get_unaligned((const uint64_t *) ptr);

this means that stdint.h is missing from includes.

