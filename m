Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id E9F8571A98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:25:03 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1cC3wZ-0005bi-Fu for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2016 13:24:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Nov 2016 13:24:55 +0100
Message-ID: <o1mgek$hr4$1@blaine.gmane.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
	<1480507445-20746-15-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
In-Reply-To: <1480507445-20746-15-git-send-email-obi@opendreambox.org>
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
X-List-Received-Date: Wed, 30 Nov 2016 12:25:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 30-11-16 om 13:04 schreef Andreas Oberritter:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index c2bbb97..b781f7c 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -36,6 +36,10 @@ SYSVINITTYPE = "sysv"
>  INITSCRIPT_NAME = "samba"
>  INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
>  
> +SYSTEMD_PACKAGES = "${PN}-base winbind"
> +SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
> +SYSTEMD_SERVICE_winbind = "winbind.service"

Do these actually work nowadays? When I tried it recently I had to change the
units into this to actually start:

# cat /lib/systemd/system/smb.service
[Unit]
Description=Samba SMB Daemon
After=syslog.target network.target nmb.service winbind.service

[Service]
Type=simple
LimitNOFILE=16384
EnvironmentFile=-/etc/sysconfig/samba
ExecStart=/usr/sbin/smbd $SMBDOPTIONS
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target

And worse, samba fails to start if there's no network interface up, so I start
smb.service using this timer to avoid races:

# cat /lib/systemd/system/smb.timer
[Unit]
Description=Samba timer

[Timer]
# Time to wait after booting before we run first time
OnBootSec=2min
Unit=smb.service

[Install]
WantedBy=multi-user.target


regards,

Koen


