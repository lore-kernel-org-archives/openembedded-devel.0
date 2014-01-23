Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD366E7D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 10:42:26 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so1863949oag.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 02:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=dUPb4okIZQ3mO97qHdrts/99plZ379WYRoU8QDu0Fiw=;
	b=zbIZsTbg2a+E1KVlQ/zWLasqWepLcCtfF6aKhCUbHA/14UcmUhdUZUQ7chmZ6xBQgR
	ncb7DREHOumTBhwzi/DNf7Os823d6rAgUZgsaD8HP0Kp1xOMgWxiIZPAF3l3Y75/nRyE
	EwvFRROgfZRcfrhpqFOU3yWO8qcxiUsKPdIm23ha6FcGUxsxyjzXBdL5GB0x00f7x9c5
	Fzu5rsZcl7ZU3DfPTLK/EmIGtMEpfqq4dX37e6Gd+d/2ETuR6RHW8SaqbVYXT4BeYGP9
	776mrLq0dsPZlu9elmrXWK/idKgkCn7wDKOztXP0F6sOaRq24a6p31z9PwRaOvVEOAQg
	sf5w==
MIME-Version: 1.0
X-Received: by 10.60.119.70 with SMTP id ks6mr2156040oeb.45.1390473747022;
	Thu, 23 Jan 2014 02:42:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 02:42:26 -0800 (PST)
In-Reply-To: <lbqp0j$b55$2@ger.gmane.org>
References: <1390332748-31444-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZOjUDhRCN7QPHwPckvDxzbvOWwEb3iT7ZRdnWwD3zZew@mail.gmail.com>
	<CAP9ODKr+d8tG=XUsAR=btn3=vfetvQusu=oid-bCkPGonmGXsw@mail.gmail.com>
	<lbqp0j$b55$2@ger.gmane.org>
Date: Thu, 23 Jan 2014 08:42:26 -0200
X-Google-Sender-Auth: xgbi88n93dhSIjac137_GRbVeEQ
Message-ID: <CAP9ODKqPQ+NU1rYPGvtSAYaiMbqzOoSv4xFoFJ8ZoVMiR+8mYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xf86-video-ati: recommend linux-firmware
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
X-List-Received-Date: Thu, 23 Jan 2014 10:42:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 7:57 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Otavio Salvador schreef op 22-01-14 15:36:
>> On Tue, Jan 21, 2014 at 6:21 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>> On 21 January 2014 19:32, Koen Kooi <koen@dominion.thruhere.net>
>>> wrote:
>>>> Technically it won't work without, but it's possible to build the
>>>> firmware into the kernel, so use RRECOMMENDS.
>>>
>>> A blanket recommendation like that seems like you should be splitting
>>> the relevant firmware into a separate package first.
>>
>> Agreed; this helps to reduce the footprint increase from this change.
>
> http://patches.openembedded.org/patch/65573/
>
> I'll send an updated patch for xf86-video-ati after the above lands in oe-core.

Thanks a lot

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

