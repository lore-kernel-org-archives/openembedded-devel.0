Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF29D7853D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 14:14:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z3so17993089wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2017 06:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lMWUXlA8ZpvDUCIg69wfaPKCBk8PEEPwodgqYP5ULCk=;
	b=kZcONJguakUKIFEBMiRAkzrl5b2iKo8obrcvl/Cqx445PJf8BhUOWD9UUq4QFY1gyW
	J7hf9TwnmjBeVZfNGGjHX2EoWtYA0n0K6DQz+H/n5sWBLphd7kkigV7I281j++SJ3Qqd
	3On7ZvIaQtsDR0G/IO41slgRv7JXlSnbTyXdHEOMLk9A/o5vFpLqWhVmtnbA1Iku/hhb
	FxzvjBijVgUj/MRRhrc6FMmkhETiGfIY4ageG6UgIjXeig4H8y3bidJLgWuHMBoEjpJe
	EWD23h4rxoXooOX0y8Fyylk9l1EgBmY9tpn97JS6FCEg1USAu8EYDNQW2dTOhwDe7XMn
	KiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lMWUXlA8ZpvDUCIg69wfaPKCBk8PEEPwodgqYP5ULCk=;
	b=iFblbOK69WzQ48PS8mKEmyv9PTH/xTAzqOGqyu4mibi9CcJDcBYadcLVj49wzKt91O
	YfrHRtUj2FzMwPXjCUmpau2hTkHsafTLCcdy3k22yKVfJT+jeSeXh9uv0r4Wmwnxo6gK
	L8lC4rlawqD5ysbUzGDh8t3nHROiJSaVpfC76Hx3XgjKCVheTtbnHjHVTsG3JMXyxFTl
	7Gzj+gG8XgOJw5vu4wAdd+yvzNGX/KbU63SZvel8QLkUwDjneJE85LP71m9X57g0M+bm
	AyaxKHq4y6RJW1eW1y1lw+ri0ug0FDUXsuDgGBHzS/5S8mzHRi+dih5ngzmZwD6mrw1K
	chuw==
X-Gm-Message-State: AJaThX5xTlakADYibZZyjd3YUiVzHT0Dkh153otHWxeEWtXKdip5YaEn
	OD9vHBz80OEFloCTBLwZOsX6sOZcfX6wZtr1gI9XVA==
X-Google-Smtp-Source: ABhQp+QFf2mCDjI+s9A5wxvb3INn+CQiV2qhSOZ2Ppb2IMey2ynGV0I+BSwSrXLU4mdCtExSKsnhkDoFH2zZ6t5okko=
X-Received: by 10.28.156.67 with SMTP id f64mr14872wme.42.1510236842498; Thu,
	09 Nov 2017 06:14:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.153.49 with HTTP; Thu, 9 Nov 2017 06:14:01 -0800 (PST)
In-Reply-To: <1510208423-222002-1-git-send-email-zhixiong.chi@windriver.com>
References: <1510208423-222002-1-git-send-email-zhixiong.chi@windriver.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 9 Nov 2017 14:14:01 +0000
Message-ID: <CAPyrkgzMXTeGmX2trqXbkhGc2S5XyDrW+e_uBVi=YTwZdoiTxg@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mercurial: Upgrade to 4.4.1
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
X-List-Received-Date: Thu, 09 Nov 2017 14:14:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2017 at 6:20 AM, Zhixiong Chi <zhixiong.chi@windriver.com> w=
rote:
> * Upgrade to the latest release to fix some CVEs:
>  - CVE-2017-1000115: missing symlink check that can malicious repositorie=
s
>                      to modify files outside the repository
>  - CVE-2017-1000116: did not adequately sanitize hostnames passed to ssh,
>                      leading to possible shell-injection attacks.
>
> * For other changes please see: https://www.mercurial-scm.org/wiki/WhatsN=
ew
>
> * Update SRC_URI with the new download link
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>

I sent a similar patch a few days ago which is already staged here:
http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/master

Thanks,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

