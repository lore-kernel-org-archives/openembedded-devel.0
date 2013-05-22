Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id D467560657
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 10:31:28 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id oz10so1295365veb.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 03:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=UlmCOckd974NxVMTBnxkvuH8KLMjRb0AEwv4C/XtJNs=;
	b=nqtAFJRNkX2fvig/5iYl20yQOM336r8eSNfzRXsMEFw3NBYbwAcik7UZRMBS0SfLoe
	ktEGbk/0pZgLSMWrOYNySxzwV+sra9oZvpM3FRILvIuyHmh2oSdBKcCCypYyCbsp3VYv
	zofqhhJxTgVuDncs/u/ri03nMh8bN0SbSwYwtdNSZG0utyhOObUeH/uMVYDVoefjjgOI
	CczZFFnNF/n/UMxzm6Tk9v/Ej6VY5LxonEYpsLQRC6RtAeDgBGqqYqafTcsn5Sn5Op4c
	qzZ2qW04AK39AhACSh+HQHiAhJfSDTKfwK2uwSuTFopGCu8yhX1uYlSZBs8LfgmshTZW
	RaUA==
X-Received: by 10.220.191.129 with SMTP id dm1mr2566056vcb.54.1369218689464;
	Wed, 22 May 2013 03:31:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 22 May 2013 03:31:09 -0700 (PDT)
In-Reply-To: <CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 11:31:09 +0100
Message-ID: <CAJTo0Lb-d-ZOYc+WxaONDXy+vwbsEJKG8SsnQ0LDP7og5Sm9SQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn49RsB7JPXRRSvYcYg4So970C1lFCF3TK1X0MCctElADUaVuyFAZ+8pXvuoOsyeTNaH+Zx
Cc: tsc <tsc@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 10:31:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 May 2013 09:31, Andreas M=C3=BCller <schnitzeltony@googlemail.com> wr=
ote:
> 1. systemd migration:
>
> From what I see the only major step left over is to bury meta-systemd.
> The only appends found there are those for oe-core. I asked for this
> long time ago [1] and support was offered but...

This is a 1.5 goal, and will be getting around to it but I'm also
going on holiday in the first week of June, so if you want to send
patches before I get to it them you're more than welcome.

> * Are there plans to update gtk3 to 3.8.x to have wayland support?

Yes, another 1.5 feature I own.  I have most of the pieces around now.
 If anyone has a ARM or PPC board to immediate hand, then doing a
configure of at-spi2-core and at-spi2-gtk on the devices to get the
right alignment values (yet more alignment checks in configure.ac)
would be incredibly useful.

Ross

