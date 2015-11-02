Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id BAD2060124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 21:25:23 +0000 (UTC)
Received: by ioll68 with SMTP id l68so159214981iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 13:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=iDC5CNDeyjvn74gzrO9/T5bX5PNoP7WkJ3hYPyAXotg=;
	b=zAggmj+KltngunSusF0EYHdtEcdrHNdf4FoG+4OIVPKC9o0PILG8flMvJdeSMIweyK
	8RslXK6yJ6Jr7uqecxbMIdhWKDvRLmWM/Ji18k8xGkar/0pbdV3O7N7Nm1g8VIRVHFSW
	cxXPKVg8GV9lfEtPZOiL/PrVo0DNm2UybZ/FW6A1I7h2ET+2sOeXrxyhZ2FJsB/0mCMY
	jUv5tidTQReEsxYWUOuDyABFRRvDC4UvU8OchqLkygKanoSogBi0EEfsJT6Rl34VEB9a
	bcGY5ysUdTjP+KDATuAVetZmgH4QtEEvCJlBScnPteBg0vLnxEdBeKNElt6/o1i7b1MY
	Ir2A==
X-Received: by 10.107.137.66 with SMTP id l63mr24205761iod.112.1446499523289; 
	Mon, 02 Nov 2015 13:25:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Mon, 2 Nov 2015 13:24:53 -0800 (PST)
In-Reply-To: <CAJ86T=VLZKXwJWL30cuW19d0fYOfKTw=wwfi+p_awqcWWdQQxg@mail.gmail.com>
References: <1445585893-28183-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=VLZKXwJWL30cuW19d0fYOfKTw=wwfi+p_awqcWWdQQxg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2015 13:24:53 -0800
Message-ID: <CAMKF1srB2Ds-VR8UwOtiY0aCTLL1HJBomtspekMhTYhZ_E61Lw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: Fix build with lua >= 5.2
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
X-List-Received-Date: Mon, 02 Nov 2015 21:25:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2015 at 10:43 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> +-#ifndef _WIN32
>> ++#if defined(_WIN32) && defined(__GLIBC__)
>
> Should that be ! defined (_WIN32) ?

good catch !

