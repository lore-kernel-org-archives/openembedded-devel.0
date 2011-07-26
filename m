Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlbkV-0000dE-77
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 09:08:15 +0200
Received: by wyg30 with SMTP id 30so93458wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 00:04:02 -0700 (PDT)
Received: by 10.216.60.4 with SMTP id t4mr4305032wec.101.1311663842146;
	Tue, 26 Jul 2011 00:04:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m38sm107090weq.21.2011.07.26.00.04.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 00:04:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110726070039.GD25533@jama.jama.net>
Date: Tue, 26 Jul 2011 09:03:55 +0200
Message-Id: <EE934BD9-BB14-47D8-BF1C-A59EFEC27B0E@dominion.thruhere.net>
References: <1311663177-19331-1-git-send-email-koen@dominion.thruhere.net>
	<20110726070039.GD25533@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-efl] e(fl).bbclass: don't override PACKAGES, but add to it
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
X-List-Received-Date: Tue, 26 Jul 2011 07:08:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2011, om 09:00 heeft Martin Jansa het volgende geschreven:

> On Tue, Jul 26, 2011 at 08:52:57AM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-efl/classes/e.bbclass   |    6 +++---
>> meta-efl/classes/efl.bbclass |    4 ++--
>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
>> index 88a1f6a..ebf1da8 100644
>> --- a/meta-efl/classes/e.bbclass
>> +++ b/meta-efl/classes/e.bbclass
>> @@ -18,9 +18,9 @@ do_configure_append() {
>> export CURL_CONFIG =3D "${STAGING_BINDIR_CROSS}/curl-config"
>> export FREETYPE_CONFIG =3D "${STAGING_BINDIR_CROSS}/freetype-config"
>>=20
>> -# This construction is stupid, someone with more E knowledge should =
change it to =3D+ or something
>> -# And it's in efl.bbclass as well....
>> -PACKAGES =3D "${PN}-dbg ${PN}-themes ${PN} ${PN}-dev ${PN}-doc =
${PN}-lib ${PN}-static"
>> +PACKAGES =3D+ "${PN}-themes"
>> +PACKAGES +=3D "${PN}-lib ${PN}-tests"
>=20
> ${PN}-tests wasn't in original PACKAGES
>=20
>> FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
>> FILES_${PN}-themes =3D "${datadir}/${PN}/themes ${datadir}/${PN}/data =
${datadir}/${PN}/fonts ${datadir}/${PN}/pointers ${datadir}/${PN}/images =
${datadir}/${PN}/users ${datadir}/${PN}/images ${datadir}/${PN}/styles"
>> FILES_${PN}-dev +=3D "${includedir} ${libdir}/lib*.so"
>> diff --git a/meta-efl/classes/efl.bbclass =
b/meta-efl/classes/efl.bbclass
>> index 2dc6fc2..c831439 100644
>> --- a/meta-efl/classes/efl.bbclass
>> +++ b/meta-efl/classes/efl.bbclass
>> @@ -19,8 +19,8 @@ do_install_prepend () {
>> 	done
>> }
>>=20
>> -# This construction is stupid, someone with more E knowledge should =
change it to =3D+ or something
>> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-themes ${PN}-dev ${PN}-doc =
${PN}-tests ${PN}-static"
>> +PACKAGES =3D+ "${PN}-themes"
>> +PACKAGES +=3D "${PN}-lib ${PN}-tests"
>=20
> ${PN}-lib wasn't in original PACKAGES

I did that to keep them in sync between the 2 classes. I can restore =
them to the original settings if you wish, I have no strong preference =
either way.

regards,

Koen=


