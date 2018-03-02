Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A1F1A60269
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 03:23:47 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id p189so5001605vkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 19:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BtaEfzvVSE2gvoZ2xFgNlfehgzqmBX6orGfGYM3jR6U=;
	b=GPJFRyJxXrGZW2v6Zdk1TbKbV7XNl0Y0HNpluC8rgmsoVkJehbbhC4lhuPtiuvKJ+q
	7ma/V3D+uVvHaCicjKCl2ekJhrczqPnczo+Oj1B548e/VUgNKas9QDHhlSnnGmrsWsS9
	wHSFim+91hfnXuApUbV0s+I8Fa+IA2c5XAaclvUqhhmnEAkjUkbFY17QrlbG9c6aK9qk
	Hun2Cp2nc9dJFDAhpA2di9SdAluZSaInmTLAwHqCEtq0Rus1034ZxJWEFJNJir/cfw/x
	vw/q3Ant6MKlUAYQhe55nl8wF3Fx5gsBiRT5WKfEFRrgqH1MorOwT4hFXvBpNwdhTujz
	Bqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BtaEfzvVSE2gvoZ2xFgNlfehgzqmBX6orGfGYM3jR6U=;
	b=QJnFUi/6guzSrhXT3JVketYkATTT4Pg71XrtWd0A2W4oFxto61e4i/6QKscKmiTRH8
	wVELXOOWm3OCVTGXxj0gCInFquEoU3JjxFvjvblgityxq6ow/k4bAzEkQhfck52GskKa
	5DkxtIqW898eVOWGLAdXDhdaGdejVhsMGUxd7xw/TP6/sBidL3sM/8ki4Omtowm2hRFB
	2OU7oe3+2EhRoqYyFLQBJ1BhdmZzUq+sJwVAPEq2A/1mYuXX1e3mhSLTGybQUBMWD8BJ
	SosAeNUE8v0mDGfq/OylYoWSXd3ciWSBQ3yjej2rbYQT1mE4gBH7jqD4MjbbvdQFJ/TP
	OVIw==
X-Gm-Message-State: APf1xPDUX9nJRXZuMH+oJIhq1FEOG97n5Q126lF4X7e+ytkqfDN2aker
	7klIRxphQodIAbgm1WX8EIw/4DE3xU9N1F+pkiQ=
X-Google-Smtp-Source: AG47ELuocixdMalKS/vCYc2vL1enGTHdRPATeE+f0NqUwHv5V2JP23NtCpGErpnzt8LT7sNyfFMilOkX7lRRfXiCcGU=
X-Received: by 10.31.34.196 with SMTP id i187mr2830926vki.63.1519961027953;
	Thu, 01 Mar 2018 19:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20180302020443.29914-1-raj.khem@gmail.com>
In-Reply-To: <20180302020443.29914-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 02 Mar 2018 03:23:37 +0000
Message-ID: <CANx9H-Db1inQXoFSLasqofni3Dp-RR+H59t_O1X1QS=rB4AMNA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-cryptography: Add -pthread to link flags
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
X-List-Received-Date: Fri, 02 Mar 2018 03:23:47 -0000
Content-Type: text/plain; charset="UTF-8"

Thank you for the catch.

This is why we need to have 100% package run time coverage. Call to arms
for everyone in the community. If you are reading this, this means you.

Acked-by: Tim Orling <ticotimo@gmail.com>

On Thu, Mar 1, 2018 at 6:05 PM Khem Raj <raj.khem@gmail.com> wrote:

> It builds openssl module which needs pthread_atfork()
> but we do not link it with libpthread, which results
> in runtime loading errors
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/
> python3-cryptography_2.1.4.bb
> index f64e51d3f..195923343 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
> @@ -1,6 +1,8 @@
>  inherit pypi setuptools3
>  require python-cryptography.inc
>
> +LDSHARED += "-pthread"
> +
>  SRC_URI += " \
>      file://run-ptest \
>  "
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

