Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id B4F7560110
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 18:48:52 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id t13so21701381qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 10:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OQHo5HroVLhAcQ12TnGKyNIi5L+uef8nxlRn9AeWXPY=;
	b=m0ZJD1JmIqeUNUQ8bgxKTxixu1Ofch32TfoXrkaLNc22kFbtZYLDF9+qy3doZLvtda
	goi0cWQI47ZiPqD5vI6ETD7mI5GJWxEHrZVXZFbYNq59Er56Q2iBc2U2bgFDUyTantLY
	c6rimCybF8c+8kKwIcDAHQGx14ZhCTlZYx5Zj6+OWSbPVQfIcGQdjKoZmSetqSbXnwvY
	CmYfVb7uEXVoaojT9ZJ2sbXknRkP5t58Wsa+6Q9cU9gFPOvQVAziQJofyaB8CBzsTrd8
	bMt7O2QEQwlW+ZdWwoZ78b1kyWoFHeqj99S30qA6eqqdSvrmR68omGmtY2qTxxFDVDCK
	p3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OQHo5HroVLhAcQ12TnGKyNIi5L+uef8nxlRn9AeWXPY=;
	b=htagfU5JiWeelX5N+V/8AtGC003/w02eX0gqUlXhcScg7f8MmpkOPVtN3sqaEjMAAb
	XDIm+RMOVfqdF4JLq1wqCUtmWX22GiG6C+ZQ2wkQDu2DdgaGHdManEahJfIzaZS06bRE
	4FU7e1VV5RwdNRGi+y3aDBQcMcVA5Eqy2uv6qxl/eWaVSfmkT+iTrg06+dSI8fIR8c3E
	r15KFHpOSXQWqgfpjwNURG114xRFAOPmSKJcIYRyJ0LIhfzFXA4UBMIXapVITUt7lbja
	QnWis+1kk4MKI3kwL1iZAR5Dkabkc48xaR7Uw6RoabGoJB2mU3CizapaEVUCnTOjqz2/
	j0Ew==
X-Gm-Message-State: AA+aEWYlBTNRHnOHHRvl+Tma3zjbq2JTML6aU8aMiz1I9l/ladUUSqra
	/VhahJ6oGsadYFXcKKU0CUr4IDtWAKsA/mhZKkk=
X-Google-Smtp-Source: AFSGD/UmdAvSywYhJx6KDIEoaUj9tjRd9+mtBiWyO+fvWLY4aT2cyam/KF7zEcKv0X8znKvekbKdEn4pGY3acgQzF/s=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr20909494qtf.196.1544640533395;
	Wed, 12 Dec 2018 10:48:53 -0800 (PST)
MIME-Version: 1.0
References: <3045fc0b-288e-322f-e4eb-d6ff637abf2f@linuxfoundation.org>
In-Reply-To: <3045fc0b-288e-322f-e4eb-d6ff637abf2f@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Dec 2018 10:48:42 -0800
Message-ID: <CAMKF1sqqSqzXoEYO==L6t_3t6BEHFsUC75Tv9H-2pHdmv-7mtg@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Shall we remove bad-checksum files on http://sources.openembedded.org/?
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
X-List-Received-Date: Wed, 12 Dec 2018 18:48:52 -0000
Content-Type: text/plain; charset="UTF-8"

Yes they serve no purpose deleting them is in order

I should also check the Jenkins job to ignore them

On Wed, Dec 12, 2018 at 10:32 AM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> With the current setup files will accumulate on
> http://sources.openembedded.org/ over time and none will be removed. Are
> there any patterns that should be removed over time? *bad-checksum*
> files seem like an obvious choice. Please share concerns or suggust
> other patterns to remove.
>
> Thank you,
>
> --
> Michael Halstead
> Linux Foundation / SysAdmin
>
>

