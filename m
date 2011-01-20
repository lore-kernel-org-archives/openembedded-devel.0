Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Pfx0L-0002Sa-O0
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 17:04:57 +0100
Received: by qwi2 with SMTP id 2so747872qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 08:04:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.81.138 with SMTP id x10mr1881594qck.20.1295539445620; Thu,
	20 Jan 2011 08:04:05 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.29.2 with HTTP; Thu, 20 Jan 2011 08:04:05 -0800 (PST)
X-Originating-IP: [95.29.184.245]
In-Reply-To: <20110120103126.GB26640@lit.local.igalia.com>
References: <20110120103126.GB26640@lit.local.igalia.com>
Date: Thu, 20 Jan 2011 19:04:05 +0300
X-Google-Sender-Auth: Hx1do20IsiWp9A6IzmOPMGqRNU0
Message-ID: <AANLkTinrGpmXqWx8a4AULZduXpQC57VDA40=Z69wu9Dw@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: native-sdk-image do_rootfs() fails
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
X-List-Received-Date: Thu, 20 Jan 2011 16:04:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/20 V=EDctor M. J=E1quez L. <vjaquez@igalia.com>:
> I'm trying to build a native-sdk-image for pandaboard, both with
> angstrom-linux-gnueabi and external csl toolchains. Both builds failed in=
 the
> same point:
>
> | Configuring sysvinit.
> | Collected errors:
> | =A0* satisfy_dependencies_for: Cannot satisfy the following dependencie=
s for task-sdk-native:
> | =A0* =A0 =A0virtual-libc-dev *
> | =A0* opkg_install_cmd: Cannot install package task-sdk-native.
> | =A0* resolve_conffiles: Existing conffile /media/DISK/angstrom-setup-sc=
ripts/build/tmp-angstrom_2008_1/rootfs/native-sdk-image/etc/device_table is=
 different from the conffile in the new package. The new conffile will be p=
laced at /media/DISK/angstrom-setup-scripts/build/tmp-angstrom_2008_1/rootf=
s/native-sdk-image/etc/device_table-opkg.
> | ERROR: Function do_rootfs failed
>
> I don't know how to deal with this issue. Any advice?

I have built native-sdk-image twice (for qemuarm and for qemux86) this
week w/o problems, but for minimal distro.

--=20
Yury Bushmelev


