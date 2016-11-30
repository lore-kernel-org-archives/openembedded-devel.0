Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA91171A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 46A3531C19D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:53:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id th0HZCaQ2Fuw
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:53:48 +0100 (CET)
Received: from [172.22.22.61] (55d44972.access.ecotel.net [85.212.73.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4123831C1980
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:53:48 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
	<1480507445-20746-15-git-send-email-obi@opendreambox.org>
	<o1mgek$hr4$1@blaine.gmane.org>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <1c186b85-ef2f-df75-edfd-b0f15198d43c@opendreambox.org>
Date: Wed, 30 Nov 2016 13:53:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <o1mgek$hr4$1@blaine.gmane.org>
Subject: Re: [meta-networking][PATCH 15/17] samba: start on boot with systemd
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
X-List-Received-Date: Wed, 30 Nov 2016 12:53:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 30.11.2016 13:24, Koen Kooi wrote:
> Op 30-11-16 om 13:04 schreef Andreas Oberritter:
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> index c2bbb97..b781f7c 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> @@ -36,6 +36,10 @@ SYSVINITTYPE = "sysv"
>>  INITSCRIPT_NAME = "samba"
>>  INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
>>  
>> +SYSTEMD_PACKAGES = "${PN}-base winbind"
>> +SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
>> +SYSTEMD_SERVICE_winbind = "winbind.service"
> 
> Do these actually work nowadays? When I tried it recently I had to change the
> units into this to actually start:

Yes, it works for me.

> # cat /lib/systemd/system/smb.service
> [Unit]
> Description=Samba SMB Daemon
> After=syslog.target network.target nmb.service winbind.service
> 
> [Service]
> Type=simple
> LimitNOFILE=16384
> EnvironmentFile=-/etc/sysconfig/samba
> ExecStart=/usr/sbin/smbd $SMBDOPTIONS
> ExecReload=/bin/kill -HUP $MAINPID
> 
> [Install]
> WantedBy=multi-user.target
> 
> And worse, samba fails to start if there's no network interface up, so I start
> smb.service using this timer to avoid races:
> 
> # cat /lib/systemd/system/smb.timer
> [Unit]
> Description=Samba timer
> 
> [Timer]
> # Time to wait after booting before we run first time
> OnBootSec=2min
> Unit=smb.service
> 
> [Install]
> WantedBy=multi-user.target

I can reproduce this. It would be easier to depend on network-online.target.

Regards,
Andreas

