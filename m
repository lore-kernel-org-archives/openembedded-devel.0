Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PCx6y-0003GX-N7
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 17:19:57 +0100
Received: by wwb39 with SMTP id 39so17008wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KXJ/cbvKDKxyd9zKY2udd9CWzhLMzXYjOyY2YeSi+Sc=;
	b=WY+5to56ZClhKVs++S5yTrqH+AUTdu7P76qLru6R8GjU2Fqxv+B+L2kDLyqPnRDN48
	nK4D++6yCmVU/+PtRGAPskIhlM/9gkTE5OGs1mMLaL+Uod4ZEdpmZV8Ac9wz5iRC17TU
	cAuGjGCB47PVXmeQclDLiTjxEtmRzY39tpZnM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KgBKdXn7DA/1ko8sQcdhYmn9X6Io/aKisBOEY51nOTziXfMdRLZLrJRLxZlEzQgmsy
	Q9YbRa7D8VDITiSV7oKrfEhRPuP+k4A+ar8sJk0QJ3wzaC570FPHhspyDbbAJll+D/jW
	dUZtWcddR4gv+88qwqovxNuKI9amDzABDImnk=
MIME-Version: 1.0
Received: by 10.216.53.4 with SMTP id f4mr973781wec.4.1288628347114; Mon, 01
	Nov 2010 09:19:07 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Mon, 1 Nov 2010 09:19:07 -0700 (PDT)
In-Reply-To: <iakpd7$ja7$1@dough.gmane.org>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
Date: Mon, 1 Nov 2010 12:19:07 -0400
Message-ID: <AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 16:19:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 31, 2010 at 6:08 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-10-10 22:03, Yuri Bushmelev wrote:
>> 2010/10/29 Cliff Brake <cliff.brake@gmail.com>:
>>> testing-next is ready for clean builds. =A0I'm still working on my
>>> process to get this branch created automatically--thanks for your
>>> patience.
>>
>> I have joined to testing initiative with:
>>
>> DISTROS=3D"angstrom-2008.1 minimal"
>> MACHINES=3D"tosa collie akita efikamx ben-nanonote qemux86 qemuarm"
>> IMAGES=3D"x11-image opie-image"
>>
>> Test-builder will build every image for every machine for every distro
>> from list.
>> Every build will be started with clean $TMPDIR for now at least
>
> I mentioned this at OEDEM as well, only doing clean builds hides upgrade
> path type of bugs (e.g. libcdio5 -> libcdio). It would be nice if an
> incremental build going from testing-prev to testing-next would be done
> as well before tagging.

Good idea--I agree this would be good to do where possible, as it
would not cost much, and help us identify issues.  The main focus of
current testing is to identify good starting points for new users, or
people just looking for a build-able snapshot, so clean builds are
where we started.  I'll add a note to the wiki to build incremental
builds first if possible.  Based on the feedback of people doing the
actual testing work, perhaps it will make sense to do something else
in the future.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


