Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4EC65DB0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 00:51:25 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so1786935pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 17:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=w5DtWkSrtRyus0UNzWl0yJ9+4gGa/6FpLiBTAQ7mOAM=;
	b=YK+BrygerZD7GRqCSMHvbKh8u9cnV0inzwXu9Fu5+1JAgoiNLL0TA/niptQLV6WNAE
	AzuQAhsyf/fwx9s5UKjuMSxvX5mbZU/7C43ZHOMto8SQejjMqbGWpKThTbZxE7++hyAy
	nQWfD/w4fx1N1/zLnP08/v0rLJ8xL0je5rJ4II0ehVBuRYPoIjZPuBa5HYDlardZ+Uue
	Ri0M8lyjNTNDto9Cj9YD4crTz/r6obWgQwFgIZAIvN5yqyQoYLYSZ1j5CjaP6oBePR0S
	0xidOabieq4jcwJiiHVU8GSxuqG9OPBmqwdHkz0JCXRicrr7PTKJhg2Vt7kMOehBB5RA
	WaAw==
X-Received: by 10.66.254.3 with SMTP id ae3mr27701416pad.49.1398991885816;
	Thu, 01 May 2014 17:51:25 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	xz7sm168365825pac.3.2014.05.01.17.51.23 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 May 2014 17:51:25 -0700 (PDT)
Message-ID: <5362EBEE.7030005@gmail.com>
Date: Fri, 02 May 2014 10:50:54 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Fri, 02 May 2014 00:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2014 1:27 AM, Otavio Salvador wrote:
> qtdeclarative requires accessibility to be enabled and it is added by
> default to the toolchain so we ought to have it enabled to ensure the
> default toolchain generation works.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   recipes-qt/qt5/qtbase.inc |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 89736be..91cadef 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -39,6 +39,7 @@ PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsy
>   PACKAGECONFIG_FONTS ?= ""
>   PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
>   PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
> +PACKAGECONFIG_ACCESSIBILITY ?= "accessibility"
>   PACKAGECONFIG_DISTRO ?= ""
>   # Either release or debug, can be overridden in bbappends
>   PACKAGECONFIG_RELEASE ?= "release"
> @@ -56,6 +57,7 @@ PACKAGECONFIG ?= " \
>       ${PACKAGECONFIG_FONTS} \
>       ${PACKAGECONFIG_SYSTEM} \
>       ${PACKAGECONFIG_MULTIMEDIA} \
> +    ${PACKAGECONFIG_ACCESSIBILITY} \
>       ${PACKAGECONFIG_DISTRO} \
>   "
>   
I would change "qtdeclarative" to "qtquickcontrols" in the commit 
message to match the PACKAGECONFIG comment in qtbase.inc.
I think qtdeclarative might still compile fine without accessibility but 
you would have to check.

Regards,
Jonathan

