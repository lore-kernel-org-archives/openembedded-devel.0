Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1RNXsE-0007BF-Ej
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 23:41:02 +0100
Received: by eyd9 with SMTP id 9so3818926eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 14:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1AczAf5Et8/fTxzhk16IpZMR1DpDbWlmEwEtPKGKNmw=;
	b=KYDvYFjgpUrNXt5+oIyAUfRX8hA8LaaRPhcyaFMXUpTUpWAKGQ8HOE2PTyviLyWwO+
	zr7MoN7WGac/bBkGh/PoeCjzoI28jGe028h/qvgk+caNt3UvOeneYV2nQJ1G+pg21PNP
	UQc+qLeShxGafgx+vQZMftQ8YYOf14dwE1rvU=
MIME-Version: 1.0
Received: by 10.14.3.168 with SMTP id 40mr2331239eeh.130.1320705288523; Mon,
	07 Nov 2011 14:34:48 -0800 (PST)
Received: by 10.14.37.3 with HTTP; Mon, 7 Nov 2011 14:34:48 -0800 (PST)
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12DBA31174@shsmsx501.ccr.corp.intel.com>
References: <CAE21AQr7mWqM=RQZBk8k2FUkQW8=jXb6vPBL3k6SnXF5sqRSPg@mail.gmail.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12DBA31174@shsmsx501.ccr.corp.intel.com>
Date: Tue, 8 Nov 2011 11:34:48 +1300
Message-ID: <CAE21AQoKSk=GDpKuxH-br02QNf0vxiy7MR1sV2hcayAUpVxzvg@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Understanding recipes vs packages
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
X-List-Received-Date: Mon, 07 Nov 2011 22:41:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2011 at 6:15 PM, Xu, Dongxiao <dongxiao.xu@intel.com> wrote:
> Hi Charles,
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Charles Manning
>> Sent: Monday, November 07, 2011 11:32 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] Understanding recipes vs packages
>>
>> Hello
>>
>> Something very weird is going on with some changes I have made recently =
to a
>> custom image I am building.
>>
>> For some reason I was getting libpng12 built and now that no longer happ=
ens.
>>
>> In debugging this I've been doing things that now stump me.
>>
>> From my understanding, a recipe can build multiple different packages.
>> For example libpng.inc has the following in it:
>
> Yes, it is correct.
>
>>
>> PACKAGES =3D+ "${PN}12-dbg ${PN}12 ${PN}12-dev"
>>
>> FILES_${PN}12-dbg +=3D "${libdir}/libpng12*.dbg"
>> FILES_${PN}12 =3D "${libdir}/libpng12.so.*"
>> FILES_${PN}12-dev =3D "${libdir}/libpng12.* ${includedir}/libpng12
>> ${libdir}/pkgconfig/libpng12.pc"
>> FILES_${PN} =3D "${libdir}/lib*.so.*"
>> FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/*.a ${libdir}/pkgconfig \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/aclocal ${bindir} ${sbindir}"
>>
>>
>> Does that mean I should be able to build =A0libgpng12 as follows:
>>
>> bitbake libpng12
>
> No, package name could not be passed to bitbake as a parameter.
>
> Bitbake can accept a recipe name as its parameter, and it will process ta=
sks like "do_fetch", "do_unpack", ..., "do_package", etc. for that recipe. =
In the above case, libpng12 will be generated in do_package task, and then =
it will be archived into rpm/ipk/deb package formats.
>
> Try to run "bitbake libpng" and see if libpng12 is generated.

Yes it is.

OK thanks for the clarification....

So if I want to put the libpng12 in an image then do I need to do
something like:

# Add libpng to DEPENDS to get the recipe to build
# Add libpng12 to IMAGE_INSTALL because that's what I want in the package

DEPENDS +=3D " libpng"
IMAGE_INSTALL +=3D " libpng12"


