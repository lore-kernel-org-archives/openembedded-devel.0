Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZwnp-0006PH-Mq
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 04:06:58 +0200
Received: by iwn34 with SMTP id 34so2867858iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 19:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Mfqr0NodXgC/Sx4vkiv9nOXbUtSchDtpmuVD3OoB87U=;
	b=A7/QiAJbbbxLD7DbH55tAS42gybN7SMuyU78VI7SiXTpuoi/x0hBWzxUWaaucPS6Wy
	SK2syd9xTqqgo9S+8WGAXarbChrmnNEuiXVPD+v0PFvvQs4bZn10s+S7kTcWBqkVIw3j
	Gt12epNGOzjRN4gbS0VXSwArIGBxLH0ZJC9a4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hzYN0EtYYcnzuUhjzlom+5tf3s/TwbYshG9VG8WS8oAJKtbDltThwQ9AIo6nMu0g0e
	UZ1qK4DEAUdzdWJMcgeM0sxxlxM3/e0EaOsjLTh5Eu0MZIIfK40LVk6Ebccq8W5mTmC7
	FvrG17e0z2j8l7wbhhjtfvhpBBxQwYNv0XQmU=
Received: by 10.231.39.134 with SMTP id g6mr1769583ibe.8.1279332412583; Fri, 
	16 Jul 2010 19:06:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Fri, 16 Jul 2010 19:06:32 -0700 (PDT)
In-Reply-To: <i1qogv$i28$2@dough.gmane.org>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa> 
	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com> 
	<i1qogv$i28$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jul 2010 19:06:32 -0700
Message-ID: <AANLkTin6E1D5KENkaXn4lf4dF8hog7f-bnDmDXSWQn7L@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB 	big, since some executables are 100 MB each
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
X-List-Received-Date: Sat, 17 Jul 2010 02:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 16, 2010 at 4:03 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 16-07-10 17:23, Khem Raj wrote:
>> On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
>> <paulepanter@users.sourceforge.net> wrote:
>>> Dear OE folks,
>>>
>>>
>>> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
>>>
>>>> I ran out of space and noticed
>>>>
>>>> =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
>>>>
>>>> is 8,1G big.
>>>>
>>>> Some of the executable files in
>>>>
>>>> =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-de=
stdir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
>>>>
>>>> are 101 MB big.
>>
>> its most probably the -g3/-ggdb3 bloat.
>
> No, it's git not creating (hard)links but copies of the same app. Run an
> md5sum on the binaries, they will all match. I suggest you stop
> spreading FUD about -ggdb3, it is not being appriciated.

Hi Koen

Its not FUD and I only speak of what I see with my eyes. I have data
to prove it. Compile uclibc with ggdb3 and it ends up with 202M of
shared library and without its only ~600K. (with gcc 4.4 and 4.5) I
have similar experience with 4.3 but I dont
have a build handy to see how big the binaries got.

same for git native without -ggdb3 I get 1.4M of git executable and above 1=
00M
with -ggdb3 now if you copy 101M of binary 10 times it will highlight
the problem
even more.

I will post complete result of a consol-image build with -ggdb3 and
without it for reference and to clear FUD as well.

I agree FUD should not be appreciated but facts should.

Thanks
-Khem



> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMQOVfMkyGM64RGpERAjW7AKCwH5aLnQ5AbEC8PESZf7Ny7psLsQCgt1Ve
> Z1rBOhQsiOxILfsDfyNLqrE=3D
> =3DOQOZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


