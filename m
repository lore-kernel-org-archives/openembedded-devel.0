Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PQkoW-0002FG-7p
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 19:01:56 +0100
Received: by qwg5 with SMTP id 5so2814274qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 10:00:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.131.18 with SMTP id v18mr8399846qas.243.1291917624280;
	Thu, 09 Dec 2010 10:00:24 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.29.2 with HTTP; Thu, 9 Dec 2010 10:00:24 -0800 (PST)
X-Originating-IP: [95.29.187.136]
In-Reply-To: <20101209170734.GM3186@jama>
References: <4D00F942.6040103@comcast.net> <4D010B10.1060903@gmail.com>
	<20101209170734.GM3186@jama>
Date: Thu, 9 Dec 2010 21:00:24 +0300
X-Google-Sender-Auth: knkS9DJdF5wordA0RPfhA4j3kNk
Message-ID: <AANLkTimuRZ345Oi=idYh+_7RxjA+LP87-MEaHqZHVNG-@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Release-2010.12 build failure - eglibc do_package Failed
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
X-List-Received-Date: Thu, 09 Dec 2010 18:01:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/9 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Dec 09, 2010 at 09:00:00AM -0800, Tim Harvey wrote:
[skip]
> better to go to that directory dirrectly and running that command in
> terminal to see whole output from localedef, it can be unrelated issue like this one
>
> http://sourceware.org/bugzilla/show_bug.cgi?id=11258

I'll note again that poky have code in libc-package.bbclass that is
using cross-localedef instead of qemu to generate locales.

http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta/classes/libc-package.bbclass#n277

It would be great to port this to OE..

-- 
Yury Bushmelev


