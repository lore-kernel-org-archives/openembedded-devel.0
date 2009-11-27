Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NDqHl-0004gM-Ch
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 03:10:16 +0100
Received: by bwz9 with SMTP id 9so864472bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 18:08:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.157.26 with SMTP id z26mr461397bkw.124.1259287722228; Thu, 
	26 Nov 2009 18:08:42 -0800 (PST)
In-Reply-To: <E1NDcWJ-0005Ee-Np@melo.openembedded.org>
References: <E1NDcWJ-0005Ee-Np@melo.openembedded.org>
Date: Thu, 26 Nov 2009 23:08:42 -0300
Message-ID: <ae9c9a1c0911261808v3dec996fqd83d164f6c960798@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Thomas Zimmermann : obexd: add version 0.19
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
X-List-Received-Date: Fri, 27 Nov 2009 02:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I actually sent a similar patch to the list, but also moving the
content to a .inc file, 4 days ago.

Was this patch available anywhere else or simply no one is paying much
attention to patchwork?

Just to understand better how the patch process is actually being handled i=
n OE.

Thanks,

Ricardo

On Thu, Nov 26, 2009 at 8:28 AM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 05e63abd2b64cd171d41d7f4745463bfb325d396
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D05e63abd2b64cd171d41d7f4745463bfb325d396
>
> Author: Thomas Zimmermann <ml@vdm-design.de>
> Date: =A0 Thu Nov 26 09:20:49 2009 +0000
>
> obexd: add version 0.19
>
> Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
>
> ---
>
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++++
> =A0recipes/bluez/obexd_0.19.bb | =A0 10 ++++++++++
> =A02 files changed, 14 insertions(+), 0 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index df3e609..5755108 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -19802,6 +19802,10 @@ sha256=3D44ba0d99e1bf8fa2caf9f7a85d569e513208c07=
10c1ad00032e271289e87b63f
> =A0md5=3D5674f746b55439d32bc765d2c5baad16
> =A0sha256=3D6dbabd9345967120ad21cc25489a6d244aed7975cee9297cc5716af4debc7=
228
>
> +[http://www.kernel.org/pub/linux/bluetooth/obexd-0.19.tar.gz]
> +md5=3D2f03b81411a1f7c359ada35459d946a5
> +sha256=3D37fb4cffad7e361daffa9915ee6a37e615d0bf4d1f24760e585d5ac922515ca=
8
> +
> =A0[http://downloads.sourceforge.net/openobex/obexftp-0.20.tar.gz]
> =A0md5=3D085b9edc0504c0d79e7479a54e2018c5
> =A0sha256=3D7246fc75257afcd30ff16dc70185057157bcefc12fa9fba111b3b201577cc=
40e
> diff --git a/recipes/bluez/obexd_0.19.bb b/recipes/bluez/obexd_0.19.bb
> new file mode 100644
> index 0000000..e1cc6ce
> --- /dev/null
> +++ b/recipes/bluez/obexd_0.19.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "OBEX Server and Client"
> +DEPENDS =3D "openobex glib-2.0 dbus bluez4"
> +
> +LICENSE =3D "GPLv2"
> +
> +SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.g=
z"
> +
> +inherit autotools_stage
> +
> +FILES_${PN} +=3D "${datadir}/dbus-1/"
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>



--=20
Ricardo Salveti de Araujo


