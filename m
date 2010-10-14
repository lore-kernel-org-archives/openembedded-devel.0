Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6P1I-00005i-L4
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:43:01 +0200
Received: by wwe15 with SMTP id 15so6858397wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8XIMWD6D0IhWHdsBQKk49lYUGIo9UFZeg5ghlQB5NpM=;
	b=uIpTrR9GA42gMqAOoTVeogz20pvQtaQQGADDIN3RRrT10AsgWUL1Q+wBdbVs3lEl0B
	4uccH8vqsUVrIzmuRSir87N9tR6lrmC3KoeeEjJmAL33lQxCcKf0aDCg3A7nqgNs54UG
	nEGPFSRt1xPg/oLUk7xCFAUXeDSTFhxkmJwSM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=fN9p18C0V8P/Py0uqD1eHUobAfjq23Oyj5tlw+8KquXbf5DLshuQYAT2OL0VkTbU6i
	pMU0KFLLhJdaWRlOFrhdnV5UjfMzQYQOBAP8rt6Ud+Ix6RfbXn2v8LjX+d+HHult84/q
	8QL+Q6uOg3OOp6D7WVzxaFHwX9wSxJx9i88gU=
Received: by 10.216.17.9 with SMTP id i9mr64803wei.80.1287067351584; Thu, 14
	Oct 2010 07:42:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 07:36:46 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501B11B1A@deimsg40.de.net.world>
References: <26434292.80091287048749327.JavaMail.defaultUser@defaultHost>
	<AANLkTi=hDDtueQerTUy9FTcpoCbJ9AYozok=-XBkWe7R@mail.gmail.com>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501B11B1A@deimsg40.de.net.world>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 07:36:46 -0700
X-Google-Sender-Auth: iS_ycziRbuAH1jhm76k1zu3ri78
Message-ID: <AANLkTikEUi24rixCaNEEtwhAufNv_D7OPt-WoFCQaAXu@mail.gmail.com>
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
Subject: Re: S98configure role
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
X-List-Received-Date: Thu, 14 Oct 2010 14:43:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 7:33 AM, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@cassidian.com> wrote:

> for me the S98configure is a NO GO !
> I have to provide read only images that have to be used w/o any first boot
> configurations.
>
> For me there is no necessary to final install a image at first boot.
>
> Normally all configurations are able to be done at image creation time by
> some scripting.
> For example, adding a user can be done by scripting, and not necessarily
> have to be done by adduser/addgroup.
>
> Its up to the recipes to create packages which are installable offline
> totally and completely.
>
> Handling of individual settings like serial numbers, keys ... for me should
> not be a matter of first boot.
> It may be a matter of flashing(environment partition) or special
> configuration partitions.
>
> There may be some cases, a first boot installation is necessary, but for me
> it is better to have an unmodified/unmodifieable image on the target.
>

Then go ahead and modify your tree to do so, but don't expect OE to come
that way out of the box.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

