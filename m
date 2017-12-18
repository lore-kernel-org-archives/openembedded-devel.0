Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5858E71D9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:38:32 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id z62so11628763yba.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nsRUjdms6tFLZltG7Mihj7FXcnTzXiq5AGwRbaQdZNw=;
	b=OnZAcCfbsILC9BqSoqUX71MEpo+GHlUXmmq6Qs5WkgZxY4U5PEgCYs6MbrUA7H7+ba
	/dY9XDqkm+UfDzp7MSdlM2woKSa2jazMHhoRMMn6+DxSfDgjgEvgaN6l2kgmImF8zVaK
	qNlCYk0YO2V/8tKrgEI9olGm4FY2ylECrtNN3AXXpdHgJzZHOPy60S3mfniYgjNK3A8J
	NQP0EbklIpGf2HCk+JfklY+fHkApyx8w+sRavZKceryjA1mxd933tvV3qQml1zlMznYf
	ZoK8OMlmYaIko41YFrgRC8Cz8gjUaMkjwczX4R4IGzwMVLPNxzYyJlz+mv2fbrB1oXml
	WCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nsRUjdms6tFLZltG7Mihj7FXcnTzXiq5AGwRbaQdZNw=;
	b=bEZ5i65gT7PAHsYcRDOJ1qVnfJX66VckUOvr+PvQAnWCrBm4f9pG1Vi3foZtCQOF8X
	3I9rgaFrr0W8liPb6/FOPc6Man3pI+4TaWPu0uHYPQH8m3Q1GQDDU9sZwqnZN9eLDcmc
	Yxg/njh0wf5SYwFJWRoV0mXnLvHkprBgLar25ChiOCK9E21EIrSFkp+mIYVFB/1UJNlp
	6T/YOf9dCkK9iFp3Eh0xziMK/7hzvGcCkpFI9RPiRUkA/Bk/8qLWB7BJ9dY3XPwqXmLh
	K3bICXo7y5Y0zGXIgqAFDIlmxaA+LyX/IiA5ifcoKbclHCZgidyOFc8TeichruetnJdG
	riQA==
X-Gm-Message-State: AKGB3mJfR5S2Fu+zhuPdmsgzmXb8jPUFr78tLENOTV5a19iXbAQqAxQD
	l47ODbHRQMr0zrMPDLCgxR9+De9FxTiFDum57Sc=
X-Google-Smtp-Source: ACJfBovHtSf8j0VznyTGgyE0yiJ8hOuNAYKCRbX+DSiO2FDHwZdpvTjXahmBnFNDKbSezyq9w5lr6kCjB1XOLC1r4U4=
X-Received: by 10.129.99.4 with SMTP id x4mr403557ywb.225.1513618714110; Mon,
	18 Dec 2017 09:38:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Mon, 18 Dec 2017 09:38:33 -0800 (PST)
In-Reply-To: <20171214173633.16405-2-raj.khem@gmail.com>
References: <20171214173633.16405-1-raj.khem@gmail.com>
	<20171214173633.16405-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Dec 2017 18:38:33 +0100
Message-ID: <CALbNGRTpjb5cGpe2OPAVr5AL6cZ3oNt28c-SiptkDZsYc=Yepw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 2/5] gtk-xfce-engine: Fix build with glib-2.0 > 2.53
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
X-List-Received-Date: Mon, 18 Dec 2017 17:38:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 14, 2017 at 6:36 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Fixes errors like
> UnicodeDecodeError: 'utf-8' codec can't decode byte 0xd6 in position 980:
> invalid continuation byte
> Makefile:737: recipe for target 'xfce_typebuiltin.h' failed
>
> Seems patch 2-5 of this series did not make it into patchwork (->
master-next).

Andreas

