Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRXtj-0002Uj-TJ
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 21:17:31 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LRXmU-0004xw-HO
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 20:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 20:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 20:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jan 2009 21:08:16 +0100
Message-ID: <gll57g$5s3$2@ger.gmane.org>
References: <497D7E2A.8050302@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <497D7E2A.8050302@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Building for i486 based non-FPU device
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
X-List-Received-Date: Mon, 26 Jan 2009 20:17:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-01-09 10:11, Marco Cavallini wrote:
> Hello,
> This discussion was in thread "FOSDEM OE stand"
> I'm trying to build for a machine I'd like to let at OE stand.
> http://www.koala.it/it/nanopc.htm
> It's a i486 based non-FPU device (Vortex86sx), so I tried to build
>
> DISTRO = "angstrom-2008.1"
>
> I created my new machine copying it from
>   conf/machine/i586-generic.conf
> and changing the following settings:
>   TARGET_ARCH = "i486"
>   PACKAGE_EXTRA_ARCHS = "x86"
>   PREFERRED_VERSION_linux = "2.6.26"
> (I also changed 2.6.26 recipe)
>
> I found several problems:
> i586-generic uses TARGET_ARCH = "i586" : ok but for 586
> x86          uses TARGET_ARCH = "i586" : build broken
> qemux86      uses TARGET_ARCH = "i586" : not used
> i486-generic uses TARGET_ARCH = "i486" : build broken
>
> No one of the previous tested build give a useful result,
> what could I change to get a running system?
>
> Maybe do I have to specify TARGET_CC_ARCH = "-march=i486" ?
> Would be better to switch this discussion to IRC ?
> Any hint will be greatly appreciated.

'MACHINE=vortex86sx bitbake glibc' works for me with angstrom. It 
doesn't use softfloat yes, as gccs configure script doesn't like 
--with-float=soft, so we'll problably end up messing with TARGET_CC_ARCH.

regards,

Koen



