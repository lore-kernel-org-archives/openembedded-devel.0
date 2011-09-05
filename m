Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1R0hnb-00064T-Mx
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 00:37:52 +0200
Received: (qmail 13838 invoked by uid 502); 5 Sep 2011 15:32:50 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 487) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13552. avast: v3.2.1/110904-1. sophie:
	3.06/3.23.2/4.69. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.042911 secs); 05 Sep 2011 22:32:50 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 5 Sep 2011 15:32:50 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 6 Sep 2011 10:32:48 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04CE3059@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04CE2FEE@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Error building gnome image ... xsltproc
Thread-Index: AcxsEeKF7gtCjKlJRw6fsqjt3eu6wgAAaP5AAAIC6fA=
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04CE2F5D@nzc-ap-xch-02.ap.trimblecorp.net><1315257709.16863.59.camel@mattotaupa>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04CE2FEE@nzc-ap-xch-02.ap.trimblecorp.net>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Error building gnome image ... xsltproc
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
X-List-Received-Date: Mon, 05 Sep 2011 22:37:52 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hmmm, now I get the following similar error  ...

| xsltproc -o gdm-C.omf --stringparam db2omf.basename gdm --stringparam
db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook
XML V4.1.2//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_dir
"/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help"
--stringparam db2omf.omf_in
"/home/bmentink/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/a
rmv7a-angstrom-linux-gnueabi/gdm-2.32.2-r4/gdm-2.32.2/docs/gdm.omf.in"
`/home/bmentink/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroo
ts/i686-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils`
C/gdm.xml || { rm -f "gdm-C.omf"; exit 1; }
| warning: failed to load external entity
"/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| make[2]: *** [gdm-C.omf] Error 1

I have installed all the docbook stuff I can find on my host ..
Any idea's on this one?

Cheers,
Bernie=20


------------------------------------------------------------------------
------------------
I want to die peacefully in my sleep, like my grandfather, not screaming
and yelling like the passengers in his car.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Bernard Mentink
Sent: Tuesday, 6 September 2011 9:34 a.m.
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Error building gnome image ... xsltproc

Many thanks Paul ... That fixed it.

Cheers,
Bernie=20


------------------------------------------------------------------------
------------------
I want to die peacefully in my sleep, like my grandfather, not screaming
and yelling like the passengers in his car.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Paul Menzel
Sent: Tuesday, 6 September 2011 9:22 a.m.
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Error building gnome image ... xsltproc

Dear Bernard,


Am Dienstag, den 06.09.2011, 07:23 +1200 schrieb Bernard Mentink:
> Hi Guys,
>=20
> Am trying to build the systemd-gnome-image and I get a error when=20
> executing xsltproc on docbook.xsl, error is:
>=20
>  xsltproc -nonet
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs
> l
> udisks-daemon.xml
> I/O error : Attempt to load network entity=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs
> l
> warning: failed to load external entity=20
> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.x
> sl
> "
> cannot parse
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs
> l
>=20
> I suspect this is a proxy issue: Anyone have a solution for this.

I do not know if you use oe-core/meta-oe or oe.dev/oe-classic. For
oe.dev you have to install it on the build host.

	$ sudo aptitude install docbook-xsl


Thanks,

Paul

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


