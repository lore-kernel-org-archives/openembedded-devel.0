Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRWP2-0002EB-ON
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 19:41:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LRWHo-00009C-6V
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 18:34:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 18:34:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 18:34:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jan 2009 19:34:06 +0100
Message-ID: <glkvmu$gff$1@ger.gmane.org>
References: <f96d234e0901261011x1708a5cbra3334ceb18821f08@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <f96d234e0901261011x1708a5cbra3334ceb18821f08@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: rm_work and building kernel modules
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
X-List-Received-Date: Mon, 26 Jan 2009 18:41:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-01-09 19:11, Cliff Brake wrote:
> I'm noticed a little glitch with rm_work and building kernel modules
> with OE.  Typically, kernel module builds require the kernel source to
> be intact, which gets removed if rm_work is enabled.

Which is why it's getting staged to STAGING_KERNEL_DIR, see module.bbclass.

regards,

Koen



