Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id ACF5A73695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 18:35:07 +0000 (UTC)
Received: by obbnt9 with SMTP id nt9so5245805obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CmSNg65y50Qdi6tYkvEf8OLxog8YmI7BVF1aj9s+8pI=;
	b=QELXtTAxVbymHael1ySGrcSEQdTsutZZXFqubVsCR0tPea9ZbUkwQgqiOOAdhKYZ+Q
	nH7nhTSgvp5TbaHliuOwWbJWLzHt04FgdU7DHozs/QgnbksBOSG4+O81TPSk3/gVORvD
	/Eg4IQzJcnL4xYpxIuykQ9N3Wt5HMTxcS0/fOAPLjjF+VecQKxbgqpdYxviHZ8SG2Yn5
	uUvhcXuF+4CzpMbjYmWMu1av1MmzEjxG8ra9KG84A1dfWvHXyZAmTGF+UoUPe82J27Pm
	AJxhewjPlYC9E4w5ZlfAXYso2G8WcNmEup9qXUAR6PzWuK0O5xIhQ2la+fq3HJ4nagR0
	eewA==
MIME-Version: 1.0
X-Received: by 10.202.202.80 with SMTP id a77mr113995oig.118.1433961308424;
	Wed, 10 Jun 2015 11:35:08 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Wed, 10 Jun 2015 11:35:08 -0700 (PDT)
In-Reply-To: <CAMKF1soVSS2nk071dCeORmfue1sGhqUY4q0Akzfz+1yOeUQ2MQ@mail.gmail.com>
References: <1433885941-13650-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVSS2nk071dCeORmfue1sGhqUY4q0Akzfz+1yOeUQ2MQ@mail.gmail.com>
Date: Wed, 10 Jun 2015 11:35:08 -0700
Message-ID: <CAJ86T=XqGLSh+2EZJy_CucVY4DBva_30zZ=XHGbjTRNiuq0E2g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] libupnp: add initial recipe, libupnp v1.6.19
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
X-List-Received-Date: Wed, 10 Jun 2015 18:35:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 10, 2015 at 8:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 9, 2015 at 5:39 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> +-echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
>> +-cp autoconfig.h build/inc/autoconfig.h
>> +-echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
>> +-cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
>> ++echo "configure: copying \"autoconfig.h\"          to \"\$srcdir/build/inc/autoconfig.h\""
>> ++cp autoconfig.h $srcdir/build/inc/autoconfig.h
>> ++echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"\$srcdir/build/inc/upnpconfig.h\""
>
> shouldnt this be relative to builddir or top_builddir ?
> --

These are copies of the config headers which are only used by the MSVC
projects in $srcdir/build. I don't think the MSVC build would find
them if they were put anywhere else.

> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

