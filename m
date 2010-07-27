Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Odc5U-0002Bk-Uj
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 06:48:21 +0200
Received: by iwn34 with SMTP id 34so3482143iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 21:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=jmbc0iV4wl6vTJt1Cqj31rj8rkjNswDPcr2PfEoXfo8=;
	b=gokW4OaPUDQEemr8DxUZMveLCOMBVVC0KBKhP3WHpQ+fl011G9gd6HdYTXQk2mMbwQ
	Wy9Swa8+Go+c95b684znOBhFxsgoGlAZDjhCDlc9TB7OYrYE0ZXYW9SIn1RSuqbwIJFJ
	R1IT1grpK72oatl51JcgXUQvk3GWgTFbXRu6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=jPDHxlNKZ8FPyuxXy7YRdD9oWNJraWOPTLZ1rvpqDpC2xVxKXeabXcigfMyBDPODPz
	wSC7F9g+4JSWgjZLZPdofa3/APqCHzNHb0JRQ8qfxNyqh5ZzD942+XmP1s5V1QZl5zk0
	ZbZjP6EfOvXUFo/CSrwt2MZqvjBiZspzdKo4A=
Received: by 10.231.37.140 with SMTP id x12mr9136339ibd.190.1280206085148; 
	Mon, 26 Jul 2010 21:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Mon, 26 Jul 2010 21:47:45 -0700 (PDT)
In-Reply-To: <4C4E1332.9080804@mentor.com>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com> 
	<4C4E1332.9080804@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jul 2010 21:47:45 -0700
Message-ID: <AANLkTi=b_marUpgxb6c7eGercofhmySGo+6tMAEkq3vG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/7] Make multi-machine toolchains to co-exist (revised)
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
X-List-Received-Date: Tue, 27 Jul 2010 04:48:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 26, 2010 at 3:58 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Khem Raj wrote:
>>
>> Hi
>>
>> Following series of patches are for making multi-machine toolchains
>> co-exist with
>> new cross staging for toolchain.
>>
>> It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to
>> ${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS
>>
>> which means that a toolchain for armv7 is called
>> armi-v7a_oe-linux-gnueabi-*
>> and for armv5te its called arm-v5te_oe-linux-gnueabi-*
>
> Sorry to come in late here, but why can't we instead populate
> sysroot/../usr/bin/${MACHINE_SYS}/ and keep the old toolchain triplet?

yes we can. it will create its own directory structure under
usr/bin/${MACHINE_SYS} and we also have to fix the accesses to tools
it uses probably some
other humps too I have not pursues this.
gcc install supports multiple installations to live together  thats what
I am doing with these patches.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


