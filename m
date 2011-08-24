Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QwBJr-0004pk-Fs
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 13:08:27 +0200
Received: by bkbzu17 with SMTP id zu17so851519bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 04:03:41 -0700 (PDT)
Received: by 10.204.150.87 with SMTP id x23mr376786bkv.118.1314183821103;
	Wed, 24 Aug 2011 04:03:41 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id k16sm245415bke.61.2011.08.24.04.03.38
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 04:03:39 -0700 (PDT)
Message-ID: <4E54DA89.2080105@dresearch-fe.de>
Date: Wed, 24 Aug 2011 13:03:37 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Michael Lauer <mickey@vanille-media.de>
X-Enigmail-Version: 1.3.1
Subject: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 11:08:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We like to create an upstart based image. Therefor we use

  IMAGE_INIT_MANAGER = "upstart upstart-sysvcompat sysvinit-utils"

inside our image recipe.

Unfortunately our image somehow inherits task-proper-tools which contains an RDEPEND for sysvinit. This results in

-------------------------->snip<-------------------------
|  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/sbin/runlevel
|       But that file is already provided by package  * sysvinit
|  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/init.d/rcS
|       But that file is already provided by package  * sysvinit
|  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/init.d/rc
|       But that file is already provided by package  * sysvinit
|  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/default/rcS
|       But that file is already provided by package  * sysvinit
|  * opkg_install_cmd: Cannot install package upstart.
-------------------------->snip<-------------------------

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


