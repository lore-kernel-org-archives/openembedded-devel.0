Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 154266B7BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:19:32 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so4366044wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fxS5nCz5lL5k7glDyltIyWRRkHi74B6jAmQf9tGhzRg=;
	b=xvl7lAxh5/Lzs+9p1AxaYvRbBMtMiKEx704a9ezeGW7BWEzmPJR5F7d3ZYZigxBNIs
	IN+xX5VZH8hFa++rrbfTT+5IhAFrPvhOc9waulq/syv9G4rPGb4Cig90A4FpJ76Qou1s
	XSu3mSYoKc702gRE9uR5yOXQH6LpyIEQ+qY1AwvM8S2lP5OZJyCOVOzeVONIc9peS/1Y
	LCjPR4s5xTU+Ur2kFZMIutNhY7DaQEpEQ5MT78aRkj06L5PycpmjfmAq3BUlQbEKiLzH
	FbCPY1v09y8oklUXbUSJixZVBUxfvDYHz5U0yAeUeeZkPNvcGdppwpF3UZMo+AZQDvrZ
	AL+Q==
MIME-Version: 1.0
X-Received: by 10.180.206.15 with SMTP id lk15mr25548744wic.43.1405358373456; 
	Mon, 14 Jul 2014 10:19:33 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Mon, 14 Jul 2014 10:19:33 -0700 (PDT)
In-Reply-To: <CALmOhgngis1Qc8GeLhpjYpb1-m1GNXtseuji+e4pnNiAXr7ByQ@mail.gmail.com>
References: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
	<CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
	<53A9E471.8080500@linaro.org>
	<CAOLEWZUbT17s1pxuxK7Tkvvf6Jk2AO2w5dk2iWuAVCfzTkpPsA@mail.gmail.com>
	<CALmOhgngis1Qc8GeLhpjYpb1-m1GNXtseuji+e4pnNiAXr7ByQ@mail.gmail.com>
Date: Mon, 14 Jul 2014 10:19:33 -0700
Message-ID: <CAOLEWZW-Qmkqwt=B=69iKHnfv_ebM4xeXq+pAh07=BOyYawDXg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][MASTER][PATCH] lxdm: add libpam DEPENDS
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
X-List-Received-Date: Mon, 14 Jul 2014 17:19:40 -0000
Content-Type: text/plain; charset=UTF-8

In theory pam optional, as it's a configure option (and it's been a USE
flag forever).  I don't use systemd, bu I would guess the systemd login
manager might work on its own (ie, without pam).  Not sure if lxdm supports
remote auth or whatever, but for now I'll assume that pam is optional and
test what I can.  I'll let you test the systemd version...  ;)

Steve


On Thu, Jul 10, 2014 at 8:09 AM, Trevor Woerner <trevor.woerner@linaro.org>
wrote:

> Hi Steve,
>
> On 25 June 2014 00:16, Stephen Arnold <stephen.arnold42@gmail.com> wrote:
> > Yeah, it would certainly make more sense with a packageconfig option for
> > that; currently it doesn't work either with or without the "pam" feature
> due
> > to the missing plugins.  So if you want hard deps, then the plugins need
> to
> > be included as rdeps.  Otherwise, adding an appropriate packageconfig
> option
> > to the flexible depends sounds good.
> >
> > I still need an init script anyway, so...
>
> Just curious to know if you're still working on this? It doesn't look
> to me as though pam is optional with lxdm (?)
>
> Best regards,
>     Trevor
>

