Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LCz7a-0008OM-4X
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 17:19:38 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LCz39-0003L1-4Z
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 16:15:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 16:15:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 16:15:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Dec 2008 17:14:22 +0100
Message-ID: <gib8gu$dkp$2@ger.gmane.org>
References: <149566.95991.qm@web23305.mail.ird.yahoo.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <149566.95991.qm@web23305.mail.ird.yahoo.com>
Sender: news <news@ger.gmane.org>
Subject: Re: C compiler cannot create executables
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
X-List-Received-Date: Wed, 17 Dec 2008 16:19:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-12-08 16:49, Claudiu mdc wrote:
> hi, I am trying to build bootstrap-image and I have this error when building libtool-cross:
> | checking for i686-linux-gcc... i686-linux-gcc-4.3.1 -mcpu=pentiumpro
> | checking for C compiler default output file name...
> | configure: error: C compiler cannot create executables
> | See `config.log' for more details.


First: what does config.log say? (it's somewhere in 
work/i686*/libtool-cross/*)


> I use org.openembedded.stable branch
>
> Some lines from my local.conf:
> MACHINE = "i686-generic"
> TARGET_OS = "linux"
> DISTRO = "unmaintained/generic"

Secondly, you can't build for x86 using the generic distro because of 
namespace clashes. Try using angstrom-2007.1.

regards,

Koen



