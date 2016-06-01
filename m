Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E44217737C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2016 13:44:15 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q79so1990667qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2016 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=bhY0cbaQyGBrTgnoSBQBT7SXRKGIqn1cWBN11SVOSc4=;
	b=pTckp2a7LtJh4wq+H8JVyLd+UxPNXW70W8phtI7EE709Fys/vI5qX5CpqXwyugAW1s
	Oo+YSGOlMWrcc4kZJGkd1l2Ms9g5ycEBOyGIplGhlBSGIxpe9L0IalQixy+ELczQ6B60
	OT2a8OoM6nniHVAm5yF9YAT1/GmRw5bxHqXeItsWZjHdWQJi63QfvYwOGI0N0NzDyb9a
	tl+BTx+tiyHcgZlEqFJhWqUiwALXZlqXtnuL8gRwtILnn637wk6OM3V+VGU6xH9nrura
	a8UH8qWqC2v9IFk78FPOaHvrDwkC8OPLFZSQLTV3zGUKF53n68dNOjdXjxKzldH0xSwh
	6yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=bhY0cbaQyGBrTgnoSBQBT7SXRKGIqn1cWBN11SVOSc4=;
	b=EV8TsOQp9fIWNpqDC9KGW1g2bCfKYcjnKAJSLYZ16f+CgMSiRTjlBVeugmR+Cbt1Y6
	E73WxquIsxnm2O0cNiaXX1thXtRMR49fdZe8K6/DWuxVIevK2a5GU/fXTbcPUCUv5Ber
	lSys8lQ5YneWy+dzmHeHQnqVrBAu0hMluTarx54mQiUH+ASLC0ZKvSG8hlKJYfVpa2f7
	tkso/Qc7raK3njDDDEHhZupqGSPV9eeRtOX56cxDY51ULspQ2fNz9yw6gEXLYVFNggsV
	nujXTfXjXRp59H+GBM898jmyt7YyJwViQNcsioT+QV0oQBbGCtgirR5nx+IfOIC6X24f
	TQHQ==
X-Gm-Message-State: ALyK8tKDdBNki7+gLaY2tXN5+H5odRlEQTmzVCUIh9eBvYgxyds2Ug4t4VppyI+TXhkybw==
X-Received: by 10.55.137.68 with SMTP id l65mr37410991qkd.194.1464788656147;
	Wed, 01 Jun 2016 06:44:16 -0700 (PDT)
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com.
	[209.85.192.45]) by smtp.gmail.com with ESMTPSA id
	l35sm12636328qtd.10.2016.06.01.06.44.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jun 2016 06:44:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qg0-f45.google.com with SMTP id p34so37912670qgp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2016 06:44:15 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.141.28.204 with SMTP id f195mr31113649qhe.97.1464788654743; 
	Wed, 01 Jun 2016 06:44:14 -0700 (PDT)
Received: by 10.237.54.197 with HTTP; Wed, 1 Jun 2016 06:44:14 -0700 (PDT)
In-Reply-To: <1464786802-11176-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1464786802-11176-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Wed, 1 Jun 2016 10:44:14 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp+wY9AVGxgS7HfKwgGmrKXadOmLYzL5R104-N5MNu7xg@mail.gmail.com>
Message-ID: <CAP9ODKp+wY9AVGxgS7HfKwgGmrKXadOmLYzL5R104-N5MNu7xg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] opencv: Reorder PACKAGES variable
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
X-List-Received-Date: Wed, 01 Jun 2016 13:44:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 10:13 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> PACKAGES content order is important, because it determines the
> destination of the files, when the folders overlaps.
>
> Without this patch:
>
> NOTE: Executing RunQueue Tasks
> ERROR: QA Issue: non debug package contains .debug directory:
> opencv-apps path
> packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java310.so
> [debug-files]
> WARNING: QA Issue: opencv-apps: found library in wrong location:
> /usr/share/OpenCV/java/libopencv_java310.so
> opencv-apps: found library in wrong location:
> /usr/share/OpenCV/java/.debug/libopencv_java310.so [libdir]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
>
> Fixes: 3132af1d1d15 ("opencv: Fix metapkg dependencies for opencv-java ... ")

Empty line here, please.

> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

