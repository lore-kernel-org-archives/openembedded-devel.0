Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1ULzTr-0006QF-1z
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 18:22:15 +0100
Received: by mail-ob0-f174.google.com with SMTP id 16so1022204obc.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 10:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-received:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=iSyTlkBwx33ezPGSsW4c2pkb7N22/+cKSNmvR+V3MSE=;
	b=d7OPRU404KfQqOi7DfR+adkxmgkwO/2qL6v4+Oqyy0BSegxA4gK4JEY+u6sxH4VjQh
	PHBQR4MsRpJqyvQgPwprBQguhYP3G9uxtPwXinmwbBUM9VriO7TWWdufdVeBvFCsNQGr
	GacOBfMoGMQWgNuAz3BEn9zFKNuo29W4ab5yA0tgq0kVadYfzoa3FduCGPikPQMG4Mtj
	/JIOT7sOUOJpy/BSvmRWY0ZKAdWTFMeHC6DdB6u+N0Fmi2KROE0GSTc5gLBbcm9cS8QQ
	b6wjcDFDQUtraeQ8eaJ8WVph3mt6Vzfd6UIFaGOECFjqqYJ0nbIfOYxTULHIbALISudJ
	M4VA==
X-Received: by 10.182.157.104 with SMTP id wl8mr2169084obb.79.1364663108875;
	Sat, 30 Mar 2013 10:05:08 -0700 (PDT)
Received: from mail-ob0-x22f.google.com (mail-ob0-x22f.google.com
	[2607:f8b0:4003:c01::22f])
	by mx.google.com with ESMTPS id qk4sm1542282obc.5.2013.03.30.10.05.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 30 Mar 2013 10:05:08 -0700 (PDT)
Received: by mail-ob0-f175.google.com with SMTP id va7so1013615obc.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 10:05:07 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.182.12.6 with SMTP id u6mr2139129obb.3.1364663107594; Sat,
	30 Mar 2013 10:05:07 -0700 (PDT)
Received: by 10.76.90.103 with HTTP; Sat, 30 Mar 2013 10:05:07 -0700 (PDT)
In-Reply-To: <1357139774-4364-2-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
	<1357139774-4364-2-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 30 Mar 2013 13:05:07 -0400
Message-ID: <CA+T6QPnFy=OAdiAi7H0avHn0AK-qbtEbMBBkizF7OWYtL4qGyQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlxBJb13ELHp1Tt4SxPnZ5YRRYlQ1NfzBTmv2MRo8hCC1D/DD9qv3b5ZShK2Yle1gsiRI6y
Subject: Re: [meta-xfce/meta-gnome/V2 01/10] exo: update to 0.10.2
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
X-List-Received-Date: Sat, 30 Mar 2013 17:22:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 2, 2013 at 10:16 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/exo/exo/configure.patch     |    4 ++--
>  .../exo/{exo_0.8.0.bb =3D> exo_0.10.2.bb}            |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb =3D> exo_0.10.2.bb} (87%=
)


There seems to be a missing dependency on some Perl modules[1]:

| checking for perl module URI::Escape... no
| checking for perl module URI::file... no
| checking for perl module URI::URL... no
| configure: error: Atleast one of the required Perl modules
(URI::Escape, URI::file and URI::URL) was not found on your system
| Configure failed. The contents of all config.log files follows to
aid debugging

[1] https://s3.amazonaws.com/beagleboard/angstrom-2013-03-30-16%3A24%3A13/b=
uild.log

I'm working on a patch.

>
>
> diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/r=
ecipes-xfce/exo/exo/configure.patch
> index 2ccfcfc..ef27e42 100644
> --- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
> +++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
> @@ -1,5 +1,5 @@
> ---- exo-0.3.4/configure.in~    2007-12-02 10:37:06.000000000 -0200
> -+++ exo-0.3.4/configure.in     2008-06-05 17:21:42.000000000 -0300
> +--- a/configure.ac     2007-12-02 10:37:06.000000000 -0200
> ++++ b/configure.ac     2008-06-05 17:21:42.000000000 -0300
>  @@ -127,22 +127,24 @@
>   dnl ***************************************
>   dnl *** Check for strftime() extensions ***
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb b/meta-xfce/recipes-=
xfce/exo/exo_0.10.2.bb
> similarity index 87%
> rename from meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
> rename to meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> index af9103f..4fdfd48 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> @@ -13,8 +13,8 @@ SRC_URI +=3D " \
>      file://gnome-mount \
>  "
>
> -SRC_URI[md5sum] =3D "189bd19210e1d7d8601be1cdf27bf259"
> -SRC_URI[sha256sum] =3D "6e21aa30692affcb45fc8283d034da4a02221d26e3e1facb=
968d04fed4ba05b0"
> +SRC_URI[md5sum] =3D "c70f2a217811bfba2e62f938d4b8f748"
> +SRC_URI[sha256sum] =3D "b385828bf8a38204da3254b57fdfa25a72694495aa189fab=
d5040f707eec76ce"
>
>  # see http://wiki.xfce.org/gnomemount-replacement
>  do_install_append () {
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


