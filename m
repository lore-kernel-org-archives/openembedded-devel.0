Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ti2d0-0000Ny-Tu
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 13:38:36 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so997834bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 04:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7sLn/qqh+sm1NskUXTNTVF8BsvNB71P20i12QgYPn4c=;
	b=d6p+haKEMYYdvqzD6piB/2tIjA2x9KgBTNQj7e8sX31Lz2VbFTIldnzngFFoHPm3G3
	UA/N0yVXdXbAR9BHhdrm57Jsn7D6zJkz5Lms7GhatQLKzAFgwY0N6fLkeK4lVT4VUVnZ
	CwBFI1IQCiaXx4JS5kkdAjV41smF6vWZ+G6UFBJZx7DQcYX14eH/jK8/dFiTjhe2sKES
	bMzRc3hwb+FaSK5uRcSSUyIYMLsyaw+sEQgvu+IxaF7I6wqtKOfzRum5ue0HWsS8dp/w
	chhjyX+Bd/iGvL6bYxl7M62aNtjChNix1GmE9uRqZ1bB5nStlNHnMS7ruvHLXFmruRzn
	qLSg==
Received: by 10.204.11.142 with SMTP id t14mr4414168bkt.9.1355142243735;
	Mon, 10 Dec 2012 04:24:03 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f24sm13821639bkv.7.2012.12.10.04.24.01
	(version=SSLv3 cipher=OTHER); Mon, 10 Dec 2012 04:24:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRQLooCy6mSDfKW0Xt4wbXo0uja2FEovZSqVM_U8t_n7LA@mail.gmail.com>
Date: Mon, 10 Dec 2012 13:24:00 +0100
Message-Id: <2B0098E7-F516-4691-9DC9-47E9C4DE0AF5@dominion.thruhere.net>
References: <CALbNGRQLooCy6mSDfKW0Xt4wbXo0uja2FEovZSqVM_U8t_n7LA@mail.gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQkgfVCDrupkYyxqvmfOJqXZiBAx2TH5hqw4gP+3NSnIZJZFdBktHZ1v8y4FbU6p5jChSMDP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] [meta-angstrom][meta-systemd]: ${sysconfdir}/tmpfiles.d/var-run.conf conflict at do_rootfs
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
X-List-Received-Date: Mon, 10 Dec 2012 12:38:40 -0000
X-List-Received-Date: Mon, 10 Dec 2012 12:38:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 7 dec. 2012, om 11:07 heeft Andreas M=FCller =
<schnitzeltony@googlemail.com> het volgende geschreven:

> Hi,
>=20
> with the latest layers do_rootfs fails with:
>=20
> |  * check_data_file_clashes: Package systemd wants to install file
> =
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-f=
ull-image/1.0-r0/rootfs/etc/tmpfiles.d/var-run.conf
> | 	But that file is already provided by package  * base-files
>=20
> var-run.conf is installed by
> * systemd
> * angstrom base-files.bbappend
>=20
> There are two possible ways to fix:
> 1. Create base-files.bbappend in meta-systemd which removes =
var-run.conf
> 2. removing do_install_append in meta-angstrom / base-files.bbappend

I'd go for option 2, but I don't have a strong opinion on it.

regards,

Koen=


