Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 720D271F05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 18:19:55 +0000 (UTC)
Received: by wesw55 with SMTP id w55so89247wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=XCputJcFmp4OV9mJnel31hu6x7O20Cp3XiDK6/7Kl14=;
	b=wU7N4sI9htaUbCaU/poedXVPoo5TRLhd+hKK1BoWAZYHhvn5QGV1ZLIRNnb5VIn4bv
	DkwMfAbgQ+GmiFbvWYYoECfsFPiNXJA360GJ2YTsAW6jxIaAD7kV0knUQA+FErwa6QOE
	rnUELyJNw07VR2IYnp71tqKCsuf9PWRpIRUWB8ECz3OFUeyqeOJM0F2speMJ/ewekGtb
	FYjzg0Nrz8rPYYaimxAl0E1Q16go8wPjZyA1alz4JKdpZQoN4mMv493MoCST0UAEJqBF
	wtaditsBm46lm3OcLB1o28H/QV8gNPSS8vExoYVIvFtfLIVRfeUvuvcplReT/uuv/vaQ
	gDGw==
X-Received: by 10.194.108.162 with SMTP id hl2mr65321643wjb.134.1424197196075; 
	Tue, 17 Feb 2015 10:19:56 -0800 (PST)
Received: from [192.168.0.7] (212-41-66-143.adsl.solnet.ch. [212.41.66.143])
	by mx.google.com with ESMTPSA id
	fo15sm25321193wic.19.2015.02.17.10.19.54
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 10:19:55 -0800 (PST)
Message-ID: <1424197193.2293.9.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 19:19:53 +0100
In-Reply-To: <CAP9ODKq6QKYojHUiO96s9Kpi4-c4qD1UtnLKi88D0MkbitKE=g@mail.gmail.com>
References: <1424125658-20285-1-git-send-email-max.oss.09@gmail.com>
	<1424125658-20285-2-git-send-email-max.oss.09@gmail.com>
	<CAP9ODKq6QKYojHUiO96s9Kpi4-c4qD1UtnLKi88D0MkbitKE=g@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [OE-core][RFC] openjdk-7: enable xawt
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
X-List-Received-Date: Tue, 17 Feb 2015 18:19:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Dienstag, den 17.02.2015, 10:57 -0200 schrieb Otavio Salvador:
> On Mon, Feb 16, 2015 at 8:27 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> > The build of xawt has been disabled as its build seemed to fail during a qemu
> > call to generate a file with information on variable sizes.
> >
> > qemu is now called with the relevant path into sysroot and thus works.
> >
> > This patch enables xawt again.
> >
> > Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> 
> I am fine with this change the only remark I may have is force X11
> dependency. Would be easy to put this in a PACKAGECONFIG?

I thought about this. As it is not simply a configure option it's not
straight forward using the PACKAGECONFIG system.

On second thought one could probably make it a PACKAGECONFIG option,
even conditionally set it with DISTRO_FEATURES but then use some python
magic to conditionally apply a patch removing xawt if headless is
configured.

I'm a bit loaded with work at the moment, so it will take some weeks to
come up with a tested v2 of the patch.

Regards
Max

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750



