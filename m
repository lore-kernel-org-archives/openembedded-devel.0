Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id F217460797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:45:37 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id w127so180553891vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=ZFBP1AzIX/vdO0HhK9OR/vBYlJhTQgc09h1/PSaOcNw=;
	b=RInY1rNXSZvuEEDW6pHNDJhaxHW3FOiR14txxMCdrLxi9+YEK7JgqVO13FM5D29F9M
	EAeaHQPi5JhGKYxAZZZawOI8I2HWo25cwbiWIdRW9JI2GYUnKyQrFNDvSWavysw97jO5
	pjP+civOr1mSHXGAWvq6U7F38KjEEcJiDxHL/hVFKPOC7ET03vXi4VtTJEsMcQttJL7m
	NXoPqQStJLDZupDaxHpC/vDlRgLYblMEnIeE7s0sAnRCX/rtXwXL6HiuhAuDyNAgjK2u
	8E5wUdOy9K+r0Db0gY+8Ps3T/1S1KfB8sCXJD5pwP7+kJuNvlT7MpiKNix4xUMK2YkIE
	9Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=ZFBP1AzIX/vdO0HhK9OR/vBYlJhTQgc09h1/PSaOcNw=;
	b=kAvF73Ua2W328CXBXIsLzwyJBEPEw1tJBOhbjDBf5vEHc3NGcpze5n4UAyv4tEbuY/
	lic1C97+9mOxu1Cz7V/OI3+tj9J+FflIa8rdNAr5OFaPGotqjJKf7LSXoN7JBcOKGj29
	1wljhVV0k+i5Dd8L+342/f1+/4CUPokyj7lEnCfMX3LUROJ5f1FAriWLX5CTpzIQSOb1
	RrwQpwD+GvkM7rUzXDUmh0WYxImvOTVVz4yI8J/tY7zdGnZiN2UMwdCnICGc6ONylctH
	LxYgRrdDWfwpb7gQxxoqA8VpixovnqWLhvtxUTaag1PhcVlhF4m4H5XPDQUw8eggfbkN
	HwsQ==
X-Gm-Message-State: ALyK8tKs0I3gT2YYfiWW/tCvjogy1CwrAfgJVpF3GBMXUZG5c1LWHKeCkJaW6/25K3bbAA==
X-Received: by 10.176.6.40 with SMTP id f37mr15325376uaf.8.1468849538014;
	Mon, 18 Jul 2016 06:45:38 -0700 (PDT)
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com.
	[209.85.213.54]) by smtp.gmail.com with ESMTPSA id
	w185sm611248vkw.11.2016.07.18.06.45.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 06:45:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f54.google.com with SMTP id x130so239123123vkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:45:36 -0700 (PDT)
X-Received: by 10.31.16.20 with SMTP id g20mr16895023vki.150.1468849536429;
	Mon, 18 Jul 2016 06:45:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 18 Jul 2016 06:45:35 -0700 (PDT)
In-Reply-To: <1464597467-55898-1-git-send-email-jackie.huang@windriver.com>
References: <1464597467-55898-1-git-send-email-jackie.huang@windriver.com>
Date: Mon, 18 Jul 2016 10:45:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoexx1QEsiXe-_a7B2t34fr1OfEKEgyzc8Q2u=pU2TF+g@mail.gmail.com>
Message-ID: <CAP9ODKoexx1QEsiXe-_a7B2t34fr1OfEKEgyzc8Q2u=pU2TF+g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] java.bbclass: change a warning message to note
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
X-List-Received-Date: Mon, 18 Jul 2016 13:45:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 30, 2016 at 5:37 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The logic is to check if the destination file exists before
> create the symlink, and give a message about removing the
> existing file, it's harmless and not necessary to be a warning.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

In master-next for test.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

