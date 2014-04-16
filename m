Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C0CE062252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 08:01:50 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so10231641ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ToASu0/Y3W7CtmhMaUa4g6cQjJ911vA5S6yzbgCMHMk=;
	b=v223LBmJo4gVaaXWtizR+8gDcIwPVlplqKy3RlveihP8nUCZZGq/6Sw+yxkVPbejPS
	PkuTJTGbasqDP6e1cR2XtG2hHBQ2JpWNsTMxpb3s5NroQrv0fFVYQPyavdvSnYse/X9J
	Ox01pQ+4LFbF9nlrv/Q/1fT2z9E3j9ru2cYtoT+su7zdFpD8OqpEEQSOq2YM0tWhYXvN
	3KbBVIPzPx69Jnqv3XyHx2rXBEhQw6N2v/u+M4u+2L8maeXf13y+mEDIyQS+l8rIkt1/
	Tj6G3zVhreYOqMl+SVlydlIB1hwLKAfoykPSvjXtmYe/QDJwcYzN3FDffOtaAUMWjs3L
	niCw==
X-Received: by 10.50.43.136 with SMTP id w8mr656752igl.20.1397635311418; Wed,
	16 Apr 2014 01:01:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 16 Apr 2014 01:01:21 -0700 (PDT)
In-Reply-To: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2014 01:01:21 -0700
Message-ID: <CAMKF1sriUuz+rQg7y-twkXdSU5b1GRghLUaQL-Tg12RJB+Qzjg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Wed, 16 Apr 2014 08:01:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 15, 2014 at 11:49 PM, Journeyer J. Joh
<oosaprogrammer@gmail.com> wrote:
> From the git log prints poky is actively developped now but
> openembedded-core is not.

OpenEmbedded-core is very much active and is at heart of everything around OE
poky is a distribution based on OpenEmbedded and it also serves as
default reference distribution of Yocto Project
and there are many other distributions which use OE technology for
build system, poky uses combo layer tools to merge the layers it uses
into a single git repository thats why you see different commit SHAs,
some other distros e.g. SHR or Angstrom
uses different mechanisms than poky for creating the sandbox out of
many layers, where the individual layers are clones
and consumed as it is.

