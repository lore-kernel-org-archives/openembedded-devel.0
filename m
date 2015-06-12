Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A4B7775932
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 20:42:39 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so18020133igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=370O/TaJS8PvXHvV63N1eMPneJbRu6jKNdKizh7v7M0=;
	b=qpKl9Ltk+4JBXqGN4GKZeGuoXdpZ4BHJEBge42RX9veI2Kg2o6+kNER9Xo9eipr2dJ
	LL4NEvYORxRi6VhzeE1yil9y2S6IZss4tULgjXEHNVBQGGsMwNJjkjgp1/fVPdvoRD52
	kjDk+0B0loJSCvD7jS1goIrHHOU0mh+2dWOF+vOJ/8FQDg6DXFNI5m9CtSFv8gU6kQVS
	7oz+63iKvW79sgzZR96sDZFVGcYOk3929EBnVINZXC6Y7LYq2jGk2t0IUCJWCddiI/Rc
	JYSoGB5dH1AyJBCVXjpdOsBmrZorT+hTMTiDjMoLPiaY9sEntEb9KgqU0Sh5fs8FUcmN
	55fA==
X-Received: by 10.43.96.5 with SMTP id ce5mr18246776icc.96.1434141761020; Fri,
	12 Jun 2015 13:42:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.78 with HTTP; Fri, 12 Jun 2015 13:42:10 -0700 (PDT)
In-Reply-To: <CAK8F28m=ZQLXUgNHZ8P8Fm6Bt55KApbO8YETf2AjyQzafcHnTQ@mail.gmail.com>
References: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
	<CAK8F28m=ZQLXUgNHZ8P8Fm6Bt55KApbO8YETf2AjyQzafcHnTQ@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 12 Jun 2015 13:42:10 -0700
Message-ID: <CAK8F28=gpkoBJcwdPjwyG8VfSsMt60q5VGdFses+HNbVmv40JA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH V2 2/8] polkit-gnome: Upgrade 0.102 -> 0.105
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
X-List-Received-Date: Fri, 12 Jun 2015 20:42:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Any insights as to what patches get backported?

Sorry for re-pinging---I'm less concerned with this exact backport and
most interested in understanding the process.

--Ash

On Fri, Jun 5, 2015 at 8:54 AM, Ash Charles <ashcharles@gmail.com> wrote:
> Hi,
>
> Can this patch and "gdm: Whitelist it" be applied to the fido branch?
>
> Meta-question: Is this an appropriate request? What patches are
> considered for backport?  In this case, I'm updating the
> meta-gumstix-extras layer to Fido which depends on meta-openembedded
> and, as it happens, these two patches.  I can readily carry such fixes
> as updated recipes/bbappends in my layer until I next up-rev if these
> aren't suitable for backporting---just looking to understand the
> process :).
>
> Thanks,
> Ash
>
> On Tue, May 5, 2015 at 8:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> add missing dep on gtk+3
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch  | 12 ++++++++++++
>>  .../{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb}       | 14 ++++++++------
>>  2 files changed, 20 insertions(+), 6 deletions(-)
>>  create mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
>>  rename meta-oe/recipes-extended/polkit/{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb} (62%)
>>
>> diff --git a/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
>> new file mode 100644
>> index 0000000..4b6ad75
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
>> @@ -0,0 +1,12 @@
>> +--- polkit-gnome-0.105/configure.ac.org        2015-05-04 22:33:03.925977953 -0700
>> ++++ polkit-gnome-0.105/configure.ac    2015-05-04 22:33:16.862288030 -0700
>> +@@ -120,6 +120,9 @@
>> + # Check for required packages
>> + # ***************************
>> +
>> ++# check for gtk-doc
>> ++GTK_DOC_CHECK([1.14],[--flavour no-tmpl])
>> ++
>> + POLKIT_AGENT_REQUIRED=0.97
>> + POLKIT_GOBJECT_REQUIRED=0.97
>> + GTK_REQUIRED=3.0.0
>> diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
>> similarity index 62%
>> rename from meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
>> rename to meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
>> index f5480e7..be33908 100644
>> --- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
>> +++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
>> @@ -7,22 +7,24 @@ LICENSE = "LGPLv2+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
>>                      file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
>>
>> -SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
>> +SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${PV}.tar.xz \
>> +           file://gtk-doc-check.patch \
>>  "
>> +SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
>> +SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
>>
>> -PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
>> -
>> -PR = "r2"
>> +#PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
>>
>>  EXTRA_OECONF = "\
>>      --disable-examples \
>>      --disable-introspection \
>> +    --disable-static \
>>  "
>>
>> +DEPENDS += "gtk+3"
>> +
>>  inherit autotools gtk-doc pkgconfig
>>
>>  FILES_${PN} += " ${datadir}/dbus-1 \
>>                   ${datadir}/PolicyKit \
>>  "
>> -SRC_URI[md5sum] = "f6b485ffd7bd605af815fd2747180481"
>> -SRC_URI[sha256sum] = "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b14b40f8ef7107d11"
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

