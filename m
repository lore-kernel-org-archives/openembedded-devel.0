Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MoGh2-0003Fg-NM
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 15:06:39 +0200
Received: by fxm22 with SMTP id 22so7951fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hJsyRlQaX9qNap2W0w0YMcFl0TQVyeCsrJdX9/17ccQ=;
	b=h9wr+WYoes9ocZ/nTMPI5Q6KPwb2Ro9162mHK+xSeQA9HRtNkzsXCzKTz8u2SF8d/y
	PUuNJn+bXZR/sM1RllfHhPjHR7xeG57DFTocY9avB2l8ox3L28zBRzHUOZ6K5hJWNYlC
	Q8ssJICFfe2xSCANmtTSd/qWFatUhuMhxQa7c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=nkFaJXKKrlpQW2kJLaX7T3614b4pMr52SZpxvt4f+mH7MQ0+QXYPeuHbUa8fwkeaHg
	mCw4nEXaak5GWGGivck81mkQQrX3IbJRIjhlINr8wE4Z09yKzzteNLPPv+lDRseHMuz5
	S1rplM2FR1bt5geBnbuBWjhBbZZ20uuoX/UDE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.143.216 with SMTP id l24mr2650hba.166.1253192763122; Thu, 
	17 Sep 2009 06:06:03 -0700 (PDT)
In-Reply-To: <1253121074.1495.75.camel@conroy-linux>
References: <1253121074.1495.75.camel@conroy-linux>
Date: Thu, 17 Sep 2009 10:06:03 -0300
X-Google-Sender-Auth: face96e96f822ef9
Message-ID: <be7a9f3d0909170606u6ecec8cdl5b3716c24dfdb331@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] rootfs postprocess command
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
X-List-Received-Date: Thu, 17 Sep 2009 13:06:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1

On Wed, Sep 16, 2009 at 2:11 PM, Chris Conroy
<Chris.Conroy@hillcrestlabs.com> wrote:
> I ran into a problem yesterday where the ROOTFS_POSTPROCESS_COMMAND
> started failing after I turned off ONLINE_PACKAGE_MANAGEMENT. It seems
> the problem is that if package management is turned off, then the opkg
> directory gets deleted. Subsequent opkg commands in the
> ROOTFS_POSTPROCESS_COMMAND fail to open the lock file because the
> directory is gone.
>
> This patch simply moves the postprocess command above the destruction of
> the opkg directory to allow any such commands to complete successfully.
>
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index 16dd511..9231787 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -81,6 +81,8 @@ fakeroot rootfs_ipk_do_rootfs () {
> =A0 =A0 =A0 =A0install -d ${IMAGE_ROOTFS}/${sysconfdir}
> =A0 =A0 =A0 =A0echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
>
> + =A0 =A0 =A0 ${ROOTFS_POSTPROCESS_COMMAND}
> +
> =A0 =A0 =A0 =A0if [ "${ONLINE_PACKAGE_MANAGEMENT}" !=3D "none" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ "${ONLINE_PACKAGE_MANAGEMENT}" =3D=3D=
 "add" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -f ${IMAGE_ROOTFS}${lib=
dir}/opkg/status
> @@ -97,8 +99,6 @@ fakeroot rootfs_ipk_do_rootfs () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -rf ${IMAGE_ROOTFS}/usr/lib/opkg
> =A0 =A0 =A0 =A0fi
>
> - =A0 =A0 =A0 ${ROOTFS_POSTPROCESS_COMMAND}
> -
> =A0 =A0 =A0 =A0log_check rootfs
> =A0}
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


