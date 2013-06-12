Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BBD5C6AAB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 14:03:23 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 10so8984289pdc.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/Cfq3cRyJnboFai1VVFEwliipN2AA+JioSSFLG6VTMc=;
	b=xfMaKokdKlYlwfsbk/HHTJ5qSbtdE5FVrdEJflutZdryX6VkRpu89vmqNZMzqdhHUm
	UcfZK59jVMn7lL9usaF92+gLt/8aUDOJl/kvzAV5y8qHQqn8C091BA0hwYlOl1z6dS0a
	ldx7VQ/gFZGIoq+Gfi+7QDldlRRuAz/yGVSnAOO6zKV3O049UaqNq4o6xpK+LcJRWYVn
	ilOgPPO4rWMz/5L/8TDj6on33C+EoNS/w60QOmHXNI/Eccy2mNASg/USZvMvuHhTf7rP
	zwM0fwWuNq+cLZBapG8fMaFC4yh3viek4bK/CDBck3UUdISjKiqb4b0L0YDnij16JxlE
	4Htg==
X-Received: by 10.68.189.36 with SMTP id gf4mr20199714pbc.73.1371045804853;
	Wed, 12 Jun 2013 07:03:24 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id ra4sm24991997pab.9.2013.06.12.07.03.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 07:03:23 -0700 (PDT)
Message-ID: <51B87E86.9010709@gmail.com>
Date: Wed, 12 Jun 2013 23:58:30 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1370992564-19617-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1370992564-19617-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [meta-gnome][PATCH] gnome-keyring: Fix build error due to missing asn1 prototypes
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
X-List-Received-Date: Wed, 12 Jun 2013 14:03:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2013 9:16 AM, Khem Raj wrote:
> This fixes the errors that started to pop up recently
> while building gnome-keyring as part of gnome images
> The error is decribed in patch header
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../gnome-keyring/gnome-keyring/egg-asn1x.patch    |   55 ++++++++++++++++++++
>   .../gnome-keyring/gnome-keyring_2.32.1.bb          |    3 +-
>   2 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
Signed-off-by: Jonathan Liu <net147@gmail.com>


