Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TmNjL-0006Sa-Pi
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 12:59:11 +0100
Received: from mail402.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 86AE6FF90EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 12:18:17 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Dec 2012 13:06:11 +0200
Received: from unknown (HELO eb-e6520) (eric%eukrea.com@90.84.144.185)
	by ns0.ovh.net with SMTP; 22 Dec 2012 13:06:10 +0200
Date: Sat, 22 Dec 2012 12:05:51 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121222120551.6916471a@eb-e6520>
In-Reply-To: <kb40tq$84p$1@ger.gmane.org>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 10674094067623177545
X-Ovh-Remote: 90.84.144.185 ()
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: koen@dominion.thruhere.net
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Sat, 22 Dec 2012 11:59:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Sat, 22 Dec 2012 11:10:09 +0100,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
> Please don't revert it, I really need those updates in denzil. Setting
> PREFERRED_PROVIDER_udev is easy enough
>=20
next time please tell this kind of "detail" in the commit log. IMHO we
shouldn't ask stable branch users to change their build settings like
this as they don't expect their build to break.
In the present case, the patch is not only upgrading systemd : it's
also changing systemd's recipe to build and provide udev.
For example with meta-toolchain-qte even setting
PREFERRED_PROVIDER_udev =3D "udev" does't fix the build as systemd is
built and udev-182 is superceeded in deploy/ipk by udev-v189 and in the
end meta-toolchain-qte fails as it is looking for udev-182 ... so only
PREFERRED_PROVIDER_udev =3D "systemd" works but that means user will get
a newer version of udev and not the one that had for months in their
stable release).

Do you have an idea to fix that so that the default stays udev 182 and
users which need 189 can select it (and not the reverse) ?

Thanks,
Eric


