Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N6Ajo-0002Sk-Ik
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 23:23:31 +0100
Received: (qmail 19590 invoked by uid 813007); 5 Nov 2009 22:22:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Nov 2009 22:22:15 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Nov 2009 23:22:07 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc5-00402-gb6727b1; KDE/4.3.2; x86_64; ;
	)
References: <200910262125.58992.david.lanzendoerfer@o2s.ch>
	<1257451262.4676.6.camel@andromeda>
	<200911052316.23264.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200911052316.23264.david.lanzendoerfer@o2s.ch>
MIME-Version: 1.0
Message-Id: <200911052322.08199.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] MokoTouch
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
X-List-Received-Date: Thu, 05 Nov 2009 22:23:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 5 listopada 2009 o 23:16:19 David Lanzend=F6rfer napisa=B3(a=
):

> +++ b/recipes/mokotouch/mokotouch-apps-helloworld_2.bb
> @@ -0,0 +1,24 @@
> +require mokotouch.inc
> +
> +DEPENDS =3D "mokotouch-coreservices-mokotouch"
> +
> +do_configure(){
> +cd ${S}/MokoTouch/Apps/HelloWorld
> +rm UIKit.framework
> +ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
> +${OE_QMAKE_QMAKE} HelloWorld.pro
> +}
> +
> +do_compile(){
> +cd ${S}/MokoTouch/Apps/HelloWorld
> +oe_runmake
> +}
> +
> +do_install(){
> +install -d "${D}/${libdir}"
> +install "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0"
>  "${D}/${libdir}/libHelloWorld.so.1.0.0" +install
>  "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0"
>  "${D}/${libdir}/libHelloWorld.so.1.0" +install
>  "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0"
>  "${D}/${libdir}/libHelloWorld.so.1" +install
>  "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0"
>  "${D}/${libdir}/libHelloWorld.so" +}

My version of that recipe:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
require mokotouch.inc

MTCOMPONENT =3D "HelloWorld"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Rest of code should be in mokotouch.inc as you only change component name i=
n=20
all recipes. Each and each repeats same errors:

=2D no setting of ${S} but use of "cd somewhere to make it build"
=2D big duplication of code
=2D no use of qmake* bbclasses which remove need of do_configure/do_compile=
 in
  your recipes
=2D again waste of space by strange installation of libraries (fix loader t=
o use
  *.so maybe and skip all *.so.1.0.0 stuff?)

Still nack from me.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




