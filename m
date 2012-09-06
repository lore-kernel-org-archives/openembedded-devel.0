Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9drx-0000uS-0V
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 17:19:49 +0200
Received: from localhost ([127.0.0.1]:35226 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9dfw-0002PZ-Id
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=D1bPLvbnqEnL0iyBkaHBp2DH6SQ=; b=TK+jIsurkkKgkPUk+E/lA11ELKyl
	04dnf5CFIU/rAIwKk2vGWOgtvCBPYdPy47eaTfq/mc8oWpSgtwf/vIMOSjO2uYtm
	k2sSVIYSvPtC3sv19mok5XV0oMN8DyvoATbBOJ6eLwQHkihvXZPTBJj7G7XAjwEt
	m201QMu4R0dtNKY=
Received: from [195.171.99.130] (port=65209 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9dfw-0002PW-Dd
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:07:24 +0000
Message-ID: <5048BC6D.8080904@communistcode.co.uk>
Date: Thu, 06 Sep 2012 16:08:29 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
In-Reply-To: <1346943545.2673.198.camel@phil-desktop>
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 15:19:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/12 15:59, Phil Blundell wrote:
> On Thu, 2012-09-06 at 15:53 +0100, Jack Mitchell wrote:
>> I'm failing to be able to build tinyXML which it seems is required for
>> XBMC after it was dropped from their internal tree. The package just has
>> a Makefile and all in all seems a bit sketchy at best. Has anyone come
>> across an error like this before:
>>
>>      DEBUG: Executing shell function do_compile
>>      NOTE: make -j 7 -e MAKEFLAGS=
>>      arm-poky-linux-gnueabi-ld
>>      --sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi
>>      -o xmltest -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed tinyxml.o
>>      tinyxmlparser.o xmltest.o tinyxmlerror.o tinystr.o
>>      arm-poky-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
>>      arm-poky-linux-gnueabi-ld: use the --help option for usage information
>>      make: *** [xmltest] Error 1
> It's using ${LD} where it should be using ${CCLD}.  This is, admittedly,
> confusing since one would tend to naïvely assume that ${LDFLAGS} is
> intended for consumption by ${LD} but that is not in fact the case.
>
> I'm not actually sure that there are any places where ${LD} is the right
> thing to use.  Maybe that variable should be deleted.
>
> p.

So, would the best way to fix it be something like:

do_compile() {
     run_oemake LD="${CCLD}"
}

I'm really only just getting into this so please excuse my naivety.

Thanks,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



