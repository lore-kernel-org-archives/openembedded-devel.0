Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id B74436AF41
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 05:53:48 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so3910659pbb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2013 22:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=R3fdpVC/rh42CmhYRRzvZHp3rWPhPH71gWVyaIYcFHo=;
	b=CVD4gJ2PvqXb/+CCgdW+GF9QJk26qJNaQlnRJb+CcMARmj6rBv8clUNC5z1hJrMDj0
	tzI/UBs8w8JnxxcFUySKj3IxzGQcMGTOnFDKdlP0Tobx97pUv0W3rVIzg4Q7Vc9yQhDS
	a6LCOS8e+mRhBP2mKfrOSQ6iqbGvps46RFXQu2tpcOMI/voB1S0inh7fBwNI/HYxJUk9
	fCMXxeIqn+Dvckg54nHiRFaPaz+bPRAzMYQwHR7p7KyjKnH4nCU6UWymEholv7FE3CUh
	5Uyl3MwprfY7oaprQ2UFvSaRnqdtOadoJnQ5iR4j5jTmbwfpxt0SQfE0P0sNv8ZPVKNN
	4m3w==
X-Received: by 10.66.162.135 with SMTP id ya7mr21029801pab.173.1373262829698; 
	Sun, 07 Jul 2013 22:53:49 -0700 (PDT)
Received: from sa-nc-spg-194.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id s5sm20443738pbo.38.2013.07.07.22.53.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 07 Jul 2013 22:53:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1373261850-3744-1-git-send-email-net147@gmail.com>
Date: Sun, 7 Jul 2013 22:53:44 -0700
Message-Id: <094610E5-4BD6-445D-B46F-B09BA052A81F@gmail.com>
References: <1373261850-3744-1-git-send-email-net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-oe][PATCH v2] samba: remove /var/lock and /var/run from package
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
X-List-Received-Date: Mon, 08 Jul 2013 05:53:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 7, 2013, at 10:37 PM, Jonathan Liu <net147@gmail.com> wrote:

> The /var/lock and /var/run directories are already created by
> base-files.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
> meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb =
b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> index a27a28c..255c0b4 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> @@ -57,3 +57,9 @@ do_configure() {
> do_compile () {
>     base_do_compile
> }
> +
> +do_install_append() {
> +    rmdir "${D}${localstatedir}/lock"
> +    rmdir "${D}${localstatedir}/run"
> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"

what is this last rmdir doing ?


> +}
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


