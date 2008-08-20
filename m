Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KVjhs-0006XA-82
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 11:10:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KVjgn-0001He-OD
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 09:09:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 09:09:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 09:09:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 20 Aug 2008 11:08:59 +0200
Message-ID: <g8gmvc$cob$1@ger.gmane.org>
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Wed, 20 Aug 2008 09:10:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi
>
> I was trying to use gcc 4.3 for some uclibc stuff and found it broken.
> This patch fixes it.
>
> 1. Fix target gcc build. The earlier patch I did to fix SDK build was
> insufficient so I enhanced it.
>
> 2. uclibc Locale patches needed a facelift to be able to work with gcc 4.3
>
> 3. Fix uclibc 0.9.29 to get build using gcc 4.3
>
> 4. Disable libobjc for arm uclibc. If someone really needs some
> packages on uclibc which need objc support then you better fix gcc
> first :)
>
> I intend to apply it on .dev. comments are welcome
>
> I have tested it on arm uclibc and arm eglibc doing bitbake gcc

Your patch has

+OBJC ?= ",objc"
+OBJC_linux-uclibcgnueabi ?= ""
+OBJC_avr ?= ""

That probably needs to be:

+OBJC_avr32 ?= ""
+OBJC_linux-uclibcgnueabi ?= ""
+OBJC ?= ",objc"

Note the '32' in avr32 and the order of weak assignments.

regards,

Koen



