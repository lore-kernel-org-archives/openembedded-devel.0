Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B6D5B77170
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 20:05:56 +0000 (UTC)
Received: by iow1 with SMTP id 1so136394057iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tV6eOe/gw8MrB7eL6QgMoD/QYVnSzQjhKPrdZv1z9AU=;
	b=jSaYCOgkops48d9QgU/MpBG8CY3bPp4rr44/YNQxW+wpXnLyT8st7ND/fnCBDs19Ps
	X3G1+G71YO2ARWVegj0nzUr1W7FnHmZNSbELETHRLE31IJdHduWVdnTID4ant5uy/0mg
	6PZUFIxMX9EK84b3peOOAo0aKd2x9q7OKAK/gPOQz1hun7yj43RlJ/p6ckG194RuI+TM
	iNdtf6x3LWgRI+jNkodx0XuaVZISGDlEEGG9fvcn0X+lTbaoYjCR0XcazVpmFBcB9vd9
	R6S9Kp58WeROXa3AeAMW9oUPDratjpY321X6y5ksBuRxjJV5SK0PjLJOQh8zSFUDo48+
	PQUg==
X-Received: by 10.107.34.149 with SMTP id i143mr21856558ioi.195.1445025956498; 
	Fri, 16 Oct 2015 13:05:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.81 with HTTP; Fri, 16 Oct 2015 13:05:27 -0700 (PDT)
In-Reply-To: <1445018245-30292-1-git-send-email-jslater@windriver.com>
References: <1445018245-30292-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Oct 2015 13:05:27 -0700
Message-ID: <CAMKF1srrWsnVLACj5gNGQrBpvO-XU=gc9gOX2qqyKGkfU_7Umw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 1/1] dracut: RDEPEND on util-linux
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
X-List-Received-Date: Fri, 16 Oct 2015 20:06:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 16, 2015 at 10:57 AM, Joe Slater <jslater@windriver.com> wrote:
> We might need findmnt and setsid, which are in the
> util-linux package.

would it make sense to put them in a independent package ?

