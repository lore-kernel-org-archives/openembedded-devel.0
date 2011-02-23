Received: from mrqout2a.tiscali.it ([195.130.225.14] helo=mrqout2.tiscali.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@tiscali.it>) id 1PsEsO-0002vX-PP
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:35:32 +0100
Received: from [10.39.115.29] by mrq-2 with esmtp (Exim)
	id 1PsEr7-0008EE-Ks; Wed, 23 Feb 2011 14:34:13 +0100
Received: from ps-wm5 (10.39.75.205) by mail-10.mail.tiscali.sys (8.5.134)
	id 4D3EB05B00BF4E56; Wed, 23 Feb 2011 14:34:02 +0100
Message-ID: <13478596.452291298468042311.JavaMail.defaultUser@defaultHost>
Date: Wed, 23 Feb 2011 14:34:02 +0100 (CET)
From: Luca Bolognini <l.bolognini@tiscali.it>
To: <openembedded-devel@lists.openembedded.org>, 
	Arago Mailing List <arago-devel@gforge.ti.com>
MIME-Version: 1.0
xOriginalSenderIP: 78.6.111.196
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: lamiaposta71@gmail.com
Subject: Re: apache2+php5 on Arago
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
X-List-Received-Date: Wed, 23 Feb 2011 13:35:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,I've investigated a bit more on the topic apache2/modphp not working (se=
gmentation fault) on Arago.During the resume I'm going to write, I will nee=
d to underline some aspects concerning the toolchain and the corresponding =
glibc packages.Then, from the beginning:apache2_2.2.14 + modphp_5.1.6 (libp=
hp5 module loaded by LoadModule directive inside httpd.conf) are unusable i=
n my Arago DISTRO 2010.12 cross-compiled with CodeSourcery2009q1 (apache2 s=
egfaults).If I commented out the LoadModule directive from httpd.conf file =
and I restart httpd, apache2 works but obviously cannot access php pages.Si=
nce my filesystem was built starting from Arago, an external toolchain was =
used (CodeSourcery2009q1 and its corresponding "glibc packages" with versio=
n 2.8).If I had used CodeSourcery2010q1, I would have got "glibc packages" =
with version 2.11.1.Since some people of OE mailing list (Raffaele and Marc=
o) told me some days ago that they were able to make apache2 fully work in =
a "pure" OE environment (not Arago overlay), I downloaded from git reposito=
ries the OE release 2010.12 and I tried to understand how to use an externa=
l toolchain to achieve apache2 and modphp ipk packages.I made so because my=
 intention was to produce these two packages and test them inside the Arago=
 filesystem previously described.When the ipks were ready (cross compiled a=
gainst glibc-2.8) I tested them on the beagleboard with Arago2010.12 (CS200=
9q1 and glibc-2.8).Apache2 works without loading php5 module (only html pag=
es), segfaults when libphp5 is loaded.Then exactly the same behaviour as in=
 Arago.
Probably Marco and Raffaele were using an OE filesystem built with "interna=
l" toolchain (then glibc-2.9 instead than 2.8)?Can you confirm this?About t=
his, now I'm trying to build an OE minimal-image for beagleboard where apac=
he2 and modphp are inserted as additional packages (I edited minimal-image.=
bb).This time I'm using the "internal" toolchain (then glibc-2.9.bb will be=
 used this time).However I already know that these packages, even if workin=
g in the minimal-image filesystem, will be unusable inside my Arago with gl=
ibc-2.8 (glibc mismatch).I'll let you know if I have some interesting news.=
In the meantime I hope to receive some opinions of yours.
Bye,Luca



----Messaggio originale----
Da: koansoftware@gmail.com
Data: 15/02/2011 14.40
A: <openembedded-devel@lists.openembedded.org>
Cc: <lamiaposta71@gmail.com>
Ogg: Re: [oe] apache2+php5 on Arago

Luca Bolognini ha scritto, Il 15/02/2011 09:51:
> Yesterday I had an exchange of emails with Raffaele Recalcati, it was=20
> in italian then I'll try to resume briefly so that everyone can read.
> I=20
> was asking Raffaele (by the way, thank you for your prompt reply) if he=
=20
> had some news about the Apache2+php5 segmentation faults that occurred=20
> in Arago distros.
> I'm currently developing for beagleboard and TI816x-
> evm.
> Raffaele pointed out that he had investigated for some time the=20
> crash in Arago=20
> ( https://gforge.ti.com/gf/project/arago/mailman/?
> _forum_action=3DForumMessageBrowse&amp;thread_id=3D3792&amp;action=3DList=
Threads&amp;mailman_id=3D39=20
> )
> but at length he had chosen to compile the two packages with a "pure"=20
> OE environment, without Arago overlay.
> With this choice, he said that=20
> Apache2 is able to open php pages without problems.
> It seems rather=20
> strange, as recipes are more or less the same (Raffaele added some=20
> customizations but they honestly seem not relevant) and tar.gz source=20
> files are identical.
> What can Arago have introduced to produces such=20
> troubles? It's difficult to say.
> It's quite annoying to use Arago for=20
> all packages of my custom filesystem and then switch to OE only for=20
> apache2 and modphp; all my scripting stuff is concerned with Arago,=20
> it's would be great to have everything confined inside Arago layer.
>=20
> Denys told he would have postponed some further investigations on the=20
> topic, maybe now he has some good news?
> Now however I'm going to make=20
> the same tests of Raffaele, that is have the two packages compiled with=
=20
> "pure" OE; in the meantime, if someone has any ideas...
> Thank you,
> bye
>=20
>=20

Luca,
unfortunately for you, I can only confirm that Apache2+php5 work with a
charm on our customers' ARM9 devices using KaeilOS/Openembedded (not Arago)=
.


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!=20
Risparmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC=
 al mese per due anni!
SCONTO DI 240 EURO!
http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso/?WT.mc_id=
=3D01fw


