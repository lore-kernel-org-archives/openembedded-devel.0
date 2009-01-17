Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LOHtv-0007qC-8b
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 21:36:15 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LOHnG-0007su-M1
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 20:29:23 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 17 Jan 2009 20:29:22 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 17 Jan 2009 20:29:22 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 17 Jan 2009 21:29:13 +0100
Message-ID: <gktf2p$thm$1@ger.gmane.org>
References: <20090117123304.79177189331@amethyst.openembedded.net>
	<200901172122.25511.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <200901172122.25511.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Tim 'timtim' Ellis : linux-orion: Add kernel for Marvell Orion based devices (replaces linux-linkstationarm) , initially supporting:
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
X-List-Received-Date: Sat, 17 Jan 2009 20:36:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-01-09 21:22, Marcin Juszkiewicz wrote:
> On Saturday 17 of January 2009 13:33:01 GIT User account wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 5f7f10f181bdc127786fce9a43e4ca71ae4ab03c
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=5f7f10f
>> 181bdc127786fce9a43e4ca71ae4ab03c
>>
>> Author: Tim 'timtim' Ellis<tim.ellis@foonas.org>
>> Date:   Sat Jan 17 12:28:42 2009 +0000
>>
>> linux-orion: Add kernel for Marvell Orion based devices (replaces
>
> Few problems:
>
> 1. KERNEL_IMAGETYPE = "uImage" - this should be rather in machine config
> 2. You use linux-2.6.27.10.tar.bz2 - please change it to 2.6.27 tarball
>     with 2.6.27.10 patch added. It will save bandwidth for autobuilders
>     which usually have 2.6.27 already fetched for other devices.

   3. It looks like it can reuse linux_2.6.27.bb


> This also shows that we should merge linux.inc more into
> kernel.bbclass...

True.

regards,

Koen



