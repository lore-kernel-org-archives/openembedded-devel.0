Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB4uJ-0006v5-9q
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 16:24:11 +0200
Received: from localhost ([127.0.0.1]:35543 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB40z-0002jf-1D
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 13:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=GMNYZBq9DWRJ3xHPwvbWSlg2mm0=; b=H64K9c7cj/ksmTQZTxRJLQY9fCab
	wMWDHvv+NSlcPNkYvkx3jkdCWw9Z4nZTm7Wuks1GIKRXxz6ZvFfdUrPJRKhJH/UL
	uWk3eKbKRk00xNSSkyx61tDMGvLJNKnz5DrAB5f971fHxipc1TgshA1n1oehhcnk
	kIIjvn4BwOEw1Xo=
Received: from [195.171.99.130] (port=6336 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB40y-0002jc-VJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 13:27:01 +0000
Message-ID: <504DEB06.2060901@communistcode.co.uk>
Date: Mon, 10 Sep 2012 14:28:38 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504DE45C.2010202@communistcode.co.uk>
	<20120910131556.GC3502@jama.jama.net>
In-Reply-To: <20120910131556.GC3502@jama.jama.net>
Subject: Re: Couple of autotools configure problems
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
X-List-Received-Date: Mon, 10 Sep 2012 14:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/12 14:15, Martin Jansa wrote:
> On Mon, Sep 10, 2012 at 02:00:12PM +0100, Jack Mitchell wrote:
>> First off:
>>
>> | automake: warnings are treated as errors
>> | lib/Makefile.am:22: warning: ':='-style assignments are not portable
>> | lib/Makefile.am:23: warning: ':='-style assignments are not portable
>> | autoreconf: automake failed with exit status: 1
>> | ERROR: autoreconf execution failed.
>>
>> What is a portable version of ':=', maybe '+='? I can't get anything but
>> unrelated hits from Google.
>>
>> Secondly:
>>
>> | autoreconf: running: aclocal -I
>> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
>> -I
>> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libwebsockets-0.0.0-r0/git/aclocal-copy/
>> -I
>> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
>> -I
>> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libwebsockets-0.0.0-r0/git/aclocal-copy/
>> --force --warnings=cross
>> | aclocal: warning: unknown warning category 'cross'
>>
>> Where does this warning=cross come from and how come it doesn't effect
>> any other autotool builds?
>>
>> I am attempting to compile libwebsockets which is located at:
>> http://git.warmcat.com/cgi-bin/cgit/libwebsockets/tree/
>>
>> Cheers,
> See this thread
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029108.html
>
> Cheers,
>

Thanks, seems as though the patch has just landed in master in the past 
few minutes!

As for the first issue I have found that ':=' operator means 'expand and 
use' , they are used here and it turns out to be a make issue, not 
configure:

libwebsockets_la_CFLAGS:=-Wall -std=gnu99 -pedantic
libwebsockets_la_LDFLAGS:=

Could I change them to

libwebsockets_la_CFLAGS =-Wall -std=gnu99 -pedantic
libwebsockets_la_LDFLAGS =

or even,

libwebsockets_la_CFLAGS+=-Wall -std=gnu99 -pedantic
libwebsockets_la_LDFLAGS+=

I don't see anything that needs expanding, or does it expand the 
variable and then append the new flags?

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



