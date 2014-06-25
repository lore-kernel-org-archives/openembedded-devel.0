Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id B3F4E60CF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 23:46:10 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id x13so2464756qcv.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 16:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dys2IPkNJGd9fSSGSkEap5Okb2JG+6ZXmenXS3xbddw=;
	b=bQQariCjWyKGLLdLv19xhkh0+QqGYvq6/x1cEr3NqQFIt/mXQTAfAZBQCKkvd4Uv8j
	Q/Zp/quxiuySsGDZHWVqrqf/ucZyMi88t+C5anJ+ufZgtACFXQDZvDgaIK9d5lMd2LmF
	RK93NsOLYPdcf95bVxLBda1hCVhumudtKBUsLb9gGGZBb/U3iQkCHXBzkeVydACs+6QA
	Ir4kO9mEEobIEdBWbtV3KLh1MZMAJkkNJOxKS4xq2qH/RD/X+YJFV+offDJSufAArFda
	jgfPm1o/Yi34ZcbpPKDwbpF0WVhABQUVVwTesL6w15DE7BKgk/xxS5qyHJEylWGdMov2
	s6wg==
X-Received: by 10.140.107.182 with SMTP id h51mr15952175qgf.82.1403739970952; 
	Wed, 25 Jun 2014 16:46:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Wed, 25 Jun 2014 16:45:50 -0700 (PDT)
In-Reply-To: <53AB5ADB.3080403@balister.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 25 Jun 2014 20:45:50 -0300
Message-ID: <CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 23:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Philip,

On Wed, Jun 25, 2014 at 8:27 PM, Philip Balister <philip@balister.org>
wrote:

> On 06/25/2014 04:13 PM, Diego Sueiro wrote:
> > Hi Denys,
> >
> > On Wed, Jun 25, 2014 at 3:55 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> >> http://cgit.openembedded.org/openembedded-core/tree/scripts/wic
> >>
> >> But indeed, better documentation would be most appreciated.
> >
> >
> > I didn't have a chance to take a look and test wic tool.
> > Do you know if it can be used to generate sdcard images for TI's Sitara
> > SoCs?
> > The _problem_ for creating a sdcard image for Sitara is the configuration
> > of Heads, Sectors and Cylinders that should be passed to sfdisk and needs
> > to be done as root.
>
> This isn't true.
>
> https://groups.google.com/forum/#!topic/beagleboard/ro5k5r4Cuq4
>
> I've avoided the CHS business for ages and haven't had trouble booting


Thanks for the link.

About 3 yeas ago I have issues with this using an industrial 2GB uSD from
Delkin Devices with am3517. And as far as I remember I just got it working
with CHS configuration.

I'm going to test it again with a Sandisk uSD and am3359 to see if it
remains. But I don't have a Delkin uSD and am3517 anymore :(


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

