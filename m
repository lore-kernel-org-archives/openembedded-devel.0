Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D21E87095E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 12:52:31 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so4352307wgg.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 05:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=HfuMzVPC9hhr7pvz/Do9nAzzfwV02gL1UTGOuNTrbPA=;
	b=mmL22cD0epErfBsQCv4czoBmZ7HhaJNR7XA20YFYLT2W0nEsWgI7K4P5mpPSUBq8Sk
	coLwMF8koTs2I/lFPnrYyw5cjm+HKew0dZRjAKzxaSU/r3kn8RvLfNmspAqrqRLq3ZNT
	noBSUUDnsMH2gwG0/lP1YJHusSKJKacakNf68xS4TvsE9ZCZxzGHNTR4yJZHdXYnWASl
	1luEvZ8y6Vpeu1F5FrIhztMf+8zwxXR4pjzQz4TcY8OAXDvBuqOfizu1jORNgaSzaLfa
	WIPo0/Vm/v9OWOvroLvVltHKU/2mA/bsCO6Y29btimJ0s52Tob9CTMgOr122vC5dOy27
	McQQ==
X-Gm-Message-State: ALoCoQnH/xKZkrBJ7zANefga67EpHesPI1pLtQuq9a2Ar81X3ypocI4qJE53bq0bubRlOVXYkeg7
X-Received: by 10.194.202.165 with SMTP id kj5mr7861359wjc.50.1406897552416;
	Fri, 01 Aug 2014 05:52:32 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id q2sm8469716wia.19.2014.08.01.05.52.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 05:52:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140801102339.GB16445@jama>
Date: Fri, 1 Aug 2014 14:52:28 +0200
Message-Id: <CF1A2608-1B45-4D54-9E64-5FA117A5E807@dominion.thruhere.net>
References: <1406887022-18508-1-git-send-email-koen@dominion.thruhere.net>
	<20140801102339.GB16445@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH] libgnomekbd: fix S!=B
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
X-List-Received-Date: Fri, 01 Aug 2014 12:52:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2014, om 12:23 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Fri, Aug 01, 2014 at 11:57:02AM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb | 4 +---
>> 1 file changed, 1 insertion(+), 3 deletions(-)
>>=20
>> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb =
b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
>> index e9ca2a7..0381192 100644
>> --- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
>> +++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
>> @@ -6,9 +6,7 @@ SECTION =3D "x11/gnome/libs"
>>=20
>> DEPENDS =3D "gconf gtk+ glib-2.0 libxklavier"
>=20
> Please test these 2 as well:
>=20
> =
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.=
bb:PNBLACKLIST[gnome-control-center] =3D "BROKEN: depends on broken =
libgnomekbd"
> =
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.=
1.bb:PNBLACKLIST[gnome-settings-daemon] =3D "BROKEN: depends on broken =
libgnomekbd"

I have a few more patches to fix up development-gnome-image for =
angstrom, I'll send those later today. In other news, having =
/usr/bin/freetype-config on your buildhost masks freetype errors :(=

