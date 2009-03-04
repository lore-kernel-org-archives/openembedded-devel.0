Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lem1I-0000dn-Tj
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 09:00:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LelxI-0002Tt-LS
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 07:55:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 07:55:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 07:55:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 08:55:42 +0100
Message-ID: <golc5v$c5u$1@ger.gmane.org>
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>
	<49ADB183.5070709@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <49ADB183.5070709@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 08:00:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-03-09 23:38, Philip Balister wrote:
> Michael 'Mickey' Lauer wrote:
>> Am Dienstag, den 03.03.2009, 21:49 +0100 schrieb GIT User account:
>>> Module: openembedded.git
>>> Branch: org.openembedded.dev
>>> Commit: eee859a9c348871d6d644ece76bc57b151cc80e8
>>> URL:
>>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=eee859a9c348871d6d644ece76bc57b151cc80e8
>>>
>>>
>>> Author: Koen Kooi <koen@openembedded.org>
>>> Date: Tue Mar 3 21:47:57 2009 +0100
>>>
>>> angstrom 2009.X: bump automake-native to 1.10.2 since some idiot
>>> deleted 1.10
>>
>> Ah, are we in that mood again? Take more pills.
>
> We need to have a serious discussion about deleting recipes. I know the
> deletion of python 2.5 will force me to address the 2.5->2.6 upgrade in
> gnuradio before the upstream developers are ready.
>
> We need a way to remove recipes, but doing it as part of adding a new
> recipe is causing problems for OE users.

Especially for 'core' recipes like busybox, automake and to a lesser 
extent, python.
The last time angstrom changed automake version multiple people had 
tested the the change and verified that the produced images worked as 
well as before the upgrade. That took some weeks to do. Now someone 
forced me (I didn't even look up who deleted 1.10) to used an untested 
version without asking or any heads up before the deletion.
Does this mean that I can add glibc 2.9 and delete all other versions?

regards,

Koen



