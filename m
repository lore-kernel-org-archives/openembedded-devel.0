Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1OQjAP-0003ox-FK
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 17:44:10 +0200
Received: by wyb39 with SMTP id 39so2907113wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 08:39:35 -0700 (PDT)
Received: by 10.216.85.73 with SMTP id t51mr400053wee.3.1277134774374;
	Mon, 21 Jun 2010 08:39:34 -0700 (PDT)
Received: from [172.20.1.5] (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id k13sm4088995wed.35.2010.06.21.08.39.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 08:39:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20100621170946.57219953.ospite@studenti.unina.it>
Date: Mon, 21 Jun 2010 17:39:31 +0200
Message-Id: <D9F41477-DE63-4833-970F-743B944F8407@student.utwente.nl>
References: <20100618001536.60bbc113.ospite@studenti.unina.it>
	<hvfnha$e9k$1@dough.gmane.org>
	<AANLkTild9C_PVbfpBYlTeknKZ4k64bjMqwNvwfMk3rTi@mail.gmail.com>
	<hvnap4$4d8$1@dough.gmane.org> <hvnrd3$25e$1@dough.gmane.org>
	<20100621170946.57219953.ospite@studenti.unina.it>
To: Antonio Ospite <ospite@studenti.unina.it>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-toolchain fails in do_populate_sdk
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
X-List-Received-Date: Mon, 21 Jun 2010 15:44:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2010, om 17:09 heeft Antonio Ospite het volgende geschreven:

> On Mon, 21 Jun 2010 16:02:11 +0200
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
>=20
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> On 21-06-10 11:18, Koen Kooi wrote:
>>> On 18-06-10 23:59, Khem Raj wrote:
>>>> On Fri, Jun 18, 2010 at 5:07 AM, Koen Kooi =
<k.kooi@student.utwente.nl> wrote:
>>>> On 18-06-10 00:15, Antonio Ospite wrote:
>>>>>>> Hi,
>>>>>>>=20
>>>>>>> * check_data_file_clashes: Package gdb-cross-sdk wants to =
install file
>>>>>>> =
.../build/tmp/work/armv5te-oe-linux-gnueabi/meta-toolchain-1.0-r0/sdk/imag=
e/usr/local/minimal/arm/share/info/dir
>>>>>>> But that file is already provided by package  * =
binutils-cross-sdk
>>>=20
>>>> I can confirm this bug, any fixes for it available?
>>>=20
>>>>> we should force gdb-cross-sdk to not have those files and dirs.
>>>=20
>>> Any patches?
>>=20
>> This turned out to be a lot simpler than expected:
>>=20
>> =
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Ddbf77a6a15=
ea7926bf8f75dd728ff7bd55c60b11
>>=20
>=20
> Thanks Koen.
>=20
> Nitpicking: I noted the indentation of the changed line is different
> from the existing one, is there are there style guideline for OE
> recipes and classes?

Have a look at contrib/oe-stylize.py. Note that that hasn't been updated =
in a while, so use common sense when (ab)using it :)

regards,

Koen=


