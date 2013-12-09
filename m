Return-Path: <cjb.sw.nospam@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 67C4D61222
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 09:21:14 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b57so1392979eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:references:in-reply-to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding:thread-index
	:content-language:importance;
	bh=OASyAZh2JSwis76M/8V+EgBp0NYUjliA1JRiVZcT1aI=;
	b=m5Lh+KoTQKcYTlIRwjjiSnfnPTrOTlI6+koU207QVcNP4pKYrFGmEqrKrRNKCoYsTp
	Me09+6t5pnW4jpwPv6GyxoWHhhik3yFUayAvRQ8Eze5PCDiqQRDkrj7HkKbxkp4hiTrx
	x2OvU+1mgghUZotM+WSrL5EFWMPky2/SiJLccqyGAJc/0yCnWPDfNYoUIOM53ur0vq0T
	ETR72Hln4eFuD+eqEOhx0Q4qV1RrW9MDIXXKDmtQQ3qHWmUwYpl+uXYWkDzgGKfFXE9d
	QU8k1GlnipYkSyG6DzJDxVf0nrnwqB08Q/HisdQ8lr5WZkH1hHgbMtsAB+7ytPyJhYG/
	AyCg==
X-Received: by 10.14.9.131 with SMTP id 3mr11939769eet.45.1386580873261;
	Mon, 09 Dec 2013 01:21:13 -0800 (PST)
Received: from SIMONENB (88-149-150-170.v4.ngi.it. [88.149.150.170])
	by mx.google.com with ESMTPSA id a51sm26406962eeh.8.2013.12.09.01.21.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Dec 2013 01:21:11 -0800 (PST)
From: "Simone" <cjb.sw.nospam@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
	<52A569A4.1040105@gmail.com>
In-Reply-To: <52A569A4.1040105@gmail.com>
Date: Mon, 9 Dec 2013 10:20:50 +0100
Message-ID: <003a01cef4bf$f5353980$df9fac80$@gmail.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHZdKVhVxVkB2XuyXA/xZKkLRZcFABbW/c6mjO6zCA=
Importance: High
Subject: Re: Meta-qt5 sdk
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
X-List-Received-Date: Mon, 09 Dec 2013 09:21:17 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: it

Hello Marco,
I built qt5 from master branch (both yocto and meta-qt5), without =
applying
any patch.
Just add the lines you already have in your configuration..

Ciao
Simone


-----Messaggio originale-----
Da: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] Per conto di
Marco
Inviato: luned=EC 9 dicembre 2013 07:57
A: openembedded-devel@lists.openembedded.org
Oggetto: Re: [oe] Meta-qt5 sdk

Il 27/11/2013 21:26, Simone ha scritto:
> Hello to all,
> I'm new to this mailing list.
>
> I'm writing because i want to ask the actual status of meta-qt5 layer.
> Actuallly, we are able to build qt5 with examples for our fsl based
platform.


Hi Simone,
I was able to build with the following settings but I am not able to run
Qt5 apps on my iMX6 target.
IMAGE_INSTALL_append =3D "qtbase qtbase-fonts qtbase-plugins =
qtbase-examples
cinematicexperience gstreamer nano cairo pango fontconfig freetype"
DISTRO_FEATURES_remove =3D "x11 wayland"

meta-yocto-bsp    =3D "dora:75bed4086eb83f1d24c31392f3dd54aa5c3679b1"
meta-oe           =3D "dora:513e7ca20ddd0a5c3b649bf292a67c3e0473d3a8"
meta-fsl-arm      =3D "dora:5b3b6618426ad06e4fb6a3a77c4a53dfb47f0556"
meta-qt5          =3D "dora:cefaba69a785c5221463f0eb496b749d5ddf8a5a"

root@imx6dlsabresd:~# ./analogclock/analogclock -platform eglfs =
Segmentation
fault


Which branch are you using (for yocto and meta-qt5)?
Are you applying any patch to meta-qt5?

TIA

Ciao
--
Marco
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


