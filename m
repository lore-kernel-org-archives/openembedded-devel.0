Received: from ausc60pc101.us.dell.com ([143.166.85.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OYhAu-0006Vt-3J
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 17:13:38 +0200
X-Loopcount0: from 10.166.62.177
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Jul 2010 10:08:28 -0500
Thread-Topic: [oe] [PATCH] Correcting APACHE mirror location for APR recipes.
Thread-Index: AcsiUa891Zrl8CsISmiYHZJT0Nu+hgAS0RhQ
Message-ID: <113134CF306E8E4CACC27BE5937261B20931BF1B28@AUSX7MCPS303.AMER.DELL.COM>
References: <AcsiEe3JHQwDByVbTtuXbCTfXM2oUg==>
	<113134CF306E8E4CACC27BE5937261B20931BF148F@AUSX7MCPS303.AMER.DELL.COM>
	<AANLkTilYsPNfPjreXVd31_k4mzUDHLiyY4XlPNmJh6x-@mail.gmail.com>
In-Reply-To: <AANLkTilYsPNfPjreXVd31_k4mzUDHLiyY4XlPNmJh6x-@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {D4ED70B1-0479-439B-84B0-70E4938A88B0}
x-cr-hashedpuzzle: Al4u B6+R C6DA DMq0 DVii DppR ERJO EcwF E730 FcSU FtC2
	Hxne IGhJ JtAW KFiQ KcXk; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {D4ED70B1-0479-439B-84B0-70E4938A88B0};
	cwBlAGEAbgBfAGgAdQBkAHMAbwBuAEAAZABlAGwAbAAuAGMAbwBtAA==; Tue,
	13 Jul 2010 15:08:28 GMT;
	UgBFADoAIABbAG8AZQBdACAAWwBQAEEAVABDAEgAXQAgAEMAbwByAHIAZQBjAHQAaQBuAGcAIABBAFAAQQBDAEgARQAgAG0AaQByAHIAbwByACAAbABvAGMAYQB0AGkAbwBuACAAZgBvAHIAIABBAFAAUgAgAHIAZQBjAGkAcABlAHMALgA=
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Jul 2010 15:08:31.0948 (UTC)
	FILETIME=[41CEE8C0:01CB229D]
X-SA-Exim-Connect-IP: 143.166.85.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Correcting APACHE mirror location for APR recipes.
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
X-List-Received-Date: Tue, 13 Jul 2010 15:13:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It appears as though the only versions visible at the current URL are the l=
atest version.  To get access to the latest version, the archive URL appear=
s to be necessary.  It is worth noting that the archive seems to contain th=
e latest version too.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Tuesday, July 13, 2010 1:06 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] Correcting APACHE mirror location for APR recipes=
.

On Mon, Jul 12, 2010 at 3:31 PM,  <Sean_Hudson@dell.com> wrote:
> Hi all,
>
> =A0We recently noticed that apr and apr-util recipes were not fetching co=
rrectly.
> =A0It appears as though the APACHE_MIRROR variable in the bitbake.conf fi=
le.
>
> =A0Below is a trivial patch to update the variable.

I am able to see the files in existing URL. What problem did you have

>
> Regards,
> Sean
>
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 12a5522..71c7273 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -533,7 +533,7 @@ export palmqtdir =3D "${palmtopdir}"
> =A0OE_STRICT_CHECKSUMS ?=3D "1"
>
> =A0ADOBE_MIRROR =3D "http://fpdownload.macromedia.com/get/flashplayer/cur=
rent/"
> -APACHE_MIRROR =3D "http://www.apache.org/dist"
> +APACHE_MIRROR =3D "http://archive.apache.org/dist"
> =A0DEBIAN_MIRROR =3D "ftp://ftp.debian.org/debian/pool"
> =A0E_CVS =3D "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e"
> =A0E_URI =3D "http://enlightenment.freedesktop.org/files"
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


