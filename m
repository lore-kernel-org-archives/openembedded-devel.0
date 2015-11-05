Return-Path: <danismostlikely@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id BF48C76230
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 04:17:26 +0000 (UTC)
Received: by ykba4 with SMTP id a4so111302725ykb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 20:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=OMpmoe7jedTlZ9ZSdoX2aWPiISUrk0j3ILElvHcZR6U=;
	b=JISefvZuBRrGJFDyCM+zb5NFLw17nzbvaLwCkNC4/LzatyL98XYBv0cgwzr2uVjUat
	7VdrNcwWgl5pUlyyS9TE0NjRpLhiedRjdE/IHhPsAalKU4NW6tHF369fSi96HpO7+091
	xkstAbpnYI3Nmje3Mzyqx4z/4pFA7oArPEXIlmhcysCxKfYYG0SNe/httK3osTwe4W9T
	doXCyL6mHchoHOrIc/9iDyI1VKbvPTVU/dI2fZvd18tqB4a7afXSxj5YAonjHvJXSdN1
	GxFmmhanrE6OD+90ZW/lO6BqXldG/hfUoe9TE3sS0hOBvoGzJoaLMKKjZeOI1DpKqmRQ
	Vfig==
MIME-Version: 1.0
X-Received: by 10.31.154.138 with SMTP id c132mr5102498vke.96.1446697047135;
	Wed, 04 Nov 2015 20:17:27 -0800 (PST)
Received: by 10.31.237.197 with HTTP; Wed, 4 Nov 2015 20:17:27 -0800 (PST)
In-Reply-To: <255DA978-17A8-4A1C-8E1E-D72360AD923C@gmail.com>
References: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
	<1446695892-21744-2-git-send-email-danismostlikely@gmail.com>
	<255DA978-17A8-4A1C-8E1E-D72360AD923C@gmail.com>
Date: Wed, 4 Nov 2015 22:17:27 -0600
Message-ID: <CACS+7ZTsUG1tMs-b+r_2ZH6U0UsqhE9rxM2G4XK8GZLBY-sT8Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] gateone: update to latest git
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
X-List-Received-Date: Thu, 05 Nov 2015 04:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 November 2015 at 22:03, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Nov 4, 2015, at 7:58 PM, Dan McGregor <danismostlikely@gmail.com> wro=
te:
>>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> This version works with pyton-tornado 4.2 as currently distributed
>> with OE.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>> ...on.py-Hack-around-broken-gethostname-thin.patch | 26 ----------------=
------
>> .../recipes-connectivity/gateone/gateone/80oe.conf |  1 +
>> .../recipes-connectivity/gateone/gateone_git.bb    |  7 +++---
>> 3 files changed, 5 insertions(+), 29 deletions(-)
>> delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/0001=
-configuration.py-Hack-around-broken-gethostname-thin.patch
>>
>> diff --git a/meta-python/recipes-connectivity/gateone/gateone/0001-confi=
guration.py-Hack-around-broken-gethostname-thin.patch b/meta-python/recipes=
-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-geth=
ostname-thin.patch
>> deleted file mode 100644
>> index 5f5fa91..0000000
>> --- a/meta-python/recipes-connectivity/gateone/gateone/0001-configuratio=
n.py-Hack-around-broken-gethostname-thin.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From d811d3bdf06d78c93c48bef762c19c392c879077 Mon Sep 17 00:00:00 2001
>> -From: Koen Kooi <koen@dominion.thruhere.net>
>> -Date: Tue, 26 Nov 2013 15:54:10 +0100
>> -Subject: [PATCH] configuration.py: Hack around broken gethostname thing=
y
>> -
>> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ----
>> - gateone/core/configuration.py | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/gateone/core/configuration.py b/gateone/core/configuration=
.py
>> -index da41cbd..d1c8222 100644
>> ---- a/gateone/core/configuration.py
>> -+++ b/gateone/core/configuration.py
>> -@@ -162,7 +162,7 @@ def define_options(installed=3DTrue):
>> -     ]
>> -     # Used both http and https above to demonstrate that both are acce=
ptable
>> -     try:
>> --        additional_origins =3D socket.gethostbyname_ex(socket.gethostn=
ame())
>> -+        additional_origins =3D [] # additional_origins =3D socket.geth=
ostbyname_ex(socket.gethostname())
>> -     except socket.gaierror:
>> -         # Couldn't get any IPs from the hostname
>> -         additional_origins =3D []
>> ---
>> -1.8.4.2
>> -
>> diff --git a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf =
b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
>> index cde98bc..09cdbfa 100644
>> --- a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
>> +++ b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
>> @@ -2,6 +2,7 @@
>> {
>>     "*": {
>>         "gateone": { // These settings apply to all of Gate One
>> +            "log_file_prefix": "/var/log/gateone.log", // default would=
 be /var/log/gateone/gateone.log
>
> Can this use ${localstatedir} some how instead of /var

I think so. That's what sed is for.

>
>>             "log_file_max_size": 5242880, // 5 megabyte logs for OE by d=
efault (default would normally be 100Mb)
>>             "log_file_num_backups": 2, // Default is normally 10
>>             "origins": ["*"], // Every device has a unique origin
>> diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/m=
eta-python/recipes-connectivity/gateone/gateone_git.bb
>> index 7eae12a..80bbae8 100644
>> --- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
>> +++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
>> @@ -4,9 +4,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D834cbc699=
5db88433db17cdf8953a428"
>> HOMEPAGE =3D "http://liftoffsoftware.com/Products/GateOne"
>>
>> PV =3D =E2=80=9C1.2"
>
> Should this have SRCPV in PV

Yes, this is not a release.

>
>> -SRCREV =3D "1528d324088fc1c180b7fdf50f5b5c1af057eef6"
>> -SRC_URI =3D "git://github.com/liftoff/GateOne.git \
>> -           file://0001-configuration.py-Hack-around-broken-gethostname-=
thin.patch \
>> +SRCREV =3D "17fbf85753f4d9c317950a3ef14f811188a51cb7"
>> +SRC_URI =3D "git://github.com/liftoff/GateOne.git;branch=3Dmaster \
>>            file://gateone-avahi.service \
>>            file://80oe.conf \
>>            file://gateone.service \
>> @@ -49,6 +48,7 @@ FILES_${PN} =3D "${localstatedir}/lib ${bindir} ${base=
_libdir} ${sysconfdir} ${PYT
>> RDEPENDS_${PN} =3D "mime-support \
>>                   openssh-ssh \
>>                   python-compression \
>> +                  python-contextlib \
>>                   python-crypt \
>>                   python-datetime \
>>                   python-email \
>> @@ -76,6 +76,7 @@ RDEPENDS_${PN} =3D "mime-support \
>>                   python-tornado \
>>                   python-unixadmin \
>>                   python-xml \
>> +                  python-html5lib \
>>                   bash \
>> "
>>
>> --
>> 2.6.2.11.gb05c2f9
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

