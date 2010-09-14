Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OvUyi-0005yj-MR
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:51:17 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OvUxv-00044S-9k from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 05:50:27 -0700
Received: from 137.202.157.210 ([137.202.157.210]) by eu2-mail.mgc.mentorg.com
	([137.202.76.30]) via Exchange Front-End Server
	webmail.mentor.com ([192.94.38.218]) with Microsoft Exchange
	Server HTTP-DAV ; Tue, 14 Sep 2010 12:49:58 +0000
Received: from pkl-fusman-ubuntu by webmail.mentor.com;
	14 Sep 2010 17:49:48 +0500
From: Fahad <Fahad_Usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinLc9Yns87CFTwX4Wk_Wj0k=g02F06e5Aj5HXup@mail.gmail.com>
References: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>
	<AANLkTinLc9Yns87CFTwX4Wk_Wj0k=g02F06e5Aj5HXup@mail.gmail.com>
Organization: Mentor Graphics
Date: Tue, 14 Sep 2010 17:49:48 +0500
Message-ID: <1284468588.11942.25.camel@pkl-fusman-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omniorb_4.1.4: merged native and non-native recipes
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
X-List-Received-Date: Tue, 14 Sep 2010 12:51:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-09-09 at 19:20 +0200, Frans Meulenbroeks wrote:
> 2010/9/9 Fahad Usman <fahad_usman@mentor.com>:
> > +# The following comment is from the omniorb-native recipe which is now=
 merged into this one...
> > +# Ugly hack so libtool does not find native libs when building cross p=
ackages
> > +# We really only build this package for omniidl anyway
> > +do_install_virtclass-native_append() {
> > +        rm -f  ${D}${libdir}/libomni*
>=20
> Can you verify if this is still needed ?
> I suggest to do that by cleaning both recipes, then remove this hack,
> then build omniidl-native followed by omniidl
> If the last one builds fine, I'd say it is afe to leave tout this rm
>=20
Hi Frans,
looks like omniidl recipes are not in git any more and i couldn't find
any other package that depends on omniorb or omniorb-native. So, it is
probably not needed and it should be safe to remove this hack. I will
submit the updated patch for this.

Fahad.
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



