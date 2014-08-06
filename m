Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7917089E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:56:36 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so3127186wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 05:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Dr6btGFTEYSWbOP9YxpCnYkXsogpRCzCsHEVVR5TA0M=;
	b=jIb47WqmsU0tcBnBLbpKN6gIN81iyqbVJ1aiiETiCSlb6wjz0S2NqgrhIkpfnFBwjV
	PevFGE0r3mMsu4hgMK1cC2YBGi+st3eg5HP8rf1LFSCWs9bPRAmU28p10cLgUuHIrPB7
	KvRHfcvJ9reo5gLbmfB03xMIU0mPJWOzJSSsXVa1e2YI9Kq71yW9sWHq7m5SIzTcplJR
	XUi7DAzVX1wCn5xrxbJpnRsUXJ7qjTm6nBa/MOn5aNJdQDATqTqLlSC+fnyzNJdjxkus
	cgWXqgwrdNkhe/SzvN0HgM4Y2UuS50s3JDxrmG5xidHPd0LKWiP6w5BB3KNGuZTV4fAS
	10KA==
X-Gm-Message-State: ALoCoQmCxMeNFHpR77m0G108CFXv+a9tN4G23TBcJ/GlpWBNh/fYIOYjkeiaIrWAvcuA0a5vc4l6
X-Received: by 10.194.87.102 with SMTP id w6mr15517734wjz.24.1407329797072;
	Wed, 06 Aug 2014 05:56:37 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a410:be81:fc17:ae6f?
	([2001:610:612:0:a410:be81:fc17:ae6f])
	by mx.google.com with ESMTPSA id
	eb4sm18124516wic.16.2014.08.06.05.56.35 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Aug 2014 05:56:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140804161438.GC2465@jama>
Date: Wed, 6 Aug 2014 14:56:34 +0200
Message-Id: <A1740C8A-81B6-4FAB-8971-20F9D486DD09@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
	<1406900096-31368-7-git-send-email-koen@dominion.thruhere.net>
	<20140804161438.GC2465@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH 07/10] abiword: remove blacklist, libgsf and sv have been fixed
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
X-List-Received-Date: Wed, 06 Aug 2014 12:56:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 aug. 2014, om 18:14 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Fri, Aug 01, 2014 at 03:34:53PM +0200, Koen Kooi wrote:
>> Also disable collab service due to gnutls build errors.
>=20
> abiword also depends on libwmf-native which is still broken
>=20
> | checking for XML_ParserFree in -lexpat... yes
> | checking for freetype-config... =
/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/f=
reetype-config
> | checking for FT_Init_FreeType in -lfreetype... yes
> | checking ft2build.h usability... no
> | checking ft2build.h presence... no
> | checking for ft2build.h... no
> | configure: error: * * * freetype(2) is required * * *
> | Configure failed. The contents of all config.log files follows to =
aid debugging
> | ERROR: oe_runconf failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at =
/home/jenkins/oe/world/shr-core/tmp-eglibc/work/x86_64-linux/libwmf-native=
/0.2.8.4-r3/temp/log.do_configure.22003)
> NOTE: recipe libwmf-native-0.2.8.4-r3: task do_configure: Failed
> ERROR: Task 28608 =
(virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/=
recipes-extended/libwmf/libwmf_0.2.8.4.bb, do_configure) failed with =
exit code '1'

Patch sent: http://patches.openembedded.org/patch/77381/


>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 4 +---
>> 1 file changed, 1 insertion(+), 3 deletions(-)
>>=20
>> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb =
b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
>> index 7cd6c65..eb4bba2 100644
>> --- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
>> +++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
>> @@ -14,8 +14,6 @@ SRC_URI =3D =
"http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
>>            file://autogen-common.sh \
>> "
>>=20
>> -PNBLACKLIST[abiword] =3D "BROKEN: depends on broken wv -> libgsf"
>> -
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc5edcc3ccd864b19004d14e9c1c9a26a"
>>=20
>> SRC_URI[md5sum] =3D "8d9c41cff3a8fbef8d0c835c65600e65"
>> @@ -26,7 +24,7 @@ SHRT_VER =3D =
"${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
>>=20
>> inherit autotools-brokensep pkgconfig
>>=20
>> -PACKAGECONFIG ??=3D "collab-backend-xmpp collab-backend-tcp =
collab-backend-service"
>> +PACKAGECONFIG ??=3D "collab-backend-xmpp collab-backend-tcp"
>> PACKAGECONFIG[spell] =3D "--enable-spell,--disable-spell,enchant"
>> PACKAGECONFIG[collab-backend-xmpp] =3D =
"--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf =
libxml2 loudmouth"
>> PACKAGECONFIG[collab-backend-tcp] =3D =
"--enable-collab-backend-tcp,--disable-collab-backend-tcp,libgsf =
libxml2"
>> --=20
>> 1.9.0
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


