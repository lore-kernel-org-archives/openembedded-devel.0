Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 52D916FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 02:35:43 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id qg3so1918750obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 18:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=dgkYoDeTwnlijiOLJK8t+aKUOrMqzWdFThr4bvRMCKI=;
	b=Huf2EIIFFzfKbhTyqxt0bZrjbadqgmp5Hzo5WS2a2+wu/gMt4EfknZXoUdjqmYcRp7
	kLtU0/r187MwWFuip69Id7/QovrWKxuDoB3cxOQxWNdtuM3wR4nusuMXCu3gf/bHuadL
	rkW8dyPK2E9Ogv/cIGp/hKfjmBj0zSr04cXShFatK7a26EQp7z4UKWIz20O8UC3HSByq
	uzpo6GyH4TvrgP+dIG3fkd/U2sGpWQ9BkQRi8WtwcE2/bkbmfsKVEByCnJ5sv2P/7mQU
	skBpfltrzOODymsV3SsMtVs9WZMYNzKVQZmFdTDLaLWVUfm3f9H6mp/GJ386MxUtJYzJ
	i+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=dgkYoDeTwnlijiOLJK8t+aKUOrMqzWdFThr4bvRMCKI=;
	b=VA7GozWs/f1WaVxivdDGSF6LGdghj5nqXG5p9TXRdBS2ClsoKyNpwZVLwEY0EQ6jSW
	8GalkHB2bbFRGXCS8sy/qI8BO/AbF+dQP/0ZXY0m4YlDSXAUyTrCzdTnjQ1LkKrnlug8
	OTpnJkD7ngZLiWOW2QtytSRlBMNONwscm7pMDugjC5OjqKZabEkYawAEsuS8SFyvuynV
	SckCuwvjZK5r+oLTwZNvzYjQQOPJNunz8xLp4LDWap7B58WyXsZiFe9Lq4wOluRdNxbD
	30fNCZtgbgbdtXGLm4QxF9ggUVT29lPOXZH9CMU85PiGnXkmFsifbGZaelDIuirM5Q59
	nhPw==
X-Gm-Message-State: AD7BkJL4gVJlg1fUwWhJcRyWK4NllQxWRjJ5YuDKB7Dw3ZwKQYo33zF2KugquupXz+AdgkDaL43UIDpHKriPTA==
MIME-Version: 1.0
X-Received: by 10.182.73.225 with SMTP id o1mr19979662obv.80.1456886143837;
	Tue, 01 Mar 2016 18:35:43 -0800 (PST)
Received: by 10.182.174.8 with HTTP; Tue, 1 Mar 2016 18:35:43 -0800 (PST)
In-Reply-To: <145451D4E6785E4DA4DFA353A58CB7B2F7E579FF@OLAWPA-EXMB03.ad.garmin.com>
References: <1452726499-3950-1-git-send-email-nate.karstens@garmin.com>
	<20160127141549.GG2574@jama>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E579FF@OLAWPA-EXMB03.ad.garmin.com>
Date: Tue, 1 Mar 2016 18:35:43 -0800
Message-ID: <CAOLEWZXey6YxbamMHz_+ZEjCqPBhwUrjn6_SyiegVj=p5rCKhA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v4] dhcpcd: add recipe for dhcpcd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2016 02:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sorry, in answer to previous question I'm fine with Roy's dhcp client
package (if I still need wifi-radar I'll port the stupid thing to work
with it).

Steve

On Thu, Jan 28, 2016 at 5:21 PM, Karstens, Nate
<Nate.Karstens@garmin.com> wrote:
> Martin,
>
> It looks like the recipe that was merged in was for 6.10.0, but the warni=
ng is for version 6.9.4. Is it an issue with the 6.10.0 version as well?
>
> Nate
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, January 27, 2016 8:16 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH v4] dhcpcd: add recipe for dhcp=
cd
>
> On Wed, Jan 13, 2016 at 05:08:19PM -0600, Nate Karstens wrote:
>> Adds a new recipe for dhcpcd version 6.10.0.
>
> It was merged, but there is QA warning:
> dhcpcd-6.9.4: dhcpcd rdepends on libudev, but it isn't a build dependency=
? [build-deps]
>
> Please send follow-up patch to fix this.
>
>> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
>> ---
>>  .../recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb   | 22 +++++++++++++++=
+++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6=
.10.0.bb
>>
>> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.b=
b b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
>> new file mode 100644
>> index 0000000..058a932
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
>> @@ -0,0 +1,22 @@
>> +SECTION =3D "console/network"
>> +SUMMARY =3D "dhcpcd - a DHCP client"
>> +DESCRIPTION =3D "dhcpcd runs on your machine and silently configures yo=
ur computer to work on the attached networks without trouble and mostly wit=
hout configuration."
>> +
>> +HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
>> +
>> +LICENSE =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D "file://dhcpcd.c;endline=3D26;md5=3D77c40d671aff80=
4ca91ea99556da8e9b"
>> +
>> +SRC_URI =3D "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.=
xz"
>> +
>> +SRC_URI[md5sum] =3D "f39c5773e7c4bea352d9fb7367c899de"
>> +SRC_URI[sha256sum] =3D "ab56af9b2e86913c55a965cb0f835e87749df78318564ac=
f90d5d698f413ad35"
>> +
>> +inherit autotools
>> +
>> +B =3D "${S}"
>> +EXTRA_OECONF =3D "--enable-ipv4 --enable-ipv6"
>> +
>> +FILES_${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"
>> +
>> +RDEPENDS_${PN} =3D "udev"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> ________________________________
>
> CONFIDENTIALITY NOTICE: This email and any attachments are for the sole u=
se of the intended recipient(s) and contain information that may be confide=
ntial and/or legally privileged. If you have received this email in error, =
please notify the sender by reply email and delete the message. Any disclos=
ure, copying, distribution or use of this communication (including attachme=
nts) by someone other than the intended recipient is prohibited. Thank you.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

