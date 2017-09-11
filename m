Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8466678250
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 19:52:50 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id t10so10872739vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NeQSG0Ncg02eehNjfxA4nh8Ncl+SnnClBMUF9ZN3+L8=;
	b=ElZxCaTdZELdlBz0SQNPaa1XrSkWIc97jiwks0HnmS3YH37Jbz2tjJp0gpF3TDFghc
	YIH/QWyR4USjbYTxvWhXRB+od0mTlnrJIxMV14GEnuB7slc8PpQyCjbdBJ07nYx38fOs
	kLIGoW3rGS83kQMjTK/vPydGe1ZdVCZ0uXmfLGPVcAp8+Xj3lMIkgRQCxKCMbUtlQy35
	U55eRrhdZCLXxUIfw4YeDPOAmQ5MlEmYLOWchGNFfa+XRofPyHr7j/4l3Tw7SjWQUPAu
	R3dEfbSZyNiFl7eGii5mgVq+s4S/Czj/gH9L2JcKDI7vjAKwWvPrDVveZaArgdzr0776
	XOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NeQSG0Ncg02eehNjfxA4nh8Ncl+SnnClBMUF9ZN3+L8=;
	b=jbDaSdRcmf0RgLolGxKnXyKw8qHPZhhdMqJSKqtUo0Sn7yFGLqE8GZ32JqjSaPuDwP
	bC/qPHpD9qlEF0lZFSjjIBkiqfGYFLTf2r+dlwf+STcgc5Hoy8IOsJLOBwuVMcwYl7u7
	suv1kKiPCWFlupa7V56+pwiB8lCXQMJGpxrpd5HuUdsg1Q1mCmVf/ksN8K7VJthib/fO
	0vryPmNeeXi8CQXEAF5HJ6ZcDjtH4tQ8Qio1/Hn2zZn2yc0OnNjgKafdAe1pI9p3fKy0
	hzULi1rBQeB8EVk/IzFC83/JeqKgZ4up3zLG8FVmJo0zbcMzYjuGk+gnxbTAakz0icRb
	SObA==
X-Gm-Message-State: AHPjjUjwSEBMJka5N8Xc3HPSqnKFeUChy9K8V6crWhsuBLlYbRmlvvfF
	GizKXKDJkiLtLTK/UkqlZZ5tHY+O5g==
X-Google-Smtp-Source: AOwi7QAkKVkT7wEkakFBF2VA7UZE455vR4/UFxkvbIKbygw94bocEkQZ46Qky0F9myoIY1rs3hmwR3bCk2ymsVP21Oo=
X-Received: by 10.31.41.136 with SMTP id p130mr8878777vkp.122.1505159571562;
	Mon, 11 Sep 2017 12:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 11 Sep 2017 12:52:50 -0700 (PDT)
In-Reply-To: <CANDbA3c8tGiOK-AUSNhe3rqZ=sCRn3=2NTdGF8o5y79d_aG7aA@mail.gmail.com>
References: <1504993112-9111-1-git-send-email-athoik@gmail.com>
	<CA+chaQebLEPnMQk+P2XdVGH-FPB0FA41N8Cic5ovJifUvbdkgA@mail.gmail.com>
	<CANDbA3c8tGiOK-AUSNhe3rqZ=sCRn3=2NTdGF8o5y79d_aG7aA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Sep 2017 21:52:50 +0200
Message-ID: <CA+chaQducSfMb-woaHtjYUfTnUsCmZwNBbtJ_SV40N-rSkuOEA@mail.gmail.com>
To: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Mon, 11 Sep 2017 19:52:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes

On Mon, Sep 11, 2017 at 9:31 PM, =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=
=CE=BF=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 <athoik=
@gmail.com>
wrote:

> 2017-09-11 16:17 GMT+03:00 Martin Jansa <martin.jansa@gmail.com>:
> > This causes build failure (at least with gold enabled):
> >
> > ../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to
> > 'pthread_cancel'
> > ../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to
> > 'pthread_create'
>
> Most probably something unexpected with pthread and gold. I guess
> adding -lpthread should fix that.
>
> In order to test with gold enable just adding ld-is-gold to
> DISTRO_FEATURES is enough?
>
> Thanks,
> Athanasios
>

