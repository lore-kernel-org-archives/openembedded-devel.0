Received: from futzingaround.com ([67.212.234.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <o2e@saaworld.com>) id 1PPEU3-0006uF-FO
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 14:18:32 +0100
Received: from [172.16.62.154] (c-98-207-238-38.hsd1.ca.comcast.net
	[98.207.238.38]) (authenticated bits=0)
	by futzingaround.com (8.13.1/8.13.1) with ESMTP id oB5DH5Z9002713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Dec 2010 05:17:05 -0800
Mime-Version: 1.0 (Apple Message framework v1082)
From: Scott Anderson <o2e@saaworld.com>
In-Reply-To: <4CF7A13D.2060309@sirius-es.it>
Date: Sun, 5 Dec 2010 05:17:04 -0800
Message-Id: <76CCF123-9D03-4AAA-8F7A-6EBA1D6A2A78@saaworld.com>
References: <1290790442-28006-1-git-send-email-matteo.facchinetti@sirius-es.it>
	<icoqf5$9n4$1@dough.gmane.org> <4CF7A13D.2060309@sirius-es.it>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1082)
X-SA-Exim-Connect-IP: 67.212.234.189
X-SA-Exim-Mail-From: o2e@saaworld.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sysvinit_2.86.bb: add possibility to use USB Serial Console with only rx/tx.
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
X-List-Received-Date: Sun, 05 Dec 2010 13:18:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I apologize for coming into this late, but could you give a quick =
explanation of why a
new variable is needed?  In other words, what is wrong with something =
like:
SERIAL_CONSOLE=3D"-L /dev/ttyUSB0 115200"

  SAA

On Dec 2, 2010, at 5:38 AM, Matteo Facchinetti wrote:

> USB_SERIAL_CONSOLE is similar to SERIAL_CONSOLE but SERIAL_CONSOLE =
variabile isn't described too.
>=20
> IMHO could be need to add a new paragraph describing all kind of =
CONSOLE available for machine conf file.
>=20
> Where's the right place to add these variabiles in usermanual?
>=20
>=20
>=20
> On 11/26/2010 06:23 PM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> Where's the patch that adds this new var to the usermanual?
>>=20
>> On 26-11-10 17:54, matteo.facchinetti@sirius-es.it wrote:
>>  =20
>>> From: Matteo Facchinetti<engineering@sirius-es.it>
>>>=20
>>> There are many evaluationboard that use mini-usb port like as
>>> a serial port + power supply. Using it as serial console have
>>> to force getty with no need for carrier detect.
>>>=20
>>> Signed-off-by: Matteo Facchinetti<engineering@sirius-es.it>
>>> ---
>>>  recipes/sysvinit/sysvinit_2.86.bb |    5 +++++
>>>  1 files changed, 5 insertions(+), 0 deletions(-)
>>>=20
>>> diff --git a/recipes/sysvinit/sysvinit_2.86.bb =
b/recipes/sysvinit/sysvinit_2.86.bb
>>> index 6ab5290..c34cbc9 100644
>>> --- a/recipes/sysvinit/sysvinit_2.86.bb
>>> +++ b/recipes/sysvinit/sysvinit_2.86.bb
>>> @@ -65,6 +65,11 @@ do_install () {
>>>  	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
>>>  	if [ ! -z "${SERIAL_CONSOLE}" ]; then
>>>  		echo "S:2345:respawn:${base_sbindir}/getty =
${SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
>>> +	else
>>> +	=09
>>> +		if [ ! -z "${USB_SERIAL_CONSOLE}" ]; then
>>> +			echo "S:2345:respawn:${base_sbindir}/getty -L =
${USB_SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
>>> +		fi
>>>  	fi
>>>  	if [ "${USE_VT}" =3D "1" ]; then
>>>  		cat<<EOF>>${D}${sysconfdir}/inittab
>>>    =20
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>=20
>> iD8DBQFM7+0kMkyGM64RGpERAtPZAKCSHvZA9Eko51AqkoVR476+5tWoIQCgr1/Z
>> kxtr+B+5lfr+vqIxh6o5qGA=3D
>> =3DJSd7
>> -----END PGP SIGNATURE-----
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>  =20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



