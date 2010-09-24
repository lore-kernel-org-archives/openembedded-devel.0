Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Oz6rq-0007VI-6G
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 13:55:13 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8OBsxJo011077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 06:54:59 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8OBswRT001775
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 06:54:58 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8OBswuE017872
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 06:54:58 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 24 Sep 2010 06:54:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Sep 2010 06:54:56 -0500
Thread-Topic: [oe] Question about automake licensing in recipe
Thread-Index: Actbbg8z/9k2ZTCySWSYXyviVkisxQAcO5jQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310E1558D@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310E154E8@dlee06.ent.ti.com>
	<AANLkTi=45dASvU5XiCia4o2bia-Zx38neVw8vK6Qvrx-@mail.gmail.com>
In-Reply-To: <AANLkTi=45dASvU5XiCia4o2bia-Zx38neVw8vK6Qvrx-@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about automake licensing in recipe
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
X-List-Received-Date: Fri, 24 Sep 2010 11:55:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Graham Gower
> Sent: Thursday, September 23, 2010 5:18 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Question about automake licensing in recipe
>=20
> On 24 September 2010 05:44, Maupin, Chase <chase.maupin@ti.com> wrote:
> > All,
> >
> > I was digging around in the automake sources and I noticed that there i=
s
> a top-level COPYING file that says automake is licensed under
> GPLv2. =A0However, in the lib directory there is another COPYING file tha=
t
> says GPLv3. =A0I was trying to figure out what LICENSE should be set to f=
or
> automake when the sources contain both GPLv2 and GPLv3 code. =A0Should it=
 be
> set to something like GPLv2/GPLv3? =A0I've read that GPLv2 and GPLv3 are
> incompatible
> (http://gplv3.fsf.org/wiki/index.php/Compatible_licenses#GPLv3-
> incompatible_licenses) so can a recipe even be marked as being both GPLv2
> and GPLv3?
> >
> > Any input would be appreciated here.
>=20
> If the GPLv2 has the "or later version" clause and you are combining
> with GPLv3, then there is no incompatibility as the entire thing is
> then distributed under the GPLv3. If there is no "or later" clause,
> then its a problem that needs to be sorted out upstream.

Graham,

Thanks for the input.  I do not see the "or later" clause.  I see some disc=
ussion on FSF about updating the exceptions for tools like automake.  I gue=
ss this comes back to my question though of how we should mark the LICENSE =
field for the automake recipe until all the licensing is done?

also, has anyone thought about having a license type of GPLv3+exception or =
some other format to indicate that there is an active exception for a packa=
ge?

>=20
> -Graham
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


