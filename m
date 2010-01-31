Received: from mail18.yourhostingaccount.com ([65.254.253.238]
	helo=mailout08.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <SRS0=daaoDp=JQ=ngndg.com=tim@yourhostingaccount.com>)
	id 1NbdYn-0001r9-Tg for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 18:26:13 +0100
Received: from mailscan02.yourhostingaccount.com ([10.1.15.2]
	helo=mailscan02.yourhostingaccount.com)
	by mailout08.yourhostingaccount.com with esmtp (Exim)
	id 1Nbd3I-000415-48 for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 11:53:36 -0500
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan02.yourhostingaccount.com with esmtp (Exim)
	id 1Nbd3H-0005hs-Ul; Sun, 31 Jan 2010 11:53:35 -0500
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9])
	by impout03.yourhostingaccount.com with NO UCE
	id cGtb1d0010BkWne0000000; Sun, 31 Jan 2010 11:53:35 -0500
X-EN-OrigOutIP: 10.1.18.9
X-EN-IMPSID: cGtb1d0010BkWne0000000
Received: from 79-69-185-31.dynamic.dsl.as9105.com ([79.69.185.31]
	helo=[192.168.0.2])
	by authsmtp09.yourhostingaccount.com with esmtpa (Exim)
	id 1Nbd3F-0007b1-Hk; Sun, 31 Jan 2010 11:53:35 -0500
Mime-Version: 1.0 (Apple Message framework v1077)
From: Tim Ellis <tim@ngndg.com>
In-Reply-To: <20100131093448.GI24852@ibawizard.net>
Date: Sun, 31 Jan 2010 16:53:27 +0000
Message-Id: <24792B84-53F1-4DFB-B253-D39514883957@ngndg.com>
References: <op.u7dmmldamn1qzu@camelguo>
	<19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
	<op.u7dt8jyhmn1qzu@camelguo> <op.u7dus8qwmn1qzu@camelguo>
	<20100131093448.GI24852@ibawizard.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-EN-UserInfo: b8ae887d91300d60195f6ea73d56f3bc:43527cee0c82d0ab5dc2dc3726f6afdf
X-EN-AuthUser: tim@ngndg.com
Sender: Tim Ellis <tim@ngndg.com>
X-EN-OrigIP: 79.69.185.31
X-EN-OrigHost: 79-69-185-31.dynamic.dsl.as9105.com
X-SA-Exim-Connect-IP: 65.254.253.238
X-SA-Exim-Mail-From: SRS0=daaoDp=JQ=ngndg.com=tim@yourhostingaccount.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of	liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 17:26:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

=46rom memory this needed a specific (or minimum) version of lua. Byron =
may also have an updated version we can test and commit. Sorry all my =
stuff is packed up at the mo and I can't test!  (Sorry for the extra =
email Byron the other bounced!)

Tim

On 31 Jan 2010, at 09:34, Petr =8Atetiar wrote:

> Guo Hongruan <camelguo@gmail.com> [2010-01-31 13:56:58]:
>=20
>> 2. but piccoontrol_0.4.bb tries to link liblua5.1.a, which name is =20=

>> liblua.a.
>>   20 LDFLAGS +=3D " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ldl =
"
>>=20
>> changing piccontrol_0.4.bb may correct the error.
>=20
> I think, that correct way of fixing it would be to fix Lua recipe to =
install
> as liblua5.1.a. Maybe creating pkgconfig for Lua would help also.
>=20
> -- ynezz
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



