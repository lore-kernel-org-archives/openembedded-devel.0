Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PK5yS-0001GR-0I
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 10:12:40 +0100
Received: by vws6 with SMTP id 6so776129vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 01:11:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.202.135 with SMTP id fe7mr1181940vcb.69.1290330688688;
	Sun, 21 Nov 2010 01:11:28 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Sun, 21 Nov 2010 01:11:28 -0800 (PST)
X-Originating-IP: [95.29.187.131]
In-Reply-To: <1290257871.3928.24.camel@mattotaupa>
References: <1290257871.3928.24.camel@mattotaupa>
Date: Sun, 21 Nov 2010 12:11:28 +0300
X-Google-Sender-Auth: uDeNb8_Cs-h7aOOGWvBuMP1fHbw
Message-ID: <AANLkTinAGdNvU4+uNJ5yvspT3LDgaqknchwW-hja14PF@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: x11-image: task `rootfs` fails with `opkg_install_cmd: Cannot install package locale-base-fr-fr.`
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
X-List-Received-Date: Sun, 21 Nov 2010 09:12:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/20 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE folks,
>
>
> `bitbake -k x11-image` fails for me with the following error.
[skip]
> =A0 =A0 =A0 =A0| Collected errors:
> =A0 =A0 =A0 =A0| =A0* resolve_conffiles: Existing conffile /oe/build-mini=
mal-eglibc/minimal-dev/rootfs/x11-image/etc/device_table is different from =
the conffile in the new package. The new conffile will be placed at /oe/bui=
ld-minimal-eglibc/minimal-dev/rootfs/x11-image/etc/device_table-opkg.
> =A0 =A0 =A0 =A0| =A0* opkg_install_cmd: Cannot install package locale-bas=
e-fr-fr.
> =A0 =A0 =A0 =A0| ERROR: Function do_rootfs failed
> =A0 =A0 =A0 =A0NOTE: package x11-image-1.0-r0: task do_rootfs: Failed
[skip]
> I have seen this error for several months so I think it is no recent
> commit that is causing this.

I've seen this too when building minimal distro with
GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 ru_RU.UTF-8=
"
but without appropriate IMAGE_LINGUAS.

Removing GLIBC_GENERATE_LOCALES and rebuilding eglibc fixes this.

Problem is coming from here:
classes/image.bbclass:IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"

--=20
Yury Bushmelev


