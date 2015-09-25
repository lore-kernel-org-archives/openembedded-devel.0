Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 567CA76E04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 06:33:08 +0000 (UTC)
Received: by iofb144 with SMTP id b144so9105799iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 23:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yC8ZnRb145GBQ6iPQGs+/Ws31hswlPFYoCyr6WAFpkA=;
	b=pp7j0dIjeS3CV6BoDl5iABp+FYHz2uWvaOy2uPA2X6wq/CpI/DdBVb07jV/z3dSjge
	J/PgKuvA7tzu1oVjO85NU3DGDidCp9lpbWYou9lpx6FB4rGs9ls2TvEjvwh7Dhx64sk3
	0iUfCXmPssdU4FsMNWfRg6fgGzUB2GmJlfd5Cqgwi12SL9WsS+C4E3sVhuc7ShIqlEMf
	Yva0FapQVtJDrah9LOuNu0a2RyM73AMDr2i1VxUtE24O4kdXJQO9Fx2Lm5AMjHGGep9b
	CMg6Oc/FHUhnU24tg094Gldik+ViJghIIosPbGJRnGSFUr3+FzyUyC9bYbMeXWcqp0HF
	iARQ==
MIME-Version: 1.0
X-Received: by 10.107.10.79 with SMTP id u76mr4298554ioi.99.1443162788803;
	Thu, 24 Sep 2015 23:33:08 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 24 Sep 2015 23:33:08 -0700 (PDT)
In-Reply-To: <20150925062547.GB2397@jama>
References: <5603FD45.5030308@topic.nl>
	<CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
	<CALbNGRR9eL001Y7UByvKuoeQuOr=93OHX_WxjD2NHO5WKNmg-w@mail.gmail.com>
	<20150925062547.GB2397@jama>
Date: Fri, 25 Sep 2015 06:33:08 +0000
Message-ID: <CALbNGRRvFMPepavZyd_oOKuy8iUr06FwN8MXLPzX-9st6TcYxA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: "libgudev" fails to build with current master
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
X-List-Received-Date: Fri, 25 Sep 2015 06:33:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2015 at 6:25 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Sep 25, 2015 at 01:22:37AM +0200, Andreas M=C3=BCller wrote:
>> On Thu, Sep 24, 2015 at 6:45 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Thu, Sep 24, 2015 at 3:40 PM, Mike Looijmans <mike.looijmans@topic.=
nl> wrote:
>> >> | checking for LIBUDEV... no
>> >> | configure: error: Package requirements (libudev >=3D 199) were not =
met:
>> >> |
>> >> | Requested 'libudev >=3D 199' but version of libudev is 182
>> >> |
>> >> ...
>> >>
>> >> ERROR: Task 5548
>> >> (/.../meta-oe/meta-oe/recipes-gnome/libgudev/libgudev_230.bb, do_conf=
igure)
>> >> failed with exit code '1'
>> >>
>> > Which init system are you using - I guess not systemd
>> >
>> Let's assume it is not systemd. Could you try attached  0001.. for
>> oe-core and 0002.. foe meta-oe and give feedback. I tested these for
>> systemd distro without new issues.
>>
>> Andreas
>
>> From 384c763f66d5f49b967253e8e5d272822552a524 Mon Sep 17 00:00:00 2001
>> From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>> Date: Fri, 25 Sep 2015 01:04:31 +0200
>> Subject: [PATCH] udev: add PROVIDES =3D "libgudev"
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=3DUTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> With the last update of systemd libgudev was splitted out of systemd. To=
 make
>> packages depending on libgudev happy, a recipe building libgudev was cre=
ated in
>> meta-oe and the dependencies were modified from udev to libgudev.
>>
>> This works fine for distros using systemd as init system, but distros no=
t using
>> build udev which provides libgudev.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta/recipes-core/udev/udev.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/ud=
ev.inc
>> index a00dad5..c378ae3 100644
>> --- a/meta/recipes-core/udev/udev.inc
>> +++ b/meta/recipes-core/udev/udev.inc
>> @@ -15,6 +15,8 @@ LDFLAGS +=3D "-lrt"
>>  DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-na=
tive libxslt-native util-linux"
>>  RPROVIDES_${PN} =3D "hotplug"
>>
>> +PROVIDES =3D "libgudev"
>> +
>>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.=
tar.gz \
>>             file://0001-Fixing-keyboard_force_release.sh-shell-script-pa=
th.patch \
>>             file://avoid-mouse-autosuspend.patch \
>> --
>> 2.1.0
>>
>
>> From e83235a777880c343fce9f286f50678b237620dd Mon Sep 17 00:00:00 2001
>> From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>> Date: Fri, 25 Sep 2015 01:17:01 +0200
>> Subject: [PATCH] libgudev: skip recipe for distros not using systemd as =
init
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=3DUTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> for those systems udev provides libgudev
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-gnome/libgudev/libgudev_230.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb b/meta-oe/re=
cipes-gnome/libgudev/libgudev_230.bb
>> index 39fc1c4..9e457d2 100644
>> --- a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
>> +++ b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
>> @@ -11,3 +11,9 @@ LICENSE =3D "LGPLv2.1"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364=
516c"
>>
>>  inherit gnomebase
>> +
>> +# in non systemd distros udev builds libgudev
>> +python () {
>> +    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False=
, d):
>> +        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
>> +}
>
> Cannot we use REQUIRED_DISTRO_FEATURES + inherit distro_features_check
> for this one?
>
For some reason I thought REQUIRED_DISTRO_FEATURES would cause an
error message - but thinking over this is not true. So yes:
REQUIRED_DISTRO_FEATURES seems the better solution.

Andreas

