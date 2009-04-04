Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LqA6H-0002tw-1W
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 19:56:15 +0200
Received: by an-out-0708.google.com with SMTP id d11so1430151and.30
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=Kux8mmUTNaduxyXC0ny1kjPrUNBQFKxMovOhvTpseBM=;
	b=HSaXRtRk+wVqElnmPVKJbXBPWZmm8mHOpe5rU0D2OnymRUflVKDFdw6Rcdz8+GAcCY
	hTIp1tGJWKj54dQXxP5l/j2R3pJi3H5LJ30qnbuS8MKlX9lOHIeGnpLLqgSkrAHupz7J
	zmtfy+ez1e4HhLPqTuD8/Xe7AV9sFC38vtSaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=uiAT8QX4F6Vie+Wu+8foqQ1C0x6F3uYEFMZvQPJLGGX18IO5y7ZFiwOSxzuUvcAk1J
	RNqVR195sUIhaObH7KwnK4XYLynrJ4+aT8hXG1t6FdF74fplSWrqWTTfemL1SIkfE+AQ
	iHyUoAnEo4awO6PwDyzjK5ge32K+WEtOSbPio=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.208.8 with SMTP id f8mr5075332ang.42.1238867614090; Sat, 
	04 Apr 2009 10:53:34 -0700 (PDT)
In-Reply-To: <20090404090946.GA13413@rainbow>
References: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
	<gqnn72$f5t$1@ger.gmane.org> <20090404090946.GA13413@rainbow>
Date: Sat, 4 Apr 2009 14:53:33 -0300
X-Google-Sender-Auth: 887e42c514f9642a
Message-ID: <be7a9f3d0904041053k38e2711akba9b549734dc87b@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.244
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH/RFC] base-files: add noatime to rootfs mount options
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
X-List-Received-Date: Sat, 04 Apr 2009 17:56:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2009 at 6:09 AM, Dmitry Artamonow <mad_soft@inbox.ru> wrote:
> On 13:48 Sun 29 Mar =A0 =A0 , Koen Kooi wrote:
>> On 15-03-09 21:47, Dmitry Artamonow wrote:
[...]
>>> Fix it by adding noatime to rootfs mount options in fstab.
>>
>> Isn't 'relatime' a better option?
>
> Maybe yes, but we need more care in this case, because relatime has
> been introduced in 2.6.20 [1], and there's still can be machines using
> older kernels (judging solely by looking at the recipes in recipes/linux)=
.
> I fear that we may break booting on these machines by passing
> unsupported option to mount.
>
> [1] http://kernelnewbies.org/Linux_2_6_20#head-6804816ab4f07548635032afbe=
dd3e1f4eb3d1d7

I belive that if those machines still uses old kernels they have the
responsability to deal with those things; besides that it is very
common for machines to provide custom fstab files so it won't
hurt to put a specific one to workaround it if required.

Regards,

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


