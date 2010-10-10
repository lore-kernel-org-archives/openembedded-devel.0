Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4jbQ-00031s-0n
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 02:17:42 +0200
Received: by wwe15 with SMTP id 15so2000054wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 17:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=mlS1Zuua55WKk78yE1s6MVohj2sVljaL9a0r8V2hLWM=;
	b=p13bwsGcooegTZfHyY0HKgIHjlzITZdOFb/EV8witcvs5UiuuTDpfD9Xw5XRcSfZmN
	2rFHI2Pnmm+yd7RWFquBZvONbx3j3kzFHGoR8IPTbtl/Lg6uUXlB/Q2Hyt2fMVMmJgnZ
	KlA9J+KuePfb9j88RWHOdrVajyhpiD1B0Blz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=CMx8K3LDVOXW35khOGZG6kILBQ3ViYaW5ZCNva/AoGWkw9coierY30yesdYVrYDwx6
	5mupImdNFQdnr5hk+C8SyQRoN4SwXAM4GpnVxZmk0p4FUP0Q3KMhVKYQXpTNkhYUX7fc
	wxn85UzvDqOermzI51z1czJF49TyHD2OsgLUs=
Received: by 10.216.71.206 with SMTP id r56mr2232653wed.29.1286669820212; Sat,
	09 Oct 2010 17:17:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sat, 9 Oct 2010 17:16:40 -0700 (PDT)
In-Reply-To: <AANLkTikmzD_v4YbOAMq3GX42=Tw0p-f6pWc8JXJyj5=m@mail.gmail.com>
References: <AANLkTikmzD_v4YbOAMq3GX42=Tw0p-f6pWc8JXJyj5=m@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 9 Oct 2010 17:16:40 -0700
X-Google-Sender-Auth: 1rti0LScXNe_9NF0M-7x4FvN4OY
Message-ID: <AANLkTincZByMDAyZZoUEsfR+OFjznvZFj1Efk3mBSx7o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: kernel packaged staging issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Oct 2010 00:17:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 9, 2010 at 2:51 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Tried to rebuild an image from packaged staging and got the following
> error for my kernel:
> install: cannot stat `arch/arm/boot/uImage': No such file or directory
> This is from
> /home/frans/oe/tmp_minimal/work/sheevaplug-oe-linux-gnueabi/linux-kirkwood-2.6.32+2.6.33-rc5-r18/temp/log.do_deploy.4309
>

Make certain that do_deploy runs before package_stage.  If a task might run
before it, or after it, then whether those files are included in the pstage
package will vary.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

