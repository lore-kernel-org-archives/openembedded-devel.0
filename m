Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id AE4C760938
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:17:50 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1cBH8D-0005Ld-TP for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2016 09:17:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Nov 2016 09:17:43 +0100
Message-ID: <o1gp73$b06$1@blaine.gmane.org>
References: <20161124055713.23487-1-jackie.huang@windriver.com>
	<f95790bd-1e5b-3666-e042-a1fe7aded164@dominion.thruhere.net>
	<1B858668EC6A94408DCA5225FDFA85AA013A3560D2@ALA-MBA.corp.ad.wrs.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A3560D2@ALA-MBA.corp.ad.wrs.com>
Subject: Re: [meta-networking][PATCH] samba: fix the hardcoded path in init script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 08:17:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 26-11-16 om 07:26 schreef Huang, Jie (Jackie):
> 
> 
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Koen Kooi
>> Sent: Thursday, November 24, 2016 6:40 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-networking][PATCH] samba: fix the hardcoded path in init script
>>
>> Op 24-11-16 om 06:57 schreef jackie.huang@windriver.com:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> Replace the hardcoded path with base_bindir in init script to fix the
>>> error: /etc/init.d/samba.sh: line 15: /usr/bin/ps: No such file or
>>> directory /etc/init.d/samba.sh: line 17: /usr/bin/sed: No such file or
>>> directory /etc/init.d/samba.sh: line 16: /usr/bin/grep: No such file or
>>> directory
>>>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com> ---
>>> meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 + 1 file
>>> changed, 1 insertion(+)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>> b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb index
>>> e9694d4..6c1e3ef 100644 ---
>>> a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb +++
>>> b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb @@ -111,6
>>> +111,7 @@ do_install_append() { -e
>>> 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \ -e
>>> 's,/opt/samba/log,${localstatedir}/log/samba,g' \ -e
>>> 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \ +
>>> -e 's,/usr/bin,${base_bindir},g' \ -i ${D}${sysconfdir}/init.d/samba.sh
>>> fi
>>
>> Wouldn't it be better to completely remove the absolute paths?
> 
> Yeah, the absolute paths don't seem to be necessary, and I think this 
> check in the init script is not needed as well:
> 
> if [ ! -d /usr/bin ]
> then                    # /usr not mounted
>         exit
> fi
> 
> I will make a path to remove them if you're agree.

Yes, agree. Thanks for looking into this.



