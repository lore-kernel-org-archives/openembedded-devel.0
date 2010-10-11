Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P5NuW-0007KS-D8
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 21:19:49 +0200
Received: by vws3 with SMTP id 3so912529vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GBMzOPRqPuuL9xjcFfLe1Nt8V2afDEeONk9UwD3YM4E=;
	b=Ae3RcGr7w5yEiuOSI9e+h1wUdmosI1HD0NnaA32H1QCPAnmsmJiey1tXNti1OatrKh
	/b9n3HuYbQJgFZs8M6g7S+zCjD7L2YAvFsa0W30woUZHSUWBf7EhKAqKcdhHg5IK7Tg0
	56UHbb+o+4BgjQrqkr06e3WNvQ1ef+kmaVEMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=G2RY+5LDP3sxE7331IH9k4tXukqdJNeaPXmkdn7a+twOWRD1UbiS3DJJxEVQUGxj7Y
	rXbP+1ytHzNrhkyuK9y2CjExmydiInJQj/5DXXb2AyCdGcSpLeQIP6dmRQw1U6qRIxKC
	McYwKABmkHT1Z8379/mY/rxLh73xzLBeN83mY=
MIME-Version: 1.0
Received: by 10.220.200.3 with SMTP id eu3mr2050724vcb.13.1286824755964; Mon,
	11 Oct 2010 12:19:15 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 11 Oct 2010 12:19:15 -0700 (PDT)
In-Reply-To: <AANLkTi=_CEduzJiR369hBifGv6=X=k4zDNQw=v7gAmmA@mail.gmail.com>
References: <AANLkTineQJGDAdjuuHpkKEsYPU1TuvmgE+7k+EoYqtTp@mail.gmail.com>
	<201010111602.05916.khimov@altell.ru>
	<AANLkTi=_aW1_xh4s=MTG60waODeY6VFKy6v_bXNgf=pu@mail.gmail.com>
	<AANLkTi=_CEduzJiR369hBifGv6=X=k4zDNQw=v7gAmmA@mail.gmail.com>
Date: Mon, 11 Oct 2010 12:19:15 -0700
Message-ID: <AANLkTino_dSNi67Dv-qHqBSRkOTUDTMv44uxLK9paS6D@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] unpackaged files
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
X-List-Received-Date: Mon, 11 Oct 2010 19:19:50 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/10/11 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/10/11 J. L. <vwyodapink@gmail.com>:
>> On Mon, Oct 11, 2010 at 5:02 AM, Roman I Khimov <khimov@altell.ru> wrote=
:
>>> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=
=CB 11 =CF=CB=D4=D1=C2=D2=D1 2010 15:51:05 =C1=D7=D4=CF=D2 Frans Meulenbroe=
ks
>>> =CE=C1=D0=C9=D3=C1=CC:
>>>> =9A- a way to indicate that a file is installed but purposedly not
>>>> packaged (e.g. I have such a thing in mythtv with a README file)
>>>> This could be by creating a pseudo-package (like -unused or -ignore)
>>>> which can be used to add files that are explicitly not packaged
>>>
>>> Shouldn't such files be removed with do_install_append()?
>
> rethinking this (after my previous mail) would we get an issue because
> some files are staged but not packaged (which is generally not the
> case, but I am thinking about gcc-cross and friends)
>>
>> my uneducated suggestion would be dont remove them and do something
>> like Frans suggests, reason being I am noticing packages that do not
>> build with files that you would expect especially ones with -dev tags.
>> or even some not being made like libgcc-dev. But like one off the top
>> of my head would be if you install libpcap and libcap-dev you still do
>> not get a pcap.h to use if you compile something on the machine your
>> built those packages into the image of.
>>
>
> it is not my proposal to make this a real installable package. I just
> want a mechanism that you can use to tell that a file while being
> there is on purpose not packaged
> Wrt your example: I'd say if pcap.h comes from libcpcap, it should
> probably go into libpcap-dev (or maybe libcap-dev).
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Ahh ok sorry miss understood what you wanted. I did run into another
one where I installed the built mysql5 and mysql5-dev  and it does not
provide a mysql.h on the machine, also lots of .dev packages rely on
libgcc-dev but there is not an installable version of libgcc-dev. So
if you install a -dev after you have the image running you get
complaints about no libgcc-dev on the machine. So if I run into things
like that I would need to go to that package and figure out why and
how to get the .h's I need in the .dev and or figure out how to make
the missing -dev ?

Thanks


