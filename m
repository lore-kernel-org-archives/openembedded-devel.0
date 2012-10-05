Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TK7GA-0003W4-Hr
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 14:44:06 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so1662871pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9udBxtwAFcAaINlEfVvufDRtSU2wM6tKJGX/v4F91qw=;
	b=XQiRRF5IiCi3KGneDdj1ZvCfD+dfd93sEE79l2mlaen8KPf1vNsEKSWxLVtJPjC9/T
	p5zzGK5wsZ8klq/9L7yw04ivEIdnT5lHCDozSQs9I2Nw3OE5lVnat0sYesZDAYXzPtIt
	g2J/o66zcrQUyUCLXByvVb3DCAGHzPrl2Cm5hW0RvVXvrNxkmh7LxS5DkfQYFYERoR3y
	7qSBsKLVTq2obR3lRmd0tvSgL9abSpTnSPEEPCiTCuIjnKxcbToNnYp1jzWMyclhRb6O
	wgEr/+scUsT/k5gy0TK/+YPSukP8c83QO2OV3DHoyf4t3gjHFHngYdIHp1km2aGm6HOV
	tVgw==
MIME-Version: 1.0
Received: by 10.68.129.233 with SMTP id nz9mr30268891pbb.136.1349440263639;
	Fri, 05 Oct 2012 05:31:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Fri, 5 Oct 2012 05:31:03 -0700 (PDT)
In-Reply-To: <20121005122535.GB3542@jama.jama.net>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
	<1349323389-16520-2-git-send-email-otavio@ossystems.com.br>
	<20121005122535.GB3542@jama.jama.net>
Date: Fri, 5 Oct 2012 09:31:03 -0300
X-Google-Sender-Auth: MysMCdlPCDFGANfjptHG4qa_zIs
Message-ID: <CAP9ODKov0soW=roBAfUGXW2vaiL8=BF7Kknp7Cmd0kvMrLdZbQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/9] libav: Convert to use dynamic packages to split libraries
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
X-List-Received-Date: Fri, 05 Oct 2012 12:44:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 5, 2012 at 9:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Oct 04, 2012 at 01:03:01AM -0300, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta-oe/recipes-multimedia/libav/libav.inc |   76 ++++++++++++----------------
>>  1 files changed, 33 insertions(+), 43 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
>> index fc0b021..21b57b7 100644
>> --- a/meta-oe/recipes-multimedia/libav/libav.inc
>> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
>> @@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET = "arm"
>>  # faac faad2 lame schroedinger libgsm
>>  DEPENDS = "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
>>
>> +PACKAGES_DYNAMIC = "lib*"
>
> Please limit this a bit
>
> NOTE: multiple providers are available for runtime libpurple-protocol-msn (libav, pidgin)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-protocol-msn
> NOTE: multiple providers are available for runtime libpurple-protocol-icq (libav, pidgin)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-protocol-icq
> NOTE: multiple providers are available for runtime libpurple-plugin-ssl-gnutls (libav, pidgin)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-plugin-ssl-gnutls
> NOTE: multiple providers are available for runtime libpurple-protocol-irc (libav, pidgin)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-protocol-irc
> NOTE: multiple providers are available for runtime libpurple-protocol-xmpp (libav, pidgin)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-protocol-xmpp

I just doesn't understand why it didn't happen here...

I try it here to reproduce it and then see how to fix it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


