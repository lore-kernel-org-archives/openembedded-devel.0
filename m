Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MeKQ6-0002XV-Et
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 05:04:02 +0200
Received: by qw-out-1920.google.com with SMTP id 4so252470qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 19:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fbOvMcVY/k63hBeqnGQED01+PbuelCietmGaz5faVOs=;
	b=gz4Bnd0XxpU7bYigQMk+UbzCkHkogMguQ3yEt2xmDW07jvd2p0B3SvES5qnvHe4v8N
	Y8U+vsjn9a0J8SLYpWWO93LYy87RwmvnoPgpnEJDGk6mGtqxdJ+xIGWW9UEJ5F+5vVNz
	EUTsyRTTfuVOo2KhMjj1jNfAn4m640Ru18vrU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AmgZ4vsiBFatyaWvJhIjWQRC5jAgp69e94S8jDqudOmPvZ+dlfpMSK7gbZWzXtnytm
	NWoRsI+k2fk7cPhUcvHG+ndrsDKB799waZvEcGGWA+xOnJPoUQduvUT4QDGi6s4ALxG/
	OteFA/wEDshe7F0XyywWyGuuMSubEB3cwPuxs=
MIME-Version: 1.0
Received: by 10.229.93.4 with SMTP id t4mr96091qcm.93.1250822801346; Thu, 20 
	Aug 2009 19:46:41 -0700 (PDT)
In-Reply-To: <20090820050404.GI32010@denix.org>
References: <4A8CD3A8.900@gmail.com> <20090820050404.GI32010@denix.org>
Date: Thu, 20 Aug 2009 19:46:41 -0700
Message-ID: <19c1b8a90908201946o18975addyfd8f8194661620eb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake ignores DEFAULT_PREFERENCE
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
X-List-Received-Date: Fri, 21 Aug 2009 03:04:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Aug 19, 2009 at 10:04 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> On Thu, Aug 20, 2009 at 10:40:08AM +0600, Dmitry Vinokurov wrote:
>> Hello,
>>
>> I want to port OE to LPC3250 board and now I'm trying to build
>> helloworld-image.
>>
>> I've created lpc3250.conf in conf/machine:
>> TARGET_ARCH = "arm"
>> PACKAGE_EXTRA_ARCHS = "armv5te"
>> TARGET_CC_ARCH = "-fsigned-char -mfpu=vfp -mfloat-abi=softfp"
>>
>> Then I've added DEFAULT_PREFERENCE_lpc3250 = "1" to
>> 'recipes/linux/linux_2.6.27.bb', but 'bitbake -v helloworld-image'
>> downloads 2.6.23 kernel all the same. Re-reading all recipes database make
>> no sense.

It could be downloading it for linux-libc-headers package too. bitbake -g
can help you here.

>>
>> Could anybody advise, how this can be solved? I need to use exactly 2.6.27
>> kernel as I know that it definitely works.
>
> Are you sure it downloads 2.6.23 to build your kernel and not the
> linux-libc-headers? Check the dependencies and what it's going to build by
> executing "bitbake <target> -g" and then poking into depends.dot...
>
> Otherwise you can try setting PREFERRED_VERSION_virtual/kernel = "2.6.23" to
> override DEFAULT_PREFERENCE...
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


