Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1PJJ32-0005kJ-GT
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:58:10 +0100
Received: by gwaa11 with SMTP id a11so2533904gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 20:57:00 -0800 (PST)
Received: by 10.100.107.20 with SMTP id f20mr1123100anc.91.1290142614242;
	Thu, 18 Nov 2010 20:56:54 -0800 (PST)
Received: from [192.168.10.100] (cm152.psi156.maxonline.com.sg
	[58.146.156.152])
	by mx.google.com with ESMTPS id w15sm1309980anw.33.2010.11.18.20.56.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 20:56:53 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <AANLkTikqYyVJbXE+1Ed5R8hqfybDUG264GaGPab=qy8b@mail.gmail.com>
Date: Fri, 19 Nov 2010 12:56:49 +0800
Message-Id: <7461D474-7A94-4D7E-819F-4D8EFD5AD633@chumby.com>
References: <F8F69BD6-3BBB-4F09-B9E1-B172C31B4B96@chumby.com>
	<AANLkTikqYyVJbXE+1Ed5R8hqfybDUG264GaGPab=qy8b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs: Add emacs 23.2
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
X-List-Received-Date: Fri, 19 Nov 2010 04:58:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On 19-Nov-2010, at 12:42 PM, Khem Raj wrote:

> On Thu, Nov 18, 2010 at 8:34 PM, Sean Cross <sean@chumby.com> wrote:
>=20
>>=20
>> ---
>>  recipes/emacs/emacs_23.2.bb                  |   15 ++++
>>  recipes/emacs/files/emacs23.2-use-qemu.patch |  102 =
++++++++++++++++++++++++++
>>  2 files changed, 117 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/emacs/emacs_23.2.bb
>>  create mode 100644 recipes/emacs/files/emacs23.2-use-qemu.patch
>>=20
>> diff --git a/recipes/emacs/emacs_23.2.bb =
b/recipes/emacs/emacs_23.2.bb
>> new file mode 100644
>> index 0000000..d57351a
>> --- /dev/null
>> +++ b/recipes/emacs/emacs_23.2.bb
>> @@ -0,0 +1,15 @@
>> +require emacs.inc
>> +
>> +EXTRA_OECONF =3D "--without-sound --without-x"
>> +
>> +#/!\warning untested recipe
>> +DEFAULT_PREFERENCE =3D "-2"
>=20
> Why not make it default. ?

Largely because I did a copy-and-paste from emacs_23.1.bb, which had the =
same setting.

I'm ordinarily a vim user, but I had a request for emacs, so I got it =
building.  I haven't done any testing on it beyond building the package =
and running "emacs" on a target system.  In that sense, 23.2 works much =
better than 23.1.

If you like, I can resubmit with that removed.



