Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L68p8-0004L5-Bz
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 20:16:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L68m4-0003k8-R7
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 19:13:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 19:13:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 19:13:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Nov 2008 20:13:01 +0100
Message-ID: <ggpfrt$b8u$1@ger.gmane.org>
References: <49303ABA.4060401@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <49303ABA.4060401@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: can use x86_64 as an override
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
X-List-Received-Date: Fri, 28 Nov 2008 19:16:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-11-08 19:38, Robert Schuster wrote:
> Hi,
> it seems to be impossible to use x86_64 as an override. I want to
> do this:
>
> DEPENDS = "zlib-native classpath-initial jikes-initial"
> DEPENDS_x86_64 += "libffi-native"

What happens it you do

DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native" ?

regards,

Koen


>
> However when wvaluting this with "bitbake -i" libffi-native is not part
> of the DEPENDS variable.
>
> I guess it has something to do with the underscore in x86_64, right?
>
> Perhaps we can fix this by sanitizing OVERRIDES by replacing all
> underscores in its entries with a hyphen. At least for the above case
> this would not be to bad.
>
> Ideas?
>
> Regards
> Robert
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




