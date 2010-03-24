Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1NuFv7-0002Ma-1Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 03:02:11 +0100
Received: by iwn4 with SMTP id 4so2736850iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 18:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ckXrvXi9o1XP5BOvAIay01u+l50rsNG17oXc/LUHvEc=;
	b=IDNaTMB26TqKMUJ74EZ1ge3tkQHaK/dHJXq+bbgjzppd3tFx4jfpSUsMTWFbFWdC/X
	fKkVoTdvh6t8PYCYoRHg7QojaBkXNQ1K7Cvz3M2g9mIH7ApNgIP6BDI/o0diA+bzHAO+
	imgQ4BwGSsEDnZueE7wOiuS3aa2EWCGTzEj9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=K6Hl6DMwtYw+L+aDcwLisusbjpuaLXKiyTnmgcc8Lg9IAj9Em5VZqeINsOv4Kc7yts
	sa59Ze6+z+0jleWQm2n8mwXSjbLZ32rqnpHHwhJEopEHuvSIFw4cEJAvJ9TiqF/fqZBE
	KP7dOH2KP20kXiqDRXPe/2taNy7m3uKsNPuCg=
MIME-Version: 1.0
Received: by 10.231.152.75 with SMTP id f11mr3128639ibw.50.1269395939271; Tue, 
	23 Mar 2010 18:58:59 -0700 (PDT)
In-Reply-To: <f275a9df1003231753y25619594i8310eb1883688fc9@mail.gmail.com>
References: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
	<f275a9df1003230243h6942495bya29166db2fda49a@mail.gmail.com>
	<20100323205054.GB12446@gmail.com>
	<f275a9df1003231753y25619594i8310eb1883688fc9@mail.gmail.com>
Date: Wed, 24 Mar 2010 09:58:58 +0800
Message-ID: <f275a9df1003231858m12e94060sb9f8b15d9dd218d@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to rebuild images with updated PREFERRED_PROVIDER_xxx in machine conf?
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
X-List-Received-Date: Wed, 24 Mar 2010 02:02:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

resulted two things:

1. bitbake -c package_update_index opie-image
ERROR: Task do_package_update_index does not exist for target opie-image

2. I just found that:
although "bitbake some-pkg" will produce some-pkg-mine.ipk correctly,
some-pkg was still in some-image instead of some-pkg-mine after
"bitbake some-image". :-(

strangest thing is, if "some-pkg" was "virtual/kernel", then things
all worked correctly...

 Any info are very appreciated. :-/

Thank You!
jiason
20100324


