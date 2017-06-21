Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 64B9077E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 18:37:47 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id s9so3373901ybe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pohdCeX77fWQG0atqbQMbXDTnT6WXdWFsxTAsP33L3Y=;
	b=IgRpIpJwmmlW/AB5tMvAoJLEk1x3Ww5GLOiwsIHG/39+zwKhjxRKwUplLUrmpZcY1k
	Oe/wIymzwWmfoBG5b6K4NXdWm4hwzCp6Xn+thXEXC26u/AM3CiUKrgcAvL6LRIqX7iEd
	FMU/qy4PhbTUuSDkcOWTBK0cQpQtxQl8DRbC05SsM2IsYI9zlMZQPci6F/QAf4Rh/+Ju
	SPgQjO/eYeA+NMF8P1Nc9YIKalyAUtXqp5b3g6vjSQ3CZRjO/iD4xyF/ZW1QL6sFfYZO
	YuPazfYpVvTn5ao3dL5DAwIRcOSQwWrqEliSxPw5GSmTjdTzC1C25fnB1k9Hcs7H/dOU
	+lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pohdCeX77fWQG0atqbQMbXDTnT6WXdWFsxTAsP33L3Y=;
	b=tB/WRNyPcJee7W34KzNzZJIJOoVC20I2PPBE7L6FJC1SregrhR33id/nu6i0aJBCc8
	nU3fuC+5hAn0tWZ0DHi8k0EwooAEFTVSe057gGBAGaGjrq8Is904snzMcEjqZdgfJeCY
	kGLhDiDmoseNP9rRWhjRSahdLAPmStNeiK8um+fFp1OH7Ezb8Et5Mxvma54ldf85T5l+
	I5i65kQv9MHfEdKVKXdujm9XF/xq4RBAQntsQ+wT4LCcjM77Hot3OmDAL8BmCqsf0h8d
	JOnsXG6FzovArmVrmwSnD18FVFa48UXvxVU9E9bsqKK8/GO2GN1NJuHJKcdjP71ICHGz
	bY/g==
X-Gm-Message-State: AKS2vOxXZu9hkIGkIBIVG/6yw4woqv/abkowzuNHmC25EBK9KOi3jM7B
	hFPLdIEScp+t+PW/f8m5pWnYvqPmGA==
X-Received: by 10.37.178.4 with SMTP id i4mr10241339ybj.147.1498070268979;
	Wed, 21 Jun 2017 11:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Wed, 21 Jun 2017 11:37:48 -0700 (PDT)
In-Reply-To: <CAKmWj-1-sXNeNBJpO1uzF+8q7sFjS3XO4m=hQL3CDa10T2H99w@mail.gmail.com>
References: <CAKmWj-1-sXNeNBJpO1uzF+8q7sFjS3XO4m=hQL3CDa10T2H99w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Jun 2017 20:37:48 +0200
Message-ID: <CA+chaQe1aL95ioVkxrfaWvDz9LuyAJhr62gPiwt1caXgMatmqg@mail.gmail.com>
To: Paul Knopf <pauldotknopf@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 nothing provides qtdeclarative-plugins
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
X-List-Received-Date: Wed, 21 Jun 2017 18:37:49 -0000
Content-Type: text/plain; charset="UTF-8"

My guess is that you're missing a few qtbase PACKAGECONFIGs.

On Wed, Jun 21, 2017 at 8:15 PM, Paul Knopf <pauldotknopf@gmail.com> wrote:

> When I try to use "packagegroup-qt5-qtcreator-debug", I get this error.
>
> nothing provides qtdeclarative-plugins needed by
> packagegroup-qt5-qtcreator-debug-1.0-r0.noarch
>
> I am using poky/pyro, with meta-qt5/master
> (3ae86cb32edd1449f702e0a094929ae9b21ce191).
>
> I checked the build/workspace directory for this recipe, and indeed, no
> files are being put into the qtdeclarative-plugins package. The build
> directory contains no plugins directory.
>
> I checked the morty branch and some "plugins/qmltooling/libqmldbg_*".so"
> files were being placed inside of the "qtdeclarative-plugins" package.
>
> Does the "packagegroup-qt5-qtcreator-debug" need to remove the
> "qtdeclarative-plugins" dependency, or does the qtdeclarative recipe need
> to be fixes to include plugins in the build output?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

