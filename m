Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NCq8B-00074O-AV for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 08:48:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NCq6l-0000g2-DQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 08:46:43 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 08:46:43 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 08:46:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Nov 2009 08:46:20 +0100
Message-ID: <heg30c$7a4$1@ger.gmane.org>
References: <1259015105.7271.96.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1259015105.7271.96.camel@mattotaupa.wohnung.familie-menzel.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake console-image: ERROR: function do_deploy failed: install: cannot stat `arch/arm/boot/uImage': No such file or directory
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
X-List-Received-Date: Tue, 24 Nov 2009 07:48:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-11-09 23:25, Paul Menzel wrote:
> Dear OpenEmbedded hackers,
>
>
> I successfully built base-image with
>
>          $ bitbake base-image
>
> following [1].
>
> I now want to build console-image afterwards, but I get an error.
>
>          ERROR: function do_deploy failed
>          ERROR: see log in /srv/oe/angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/linux-omap-2.6.29-r49/temp/log.do_deploy.18428
>          NOTE: Task failed: /srv/oe/angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/linux-omap-2.6.29-r49/temp/log.do_deploy.18428
>          ERROR: TaskFailed event exception, aborting
>          ERROR: Build of /srv/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb do_deploy failed
>          ERROR: Task 737 (/srv/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb, do_deploy) failed
>          ERROR: '/srv/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb' failed

'bitbake -c clean virtual/kernel'

This error is a side effect of moving the deploy task.

regards,

Koen



