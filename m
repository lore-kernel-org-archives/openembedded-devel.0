Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kkvqx-0001Yp-Bm
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 09:10:31 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kkvmz-0005RA-Eh
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 07:06:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Oct 2008 07:06:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Oct 2008 07:06:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Oct 2008 09:06:15 +0200
Message-ID: <gbv7h7$s6b$1@ger.gmane.org>
References: <200810010447.44667.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <200810010447.44667.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: Making it mandantory to have a checksums.ini entry
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
X-List-Received-Date: Wed, 01 Oct 2008 07:10:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-10-2008 04:47, Holger Freyther wrote:
> Hey,
>
> I constantly spend my day moving checksums from tmp/checksums.ini to the right
> place and I would like to make it mandatory to have a checksums.ini entry
> when adding new versions.

+1

>
> The spend time on copy and pasting a checksums.ini entry is really small and
> the value is very high.

I added a bunch checksums from my buildmachines and poky a while ago, 
Marcins scripts make that really easy.

> Stuff like macports is forcing one to have checksums
> as well.
>
> The attached diff would force it.

How that that patch affect things fetched for a CVS_TARBALL_STASH, e.g. 
git_foo.bar.tar.gz, since that one is unversioned and prone to change?

regards,

Koen

>
> comments appreciated
> 	z.
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




