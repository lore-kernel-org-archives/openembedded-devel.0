Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QwCgf-0007Gd-8E
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 14:36:05 +0200
Received: by bkbzu17 with SMTP id zu17so907997bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 05:31:18 -0700 (PDT)
Received: by 10.204.130.133 with SMTP id t5mr539851bks.36.1314189078584;
	Wed, 24 Aug 2011 05:31:18 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id zw12sm273240bkb.27.2011.08.24.05.31.15
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 05:31:16 -0700 (PDT)
Message-ID: <4E54EF12.2010100@dresearch-fe.de>
Date: Wed, 24 Aug 2011 14:31:14 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Michael Lauer <mickey@vanille-media.de>
References: <4E54DA89.2080105@dresearch-fe.de>
In-Reply-To: <4E54DA89.2080105@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 12:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.08.2011 13:03, Steffen Sledz wrote:
> We like to create an upstart based image. Therefor we use
> 
>   IMAGE_INIT_MANAGER = "upstart upstart-sysvcompat sysvinit-utils"
> 
> inside our image recipe.
> 
> Unfortunately our image somehow inherits task-proper-tools which contains an RDEPEND for sysvinit. This results in
> 
> -------------------------->snip<-------------------------
> |  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/sbin/runlevel
> |       But that file is already provided by package  * sysvinit
> |  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/init.d/rcS
> |       But that file is already provided by package  * sysvinit
> |  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/init.d/rc
> |       But that file is already provided by package  * sysvinit
> |  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/default/rcS
> |       But that file is already provided by package  * sysvinit
> |  * opkg_install_cmd: Cannot install package upstart.
> -------------------------->snip<-------------------------

BTW:
What is the exact meaning/purpose/use of task-proper-tools?

The list contains a lot of tools with existing alternatives (e.g. syslog-ng vs. rsyslog or pump vs. dhcpcd). If an image contains for example rsyslog and task-proper-tools then syslog-ng is installed too although it is not used (rsyslog has a higher u-a prio). So it senselessly occupies image space. :(

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


