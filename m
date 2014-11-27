Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 662C372366
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:15:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XtvAD-0007Fw-2B for openembedded-devel@lists.openembedded.org;
	Thu, 27 Nov 2014 10:15:01 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:15:01 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:15:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 27 Nov 2014 10:14:51 +0100
Message-ID: <m56q2b$8q2$1@ger.gmane.org>
References: <1416555843-1935-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1416555843-1935-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] open-iscsi : add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Nov 2014 09:15:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Li xin schreef op 21-11-14 08:44:
> Open-iSCSI project is a high performance, transport independent, 
> multi-platform implementation of RFC3720.
> 
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>

> +++ b/meta-oe/recipes-support/open-iscsi/files/open-iscsi.service @@ -0,0
> +1,18 @@ +[Unit] +Description=Open-iSCSI +Documentation=man:iscsid(8)
> man:iscsiadm(8) +After=network.target + +[Service] +Type=forking 
> +PIDFile=/var/run/iscsid.pid +ExecStartPre=-/sbin/modprobe -q iscsi_tcp 
> +ExecStartPre=-/sbin/modprobe -q ib_iser +ExecStart=/usr/sbin/iscsid -p
> /var/run/iscsid.pid +ExecStartPost=-/usr/sbin/iscsiadm -m node
> --loginall=automatic +ExecStopPost=/bin/sync 
> +ExecStopPost=-/sbin/modprobe -r ib_iser +ExecStopPost=-/sbin/modprobe -r
> iscsi_tcp

Tons of hardcoded paths here


> + +[Install] +WantedBy=multi-user.target diff --git
> a/meta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871.bb
> b/meta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871.bb new file mode
> 100644 index 0000000..c8a87d3 --- /dev/null +++
> b/meta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871.bb @@ -0,0 +1,35
> @@


> +SRC_URI = "http://www.open-iscsi.org/bits/${BP}.tar.gz"

[..]

> +SRC_URI += "file://iscsi_sysfs.c-add-include-files.patch \ +
> file://open-iscsi.service"

Please collapse these into a single SRC_URI


> +do_install_append () { +    if
> ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then +
> install -d ${D}${systemd_unitdir}/system +        install -m 0644
> ${WORKDIR}/open-iscsi.service ${D}${systemd_unitdir}/system/ +    fi +} 
> + +do_install () { +    oe_runmake DESTDIR="${D}" install_user +}

Please collapse these into a single method

> +inherit
> ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}

'inherit
> 
systemd' should be safe enough with this check. And if you *really*
want to check, check for DISTRO_FEATURES.

Also, you're missing RRECOMMENDS for the kernel modules you try to modprobe
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUduuKMkyGM64RGpERAg9KAJ9lOrnIsfdO55QXXtOapwNqlA003wCgumTL
Cc+RUQRUvvzJKfupM/kauqc=
=MBC4
-----END PGP SIGNATURE-----


