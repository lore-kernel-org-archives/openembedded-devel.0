Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Phk5K-0006X3-Ar
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 15:41:30 +0100
Received: by iwn8 with SMTP id 8so5741679iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 06:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=XZtXIKItT9NwZm+5PSK3zq749y4UOMs6UWHmzKwwuC4=;
	b=MTnFl+2AXJIn+kx4HUFRU/3Whg2HOzDMBwMxVVFjuHlyqd1Y83GSCQtvg2ZMRFTOrT
	3/x5mDB3NcHmbeAxlZehl7e+dF1sQgOnKzcfWR9xExZoRMUBWEpPcMUbQ/xyGgvx5Ap/
	RqRlCUbMj1oGI5uDwkswDYDn/HOE6F0J37mOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WS8t0AKRavY0xPAKtoGB8kzWVqcaX/nXktF3FNOtwIoq/ukm1C/N2KQVV71Aw2F/4J
	ox4QkknO2aCabXjR3pL4Zd/IBkHzQetITmNPOb/F61tRCj+hSXW0m88wi9b0hfYv194l
	H8BDoQQEqtiYeV9I/p8WkarF0pYuIhHD9Ta9w=
MIME-Version: 1.0
Received: by 10.231.19.201 with SMTP id c9mr6632882ibb.183.1295966441445; Tue,
	25 Jan 2011 06:40:41 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 06:40:41 -0800 (PST)
In-Reply-To: <ihmjum$vdq$2@dough.gmane.org>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> <ihmjum$vdq$2@dough.gmane.org>
Date: Tue, 25 Jan 2011 15:40:41 +0100
Message-ID: <AANLkTinHGa136tXLwyBO2L=TUOQP+kW2WQTLyjBEU0Zx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Tue, 25 Jan 2011 14:41:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-01-11 08:10, Koen Kooi wrote:
>> On 19-01-11 20:35, Philip Balister wrote:
>>> On 01/19/2011 11:21 AM, Koen Kooi wrote:
>>>> * Having rpath to sysroot is just as bad as one to workdir
>>
>>> When you do a build with this, how many recipes have issues?
>>
>> Console-image is clean now :)
>
> And angstrom-gnome-image as well, so can I get some Acks or tested-bys
> please?

NAK, I feel other distro's like shr and minimal should be given some
time to test this too. (and fix their issues)
Will try to set something up tonight or tomorrow.

Frans
>
>>
>>
>>> Philip
>>
>>
>>>>
>>>> Based on insane.bbclass from yocto
>>>>
>>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>> ---
>>>> =A0 classes/insane.bbclass | =A0 11 ++++++-----
>>>> =A0 1 files changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
>>>> index 677db27..50752b5 100644
>>>> --- a/classes/insane.bbclass
>>>> +++ b/classes/insane.bbclass
>>>> @@ -160,20 +160,21 @@ def package_qa_check_rpath(file,name,d, elf):
>>>> =A0 =A0 =A0 import bb, os
>>>> =A0 =A0 =A0 sane =3D True
>>>> =A0 =A0 =A0 scanelf =3D
>>>> os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
>>>> - =A0 =A0bad_dir =3D bb.data.getVar('TMPDIR', d, True) + "/work"
>>>> + =A0 =A0bad_dirs =3D [bb.data.getVar('TMPDIR', d, True) + "/work",
>>>> bb.data.getVar('STAGING_DIR_TARGET', d, True)]
>>>> =A0 =A0 =A0 bad_dir_test =3D bb.data.getVar('TMPDIR', d, True)
>>>> =A0 =A0 =A0 if not os.path.exists(scanelf):
>>>> =A0 =A0 =A0 =A0 =A0 bb.fatal("Can not check RPATH, scanelf (part of
>>>> pax-utils-native) not found")
>>>>
>>>> - =A0 =A0if not bad_dir in bb.data.getVar('WORKDIR', d, True):
>>>> + =A0 =A0if not bad_dirs[0] in bb.data.getVar('WORKDIR', d, True):
>>>> =A0 =A0 =A0 =A0 =A0 bb.fatal("This class assumed that WORKDIR is
>>>> ${TMPDIR}/work... Not doing any check")
>>>>
>>>> =A0 =A0 =A0 output =3D os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
>>>> =A0 =A0 =A0 txt =A0 =A0=3D output.readline().split()
>>>> =A0 =A0 =A0 for line in txt:
>>>> - =A0 =A0 =A0 =A0if bad_dir in line:
>>>> - =A0 =A0 =A0 =A0 =A0 =A0error_msg =3D "package %s contains bad RPATH =
%s in file %s"
>>>> % (name, line, file)
>>>> - =A0 =A0 =A0 =A0 =A0 =A0sane =3D package_qa_handle_error(1, error_msg=
, name, file, d)
>>>> + =A0 =A0 =A0 =A0for dir in bad_dirs:
>>>> + =A0 =A0 =A0 =A0 =A0 =A0if dir in line:
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0error_msg =3D "package %s contains ba=
d RPATH %s in file
>>>> %s" % (name, line, file)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sane =3D sane + package_qa_handle_err=
or(1, error_msg,
>>>> name, file, d)
>>>>
>>>> =A0 =A0 =A0 return sane
>>>>
>>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNPtMWMkyGM64RGpERAoWvAKC2+GgE7rmeUXUClmBBlAx5WB1dNgCgjGlf
> IkvPXdAoZ6J072F/YSctiyE=3D
> =3DPndr
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


