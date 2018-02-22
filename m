Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5A25071A60
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 07:51:46 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id f11so3834670otj.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 23:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=q9zIB1gSFkfmfoMXqATXbWYZ26nNEoTQz0d9Sx+Nxhw=;
	b=i73zpe4ESPpem/a6bERp6T8GgFU2ek80+/w3W/0bu/tXcG1BKeRyoEf5ZPeZ1BBdtN
	+Ecc1Pr+qZMDXtb/4K9ZGoLQJRuXjEUSfA27fjOFNKzgmlUq12bETuxfQ0A9vtDF+rLH
	Fxl69/WEjB3seVxVDiPOMuInoXzP3+ma4IXP1zJnGYDmi7JvUW6suXQ0TzBrK7XC1u0T
	rwNGwME7EH8D9lPToiIVPq/DY+4KTl/CNWf41x3rKyjM2j00jtbsM3Dqm+YtoZ5B5OMg
	fOeAJEPjIB6RUK4hKfV3YMeVlFDT0MCvNrrtQOtOR7fN7lXp5nXWCJSqBvVDW3qWCR54
	NtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=q9zIB1gSFkfmfoMXqATXbWYZ26nNEoTQz0d9Sx+Nxhw=;
	b=MUQLJUgQ6a18VdLXVAnJexRY/bzY8ruy3q4W6mL9Smx6lp1d82E9gP0BvfBBMbch8K
	3Q53sKP34s7dZsq5uOCoQSdT312K+wfIDL4+afqJnAJCxnaH7XddTkpv4MnBnypk/TY+
	NzD2Rs/zszhOCXVI/qkKHwwP5Ep8qkgHGeNSGfXRZ393MUnmvzvQsyq+y+Km2PgQ0Iag
	H+pr7AgnnxlHTskxxOV/tgmfUpLGeyoNZmWxTtuxiEtqteza8c979xdaOczgI4Bhe6qI
	BJ3Yw8yVoRlmNJblemcAP52r+3YFN26kaUosnqJYgXN5W1NdOQ4agNYnk+d9wV5XkN6b
	C15g==
X-Gm-Message-State: APf1xPAD7bCCSM0J7S9U9tW+W3uasj3sZuOs3IDeGU9gcJLHs5jYp1UX
	w0Cp0gMkttOeBy4UxP/qnAm1r3nl
X-Google-Smtp-Source: AG47ELs96lAX23Fs+Q4hVuyFaF3rTIop3XN9ukumylpl15Zd/p2wr4s86/DkvWEZAvfId19+8+DveQ==
X-Received: by 10.157.68.57 with SMTP id u54mr4185900ote.67.1519285907946;
	Wed, 21 Feb 2018 23:51:47 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176]) by smtp.gmail.com with ESMTPSA id
	c2sm14766837oia.10.2018.02.21.23.51.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 23:51:46 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id f18so3845797otf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 23:51:46 -0800 (PST)
X-Received: by 10.157.32.13 with SMTP id n13mr4240155ota.35.1519285906205;
	Wed, 21 Feb 2018 23:51:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Wed, 21 Feb 2018 23:51:45 -0800 (PST)
In-Reply-To: <bd62279e-5896-e416-7768-f52552752b46@xilinx.com>
References: <20180221192129.2759-1-otavio@ossystems.com.br>
	<20180221192129.2759-2-otavio@ossystems.com.br>
	<bd62279e-5896-e416-7768-f52552752b46@xilinx.com>
Date: Thu, 22 Feb 2018 04:51:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrdfLwf4kRDwDBD3RDRe2rhGoY1-NJK_r_GtrgTyri6Mw@mail.gmail.com>
Message-ID: <CAP9ODKrdfLwf4kRDwDBD3RDRe2rhGoY1-NJK_r_GtrgTyri6Mw@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RESEND meta-python PATCH 2/2] python3-requests: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Thu, 22 Feb 2018 07:51:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 6:48 PM, Alejandro Enedino Hernandez Samaniego
<alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
> Just to clarify that the misc package wasnt removed, it still exists, but
> with the rework
>
> selectors was put on core, so your patch is fine, but what was removed was
> the
>
> dependency on misc, not the package itself, just a technicality.

Sent a v2. Thanks for the review :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

