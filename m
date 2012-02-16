Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyPD-00067k-Bu
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:17:39 +0100
Received: by vcbfl15 with SMTP id fl15so1581180vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=SbYxXKsAX8Rwx05XhprrjrKFhZmsjBOqUv1E04hOQGk=;
	b=WjMwa7HhF+AZXqMlUzD4MGJKqcZvKgbIufKgvl9ErtmowcTmXGGEsjWzQtpTwHvmh0
	ELNHmOfmEHosrjPkKagn9hWmFIB6Eaqy4BHJN11ZupczFDWeoGvJF+RcMx9JB++xl5cY
	z9mEHzkvLctndHCi9+PW/cjcMzZXlvQx2A8/8=
MIME-Version: 1.0
Received: by 10.220.157.83 with SMTP id a19mr972609vcx.54.1329386965516; Thu,
	16 Feb 2012 02:09:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:09:25 -0800 (PST)
In-Reply-To: <1329357796-27398-22-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-22-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:09:25 -0200
X-Google-Sender-Auth: lcHSaivKA7EoEMeuX6m8UOsQ_vo
Message-ID: <CAP9ODKpHyqa+d_-KQjwRjuCvSxwELH2ET1i4R=s3K0aBuc_YcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 21/22] dhcp: add native systemd support for dhcp-relay
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
X-List-Received-Date: Thu, 16 Feb 2012 10:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |    8 +++++---
>  .../dhcp/files/dhcrelay.service                    |   10 ++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
>
> diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> index 829ad3c..6d1e3df 100644
> --- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> +++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> @@ -3,9 +3,11 @@ FILESEXTRAPATHS :=3D "${THISDIR}/files"
>
>  inherit systemd
>
> -PRINC :=3D "${@int(PRINC) + 2}"
> +PRINC :=3D "${@int(PRINC) + 3}"
>
> -SYSTEMD_PACKAGES =3D "dhcp-server-systemd"
> +SYSTEMD_PACKAGES =3D "dhcp-server-systemd dhcp-relay-systemd"
>  SYSTEMD_SERVICE_dhcp-server-systemd =3D "dhcpd.service"
> +SYSTEMD_SERVICE_dhcp-relay-systemd =3D "dhcrelay.service"
>
> -SRC_URI +=3D "file://dhcpd.service"
> +SRC_URI +=3D "file://dhcpd.service \
> +            file://dhcrelay.service"
> diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
> b/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
> new file mode 100644
> index 0000000..f68f468
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DDHCP Relay Agent Daemon
> +After=3Dsyslog.target network.target
> +
> +[Service]
> +EnvironmentFile=3D/etc/default/dhcp-relay
> +ExecStart=3D/usr/sbin/dhcrelay -d $DHCRELAYARGS
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

