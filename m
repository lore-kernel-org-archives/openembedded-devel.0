Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mgl@doredevelopment.dk>) id 1M0Bck-0000ml-NW
	for openembedded-devel@openembedded.org; Sat, 02 May 2009 11:35:10 +0200
Received: from [10.0.0.5] (port80.ds1-abc.adsl.cybercity.dk [212.242.125.19])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id n429TTic027266
	for <openembedded-devel@openembedded.org>;
	Sat, 2 May 2009 11:29:37 +0200
Message-ID: <49FC1275.7080202@doredevelopment.dk>
Date: Sat, 02 May 2009 11:29:25 +0200
From: Martin Lund <mgl@doredevelopment.dk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US;
	rv:1.9.1b3pre) Gecko/20090223 Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49FAE94F.2090101@doredevelopment.dk>
	<200905020946.08201.marcin@juszkiewicz.com.pl>
In-Reply-To: <200905020946.08201.marcin@juszkiewicz.com.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Sat, 02 May 2009 09:35:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02-05-2009 09:45, Marcin Juszkiewicz wrote:
> Dnia pi=C4=85tek, 1 maja 2009 o 14:21:35 Martin Lund napisa=C5=82(a):
>   =20
>> The "Micro" distribution/image is created because we feel that there
>> is a need for a truly tiny and clean distro and image definition in
>> OE for those users out there that needs a very tiny Linux rootfs with
>> virtually nothing installed except busybox, libc, udev, and a few
>> init scripts. On arm the jffs2 image size is only 1 MB (uclibc
>> based). No bloat allowed.
>>     =20
>
> You already mentioned that you have a bloat in that image - udev is not
> required as busybox-mdev can also populate /dev/ with nodes.
>
> Regards,
>   =20
Its still work in progress -  thats why I wrote the following in my wiki=20
todo list ;)

* Replace udev with mdev (a big maybe, depends on mdev maturity)

Initially udev is the one thing that I dont want to compromise too much=20
on functionality - its important that the device nodes are created=20
correctly. Disregarding code size, the real downside by picking mdev is=20
that the implementation supports a different rule base (at least that=20
was so last time I checked - be it some time ago and back then it was=20
also quite buggy).

Im going to give mdev a new review soon -  most likely I will go with=20
mdev in the end for the sake of keeping things simple and tiny=20
regardless of its limitations.

Actually I plan to review the whole busybox configuration to make sure=20
its fit.

Br, Martin

