Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MY14D-0002Wm-T2
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 19:11:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MY0pC-0002Yf-Po
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 16:55:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 03 Aug 2009 16:55:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 03 Aug 2009 16:55:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 03 Aug 2009 18:55:35 +0200
Message-ID: <h574q8$s8u$1@ger.gmane.org>
References: <B7AB64EE-A236-4ABD-A033-A737F5663F09@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <B7AB64EE-A236-4ABD-A033-A737F5663F09@mac.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Deleting target specific folders from tmp directory
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
X-List-Received-Date: Mon, 03 Aug 2009 17:11:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-08-09 18:37, Elvis Dowson wrote:
> Hi,
> I just noticed that if I have built a v2.6.31 kernel, then cleaned it,
> and then built a v2.6.29 kernel, and then do a console image, some
> artifacts from the previous 2.6.31 console image remains.

Yes, you made the kernel version go backwards, which is a VERY bad thing 
to do in the OE world where we use package management for nearly 
everything image related.
The only safe route here is a complete rebuild from scratch.

regards,

Koen



