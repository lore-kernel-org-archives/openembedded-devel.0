Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMzwo-0001BM-2s
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 08:13:54 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LMzqQ-0002HF-Dm
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 07:07:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 07:07:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 07:07:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 14 Jan 2009 08:07:09 +0100
Message-ID: <gkk2ut$5m8$1@ger.gmane.org>
References: <496D4B33.60102@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <496D4B33.60102@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: "armv6" override not used
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
X-List-Received-Date: Wed, 14 Jan 2009 07:13:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-09 03:17, Robert Schuster wrote:
> Hi,
> I am building chinook-compat for the n800 when it comes to libffi the
> successful build depends on this line:
>
> TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
>
> However the build fails because __SOFTFP__ isn't defined and bitbake -i
> reveals:
>
> BB>>  peek libffi-2.0+gcc4.3.2 TARGET_CC_ARCH
> SHELL: This command needs to parse bbfiles...
> NOTE: Handling BitBake files: - (6521/6521) [100 %]
> NOTE: Parsing finished. 0 cached, 6238 parsed, 283 skipped, 0 masked.
>
> -march=3Darmv6j -mtune=3Darm1136jf-s -mfpu=3Dvfp -mfloat-abi=3Dsoftfp
> -mno-thumb-interwork -mno-thumb
> BB>>
>
> It looks like something is wrong with the OVERRIDES variable. It has
> this value:
>
> local:nokia800:chinook-compat:linux-gnueabi:arm:build-linux:fail-fast:pn-=
> libffi
>
> Checking the same variable in an Angstrom build for the BeagleBoard
> (armv7a - needs the same hack) it looks like this:
>
> local:beagleboard:angstrom:linux-gnueabi:arm:build-linux:fail-fast:pn-lib=
> ffi:armv7a
>
> Something went wrong, but what?

Angstrom defines architecture overrides to make life easier for 
developers, other distros don't.

regards,

KOen





