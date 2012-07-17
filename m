Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sr3jF-0007MZ-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 11:06:01 +0200
Received: by ghbz2 with SMTP id z2so114754ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yb6UnSVt4BKGKEY2vI8dQneJ/mieUk+1G5DTY21osHA=;
	b=ALrJcrdeizaak/g7VMvt777Bo2F7Pf9WzoZv3UZ4N2fATi7aLjI4aSmvWXiOfM8faN
	jTPjEPJ6oJqWMHGbB+p+4eVtYjbvqehvbtIDt5I5b5/FMiylYqhdFaENcq7KeTYQoIUL
	dv4PTrCdk8pO/d8hsQRu/GkfKplgmEaVNYfKM5IkCsYT+FrH0ZCW5G6hzEwKCiEQYrBo
	/TFzSrs/QHFtn0hQQ0DSMYI5STT/7f38Hii1iws2IM4SLw3P76i/6ddsV762dP4Q4Qpd
	ciFOJfSWWnDvd2RzU6iDP5CDc040eXATlVFntT0krWCuZJIPPYYZG7YNfBjdybYT/UTZ
	QhBg==
MIME-Version: 1.0
Received: by 10.50.6.230 with SMTP id e6mr651490iga.47.1342515281520; Tue, 17
	Jul 2012 01:54:41 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Tue, 17 Jul 2012 01:54:41 -0700 (PDT)
In-Reply-To: <20120716182528.GO3729@jama.jama.net>
References: <20120716074256.12AC410334@opal>
	<20120716182528.GO3729@jama.jama.net>
Date: Tue, 17 Jul 2012 10:54:41 +0200
Message-ID: <CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBzeXN0ZW1kLmJiY2xhc3M6IGFkZCAqLXN5c3RlbWQgcGFja2FnZXMgdG8gUlJFQ09NTUVORFM=?=
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
X-List-Received-Date: Tue, 17 Jul 2012 09:06:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 8:25 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.org wrote:
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: 264e5a44e1111f939b43c11bb9514a0b435918db
>> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommi=
t;h=3D264e5a44e1111f939b43c11bb9514a0b435918db
>>
>> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
>> Date:   Wed Jul 11 20:46:07 2012 +0200
>>
>> systemd.bbclass: add *-systemd packages to RRECOMMENDS
>
> This is a bit unfortunate e.g. when busybox is used in small chroot
> image.
> busybox pulls busybox-syslog, which now adds busybox-syslog-systemd and
> it ends with systemd/dbus/udev/shadow/pam/util-linux/kmod being added to =
previously small image, see:
>
> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdiff;f=3Dima=
ges/crespo/eglibc/chroot-image/installed-package-names.txt;h=3D07187b9e51bd=
0199910152a8019d117ed41cc2db;hp=3D8f401e657dd449e30fe8183dc86a791d09614d9f;=
hb=3Dac04304bb15221b49e5af6838068f158e7d628ed;hpb=3D4c0555e7fa689c3c20902c7=
fc1ec8e525769723f
>
> So it could be solved by image specific BAD_RECOMMENDATIONs or something
> like that, but by default it doesn't work very well in this use-case.
>
> Cheers,
>
I think the image specific BAD_RECOMMENDATION is not that easy to
implement and to handle by user. I am 'dreaming' of of a distro layer
blacklist. So in your case the distro could mask out whole
meta-systemd. Could you live with that?

Andreas


