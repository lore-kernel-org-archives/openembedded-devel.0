Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <simaskonfa@gmail.com>) id 1M2RTW-0006gd-8f
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 16:54:59 +0200
Received: by wf-out-1314.google.com with SMTP id 25so1291046wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=p9voPSTfj0vu8Hk0Fw2nkJkStGDShRPt1G04IgKgAS4=;
	b=JWuDF09ts+R63UPiJLOTLwUsr+FggxtClH7TuunXSv+WKxQ4EiboSbrAdTgt8gYsNF
	hpOGkanVyOzDpczafUPEA3k/rTFm8R6fxafTzOGa2ij1yZWKLqiuuIFVyHOrHpBoyv52
	GXoy08wi2TGXxEySghqZosFuBhRWgQkUgl8BE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HwxLzbS8kRcXH3u9ePDu6Q+AOQ5M68DpP7BCIC2QUlj2oPo78KzY29YU9vy9DsOlra
	uJ0wlyLcV/6xw5ni9U708ejmaWzi+6xexnor9+4AeQ4IQVgtp6L/5WcxC+I5ljZEdL7l
	kJJ980WxzvtQqKj0yEt5IJT2DL+0wQf/Rwfqo=
MIME-Version: 1.0
Received: by 10.142.135.13 with SMTP id i13mr1569989wfd.133.1241794124878; 
	Fri, 08 May 2009 07:48:44 -0700 (PDT)
In-Reply-To: <20090507123730.GA21520@mi.fu-berlin.de>
References: <2e69630d0905060801w29e0719fqc4f3904e784fa7b8@mail.gmail.com>
	<2e69630d0905070510x3c161a2atbbb7b9a0edf7578e@mail.gmail.com>
	<20090507123730.GA21520@mi.fu-berlin.de>
Date: Fri, 8 May 2009 16:48:44 +0200
Message-ID: <2e69630d0905080748s5571e865kcb063b1e5eeba72c@mail.gmail.com>
From: sledge <simaskonfa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problem with opie for qemuarm
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
X-List-Received-Date: Fri, 08 May 2009 14:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Found the problem:
The (current) opie-image for qemuarm is broken:
File /mnt/tmp/etc/rcS.d/S03udev starts before S10checkroot, this
prevents udev from being populated, and messes up any subsequent
script startup. Temporary workaround (since :
cd to your -o loop mounted
Angstrom-opie-image-glibc-ipk-2009.X-test-20090506-qemuarm.rootfs.ext2
and:
mv ./etc/rcS.d/S03udev ./etc/rcS.d/S15udev

Good luck!
-- 
sledge

On Thu, May 7, 2009 at 2:37 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> On Thu, May 07, 2009 at 02:10:06PM +0200, sledge wrote:
>> Hello all,
>>
>> I have bitbaked opie-image for qemuarm. Resized the resulted
>> opie-image.rootfs.ext2 partition, launched qemu with these parameters:
>> http://linuxtogo.org/gowiki/Angstrom/qemu-system-arm
>>
>> I have also tried extracting modules*.tgz into that ext2 rootfs. Same result:
>>
>> It has configured and launched the init.d processes, stopping any
>> output after the bluetooth. Apparently opie did not start, nor any
>> other rc processes; hence no graphical interface nor command-line
>> login prompt
>>
>> Where should I start with? I tried to mv etc/init.d/bluetooth
>> etc/init.d, but it still starts (thought it was a blocker). I suppose
>> it is because the modules are being loaded.
>>
>>
>>
>> Thanks!
>>
>> --
>> sledge
>
> Try start qemu with serielle card support and get you login shell via this.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


