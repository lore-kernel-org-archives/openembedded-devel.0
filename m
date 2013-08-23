Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E05D6AF21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:36:21 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so942413pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=HNqrv1ha0go9/Pnc27R+UMaByFqUxFriEx0w/bSC/Uk=;
	b=U4BYR7EZUAFCZZcFcaISDBPa6OIHjeIovo8F4M14+84I5FT6pMLS0FTT6Nc5a3Zg7x
	SQyEeQH70v46JSOXPD/kSNcGPdkcSpDbbmGjurA++ojL4AU2lXbRYBkJyjN7OGETty/c
	STzmLvGYNsays/b+GZdzzYKJPhLM1ZXFbqrXPiQmyOBSYx+Z5g7VHe6+w4uzNiakj+nF
	Wi+TTBcWjhEfeJR+ZFa3MUcm0pzvzgdN3kjexEQZO7YFqwZEDNvZFUxm8eUQHyL6FYb5
	YOqVrUca9EV/XwNDKB2xVhkwcrwroLQxuZ9E1eoLKZWfY5w62M/4wFRckffQ4zUvmyQe
	i2iw==
X-Received: by 10.66.147.9 with SMTP id tg9mr252449pab.5.1377279381991;
	Fri, 23 Aug 2013 10:36:21 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id oj6sm2350887pab.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:36:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
Date: Fri, 23 Aug 2013 10:36:15 -0700
Message-Id: <0A0D83CF-8BD1-46F8-BCE7-214E5F634E6E@gmail.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Fri, 23 Aug 2013 17:36:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 23, 2013, at 4:33 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> This bbappend has effectively been merged into OE-Core, although the
> log buffer size is the busybox default rather than 64K - layers may
> change this either by providing their own /etc/default/busybox-syslog
> file (when using systemd) or modifying the
> CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
> config

I think it would be better if we added this option via a kconfig =
fragment
in OE-Core if DISTRO_FEATURES contained systemd and then remove this =
from
here. I say this because otherwise size of circular buffer goes back to =
16k
from 64k and may not be enough to hold valuable info. On modern systems =
I
think we can afford 64k. I would even argue to make it default in =
busybox.
having said that, busybox-syslogd may be redundant when using systemd =
since
we have journald with systemd but there might still be lot of use cases
of busybox-syslogd. Either of these above approaches are fine with me.

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta-oe/recipes-core/busybox/busybox/busybox-syslog.default |  1 -
> meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend        | 11 =
-----------
> 2 files changed, 12 deletions(-)
> delete mode 100644 =
meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
> delete mode 100644 =
meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
>=20
> diff --git =
a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default =
b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
> deleted file mode 100644
> index 8a21e6d..0000000
> --- a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
> +++ /dev/null
> @@ -1 +0,0 @@
> -OPTIONS=3D"-C64"
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend =
b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
> deleted file mode 100644
> index 7a2f0c3..0000000
> --- a/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# look for files in the layer first
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -SRC_URI +=3D "file://busybox-syslog.default"
> -
> -do_install_append() {
> -    install -d ${D}${sysconfdir}/default
> -    install -m 0644 ${WORKDIR}/busybox-syslog.default =
${D}${sysconfdir}/default/busybox-syslog
> -}
> -
> -FILES_${PN}-syslog +=3D "${sysconfdir}/default/busybox-syslog"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


