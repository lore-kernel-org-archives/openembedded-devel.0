Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R5ZyJ-0000gb-5G
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 11:17:04 +0200
Received: by wwf27 with SMTP id 27so6064494wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 02:11:47 -0700 (PDT)
Received: by 10.216.1.200 with SMTP id 50mr2686239wed.33.1316423506820;
	Mon, 19 Sep 2011 02:11:46 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id y10sm15944013wbm.14.2011.09.19.02.11.45
	(version=SSLv3 cipher=OTHER); Mon, 19 Sep 2011 02:11:45 -0700 (PDT)
Message-ID: <4E770750.2070708@dresearch-fe.de>
Date: Mon, 19 Sep 2011 11:11:44 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
	<1316187165.3510.37.camel@phil-desktop>
	<4E73760B.6020605@dresearch-fe.de>
	<20110919080621.GB3783@chargestorm.se>
In-Reply-To: <20110919080621.GB3783@chargestorm.se>
X-Enigmail-Version: 1.3.1
Subject: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Mon, 19 Sep 2011 09:17:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.09.2011 10:06, Anders Darander wrote:
> * Steffen Sledz <sledz@dresearch-fe.de> [110916 18:15]:
>> I'm not sure if there exist upstart based oe distros/images. But it
>> seems that there are some systemd based ones
>> (recipes/images/angstrom-systemd-image.bb).
>  
>> Do they have a similar problem? How do these handle the sysvinit
>> config vs. systemd config for the different services?
> 
> It varies slightly. 
> 
> Some packages, e.g. dropbear, has an extra package dropbear-systemd in
> meta-oe, that packages the systemd unit files for dropbear. The same is
> true for dbus in oe-core.
> 
> Other packages, like ofono in oe-core, pacakages the systemd unit files
> directly in the ofono-package.
> 
> In all these cases, sysvinit files are supplied directly in the main
> package.

Hmmmm? This seems to be suitable for systemd images but not for upstart. :(

If a package installs sysvinit files *and* upstart jobs both will be used (at least as long as upstart supports the sysvinit runlevels for a better migration). So there's a need to install one of them only.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


