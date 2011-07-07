Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QedDd-00032a-K6
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 03:17:30 +0200
Received: (qmail 10194 invoked by uid 501); 6 Jul 2011 18:13:37 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13285. avast: v3.2.0/110705-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.03192 secs); 07 Jul 2011 01:13:37 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 6 Jul 2011 18:13:37 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 7 Jul 2011 13:13:35 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78EBC@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <CAE21AQpLShYH+82swduxQLWtpTGtTawuywbt2WxXHUTB5+9zDQ@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Debugging u-boot
Thread-Index: Acw8PijG3YeESqNgSN+V1bkvfu7BeAABAcXQ
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net>
	<CAE21AQpLShYH+82swduxQLWtpTGtTawuywbt2WxXHUTB5+9zDQ@mail.gmail.com>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Debugging u-boot
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
X-List-Received-Date: Thu, 07 Jul 2011 01:17:30 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

Didn't know you were lurking on this list ... ;-)=20

I have built for the angstom distro (arm-angstrom-linux-gnueabi-*), but =
the tools got put in my project path I described in my earlier email, =
but
There was no GDB included for some reason ..

How do you build the meta-toolchain, and how will that help.

Cheers,
Bernie


-------------------------------------------------------------------------=
-----------------
I want to die peacefully in my sleep, like my grandfather, not screaming =
and yelling like the passengers in his car.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Charles Manning
Sent: Thursday, 7 July 2011 12:38 p.m.
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Debugging u-boot

Bernie

What toolchain are you building?

If you build meta-toolchain that should build all the stuff you can put =
into /usr/local/angstrom/arm/... which includes gdb.

That should then work with a JTAG debugger etc.

-- Charles


On Thu, Jul 7, 2011 at 11:25 AM, Bernard Mentink =
<Bernard_Mentink@trimble.com> wrote:
> Hi All,
>
> Can some one please tell me how to debug u-boot =A0on my target. I =
have=20
> built u-boot for similar hardware and I want to debug with gdb, but=20
> cannot even find the cross-compile version of gdb, It does not exist=20
> in the directory "build/tmp/sysroots/i686-linux/usr/armv6/bin/" where=20
> the other cross-compile tools live ..
>
> I want to execute "${CROSS_COMPILE}gdb u-boot"
> =A0.. and breakpoint at some very early symbol ..... Some steps to=20
> achieving this would be much appreciated ..
>
> Many Thanks,
> Bernie
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


