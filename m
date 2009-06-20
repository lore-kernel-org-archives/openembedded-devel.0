Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHxdN-0005LT-I2
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 12:17:17 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHxSy-0001vU-4E
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 10:06:32 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 10:06:32 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 10:06:32 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 20 Jun 2009 12:06:19 +0200
Message-ID: <h1icar$in$1@ger.gmane.org>
References: <1245490953.29153.235.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245490953.29153.235.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : util-linux-ng: fix packaging, u-a and replace hardcoded paths
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
X-List-Received-Date: Sat, 20 Jun 2009 10:17:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-06-09 11:42, Phil Blundell wrote:
>> @@ -129,7 +131,8 @@ do_install () {
>>   	install -d ${D}${sysconfdir}/default/
>>   	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"'>  ${D}${sysconfdir}/default/mountall
>>
>> -	ln -sf ${sbindir}/swapon ${D}${sbindir}/swapoff.${PN}
>> +	rm ${D}${sbindir}/swap* -f
>> +	ln -sf ${base_sbindir}/swapon.${PN} ${D}${base_sbindir}/swapoff.${PN}
>>   	ln -sf ${sbindir}/shutdown ${D}${sbindir}/reboot.${PN}
>>   	ln -sf ${sbindir}/shutdown ${D}${sbindir}/halt.${PN}
>>   	ln -sf ${sbindir}/shutdown ${D}${sbindir}/fastboot
>
> What's the reason for that "rm"?  This looks like it will lose when
> ${base_sbindir} and ${sbindir} are the same directory.

u-l-ng installs a symlink there that breaks finding swapoff at runtime. 
base_sbindir and sbindir aren't the same for me, so I can't test what 
happens if they are.

regards,

Koen



