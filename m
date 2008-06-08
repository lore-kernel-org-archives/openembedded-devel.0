Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K5OYD-0004tw-Ms
	for openembedded-devel@openembedded.org; Sun, 08 Jun 2008 19:19:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K5OTG-0004s7-IL
	for openembedded-devel@openembedded.org; Sun, 08 Jun 2008 17:14:22 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 08 Jun 2008 17:14:22 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 08 Jun 2008 17:14:22 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Jun 2008 19:14:13 +0200
Message-ID: <g2h415$pk1$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
Sender: news <news@ger.gmane.org>
Subject: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 08 Jun 2008 17:19:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Lately I have been wondering why things like avahi and umount don't work 
properly any more in angstrom 2008, and I found out why:

	OE (and/or bitbake) ignores pkg_postinst_*

 From avahi.inc:

pkg_postinst_avahi-daemon () {
         # can't do this offline
         if [ "x$D" != "x" ]; then
                 exit 1
         fi
         grep "^avahi:" /etc/group > /dev/null || addgroup avahi
         grep "^avahi:" /etc/passwd > /dev/null || adduser 
--disabled-password --system --home /var/run/avahi-daemon 
--no-create-home avahi --ingroup avahi -g Avahi

         DBUSPID=`pidof dbus-daemon`

         if [ "x$DBUSPID" != "x" ]; then
                 /etc/init.d/dbus-1 force-reload
         fi
}

In the rootfs:

root@efika:/usr/lib/opkg/info# cat avahi-daemon.postinst
#!/bin/sh
if test "x$D" != "x"; then
	OPT="-r $D"
else
	OPT="-s"
fi
update-rc.d $OPT avahi-daemon defaults 21 19

The same happens with the u-a calls for util-linux-(u)mount

This occurs with .dev + bitbake 1.8 head

regards,

Koen





