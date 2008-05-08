Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ju31G-0000gc-Ma
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 12:06:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ju30X-0001PR-5I
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 10:05:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 10:05:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 10:05:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 May 2008 12:05:38 +0200
Message-ID: <fvuj9i$nt9$1@ger.gmane.org>
References: <200805080215.23729.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <200805080215.23729.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 10:06:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> Hey,
>
> I have seen raster's environment breaking various buildsystems and we might
> want to really start having a clean environment before starting to build.
>
> the patch below should implement it. Should we do this in OE? I'm aware of the
> unexport inside OE but we really should do this the otherway around.

While this is a good idea, your current implementation breaks:

MACHINE=foo ANGSTROM_MODE=bar bitbake foo-bar-image


>
>
> comments?
>
> 	z.
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




