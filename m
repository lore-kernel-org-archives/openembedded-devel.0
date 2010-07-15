Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZI85-0003Cn-Lo
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 08:41:12 +0200
Received: by bwz10 with SMTP id 10so420252bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=XZmF2PdeyywtZOjV900mXBjXzdP4D/PMKGNiBjlwOTs=;
	b=QHOeX3eRCcEOVS5vnbY604Xy7E3P4kBzuoeMfiLfUQWRu3C1L0rqvu6kmLtpcl5BRT
	+qZDcy4JxTBqYw1FSm9ydoRjz6t1k3mjmD0Ph8h/3lw+9KtKeoRRrUzTKKJlEdmF8Ho1
	mqHiTzkGo/vAiSFlUPJiCDqi7gPFHjtogPHfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=eGsjOSkt3CjV6J15RmIp8Oko7548yWtxNE73L4pg4lTD1H/dDrBH4Nvl1eElQhUtjE
	YANRFhAknBgXrpqFNll+hsdkhFMRxWlyfF6avAE0P+OoL74A+iIRm1iSkxk5z0OXzSsJ
	sKKXQxe4bmcF+m2rHYxLs1vHd/OW7TMlWKi8g=
MIME-Version: 1.0
Received: by 10.204.163.74 with SMTP id z10mr5190401bkx.34.1279176067255; Wed, 
	14 Jul 2010 23:41:07 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 23:41:07 -0700 (PDT)
Date: Thu, 15 Jul 2010 08:41:07 +0200
Message-ID: <AANLkTikabrLWPM53wvdCKrDSKRJdFQTdNsA2MnfwzrI0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: u-boot-utils badness
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
X-List-Received-Date: Thu, 15 Jul 2010 06:41:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Incidentally I stumbled upon u-boot-utils.
This recipe did not seem too good.

We only have a version for 1.2.
Guess u-boot tools do not change that much, but still it seems somewhat odd.

It's do_compile reads:

do_compile () {
        oe_runmake Sandpoint8240_config
        oe_runmake tools
}

Which is also somewhat odd. Probably the u-boot env is fairlly standard, but
still it seems odd to have Sandpoint8240 there (especially since I could not
even relate it to a machine in oe).

Furthermore the recipe seems mostly useless anyway as u-boot itself also
generates the tools.
From u-boot.inc:

do_compile () {
        unset LDFLAGS
        unset CFLAGS
        unset CPPFLAGS
        oe_runmake ${UBOOT_MACHINE}
        oe_runmake all
        oe_runmake tools env
}

So there seems to be enough reason to nuke this recipe, but ...

A quick grep learned that there are several machines that recommend or
depend on this.

frans@frans-desktop:~/workspace/gtd/openembedded.git$ grep u-boot-utils -r
conf
conf/machine/lsmipsel.conf:MACHINE_EXTRA_RRECOMMENDS    = "u-boot-utils"
conf/machine/include/lsppc.inc:MACHINE_EXTRA_RRECOMMENDS = "u-boot-utils"
conf/machine/n1200.conf:MACHINE_EXTRA_RRECOMMENDS       = "temper
u-boot-utils"
conf/machine/kuropro.conf:MACHINE_EXTRA_RDEPENDS          = "micro-evtd
u-boot-utils"
conf/machine/openrd-base.conf:MACHINE_EXTRA_RDEPENDS          =
"u-boot-utils"
conf/machine/sheevaplug.conf:MACHINE_EXTRA_RDEPENDS          =
"u-boot-utils"
conf/machine/storcenter.conf:MACHINE_EXTRA_RDEPENDS = "u-boot-utils xfsprogs
sccd"
conf/machine/lspro.conf:MACHINE_EXTRA_RDEPENDS          = "micro-evtd
u-boot-utils"
conf/machine/mv2120.conf:MACHINE_EXTRA_RDEPENDS          = "u-boot-utils"
conf/machine/tsx09.conf:MACHINE_EXTRA_RDEPENDS                          =
"u-boot-utils piccontrol"
conf/machine/dns323.conf:MACHINE_EXTRA_RDEPENDS          = "u-boot-utils"
conf/machine/openrd-client.conf:MACHINE_EXTRA_RDEPENDS          =
"u-boot-utils"
conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_u-boot-utils
?= "1.2.0"

and in recipes:
frans@frans-desktop:~/workspace/gtd/openembedded.git$ grep -r u-boot-utils
recipes
recipes/tasks/task-openprotium.bb:DISTRO_EXTRA_RDEPENDS += "u-boot-utils"
recipes/linux/linux-gumstix_2.6.15.bb:DEPENDS = "u-boot-utils-native"
recipes/linux/linux-turbostation_2.6.20.2.bb:DEPENDS = "u-boot-utils-native"
recipes/linux/linux-bd-neon-2.6_2.6.22.bb:DEPENDS += "u-boot-utils-native

How to deal with this???

Frans

