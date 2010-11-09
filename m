Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PFtFI-00085y-VQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 19:48:41 +0100
Received: (qmail 22953 invoked by uid 1003); 9 Nov 2010 18:47:43 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Nov 2010 18:47:41 -0000
Message-ID: <4CD9973D.4040201@balister.org>
Date: Tue, 09 Nov 2010 10:47:25 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <30166055.post@talk.nabble.com>
	<AANLkTi=5W1Sat-egZmbeQv6B+PX+Vatabq=2+YZw_wGx@mail.gmail.com>
In-Reply-To: <AANLkTi=5W1Sat-egZmbeQv6B+PX+Vatabq=2+YZw_wGx@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [SOLVED]Network init script error??
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
X-List-Received-Date: Tue, 09 Nov 2010 18:48:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2010 08:39 PM, Steve Sakoman wrote:
> Looping in the OE developers list on the issue described below.
>
> It does indeed seem that the ifupdown package init is referencing
> /etc/network/ifstate (which doesn't exist) instead of
> /etc/network/run/ifstate.
>
> Mike's point about having the /etc/network/run directory linked to
> /var/run also seems like a good idea (so that ifstate would not
> persist after an unclean shutdown).

Fixing the script removes the state file before it is checked on boot, 
so I do not think it is necessary to move the state file to a volatile 
file system. I'm going to push the fix to the ifupdown package. There is 
also ifupdown-ubuntu, but I am not sure who is using that. It references 
/var/run/....

Philip


>
> Thoughts?
>
> Steve
>
>
> ---------- Forwarded message ----------
> From: roystonvasey<mikestocks@madasafish.com>
> Date: Mon, Nov 8, 2010 at 7:14 PM
> Subject: [Gumstix-users]  [SOLVED]Network init script error??
> To: gumstix-users@lists.sourceforge.net
>
>
>
> Dear List,
> I as many others are having problems getting the networking to start
> reliably on headless systems, wlan0 in particular.
> If the network is restarted '/etc/init.d/networking restart' wireless and my
> CAN networks come up OK, on system halt and reboot they also come up OK.
> If power is interrupted the networks are not starting after a reboot and
> require a manual restart.
>
> After some investigations I noticed that there is an initialisation script
> '/etc/rcS.d/S39ifup' that is run just before the network is started with
> '/etc/rcS.d/S40networking'. The script looks like it clears up any hanging
> ifstate files.
> #!/bin/sh -e
>
> case "$1" in
>         start|restart)
>                 if [ -e /etc/network/ifstate ]; then
>                         echo -n "Cleaning: /etc/network/ifstate"
>                         echo -n>/etc/network/ifstate
>                         echo "."
>                 fi
>                 ;;
>         stop|reload|force-reload)
>                 ;;
> esac
>
> However the actual ifstate file is created in '/etc/network/run/ifstate'.
> Adjusting the script allows the network to come up properly even after a
> power outage.
> I suspect that ifup checks ifstate to see if the interface is already up and
> doesn't do anything if there is an entry in the ifstate file and ifdown
> takes out etries as it brings down the interface. Hence a clean shut down
> will clear entries and allow the the networks to start normally on start up.
> The other observation is that the '/etc/network/run' directory should
> probably be linked to the '/var/run' directory.
>
> Can anyone verify that my findings are correct an see about amending the
> init scripts?
>
> Cheers Mike.
> --
> View this message in context:
> http://old.nabble.com/-SOLVED-Network-init-script-error---tp30166055p30166055.html
> Sent from the Gumstix mailing list archive at Nabble.com.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


