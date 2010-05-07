Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OALLE-0001c2-3w
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 13:03:36 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id E1185491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 12:59:48 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 13:00:54 +0200
Message-ID: <4BE3F2AE.8060305@dresearch.de>
Date: Fri, 07 May 2010 12:59:58 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE25BFD.2090204@dresearch.de> <hrtmn1$bp1$3@dough.gmane.org>
	<4BE3C542.4070603@dresearch.de>
In-Reply-To: <4BE3C542.4070603@dresearch.de>
X-OriginalArrivalTime: 07 May 2010 11:00:54.0417 (UTC)
	FILETIME=[905A5810:01CAEDD4]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: All the syslogs
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
X-List-Received-Date: Fri, 07 May 2010 11:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> OK, than i'll try to create an u-a setting for all the syslogs (btw: we
> have not three but four different ones, there's sysklogd too).
>=20
> Has anyone combined update-alternatives and update-rc.d for initscripts
> before? I'm afraid there are some pitfalls in the naming of the initscr=
ipt
> itself and the symlinks.

I made some first tests and they confirmed my fears. :(

The recipes look like this:

-------------------->snip<---------------------------
inherit autotools update-rc.d

do_install_append() {
        ...
        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/sy=
slog.${PN}
}

pkg_postinst_${PN} () {
    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init=
 syslog.${PN} 300
}

pkg_prerm_${PN} () {
    update-alternatives --remove syslog-init syslog.${PN}
}

INITSCRIPT_NAME =3D "syslog"
-------------------->snip<---------------------------

When opkg installs the packages it wants to run update-rc.d *before*
update-alternatives. This results in an "file does not exist" error. :(

  Installing rsyslog (5.5.4-r1.0.5) to root...
  Installing busybox-syslog (1.13.2-r24.1.5) to root...
  Configuring rsyslog
  update-rc.d: /etc/init.d/syslog: file does not exist
  update-alternatives: Linking //etc/init.d/syslog to syslog.rsyslog

Any suggestions?

Regards,
Steffen

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



