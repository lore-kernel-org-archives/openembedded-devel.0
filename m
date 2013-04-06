Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UORZE-0001U7-SY
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 13:45:57 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 18263F811E1; Sat,  6 Apr 2013 05:28:41 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2D5C8F811DC;
	Sat,  6 Apr 2013 05:28:41 -0600 (MDT)
Message-ID: <516006EA.2010609@mlbassoc.com>
Date: Sat, 06 Apr 2013 05:28:42 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515FFDE5.2020303@pseudoterminal.org>
In-Reply-To: <515FFDE5.2020303@pseudoterminal.org>
Subject: Re: Can a .bbappend introduce a different PACKAGE_ARCH ?
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
X-List-Received-Date: Sat, 06 Apr 2013 11:46:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-06 04:50, Carlos Rafael Giani wrote:
> Hello,
>
> assume there is package foo, which is normally not dependent on a specific machine. It is built with default, machine independent configuration options.
> But then I want to add a .bbappend to it, which add some configuration options that make it machine dependent (imagine something like --device=beagleboard).
> I then add PACKAGE_ARCH=${MACHINE_ARCH} to the .bbappend file. Is this actually okay to do? Or does it break something?

You can do this and it will work fine.

However, if your .bbappend file forces the use of any override
directories/files, I believe it will happen automatically. For
example, my BSP layers have their own network configuration files
which I do like this:

gthomas@zeus:/local/poky-multi$ tree -S meta-cobra4430p82/recipes-core/netbase/
meta-cobra4430p82/recipes-core/netbase/
    netbase-5.0
       cobra4430p82
          interfaces
          modem.py
    netbase_5.0.bbappend

2 directories, 4 files
gthomas@zeus:/local/poky-multi$ cat meta-cobra4430p82/packages/netbase/netbase_5.0.bbappend
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:${THISDIR}/${PN}:"

SRC_URI_append = " file://modem.py"

do_install_append() {
     install -m 0755 ${WORKDIR}/modem.py ${D}/etc
}


This setup generates a machine dependent package.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


