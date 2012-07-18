Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SrVIv-00061o-9g
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 16:32:41 +0200
Received: by yhjj56 with SMTP id j56so1484935yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dMdIDjP8nkmaheUch78rNvRQGSr8zL+b2MKxgLI9D0o=;
	b=PxBUv2tpDzlEJ+O5axMAcWKTzDN7EJOZtTlwLb63pvnnJ97tIBmLfWc/+g18CTaz2J
	T0FEC7qD+eZzkpvepymfq6xQgooIMFJJwxIeA0DrQIn4TreL9fWPNmhDjam8R8SiHxKI
	zi4UtQbVISTs7ZO8SzaOaMULaBIO4FaDy8h9KyhNpbUIxFqPWvSDS/rBO421yA9n9RC+
	dAcvK6vvBxa/TPO0T3eAOQvEAJJKgPqO3zzqKOQyCaKnWGxIlAid16Yfir7/Krg9xPQH
	nAZH4c0Fvedx7mEKXdBID5no0lSRAN3AUqUtMoT6g7q/yWwQRq6nyfjLcuMQWaHoyNil
	0dxw==
MIME-Version: 1.0
Received: by 10.50.181.232 with SMTP id dz8mr2213292igc.36.1342621279829; Wed,
	18 Jul 2012 07:21:19 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Wed, 18 Jul 2012 07:21:19 -0700 (PDT)
In-Reply-To: <20120718123125.GM22569@jama.jama.net>
References: <20120716074256.12AC410334@opal>
	<20120716182528.GO3729@jama.jama.net>
	<CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
	<20120717091818.GA3390@jama.jama.net>
	<ju3auv$81f$1@dough.gmane.org>
	<20120718123125.GM22569@jama.jama.net>
Date: Wed, 18 Jul 2012 16:21:19 +0200
Message-ID: <CALbNGRSEPoHdg4NfsDEOt32SqDwzmphUf1V7sQrqAQwap9tJkQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Jul 2012 14:32:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 2:31 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Jul 17, 2012 at 11:23:43AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 17-07-12 11:18, Martin Jansa schreef:
>> > On Tue, Jul 17, 2012 at 10:54:41AM +0200, Andreas M=FCller wrote:
>> >> On Mon, Jul 16, 2012 at 8:25 PM, Martin Jansa <martin.jansa@gmail.com=
>
>> >> wrote:
>> >>> On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.org
>> >>> wrote:
>> >>>> Module: meta-openembedded.git Branch: master Commit:
>> >>>> 264e5a44e1111f939b43c11bb9514a0b435918db URL:
>> >>>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=
=3D264e5a44e1111f939b43c11bb9514a0b435918db
>> >>>>
>> >>>>
>> >>>>
>> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
>> >>>> Date:   Wed Jul 11 20:46:07 2012 +0200
>> >>>>
>> >>>> systemd.bbclass: add *-systemd packages to RRECOMMENDS
>> >>>
>> >>> This is a bit unfortunate e.g. when busybox is used in small chroot
>> >>> image. busybox pulls busybox-syslog, which now adds
>> >>> busybox-syslog-systemd and it ends with
>> >>> systemd/dbus/udev/shadow/pam/util-linux/kmod being added to
>> >>> previously small image, see:
>> >>>
>> >>> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdiff;f=
=3Dimages/crespo/eglibc/chroot-image/installed-package-names.txt;h=3D07187b=
9e51bd0199910152a8019d117ed41cc2db;hp=3D8f401e657dd449e30fe8183dc86a791d096=
14d9f;hb=3Dac04304bb15221b49e5af6838068f158e7d628ed;hpb=3D4c0555e7fa689c3c2=
0902c7fc1ec8e525769723f
>> >>>
>> >>>
>> >>>
>> So it could be solved by image specific BAD_RECOMMENDATIONs or something
>> >>> like that, but by default it doesn't work very well in this
>> >>> use-case.
>> >>>
>> >>> Cheers,
>> >>>
>> >> I think the image specific BAD_RECOMMENDATION is not that easy to
>> >> implement and to handle by user. I am 'dreaming' of of a distro layer
>> >> blacklist. So in your case the distro could mask out whole
>> >> meta-systemd. Could you live with that?
>> >
>> > No, as the same distro is used to create full images with systemd and
>> > this chroot-image is just small initramfs for kernel (where
>> > systemd+friends is really not needed/expected).
>>
>> I think the easiest solution is to remove 'inherit systemd' from busybox=
.
>
> I have similar problem with gpsd/fso-gpsd and gpsd-systemd too.. On some
> devices I would like to include gpsd-systemd in image (e.g. with
> systemd-machine-units or through some machine specific task), but on
> others (e.g. om-gta02) I need only fso-gpsd.service to provide gpsd
> (gpsd-systemd locks gpsd port).
>
> So maybe I didn't understand Andreas right.. I can put all *-systemd
> packages to BAD_RECOMMENDATIONs and then include only needed in
> tasks/images like I did before..
>
Martin,

Correct me if I go wrong but I think you are mixing up two issues:

issue 1. busybox: automatic redepending drags in things you don't want.
issue 2. gpsd: If I understand you right: there are two services
shipped and auto-enabled and that is leading to a conflict.

My suggestions:
issue 1. Similar as Koen suggested but I would add an additional
variable - something like SYSTEMD_NO_RRECOMMENDS_{PN}. If this is set
to "1", the automatic rrecommends are not appended.
issue 2. The conflict could be resolved by SYSTEMD_AUTO_ENABLE =3D "disable=
".

Andreas


