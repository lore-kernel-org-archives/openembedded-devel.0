Return-Path: <koansoftware@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id C4B036148C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 06:56:40 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uz6so3277573obc.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2013 22:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:reply-to:organization:user-agent:mime-version
	:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=M9c6UaM6BlL8Ng5W2ovQPqgSH4R2N31bvE6JZuMlqnY=;
	b=Qp5a9B3vnPw3km0iRuV8XGs0kErcvwX8dW0YhGoN4L4ouPwbqoJCPHtx3UD+Wx3WVX
	r71DwO63aokPHbvd+dUxlUcGbg8ol17r+NR5DTUkPk8A3IMOmCFJsLj2jvPGhrlqBTQm
	eGo7kZPHJ5/nrhjrlZ0OB4fdmGzoD8ihRkRezVCjdDXxqeSLseftcupOihZR0j09ZKVO
	PWbnmc1K1JcJSN8ikQ2Lvwali2TBwQdvkigpj6lhRybevt0dsHN4X6iAUEMHARSQdVYR
	ILhm9xOA+KhPxcqWh6nZ+SjqytZ1g6YbhCg3Xk/uZ1AMNZ0kdH2eygydbMBUP6W/itCs
	Od5g==
X-Received: by 10.182.227.136 with SMTP id sa8mr11555241obc.39.1386572199706; 
	Sun, 08 Dec 2013 22:56:39 -0800 (PST)
Received: from [10.1.10.30]
	(host61-87-static.14-79-b.business.telecomitalia.it. [79.14.87.61])
	by mx.google.com with ESMTPSA id ee7sm18512208oeb.5.2013.12.08.22.56.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Dec 2013 22:56:38 -0800 (PST)
Message-ID: <52A569A4.1040105@gmail.com>
Date: Mon, 09 Dec 2013 07:56:36 +0100
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
In-Reply-To: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
Subject: Re: Meta-qt5 sdk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2013 06:56:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/11/2013 21:26, Simone ha scritto:
> Hello to all,
> I'm new to this mailing list.
>
> I'm writing because i want to ask the actual status of meta-qt5 layer.
> Actuallly, we are able to build qt5 with examples for our fsl based platform.


Hi Simone,
I was able to build with the following settings but I am not able to run 
Qt5 apps on my iMX6 target.
IMAGE_INSTALL_append = "qtbase qtbase-fonts qtbase-plugins 
qtbase-examples cinematicexperience gstreamer nano cairo pango 
fontconfig freetype"
DISTRO_FEATURES_remove = "x11 wayland"

meta-yocto-bsp    = "dora:75bed4086eb83f1d24c31392f3dd54aa5c3679b1"
meta-oe           = "dora:513e7ca20ddd0a5c3b649bf292a67c3e0473d3a8"
meta-fsl-arm      = "dora:5b3b6618426ad06e4fb6a3a77c4a53dfb47f0556"
meta-qt5          = "dora:cefaba69a785c5221463f0eb496b749d5ddf8a5a"

root@imx6dlsabresd:~# ./analogclock/analogclock -platform eglfs
Segmentation fault


Which branch are you using (for yocto and meta-qt5)?
Are you applying any patch to meta-qt5?

TIA

Ciao
-- 
Marco

