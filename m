Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXdS4-0000jY-T0
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 16:26:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXdQm-0005wN-1U
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 15:24:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 15:24:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 15:24:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 16:24:39 +0100
Message-ID: <gn1evn$adf$1@ger.gmane.org>
References: <200902121727.21796.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <200902121727.21796.roman@khimov.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Thu, 12 Feb 2009 15:26:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 15:27, Roman I Khimov wrote:
> Hello all.
>
> There are severe problems with icecc builds currently in OE. Cross-compiler
> tarball created wrong, PATH set incorrectly, etc.
>
> So, here is a patch that fixes some basic things, like:
> 1) ICECC_ENV_EXEC variable expansion. Currently you can only use absolute
>     path here, something like "${TOP}/create-icecc-env.sh" won't work.

${TOP} is dangerous to use, IIRC openssl uses it in its buildsystem, so 
people that have TOP set (hi Raster & Steve) see all kind of weird failures.

regards,

Koen



