Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7myU-0005O5-Tj
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:29:52 +0200
Received: by iwn2 with SMTP id 2so1042396iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ymSgWp0mIEPMVHLaAtTpD7ryNioyBtNqBhbeglqTCK8=;
	b=PELDyUshvmMe5+gxNRwkvtFhzQMFVRSJa6k3OEavWmmuYQwI3z7Gd1eZUsULiDp4Ps
	UEEAZ0SrMXbAwPuPqGvnEgCTWI1fQaiXkrrOFSIg8JGEGyOfQd1bh6XjIDdcstfPHq02
	7YQqsZ/cE8GvFIMSikx19Y8sDZJ+vgv1oimKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=A63NpahcqpNRch5yt3VDfXkh/dl+StEAjJNR265Y8pD0o4Jlk1i+sbxlVSJJbU36MY
	jIyfWyvfnv/3QTG6Z9UQWPdtnHoom+AB6/WP+f9xBNQa2APFCHafCov8tZba5UMmEDke
	o4zqiJLFHPHAY3fvD0Nhm6jKwSnSwqHwTdoDE=
MIME-Version: 1.0
Received: by 10.231.33.129 with SMTP id h1mr2879057ibd.140.1287397755064; Mon,
	18 Oct 2010 03:29:15 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 03:29:15 -0700 (PDT)
In-Reply-To: <1287397072.1720.17.camel@rex>
References: <20101017211540.GB3324@jama> <i9gshu$8r0$2@dough.gmane.org>
	<1287397072.1720.17.camel@rex>
Date: Mon, 18 Oct 2010 12:29:15 +0200
Message-ID: <AANLkTiniayCiU-D9qNFOsoROCfQrj5c0bguHA0rvCVxc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] do we really need all OVERRIDES in FILESPATH?
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
X-List-Received-Date: Mon, 18 Oct 2010 10:29:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/18 Richard Purdie <rpurdie@rpsys.net>:
> On Mon, 2010-10-18 at 09:21 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 17-10-10 23:15, Martin Jansa wrote:
>> > Currently
>> > bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH=3D | sed "s/:=
/\n/g" | wc -l
>> > shows 65 directories where file:// from SRC_URI can be found.
>> >
>> > base_do_unpack is looking for first directory where requested file
>> > exists. Most files are IMHO found in FILESPATHPKG PN, files or P
>> > (without an override used)
>> >
>> > Number of directories tried before
>> > PN: =A0 =A038
>> > files: 51
>> > P: =A0 =A0 25
>> >
>> > I see many recipes really using that MACHINE or DISTRO is in FILESPATH=
,
>> > few users of TARGET_ARCH and quick find/grep doesn't show any users of
>> > other OVERRIDES in FILESPATH.
>> >
>> > BTW: ie initscripts have initscripts/files/arm/alignment.sh but that's=
 only
>> > alignment.sh and SRC_URI_append_arm =3D " file://alignment.sh" would w=
ork
>> > ok even without arm in FILESPATH.
>> >
>> > What about using only ${TARGET_ARCH}:${DISTRO}:${MACHINE} in FILESPATH
>> > instead all OVERRIDES?
>>
>> At least I additionally need BASE_PACKAGE_ARCH and SOC_FAMILY in it and
>> sometimes libc-$LIBC.
>
> I have to admit, the structure of FILESPATH is a little unwieldy to me.
> I'd propose that we should have a small set of defaults like ${BPN} and
> ${BPN}-${PV} and if any recipe wants more than this, it should have a
> variable it can append a list to.
>
> I'd also suggest "files" should probably be deprecated in favour of BPN.

I'm all in favour of that but....
- we currently have 724 files directories (so this is some work)
- I'm not fully sure this will work for packages that have recipes
with different names (e.g. alsa), ofc we could rework these and add a
FILESPATHPKG
- not sure if removing files completely will not cause any problems
for the top level files dir (which contains some static device tables
(then again I didn't really found that to be an appropriate place
either)

BTW in my overlay in the top level files folders I also keep my own
busybox config. Not sure how others deal with that, but I can image
that also becomes broken
>
> It becomes obvious how horrible the current structure is when you try
> and use .bbappend and need to add some extra directory to the search
> path.
>

Agree. Frans.


