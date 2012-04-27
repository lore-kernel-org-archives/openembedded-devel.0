Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SNmrt-0001sb-An
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 17:13:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3RF4HVu025241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 08:04:17 -0700 (PDT)
Received: from msp-dhcp12.wrs.com (172.25.34.12) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Apr 2012 08:04:17 -0700
Message-ID: <4F9AB570.4090906@windriver.com>
Date: Fri, 27 Apr 2012 10:04:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4F9A932F.1020400@gmail.com>
In-Reply-To: <4F9A932F.1020400@gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q3RF4HVu025241
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Fri, 27 Apr 2012 15:13:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/27/12 7:38 AM, Martin Erts=E5s wrote:
> Hi.
>
> I'm working on a pandaboard with OMAP4460. Were trying to use the newes=
t
> PVR drivers, which conforms to the result that arose from
> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>
> We have applied the patch at the bottom of that page gcc, and also a
> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
> instead of ld-linux. Problem is, this gives us a kernel panic when it
> tries to run init. Linking ld-linux.so.3 to ld-linux-armhf.so.3 does no=
t
> work, and we're kind of in the dark as to what is missing.
>
> We tried fixing this by renaming the toolchain to be
> arm-none-linux-gnueabihf instead of arm-none-linux-gnueabi, as we heard
> this might be a problem with hardfloats, but this needed a lot of extra
> patches, and some patchwork on other packages like openssl and shadow.
>
> My question is, are there any ongoing plans to fix this, and make sure
> that if we have set hard float we make ld-linux-armhf in openembedded?
>
> For the record we are using eglibc2.15 and gcc4.6 from openembedded-cor=
e.

The ARM EABI + HF isn't well tested (to my knowledge) of oe-core.  I was =
under=20
the impressions a few people did use it, and it was working successfully =
for=20
them.  (Generally speaking people seem to agree that there is a place for=
 ARM=20
EABI + HF, but the performance increase to the couple of items where it h=
elps is=20
generally not worth the pain of incompatibility with the core ARM EABI.  =
Thus=20
it's not used very much in OE.)

Could you verify that the stock configuration (without any of the changes=
 you=20
described above) is working and will boot w/o a kernel panic at init?

If so then it'll be easier to help you track down the particulars of the =
ld.so=20
name change and related items.

--Mark

> Best regards
> Martin Ertsaas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



