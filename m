Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Ob6nH-0005Oz-I4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 08:59:14 +0200
Received: by gwj22 with SMTP id 22so2602911gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZPjoIz8as8iNy5JlLs/K1/DmE6BKmZoWPM/k5aa8/04=;
	b=XfBsJtMPcnvRsgXciVidEOesuOHjA6u9lwNVc51CJeglwu8vD5FHCmJSVRiopw5rSb
	s/67qIpupdht64J205CGul+fjC8hL8WEZXwV2wU8vtqiyeh728kSMNm60BPtFIMPzVBZ
	60DFT0uoDAjvWxECg46Rr7wofvMsFbuX+6A3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oqezQADlBP+Id5on7SBRC1dGem4wUsSd41a5bzvRnUSuSUdgGf07Cy1yvs0s2hCs20
	zhdVQQeQex4Bt4XIE4FndsqbxhM++qKF/HPraycQh77QKCsVbVcIH3t17cQDc5jg+M4/
	aphEjLCLLAwTWJ8SIpp9pyVtNVn4BWX6T7KWQ=
MIME-Version: 1.0
Received: by 10.100.194.9 with SMTP id r9mr6003170anf.129.1279609141484; Mon, 
	19 Jul 2010 23:59:01 -0700 (PDT)
Received: by 10.100.42.4 with HTTP; Mon, 19 Jul 2010 23:59:01 -0700 (PDT)
In-Reply-To: <20100720065108.GC1512@excalibur.local>
References: <AANLkTimlxdwUxIog99H_Er_QL-tzZ5Ntd9kTyT8BcG-Y@mail.gmail.com>
	<20100720065108.GC1512@excalibur.local>
Date: Mon, 19 Jul 2010 23:59:01 -0700
Message-ID: <AANLkTikm8U6XCOc_dOqWPDQiQZf-4SYPb1FMT6oQGgil@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: GPSBABLE -- fixed recipe
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
X-List-Received-Date: Tue, 20 Jul 2010 06:59:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2010 at 11:51 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Mon, 2010-07-19 at 15:12, J. L. =A0wrote:
>> It had bad checksums here is the fixed file, hope this helps
>
> Did you check what the problem was with the checksum? Like the tarball ch=
anges
> upstream but stayed under the same name?

Yes I did check that I believe, it built properly after doing so, but
I am not able to complete my full build as of yet due to other build
issues.


>
>> SECTION =3D "console/utils"
>> DESCRIPTION =3D "GPS data converter"
>> DEPENDS =3D "expat virtual/libusb0"
>> HOMEPAGE =3D "http://www.gpsbabel.org/"
>> LICENSE =3D "GPL"
>>
>> SRC_URI =3D "http://www.gpsbabel.org/plan9.php?dl=3Dgpsbabel-${PV}.tar.g=
z \
>> =A0 =A0 =A0 =A0 =A0 =A0file://autotools.patch"
>>
>> inherit autotools pkgconfig
>>
>> SRC_URI[md5sum] =3D "d41d8cd98f00b204e9800998ecf8427e"
>> SRC_URI[sha256sum] =3D
>> "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
>
> Please prepare a git patch that could get applied easily. That would incl=
ude
> that you fix the recipe as you see fit, commit your changes into git, pre=
pare a
> patch (git format-patch -1) and then send it to the list (with git send-e=
mail or
> with your normal mail reader).
>
> This workflow looks like more work in the beginning but it pays off for y=
ou and
> us within the first two patches. :)

I am a VERY new beginner in all of this and would love to learn how to
do it all properly as I have found a few recipes that I want to build
but have issues. I will figure out how to do what your saying properly
and send in the patch.

Do I need to put my recipe back to the original in OE first before
making the patch? If this is way off you can just tell me to search on
google. Thanks for taking the time to let me know though I appreciate
it.

regards
Jeremy



>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


