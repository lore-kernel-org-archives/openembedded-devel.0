Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8C171476
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 04:44:15 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id x19so2707898ier.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 21:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sXE/C9ZimDMi9GkcDEsbfWbGZNZHwt5k5sy+lrDLlfk=;
	b=01kXE2M3OS3G79RHRcJLeaoaa+dGatsnqr3sPKA1LNfeQIGGlSxgCRF2XZ9b8gdsa+
	Em33zB8yNJNUi1HjPDdGWdS+wMSe7Sfcef5wX2XEtDLU0RiuMP8EvByjQaa2lrzrLypo
	zqSWwp+j/O1JTpnkvQwL2mDX1QYKNuGzITnJj8CBmI8JVMxFBL7/JL3IgbMBCoAyGC0R
	jFOjtm4Aw6N7EafBIq1vUyt1UWuG37Ux/zANmmMg9INimZnS+m5lZBys6b/sPp0ICUcl
	/ol0y0vaqi3VGqn9qjZxTHQEhIex+lP8ja2hEdcJu0FDFZ/JULReMCPWn4Vf60EL+hz7
	/1Xw==
X-Received: by 10.42.236.197 with SMTP id kl5mr16135957icb.37.1411101857010;
	Thu, 18 Sep 2014 21:44:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Thu, 18 Sep 2014 21:43:46 -0700 (PDT)
In-Reply-To: <1410835738-27343-1-git-send-email-b40869@freescale.com>
References: <1410835738-27343-1-git-send-email-b40869@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Sep 2014 21:43:46 -0700
Message-ID: <CAMKF1srPeXz=ek8e4R++Lc30jUei6h+8RZJDExJpvFZUAVvoNA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-networking][PATCH] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Fri, 19 Sep 2014 04:44:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 7:48 PM, YangHaibo <b40869@freescale.com> wrote:
> +CFLAGS_prepend = "-I ${S}/include "

why is prepend needed  += would be better

