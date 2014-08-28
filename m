Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18FB965D34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 08:04:17 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so369961wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 01:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=VqmJaLspcy1JnWkEpxz3avjyifCka2vjR/5fifk/P1M=;
	b=fU5Z7y1/5CrrufvbuuUvvkeC4CHAG63xiNRvGbyKPdvBcUfI1tbKN5LrJa0aWDnvyv
	gj2ATcr1pMBpcXFjQcSNaj0gHftDXO1VhdVRkv8mCSrS1hw8YhzxlCJwXFToaCH0GzhO
	2+cing37lj01WtGcBfOLCL5c5mT4tupdPl6qN9QPtkLO1lmpjDqvQRzkEhTKxc+c1Gu3
	uA0Wr+a0hfPRI0WMg4mccWqVMpNtOWcOG0E4XWR5dz1W1Emp6XVTbv4P3h9c3FTG1n9J
	/DQTbfcEwlJ/sVZw/NR7qh5we6qDD0UqxtDOO4wwhF48RXNU941u4nrQGgWkaoAsRggi
	rW5w==
X-Gm-Message-State: ALoCoQmQSzvXSVCRcpgx9MaX+GFL1/NPc2rMQ2r6/fEH94dOrFZ0mfhM2orBSWq4+flz6qYw8Cx4
X-Received: by 10.180.19.97 with SMTP id d1mr3965939wie.19.1409213058132;
	Thu, 28 Aug 2014 01:04:18 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id ua8sm7890087wjc.7.2014.08.28.01.04.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 01:04:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140828072124.GD13139@haswell>
Date: Thu, 28 Aug 2014 10:04:15 +0200
Message-Id: <A25237C5-BE05-455D-B32E-B66F6D4AE693@dominion.thruhere.net>
References: <1409124541-12549-1-git-send-email-koen@dominion.thruhere.net>
	<20140828072124.GD13139@haswell>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH 1/2] dracut: add 'getopt' to RDEPENDS
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
X-List-Received-Date: Thu, 28 Aug 2014 08:04:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 aug. 2014, om 09:21 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> On 14-08-27 09:29:00, Koen Kooi wrote:
>> This drags in full util-linux, a future TODO is to split up =
util-linux
>> completely in OE-core.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb =
b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> index 945ba0f..9909a6d 100644
>> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> @@ -33,7 +33,8 @@ FILES_${PN} +=3D "${datadir}/bash-completion \
>>                 ${libdir}/kernel \
>>                "
>>=20
>> -RDEPENDS_${PN} =3D "systemd findutils cpio util-linux-blkid bash =
ldd"
>> +# 'getopt' is in the util-linux main package
>> +RDEPENDS_${PN} =3D "systemd findutils cpio util-linux-blkid =
util-linux bash ldd"
>=20
> Its dragging in bash too, does it really need it ?  can it be enhanced
> to support busybox/ash

It might be, I haven't looked at it yet.

regards,

Koen=

