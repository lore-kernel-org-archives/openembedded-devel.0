Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 34F4973192
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 16:07:31 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so21466887qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=jTK80+os1cv6Wb+811L7+YGgzoCvLPZ2a+cvEoKrNM0=;
	b=s2AAiLrsYY4RF1BVxPZILhUvmphcOBMJAII32LIUFBj6xw/aKw+o0A0ELCa/29Iut+
	/IPgX9tkaUrWOfA0ag7PlMaDmZaCmf5Y++Y0Z9zKF6qz0D1hs3R5GniEW4BeHhqyLny3
	unxtRnpIGsB7AJdMa3ukIE3shakU/L957CojbkfgFMbuMPnn9rf+rhLJh2HshAogMuvn
	dReDlXZdf5bMKDTSFndRP+aG66QWoZZIV3977+c+bMDex3Gym0t8oG0fSRgRx0McUX7E
	zEw4xC/qm8omWSv72HBLG3MFqxNw5hhmxbUlsr6UNjzgtODp+yNBp51j4YGwuW/Jhm1Y
	59Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=jTK80+os1cv6Wb+811L7+YGgzoCvLPZ2a+cvEoKrNM0=;
	b=mltHmCGNjkPghj9/BxfQTfYICQRulI5SM93saRranEwHF570sbFpufBSZkloWxv/Wn
	VZW5hyKQYGDVObsprU38I7PD3PpiCLkq09P+WuQhlqdoPpLgTQWo09ZwLMWyvrKhZek5
	ew8zPJlaFYDplpK9qRc0QI6Jlad5N1nbdlGZHNzL69AvMT1JnOrl9Y1JSeGeTMYQVuuN
	/N7EPD+r7NwMn66xPWEHz8j6XEKqrUvw2DJyjeowff62k5+Zd/nwF6WpaZ3G4SuhM2RV
	qCO9xSVFqdf2ShPCeh6x3dIaFEW44nDaYSXuKelIrX6DCQ9CwTBXrjuNaRKB/qSSYxPQ
	Gb0Q==
X-Gm-Message-State: ALyK8tJweE79IBBD3KWyAcw7F0+Ubl8hnmUsX8l3E+znnrXmRy3kRecRen228p2Ahiho2Q==
X-Received: by 10.200.40.242 with SMTP id j47mr26392896qtj.99.1464624452370;
	Mon, 30 May 2016 09:07:32 -0700 (PDT)
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com.
	[209.85.220.173]) by smtp.gmail.com with ESMTPSA id
	e127sm9523745qkb.34.2016.05.30.09.07.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 May 2016 09:07:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk0-f173.google.com with SMTP id n63so125171781qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 09:07:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.55.51.71 with SMTP id z68mr27898887qkz.50.1464624450782;
	Mon, 30 May 2016 09:07:30 -0700 (PDT)
Received: by 10.237.54.229 with HTTP; Mon, 30 May 2016 09:07:30 -0700 (PDT)
In-Reply-To: <1464593963-76595-1-git-send-email-hongxu.jia@windriver.com>
References: <1464593963-76595-1-git-send-email-hongxu.jia@windriver.com>
Date: Mon, 30 May 2016 13:07:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpF4kmM5CcfFsvu_O-tkUJW84sEZ9WD+fJ3OV84sNG3ow@mail.gmail.com>
Message-ID: <CAP9ODKpF4kmM5CcfFsvu_O-tkUJW84sEZ9WD+fJ3OV84sNG3ow@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] efivar-native: fix compile failure with older host gcc (<=4.6)
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
X-List-Received-Date: Mon, 30 May 2016 16:07:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 30, 2016 at 4:39 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> While host gcc version is 4.6.3 in ubuntu 1204, it
> did not recognize -std=gnu11 and -Wmaybe-uninitialized.
>
> While host gcc version is 4.4.7 in centos6, it
> did not recognize -std=gnu11, -Wmaybe-uninitialized,
> and -flto.
>
> For native build, use -std=gnu99 to replace -std=gnu11,
> and directly remove -Wmaybe-uninitialized and -flto.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

I am concerned about supporting such old GCC versions; this seems like
something Wind River ought to maintain privately since OE-Core does
not state it supports those host distribution versions.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

