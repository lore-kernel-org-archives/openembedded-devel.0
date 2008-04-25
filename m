Received: from [64.233.184.225] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JpSlZ-0005ve-VS
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 20:35:26 +0200
Received: by wr-out-0506.google.com with SMTP id 36so2235774wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2008 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=FrepNLnf4LOsui/eETz3wX7n4WKsYO1kO8lY6E2f7tA=;
	b=G0Ud1nS6m9FS6dcClXC/NTNwYClPDpdPIXcNkdwLlwDCjuIvX5CzB+v6EGWZ2IaNuka+Lga6O8CqH6bZSIpzx+TP/9Qglm1uwYjSXTMMsQBb8dtWhu2UeFXQXDMpuYDrexFu8i+9nTBdBjyOtzhaJaPBCnSfirQg1jZTSnm31fs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=sAEaPuYNjvZ0qLRxMVhQRDbaCvItkfSJNCKyz+CbRdtrPc8HF3uPGYZlCiLGd73wgy+RF3dO+iOjCVQREOvxf6CNu13tIkzqh/3GFcnimLLZ1Q0pAqs2sBGe28dPTEZKJg8V7uY3oSFGv4vhxCBxobcPvNBgeY/mkIhHYqFCVOI=
Received: by 10.114.190.6 with SMTP id n6mr1126243waf.51.1209148510561;
	Fri, 25 Apr 2008 11:35:10 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Fri, 25 Apr 2008 11:35:10 -0700 (PDT)
Message-ID: <f96d234e0804251135o793a12c3m2c1d397a1e0d0024@mail.gmail.com>
Date: Fri, 25 Apr 2008 14:35:10 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4811F25C.7040402@bolloretelecom.eu>
MIME-Version: 1.0
References: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
	<4811F25C.7040402@bolloretelecom.eu>
Subject: Re: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 25 Apr 2008 18:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Apr 25, 2008 at 11:01 AM, Jeremy Lain=E9
<jeremy.laine@bolloretelecom.eu> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>  Hash: SHA1
>
>  I am not sure whether this is the same issue but some time ago I filed
>  a bug report (with patch) because some of the configure.ac files did
>  not respect the PKG_CONFIG env variable and hence called the wrong
>  pkg-config:
>
>  https://bugs.freedesktop.org/show_bug.cgi?id=3D8185

Hi Jeremy,

I don't think this is the same issue because as far as I can tell this
is not an issue of running the wrong package config, rather knowing
how to use the data in it.  When I fun configure in an OE build,
$PKG_CONFIG does not seem to be defined.

This is what I came up with:

--- font-misc-misc-1.0.0.orig/configure.ac      2008-04-25
13:47:56.000000000 -0400
+++ font-misc-misc-1.0.0/configure.ac   2008-04-25 13:48:10.000000000 -0400
@@ -45,7 +45,8 @@
 AC_SUBST(FONTDIR)

 PKG_CHECK_MODULES(MAPS, [fontutil])
-MAPFILES_PATH=3D$(pkg-config --variable=3Dmapdir fontutil)
+m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
+MAPFILES_PATH=3D$PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=3Dmapdir fon=
tutil`
 AC_SUBST(MAPFILES_PATH)

 XORG_FONT_CHECK_ISO8859_1


Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


