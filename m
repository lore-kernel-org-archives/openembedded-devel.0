Return-Path: <christian.thaler@tes-dst.com>
Received: from mail.tes-dst.com (mail.tes-dst.com [212.6.170.45])
	by mail.openembedded.org (Postfix) with ESMTP id 32B8260102
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 12:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.tes-dst.com (Postfix) with ESMTP id 28857523C55;
	Wed, 18 Apr 2018 14:40:35 +0200 (CEST)
Received: from mail.tes-dst.com ([127.0.0.1])
	by localhost (mail.tes-dst.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id u6YV92qQfZsN; Wed, 18 Apr 2018 14:40:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.tes-dst.com (Postfix) with ESMTP id 14696523C66;
	Wed, 18 Apr 2018 14:40:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.tes-dst.com
Received: from mail.tes-dst.com ([127.0.0.1])
	by localhost (mail.tes-dst.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QiB1IqLVwuEa; Wed, 18 Apr 2018 14:40:34 +0200 (CEST)
Received: from [172.20.10.111] (unknown [172.20.10.111])
	by mail.tes-dst.com (Postfix) with ESMTPSA id E636A523C55;
	Wed, 18 Apr 2018 14:40:33 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1523886232-12585-1-git-send-email-christian.thaler@tes-dst.com>
	<CA+chaQfuZ0xcExSg_X+9oNX_zFddgNHt=B7T6_bu_j=mU=yaAw@mail.gmail.com>
From: Christian Thaler <christian.thaler@tes-dst.com>
Message-ID: <f6e48272-b3c3-4e2c-c16c-40bd5ce2dc65@tes-dst.com>
Date: Wed, 18 Apr 2018 14:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfuZ0xcExSg_X+9oNX_zFddgNHt=B7T6_bu_j=mU=yaAw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: fix environment.d dir permission
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
X-List-Received-Date: Wed, 18 Apr 2018 12:40:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Thanks for the advice. I have signed-off the DCO now.
---
Fixed an issue with the nativesdk-cmake package, which sets the=20
permission of
/opt/.../environment.d to rwxr-xr-x.
nativesdk-qtbase set the permission to rwxrwxr-x, leading to a conflict:

Error: Transaction check error:
 =C2=A0 file /opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/environment-se=
tup.d
 =C2=A0 conflicts between attempted installs of
 =C2=A0 nativesdk-cmake-3.8.2-r0.x86_64_nativesdk and
 =C2=A0 nativesdk-qtbase-tools-5.9.4+git0+0d9208cecb-r0.x86_64_nativesdk

Recipe nativesdk-qtbase will now set the permission to rwxr-xr-x.

Signed-off-by: Christian Thaler <christian.thaler@tes-dst.com>
---
 =C2=A0recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb=20
b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 5b20b0a..a678b19 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -171,7 +171,7 @@ do_install() {
 =C2=A0}

 =C2=A0fakeroot do_generate_qt_environment_file() {
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
+=C2=A0=C2=A0=C2=A0 install -d -m 755 ${D}${SDKPATHNATIVE}/environment-se=
tup.d/
 =C2=A0=C2=A0=C2=A0=C2=A0 script=3D${D}${SDKPATHNATIVE}/environment-setup=
.d/qt5.sh

 =C2=A0=C2=A0=C2=A0=C2=A0 echo 'export PATH=3D${OE_QMAKE_PATH_HOST_BINS}:=
$PATH' > $script
--=20
2.7.4

-------- Original Message --------
*Subject: *Re: [oe] [meta-qt5][PATCH] nativesdk-qtbase: fix=20
environment.d dir permission
*From: *Martin Jansa <martin.jansa@gmail.com>
*To: *c-thaler <christian.thaler@tes-dst.com>
*Cc: *openembedded-devel <openembedded-devel@lists.openembedded.org>,=20
Dennis Menschel <menschel-d@posteo.de>
*Date: *18.04.2018 13:33
> Missing=C2=A0Signed-off-by and I might take alternative fix for this:
> https://patchwork.openembedded.org/patch/150133/
>
> On Mon, Apr 16, 2018 at 3:43 PM, c-thaler=20
> <christian.thaler@tes-dst.com <mailto:christian.thaler@tes-dst.com>>=20
> wrote:
>
>     Fixed an issue with the nativesdk-cmake package, which sets the
>     permission of
>     /opt/.../environment.d to rwxr-xr-x.
>     nativesdk-qtbase set the permission to rwxrwxr-x, leading to a
>     conflict:
>
>     Error: Transaction check error:
>     =C2=A0 file
>     /opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/environment-setup.d
>     =C2=A0 conflicts between attempted installs of
>     =C2=A0 nativesdk-cmake-3.8.2-r0.x86_64_nativesdk and
>     =C2=A0 nativesdk-qtbase-tools-5.9.4+git0+0d9208cecb-r0.x86_64_nativ=
esdk
>
>     Recipe nativesdk-qtbase will now set the permission to rwxr-xr-x.
>     ---
>     =C2=A0recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb> | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>     b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>     index 5b20b0a..a678b19 100644
>     --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>     +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>     @@ -171,7 +171,7 @@ do_install() {
>     =C2=A0}
>
>     =C2=A0fakeroot do_generate_qt_environment_file() {
>     -=C2=A0 =C2=A0 mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
>     +=C2=A0 =C2=A0 install -d -m 755 ${D}${SDKPATHNATIVE}/environment-s=
etup.d/
>     =C2=A0 =C2=A0 =C2=A0script=3D${D}${SDKPATHNATIVE}/environment-setup=
.d/qt5.sh
>
>     =C2=A0 =C2=A0 =C2=A0echo 'export PATH=3D${OE_QMAKE_PATH_HOST_BINS}:=
$PATH' > $script
>     --=20
>     2.7.4
>
>     --=20
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>
>
> _______________________________________________________________________=
_
> This e-mail has been scanned for all viruses by Claranet. The
> service is powered by MessageLabs. For more information on a proactive
> anti-virus service working around the clock, around the globe, visit:
> http://www.claranet.co.uk
> _______________________________________________________________________=
_

--=20
Christian Thaler
E-mail: christian.thaler@tes-dst.com
Frankenstrasse 3, D-20097 Hamburg
Phone +49 (0)40-411611-60

TES Electronic Solutions GmbH
Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 20239,
Gesch=C3=A4ftsf=C3=BChrung: J=C3=BCrgen Zeller

Wichtig!!
Diese E-Mail kann Betriebs- und Gesch=C3=A4ftsgeheimnisse oder sonstige
vertrauliche Informationen enthalten. Sollten Sie diese E-Mail irrt=C3=BC=
mlich
erhalten haben, ist Ihnen eine Kenntnisnahme des Inhalts, eine
Vervielf=C3=A4ltigung oder Weitergabe der E-Mail ausdr=C3=BCcklich unters=
agt. Bitte
benachrichtigen Sie uns und vernichten Sie die E-Mail. Der Absender hat a=
lle
erdenklichen Vorsichtsma=C3=9Fnahmen getroffen, dass die Anlagen dieser E=
-Mail
frei von Computerviren o.=C3=A4. sind. Gleichwohl schlie=C3=9Fen wir die =
Haftung f=C3=BCr
jeden Schaden aus, der durch Computerviren o.=C3=A4. verursacht wurde, so=
weit wir
nicht vors=C3=A4tzlich oder grob fahrl=C3=A4ssig gehandelt haben. Wir rat=
en Ihnen,
dass Sie in jedem Fall Ihre eigene Virenpr=C3=BCfung vornehmen, bevor Sie=
 die
Anlagen =C3=B6ffnen.
Vielen Dank.

Important!!
The information contained in this email message may be confidential
information. If you are not the intended recipient, any use, interference
with, disclosure or copying of this material is unauthorized and prohibit=
ed.
Please inform us immediately and destroy the email. We have taken every
reasonable precaution to ensure that any attachment to this eMail has bee=
n
swept for viruses. However, we cannot accept liability for any damage
sustained as a result of software viruses and would advice that you carry
out your own virus checks before opening any attachment.
Thank you for your cooperation.


