Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pj3m5-0005fu-9K
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 06:55:05 +0100
Received: by ywi6 with SMTP id 6so1366470ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 21:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=pQux5HoV4keVOEqu3R0YA8H5+5SHz/y5uVylluhYwSc=;
	b=bD8Ub0dju0xvnXCi+mGp81DCPi7EWngo7m9rIXa90j1a6Sm6CGnF23ktuPI19BUOpb
	1yO5p9xkfXOIfeWjw7tVEgsPwI/6L4zJ75TCR1rxU+/b5BNR1GWR2BvZ7WB7Zpg5pIdO
	HTW4yrsB/skQxfZHvwVzkEiEZB0ah0cf8laLo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vqfRHFBov7UZ2x8u1ATgej7r2e/0eL/wzsyR3CO7B4V/Z7dDsO/q/lNrqis28HaKLo
	rk1tO7bXFjOZ8qdtlgHT1z6DdXBphiYqhC16Z8psVyGDkl5WcpmRiVimnKZKkXeO1eAJ
	+bRLRR7P7J0sndMtZIaO1KTW3N8ORmfmpGey4=
Received: by 10.90.81.19 with SMTP id e19mr5982364agb.7.1296280453855; Fri, 28
	Jan 2011 21:54:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Fri, 28 Jan 2011 21:53:53 -0800 (PST)
In-Reply-To: <AANLkTimnVCsZ7sW0yW_jqRV-nosmOQd-9pprD67HDNem@mail.gmail.com>
References: <AANLkTimnVCsZ7sW0yW_jqRV-nosmOQd-9pprD67HDNem@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2011 21:53:53 -0800
Message-ID: <AANLkTimzmP0RRL4sEdg_-aR0MrsUgL9A6fdnBDc8GXHS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to know why bitbake will pick a wrong .bb file after providing PREFERRED_PROVIDER value
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
X-List-Received-Date: Sat, 29 Jan 2011 05:55:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 28, 2011 at 1:37 PM, srinredplano SP <srinredplano@gmail.com> wrote:
>
> *linux-omap3axon-2.6.22-pspaxon.bb* file :
> #####linux-omap3axon-2.6.22-pspaxon.bb ##
>

This would make PN of your recipe to be linux-omap3axon-2.6.22-pspaxon
you probably dont want that you should name it something like
linux-omap3axon-pspaxon_2.6.22.bb

then in your <machine.conf> add
PREFERRED_PROVIDER_virtual/kernel = "linux-omap3axon-pspaxon"

in linux-omap3axon-pspaxon_2.6.22.bb you can add
DEFAULT_PREFERENCE_<yourmachine> = "1"

-khem


