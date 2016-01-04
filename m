Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C7ED3731C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:50:30 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 1so114000566ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DB/jFLJktEI8S+dKhcqvVeyGR6fm8zXwZFVs5o5j04o=;
	b=H830ut19bCavlkRfMK+PKdNLaL3dUzPcovpnP02wfD10dkxrRpYl8ObwAdcKzAYNo2
	hymGZHKNdlTBKUoR64s4vUguQReW4TClxrNcf2Ea+A+VGiwUMaBn6q3BcAK8pHi8A36B
	k0zFepXRWI9mus2RW0kcTFs362F2mGrKV1zrrdMnBKjgZkNH6ibkoBM7PfSSl81u5vi7
	yFZGBr1jvC0TBbB+KtO2DMhUZCuddIitRkLk/tsd1L9xY9ayMTHCgyRmldawJqPl8iWK
	xGKQgEgmzybd4E7eHtZtEFnyf7L4W1YI3CiTJ5/FBFXqMLHSVZ2QHkb6ZYDRmmv32qZP
	x6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DB/jFLJktEI8S+dKhcqvVeyGR6fm8zXwZFVs5o5j04o=;
	b=m8RTiU2vVaup6z11txATHgTXnujWTR+Devcq/MFjD81zUOipvijW7VJznLE+hEC3rZ
	Viu3E9cjIt11clySFFbSBZj2+8ngMPmiGV8NGXfTPTwOt4dCzCbdRTnsRjlG4x6TLkuz
	cnKJOwtRh7FO24VhdhuqgSU8kC+tmD5ViRuI+FA6C7ToykY8JFysozCflPrXxxgC92lx
	AGv3TIIJcV6kHQqmseDyacT7e4SPsm7IpHsc1koVBsqcPeirVuvnrVoPkvR0bsMmLyB1
	V71enQJLjrIlquViwiDgEcBnr23vZ/pRJuQRrBZ+R1BL6z6nylHNA+hLAjSE3OqYjEV8
	MwyQ==
X-Gm-Message-State: ALoCoQkGwdS+GM2e5GFxfCaM6iVcYOVZa90EinZT07Zfx2XRCrl/07ziarnk3tMisxGJPlX104mB8AybZdjW0nDSLVZmgGatac/FIPoSoJzcXjG3GAeH5N8=
X-Received: by 10.107.135.104 with SMTP id j101mr51758277iod.133.1451926231070;
	Mon, 04 Jan 2016 08:50:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 08:50:11 -0800 (PST)
In-Reply-To: <20160104084826.GA4807@ulm-bmuc496424.bmw-carit.de>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<20160104084826.GA4807@ulm-bmuc496424.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 16:50:11 +0000
Message-ID: <CAJTo0LbM6p7BxOXf5bfOVMwRdLDWdYVqJCc5h79euMqfQeoo5g@mail.gmail.com>
To: Clemens Lang <clemens.lang@bmw-carit.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Delete all .la files?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 16:50:30 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 08:48, Clemens Lang <clemens.lang@bmw-carit.de> wrote:

> Note that any software using libltdl will still require the .la files
> and must thus opt-out of .la file deletion. ImageMagick is probably the
> most common occurrence of this.
>

The use of modules in imagemagick is disabled by default, so this only
impacts people who change that default (and the wiper will optional).

Ross

