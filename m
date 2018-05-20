Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id DBC7774CB9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:27:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p14-v6so6119703pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ozrL1WV4+LxWza6bC8zzXk6nHhJCpLLEnkx7PGRlqyk=;
	b=bJQqNsVIOYo0yyqTuWD1AHb99bz+/ArQ+7jNAUYhqHrQNUpk/k5w5dtmn3dHAPqi/V
	JmTLvVl0rB/t+FwudnqUh9SJnUWN8Iugn/Wps7Q7DqVBMaEPQ6RgIkdUsAA1mfTcqmbt
	JIZIUjqERpo73kMsnxt8ne4wLloE8JYO2HFB2veh9g5ZgkB3dpATbwJSktye/ytcKm4w
	PqaqBXMfUwGP2R9LianbECWkBMgOlgYF5wq0d7ihsSsw637dPHIM3k1FHEnaQVEPOwNH
	QzP0Uk2g+9pSFWRblGxvBQCZXDwHYJXSfFXjo8elPajZ6RI/6TQ/dxlcc66OzUVFnvv1
	7+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ozrL1WV4+LxWza6bC8zzXk6nHhJCpLLEnkx7PGRlqyk=;
	b=L48ab273g4d9rKbQoe1iQ2VJZazANo9KK5aYgDBXmJCnijUDCodLtowfIRRNqIbjwz
	wVIcFemBkKBDi+Gl1Qcul3n2D9iVINlI0qZ+OqQqTMJFOqQEkVZhVhz5WmuWAzLnKlA5
	52KaQfLds8RJ022L/6KoBw6nVK1GH3fT3pth5fudwtt+o4PJz2+lS0HF8jVaNjDvO9Us
	+hu17S/nhepftQRJ+htxvZFoXzWKj8FNKvnVhL3czeJHQiVzOFAFcdcKdiONkAbQmV5U
	xGVrgHk6Ue/Wv1/3UR0XW/svDQzC9KjDY8jo4qmQ4ALe7Q2eJ7lSSJCjfi847bjr8fPV
	si8A==
X-Gm-Message-State: ALKqPwdg4v+g8i6phzKlwZVjHoGM1oQ597g+sGKAniD3C839AySNQvQ6
	6mQ+/RyLZgi36DRS5MvFMyDrqXXjXXzcXZfhzyc=
X-Google-Smtp-Source: AB8JxZoB/w6YH8JOAg3i59ti/9RNbWMlICs/0sZnSqOnhv/TMwf2+HW1AYAAtNpA9AOV9i2xLtyjaQsmVWZbwxMkQ5c=
X-Received: by 2002:a62:5b02:: with SMTP id
	p2-v6mr17580359pfb.96.1526855278526; 
	Sun, 20 May 2018 15:27:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Sun, 20 May 2018 15:27:28
	-0700 (PDT)
In-Reply-To: <20180520024130.11222-1-twoerner@gmail.com>
References: <20180520024130.11222-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 May 2018 15:27:28 -0700
Message-ID: <CAMKF1srEN6W4xNtmLevLG6hzpdJ60AnvEP31e+y3LBh8j0+UXQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH] rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sun, 20 May 2018 22:27:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Trevor

On Sat, May 19, 2018 at 7:41 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> --- a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
> @@ -74,7 +74,6 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
>  FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
>  FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
>
> -FILES_${PN}-dev += "${libdir}/cmake"

fftw can be built using both autotools and cmake, for OE we use autotools
therefore it does not inherit cmake, so please reinstate this change
in next version of patch.

>  RDEPENDS_${PN}-dev = "libfftw libfftwl libfftwf"

