Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0WDO-0002PE-B7
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 11:11:11 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 73A84491282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 11:10:59 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 28 Sep 2010 11:10:59 +0200
Message-ID: <4CA1B11D.4080208@dresearch.de>
Date: Tue, 28 Sep 2010 11:10:53 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285658920-15596-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTinAZPimHtcKhmcFZeaDmuArR9yDtezq_5RjfEus@mail.gmail.com>
In-Reply-To: <AANLkTinAZPimHtcKhmcFZeaDmuArR9yDtezq_5RjfEus@mail.gmail.com>
X-OriginalArrivalTime: 28 Sep 2010 09:10:59.0160 (UTC)
	FILETIME=[10C1FD80:01CB5EED]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove dbus support from wvstreams-4.6 because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 09:11:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello, Frans,

> I'd say it is either this
>
>> -DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
>> +DEPENDS =3D "zlib openssl (>=3D 0.9.8) dbus (>  1.2.14)"
>
> which makes sure dbus is build and available.

Nope, it doesn't. Not for wvstreams, at least. Configure.ac is broken=20
and the package will fail to build at link time because it is looking=20
for libdbus-1.a in the system root ( "/libdbus-1.a"; see first mail ).

However, I forgot to remove this little helper.

>
> Or this:
>
>> -EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam"
>> +# tfm: dbus build currently broken
>> +EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without=
-dbus"
>
> but not both.
> If wvstreams should be build with dbus support you should use the
> former, it is should be build without it, it should be the latter.
>

So it is the latter. [v2] is out.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB:54412
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle


