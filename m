Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 447B5766D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:20:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7C1KYcc014413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:20:34 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 11 Aug 2015 18:20:33 -0700
Message-ID: <55CA9F60.4020602@windriver.com>
Date: Wed, 12 Aug 2015 09:20:32 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>	<55C986FA.9050404@windriver.com>
	<mqcpsd$esk$1@ger.gmane.org>
In-Reply-To: <mqcpsd$esk$1@ger.gmane.org>
Subject: Re: [PATCH] ypbind-yocto.init: add status command
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2015 01:20:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月11日 20:30, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 11-08-15 om 07:24 schreef Rongqing Li:
>> ping
>
> While you're there, can you please fix the name of this file? Either change
> it to 'yoctoproject' or rename it to something sensible, but the current
> situation is just wrong.
>

I will change the title of this patch, and not rename
ypbind-yocto.init, since ypbind-yocto.init will be rename
to ypbind when it is installed into system


-Roy


>>
>> -Roy
>>
>> On 2015年07月06日 16:29, rongqing.li@windriver.com wrote:
>>> From: Zhu Yanjun <yanjun.zhu@windriver.com>
>>>
>>> Add the "status" command to check the status of ypbind.
>>>
>>> Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com> ---
>>> meta-networking/recipes-support/nis/files/ypbind-yocto.init | 7
>>> +++++++ 1 file changed, 7 insertions(+)
>>>
>>> diff --git
>>> a/meta-networking/recipes-support/nis/files/ypbind-yocto.init
>>> b/meta-networking/recipes-support/nis/files/ypbind-yocto.init index
>>> 5f50a53..da533a1 100644 ---
>>> a/meta-networking/recipes-support/nis/files/ypbind-yocto.init +++
>>> b/meta-networking/recipes-support/nis/files/ypbind-yocto.init @@ -21,6
>>> +21,9 @@ #    the NIS binding information. ### END INIT INFO
>>>
>>> +# Need to use status function +. /etc/init.d/functions +
>>> YPBIND_BIN=/usr/sbin/ypbind pidfile=/var/run/ypbind.pid
>>>
>>> @@ -92,6 +95,10 @@ case "$1" in echo -n "Reload service ypbind"
>>> start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile ;; +
>>> status) +    echo -n "Checking for ypbind: " +    status $YPBIND_BIN +
>>> ;; *) echo "Usage: $0
>>> {start|stop|status|try-restart|restart|force-reload|reload|probe}" exit
>>> 1
>>>
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFVyerMMkyGM64RGpERAsGEAJ4wrA9wavFzQZfyIiZwLntHXnLVPACfW0Dc
> GihWGohDCHjH8dKz+cq5fLo=
> =mkrk
> -----END PGP SIGNATURE-----
>

-- 
Best Reagrds,
Roy | RongQing Li

