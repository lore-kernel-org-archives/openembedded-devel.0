Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7588B6B8DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 23:06:56 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id y10so16814438pdj.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 15:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=nN+hFe7qG+Ai+NTrxEar2OH91eKxxav/IaGnyThYJ+c=;
	b=iSlQwpqF3PXbikC1dBkHCJ8oOI3rn52ACnbMYbuu+07iSTXzA1M4+ayWH2yIHbfcw3
	pWYkrn51VCmpbw9JJ6jnabBEWcyI4ffAuFFTJdlU9CF3OOetjy+r9RS7n+T+KnTyFWKb
	mjdKZ6x/spK3Yo4VRpKcoaAoNpEIeH38w/gy6MgMFgBY66D1kJR+kYdXoYWPw/kFNk/W
	V4I7E9RbgFxY4MYUdPh7fr8PZzBYsiJf3Z0grPgCe8jSBHNuBHrCRSpL/H7WfhxdZYIo
	uTPJMeGGY8fjRzjJZ3TYcCMLBid3XHqgUsN8dvnZpWwt2VA3kN2X8YizqurkyXJWLUDU
	MlEQ==
X-Received: by 10.66.166.175 with SMTP id zh15mr35946517pab.36.1392764817145; 
	Tue, 18 Feb 2014 15:06:57 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	iu7sm59596598pbc.45.2014.02.18.15.06.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 15:06:56 -0800 (PST)
Message-ID: <5303E613.2000309@gmail.com>
Date: Wed, 19 Feb 2014 10:00:35 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1392737825-11241-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1392737825-11241-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-qt5][PATCH] qtbase-native: explicitly disable icu
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
X-List-Received-Date: Tue, 18 Feb 2014 23:06:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19/02/2014 2:37 AM, Martin Jansa wrote:
> * Jonathan Liu reported that qtbase-native was failing to build for him
>    and it looks like qtbase-native was trying to link against icu from his
>    host (instead of icu-native because it isn't in DEPENDS)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   recipes-qt/qt5/qtbase-native.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
> index b9193e4..860bc29 100644
> --- a/recipes-qt/qt5/qtbase-native.inc
> +++ b/recipes-qt/qt5/qtbase-native.inc
> @@ -51,6 +51,7 @@ EXTRA_OECONF = " \
>       -no-opengl \
>       -no-openssl \
>       -no-xcb \
> +    -no-icu \
>       -verbose \
>       -release \
>       -prefix ${OE_QMAKE_PATH_PREFIX} \
Acked-by: Jonathan Liu <net147@gmail.com>

