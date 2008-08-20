Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KVwH8-0002ih-Vo; Thu, 21 Aug 2008 00:35:35 +0200
Received: from 88-111-45-211.dynamic.dsl.as9105.com ([88.111.45.211]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KVwG3-0004En-BS; Wed, 20 Aug 2008 23:34:27 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8gmvc$cob$1@ger.gmane.org>
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
	<g8gmvc$cob$1@ger.gmane.org>
Date: Wed, 20 Aug 2008 23:34:26 +0100
Message-Id: <1219271666.9935.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Cc: openembedded-devel@openembedded.org
Subject: Re: uclibc and uclibc-locale support in gcc 4.3.1
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
X-List-Received-Date: Wed, 20 Aug 2008 22:35:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-08-20 at 11:08 +0200, Koen Kooi wrote:
> Your patch has
> 
> +OBJC ?= ",objc"
> +OBJC_linux-uclibcgnueabi ?= ""
> +OBJC_avr ?= ""
> 
> That probably needs to be:
> 
> +OBJC_avr32 ?= ""
> +OBJC_linux-uclibcgnueabi ?= ""
> +OBJC ?= ",objc"
> 
> Note the '32' in avr32 and the order of weak assignments.

You're probably correct about avr/avr32, but the order of the
assignments is immaterial here.

I think what Khem actually wanted was a weak conditional assignment, but
unfortunately bitbake doesn't have such an operator (or, indeed, true
conditional assignments of any kind).  The only way to get that
behaviour is to write it as an anonymous python function, which is
doable but somewhat tedious.

p.




