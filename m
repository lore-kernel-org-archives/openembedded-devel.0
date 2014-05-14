Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (unknown [209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id ED4A865FE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 19:10:40 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 131so1962881ykp.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=B3nvuY9mlGE69p5ztqt1MfYze7dAGHFVcCMZBY+ftzI=;
	b=RokKzmV4UpNIgNWwSdma/pNvQQffkgN8XOG+3BP/HmwvRyoB1owI0v8iFxWdlD1A09
	OIrLjPCmHbsmwo+CpRvVeNOAxJHd2+A3WnwKNAXb1I/oC9O4B4rrX+gSxMb0lF9UjblU
	ofsmlu4n2wB+lkdFc+sFdTz0g+6jz9KJBFzQh4vORGRbrEQMySi61ByzGtvxDRK464qk
	vRD711R0lR9X1BlYmUBGAcKZivC0S3nVuYulLgAM0hUI3ZJTmbaKrKO2/rSpE4ia3cFs
	zeiem4nljqF4t2vRDNWq+AOBChdfEVmUgkq0zzsYFZETCzW1jEKGN2bW4oOCULjw06nR
	mk5w==
MIME-Version: 1.0
X-Received: by 10.236.198.243 with SMTP id v79mr7744121yhn.87.1400094264872;
	Wed, 14 May 2014 12:04:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 14 May 2014 12:04:24 -0700 (PDT)
In-Reply-To: <CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
	<20140504214712.GG2486@jama>
	<CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
Date: Wed, 14 May 2014 16:04:24 -0300
X-Google-Sender-Auth: 7rlKMaIvpNWRsaXO55qAEUzHoH4
Message-ID: <CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>, Jonathan Liu <net147@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 14 May 2014 19:10:49 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

On Mon, May 5, 2014 at 9:21 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Sun, May 4, 2014 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
>>> qtdeclarative requires accessibility to be enabled and it is added by
>>> default to the toolchain so we ought to have it enabled to ensure the
>>> default toolchain generation works.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ...
>> As I told you on gtalk, I would prefer default to stay as minimal as
>> posible, why don't you change packagegroup-qt5-toolchain-target.bb to
>> use RRECOMMENDS instead of RDEPENDS so that missing
>> qtquickcontrols-qmlplugins package doesn't break it when it's not
>> available (because it's empty)?
>
> I don't have a strong opinion for either case however I think we ought
> to know what other meta-qt5 users think about it.
>
> In support to this patch addition I think we ought to provide the most
> used features of Qt5 working out of box to users have a good first
> use. Special cases can customize it per need basis. I think QML is
> common enough for us to provide full support for it by default.


Martin and I have different views on this topic and I'd like to merge
or drop this patch. Could people comment on this one?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

