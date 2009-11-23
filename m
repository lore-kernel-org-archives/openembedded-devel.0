Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NCU64-0002ZQ-1P for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:16:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NCU4d-0005zu-Kj
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:15:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:15:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:15:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Nov 2009 09:12:08 +0100
Message-ID: <hedg4o$hn9$1@ger.gmane.org>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Mon, 23 Nov 2009 08:16:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-11-09 07:14, RK Raggit wrote:
> Hi,
>
> I am adding support for a cortex-a9 based machine but the build fails at gcc
> with this error -
>
> ****************
> |
> /home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: bad value (cortex-a9) for -mtune= switch

Gcc 4.2.4 doesn't support armv7


> gcc variables in my local.conf read thus -
>
> PREFERRED_VERSION_gcc                    = "4.2.4"
> PREFERRED_VERSION_gcc-cross              = "csl-arm-2008q1"
> PREFERRED_VERSION_gcc-cross-initial      = "csl-arm-2008q1"
> PREFERRED_VERSION_gcc-cross-intermediate = "csl-arm-2008q1"

Don't use CSL toolchains, they are waaaay to broken, especially 2008qX: 
http://hardwarebug.org/2008/11/28/codesourcery-fails-again/
Stick with the default toolchain angstrom is using, it is tested on real 
hardware (CS only tests inside qemu) and is know to work well

regards,

Koen



