Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 11F7C60797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 13:19:36 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id f7so122635638vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=nuc3sjZ/1FYjdmtt/BFMrzwoyZfDTpntktsprDcaMG8=;
	b=shdQYomo3a2zeucN3rbHNhcok/rQkywzolZbTpJopHy8YhgY0d1pMb+XlCzhQp0pz5
	wunil+hDzRfv3k2kh/dgo0eHQs+bMeivvf3dz0CDq0TFdmD4LPdmamfE4XSn80POaeVW
	LbysLQ/iCS51/cV2HaImg/hehzcyKFCK1R/pbU8JKiDLpDW4xRTXbCTipdM/Wa+U85CY
	f9vQeSxxobXPWCQDC5/S0wv6kiDrFYUg6Rw/3R9xmtGdf+ll2ASxxtGpTp+oBOt767/F
	96d49xEWYpveQGt8Nt2FCczKidtWLFzMPXenjDY/LWA7Qx1Q3idu7Hs5kkJ+MXQeTYGt
	TO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=nuc3sjZ/1FYjdmtt/BFMrzwoyZfDTpntktsprDcaMG8=;
	b=NBuR339VZ9YeXz1Tz8d1IDVopYbaTo6iqzzeMqkkmFXNmc2uSKOHGTRR4YXbomnItm
	bdUxHEJuBnjIj9WwEtb2zKqv+1xmTBflMZtB+5QZbrL2zKy8qpzbD1jDESUDDMvliIFy
	ZKaecOZEvYz11pVUjwmgRK6FYJ2QKs0X2i8E+577rqvbqfMX4hyhXfwDq0WJPTSWBETZ
	w6CVoMuTOSPRk0PSt4y580MU03MVpTF+ISp8M1/FXNuz0Z5/wVY77SY/kPdLTf7SSR9G
	NjmJ56iXdr4mG/0sC+2vyO/Ymt+5ti0mux32F6nKI9NVnrRe7zZ1S90IxM63iu2UhP8a
	vP/Q==
X-Gm-Message-State: ALyK8tJS80jsSeHb4WE0JjR6xJsXBkgtO5DvLlpAUFTIjHxXm+81Y2pfNTKGLM0C+koYrA==
X-Received: by 10.31.92.15 with SMTP id q15mr5816440vkb.92.1468243176829;
	Mon, 11 Jul 2016 06:19:36 -0700 (PDT)
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com.
	[209.85.213.54]) by smtp.gmail.com with ESMTPSA id
	l137sm2301391vke.0.2016.07.11.06.19.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 06:19:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f54.google.com with SMTP id o63so54957249vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 06:19:35 -0700 (PDT)
X-Received: by 10.31.94.205 with SMTP id s196mr3135119vkb.78.1468243174982;
	Mon, 11 Jul 2016 06:19:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 11 Jul 2016 06:19:34 -0700 (PDT)
In-Reply-To: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
References: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
Date: Mon, 11 Jul 2016 10:19:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
Message-ID: <CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: daniel.mcgregor@vecima.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java] gcc6 support breaks build for gcc < 6
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
X-List-Received-Date: Mon, 11 Jul 2016 13:19:37 -0000
Content-Type: text/plain; charset=UTF-8

Hello Dobbe,

(Added Khem and Fabio on Cc)

On Mon, Jul 11, 2016 at 8:37 AM, Winfried <winfried_mb2@xmsnet.nl> wrote:
> Commit  33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (openjdk-8: make GCC6
> happy) adds gcc option -fno-lifetime-dse, which was added in gcc6. This
> breaks the compilation of openjdk-native on hosts where gcc4 or gcc5 is the
> default compiler.
>
> If this is intentional, I think the README file should mention that
> meta-java requires gcc6. Better would be to add the '-fno-lifetime-dse'
> option only if gcc >= 6 is used for native compilation (if that is
> possible).

This is a non-desired side effect of the patch. Daniel, could you take
a look on this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

