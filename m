Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QLaGc-0001PK-CR
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 14:17:50 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 8EBFE799016; Sun, 15 May 2011 14:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-182-216.pools.arcor-ip.net
	[88.71.182.216]) by gravedo.de (Postfix) with ESMTPSA id DA012799013
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 14:15:00 +0200 (CEST)
Message-ID: <4DCFC3C4.506@gravedo.de>
Date: Sun, 15 May 2011 14:15:00 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105131210.17952.sgh@sgh.dk>	<f8a3ce78c529edc295cc9d15986d55bd.squirrel@webmail.infeline.org>	<4DCD526E.2080706@eukrea.com>	<4DCD881C.3080103@eukrea.com>
	<4DCFC1B6.6090808@gravedo.de>
In-Reply-To: <4DCFC1B6.6090808@gravedo.de>
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Sun, 15 May 2011 12:17:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 15.05.2011 14:06, Simon Busch wrote:
> On 13.05.2011 21:35, Eric B=E9nard wrote:
>> Hi,
>>
>>> On 13/05/2011 16:28, Eivind Kvedalen wrote:
>>>> I get the same problem here when trying to compile
>>>> qt4-embedded_4.7.2.bb.
>>>>
>>>> Build Configuration:
>>>> BB_VERSION =3D "1.10.2"
>>>> METADATA_BRANCH =3D "master"
>>>> METADATA_REVISION =3D "54ab33e"
>>>> TARGET_ARCH =3D "arm"
>>>> TARGET_OS =3D "linux-gnueabi"
>>>> MACHINE =3D "beagleboard"
>>>> DISTRO =3D "angstrom"
>>>> DISTRO_VERSION =3D "v2011.05"
>>>> TARGET_FPU =3D "hard"
>>>>
>> problem reproduced with a clean tmp.
>> this patch restore a part that 5a6efd58cdc85d08ab9e106c84bbac5110b5aec=
d
>> removed in do_install which seems to be the root of the problem.
>=20
> I tested this with
>=20
> # bitbake qt4-native && bitbake qt4-x11-free
>=20
> and both builds succceeded. Only the qt4-x11-free build prints some
> WARNINGS I didn't discoverd before:
>=20
>=20
> WARNING: the following files were installed but not shipped in any pack=
age:
> WARNING:   /usr/imports/Qt/labs/particles/libqmlparticlesplugin.so
> WARNING:   /usr/imports/Qt/labs/particles/qmldir
> WARNING:   /usr/imports/Qt/labs/particles/.debug/libqmlparticlesplugin.=
so
> WARNING:
> /usr/imports/Qt/labs/folderlistmodel/libqmlfolderlistmodelplugin.so
> WARNING:   /usr/imports/Qt/labs/folderlistmodel/qmldir
> WARNING:
> /usr/imports/Qt/labs/folderlistmodel/.debug/libqmlfolderlistmodelplugin=
.so
> WARNING:   /usr/imports/Qt/labs/gestures/libqmlgesturesplugin.so
> WARNING:   /usr/imports/Qt/labs/gestures/qmldir
> WARNING:   /usr/imports/Qt/labs/gestures/.debug/libqmlgesturesplugin.so
> WARNING:   /usr/imports/QtWebKit/libqmlwebkitplugin.so
> WARNING:   /usr/imports/QtWebKit/qmldir
> WARNING:   /usr/imports/QtWebKit/.debug/libqmlwebkitplugin.so
> WARNING:   /usr/lib/fonts/fontdir
> WARNING:   /usr/lib/qt4/plugins/qmltooling/libtcpserver.so
> WARNING:   /usr/lib/qt4/plugins/qmltooling/.debug/libtcpserver.so
>=20
> As this are some quite relevant components (like the QML webkit plugin)
> they should really get packaged by our qt4-x11-free recipe. Will see if
> I have the time to provide a patch for this too.
>=20
> Will send a patch with my changes to the qt4-native.inc file (which are
> mostly the same as Eric did) after this mail.

Hm, ok someone was fast than me and already commited the patch without
mention it here. Thanks Eric!

regards,
Simon


