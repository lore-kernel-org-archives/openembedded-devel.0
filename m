Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1PzmHG-0003cw-2m
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 09:40:22 +0100
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1PzmFZ-00066i-Aq from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 01:38:37 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 16 Mar 2011 09:38:34 +0100
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A505479928@eu2-mail.mgc.mentorg.com>
In-Reply-To: <20110316080500.GA3414@jama.jama.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Python-native dependency in libxml2
Thread-Index: AcvjsWNKCktkBgGKSJakDP0uSABizwAA0PIg
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de><1300180117.2522.14.camel@eha>
	<20110315220301.GC3042@denix.org><1300254477.2818.5.camel@eha><989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com><4D8061DE.6030106@gmail.com><AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
	<20110316080500.GA3414@jama.jama.net>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 08:40:22 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I made 2 changes, first one was to remove python-native from DEPENDS and
second was commented out XPY_virtclass-native =3D "
--with-python=3D${PYTHON_DIR}". Moreover I removed all the stuff from
build dir, so there were not python-native for me. After kicking this
build libxml2-native build fine.

I was looking for xml2po recipe, I couldn't find it. Can you tell me how
to build xml2po package so that I can reproduce the problem.

Regards,
Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Martin Jansa
Sent: Wednesday, March 16, 2011 1:05 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Python-native dependency in libxml2

On Wed, Mar 16, 2011 at 08:28:39AM +0100, Frans Meulenbroeks wrote:
> 2011/3/16 Khem Raj <raj.khem@gmail.com>:
> > On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
> >>
> >> Hello,
> >>
> >> I was looking at the libxml2 package. While going through the
recipes I
> >> came to know that its native package depends on python-native
package as
> >> well. This dependency is defined in libxml2.inc file.
> >>
> >> DEPENDS_virtclass-native =3D "python-native"
> >>
> >> This package build fine after removing this dependency. I am not
clear
> >> why this dependency is being added in libxml2 package. Can somebody
> >> clear that to me. While looking at the git log I came to know that
this
> >> change is coming from libxml2-native.inc file. But I am not clear
why
> >> this dependency was added as this package build fine without it.
> >>
> >> Please help me in understanding this dependency. Thanks.
> >
> > Try to build this recipe from scratch and see if it still works then
we can
> > remove the dep

That's not enough, libxml2-native builds fine.. but then xml2po
will fail if there isn't libxml2-native built with python support.

see a25f07ca6159e1cd5b8a215ca5da8405fb1b9053

So yes.. for such tests you should build recipe from scratch _and_ check
if resulting package/sysroot is still the same.

Regards,

> I'm not sure if that is the right way.
> It might well be that typically python-native is already there in a
> scratch build because some earlier package needed it (or even because
> of the scheduling of build steps.
>=20
> Probably a better way is to build with packaged staging (with staging
> dir outside TMPDIR) then rm TMPDIR and bake the package.
> Alternately peek into the package to see if it needs python. If it is
> needed then the DEPENDS should stay.
>=20
> Looking at the issue at hand maybe the best person to ask is Martin
> Jansa as he last touched that line according to git blame:
> 3cd9ddbf recipes/libxml/libxml2.inc  (Martin Jansa
> 2010-02-26 12:32:53 +0100  5) DEPENDS_virtclass-native =3D
> "python-native"
>=20
> The other thing is that further on in the .inc file I see:
> XPY_virtclass-native =3D " --with-python=3D${PYTHON_DIR}"
>=20
> This strongly suggests a hard dependency on python, so removing the
> DEPENDS "because it builds without it" does not seem to be a good plan
> to me.
>=20
> My strong feeling is that recipes should be self-contained (so should
> list all packages they need to build, minus the ones that are
> inherited from classes (and maybe a few implicit ones like maybe make)
>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


