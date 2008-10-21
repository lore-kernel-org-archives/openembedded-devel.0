Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KsHwK-0007xr-HG
	for openembedded-devel@openembedded.org; Tue, 21 Oct 2008 16:10:35 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KsHvu-0004ed-IZ
	for openembedded-devel@openembedded.org; Tue, 21 Oct 2008 14:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Oct 2008 14:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Oct 2008 14:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Oct 2008 16:08:14 +0200
Message-ID: <gdknoe$186$2@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF47B@hiob.intern.dresearch.de>	<gdk0so$7qm$1@ger.gmane.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Tue, 21 Oct 2008 14:10:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-10-2008 15:43, Sledz, Steffen wrote:
>> a) find out which kernel version your custom kernel is (e.g 2.6.27)
>> b) extract the diff (diff -Nurd linux-2.6.27/ linux-2.6.27-mymachine/)
>> c) add SRC_URI_append_mymachine = "file://mymachine.diff" to
>>     linux_2.6.27.bb
>> d) put defconfig in packages/linux/linux-2.6.27/mymachine/defconfig
>
> It seems to be necessary to add DEFAULT_PREFERENCE_mymachine = "1" too. Right?

yeah, forgot about that, sorry.

regards,

Koen



