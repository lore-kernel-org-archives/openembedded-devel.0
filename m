Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TgUXM-0006Wu-Kj
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 07:02:20 +0100
Received: from ad.chargestorm.se (83.252.253.85) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 6 Dec 2012 06:47:55 +0100
Date: Thu, 6 Dec 2012 06:48:53 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121206054852.GA13286@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
	<70ef34edf29d62cfc815aa5c70186026cb05c4cf.1354731625.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <70ef34edf29d62cfc815aa5c70186026cb05c4cf.1354731625.git.Martin.Jansa@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 68/77] systemd: add target python to depends
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
X-List-Received-Date: Thu, 06 Dec 2012 06:02:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline




* Martin Jansa <martin.jansa@gmail.com> [121205 19:32]:
> * pythonnative adds only python-native to DEPENDS, but we need target python for working python-config
> checking for python-config... /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python-config
> Traceback (most recent call last):
>   File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python-config", line 24, in <module>
>     pyver = sysconfig.get_config_var('VERSION')
>   File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 602, in get_config_var
>     return get_config_vars().get(name)
>   File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 518, in get_config_vars
>     func()
>   File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 416, in _init_posix
>     raise DistutilsPlatformError(my_msg)
> distutils.errors.DistutilsPlatformError: invalid Python installation: unable to open /OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/python2.7/config/Makefile (No such file or directory)

Which steps are introducing these errors?

I'm curious as systemd has been built without this native python
previously, and we're also adding --without-python to EXTRA_OECONF.
Thus, to me it seems fishy if we should need to add that depends.
Though, there might be a good reason, I guess. 

As usual I'm slightly worried about build time...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


