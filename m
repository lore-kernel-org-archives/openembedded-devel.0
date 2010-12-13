Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PSGmE-0007s9-Cf
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 23:21:50 +0100
Received: by fxm11 with SMTP id 11so6180896fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 14:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=gez+2exZXg4NXPtmEm6pOJbj3XYhGT/L57b6pgCPmOg=;
	b=b2zcZqodnA3G+QtdeXRqL3jvsDN+O1qGQgbFB2DAD2s39qUyIYdOy226WlicNbpu2j
	tKVbgb7XWaK9oQb+7GachaxgB2Z4YbRCbcWtk/EjB810iGt5Y5PcPKlvv2bph6JDPib3
	BnO+KzPHxMEv4A/ElYNVJxLR987RRSOzkcA3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Yw6Ta0x5jYKEbqd/lwtj/kMY5sHG7aqYMCRj0sDQEMTytrobLZLWri5VN7WRRK9KAN
	9t1TNa4ZqscDLVjYnskokxaP2fN2uXOxu8csM2J5nM6YqtxkMjf5YrStUfzvUB/mvztQ
	b1lB88Jofnf7IIPFgvlwZWQ566GzkXBbjCz1U=
Received: by 10.223.114.14 with SMTP id c14mr462364faq.103.1292278811825; Mon,
	13 Dec 2010 14:20:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Mon, 13 Dec 2010 14:19:51 -0800 (PST)
In-Reply-To: <AANLkTik3B0Boi4PuUqZiSd8no_BwBoSzcgWVmFcKcY3L@mail.gmail.com>
References: <AANLkTik3B0Boi4PuUqZiSd8no_BwBoSzcgWVmFcKcY3L@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 13 Dec 2010 15:19:51 -0700
Message-ID: <AANLkTinvRwriJ=W50duDtc50t2fCT5PM_3-D6Ec8VwM5@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: task-sdk-native hard-coded to depend on sysvinit
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
X-List-Received-Date: Mon, 13 Dec 2010 22:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

actually, the error only seems to happen when another package is installed
or when it is part of a my-custom-image.bb - which is a problem since I want
to install both it and upstart.

opkg install python python-misc task-sdk-native

when I tried it all on it's lonesome it worked.

AJ ONeal

On Mon, Dec 13, 2010 at 2:27 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> Why should task-sdk-native depend on sysvinit in the first place?
>
> And in the second place, isn't there something like virtual/init that it
> should depend on instead?
>
> opkg install task-sdk-native
>
> Collected errors:
>  * check_data_file_clashes: Package sysvinit wants to install file
> /sbin/telinit
>     But that file is already provided by package  * upstart-sysvcompat
>  * check_data_file_clashes: Package sysvinit wants to install file
> /sbin/killall5
>     But that file is already provided by package  * sysvinit-utils
>  * check_data_file_clashes: Package sysvinit wants to install file
> /etc/init.d/rc
>     But that file is already provided by package  * upstart-sysvcompat
>  * check_data_file_clashes: Package sysvinit wants to install file
> /etc/init.d/rcS
>     But that file is already provided by package  * upstart-sysvcompat
>  * check_data_file_clashes: Package sysvinit wants to install file
> /etc/default/rcS
>     But that file is already provided by package  * upstart-sysvcompat
>  * opkg_install_cmd: Cannot install package task-sdk-native.
>
>
> AJ ONeal
>

