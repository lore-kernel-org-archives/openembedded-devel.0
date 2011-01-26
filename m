Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pi9zB-0005yw-ER
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:20:54 +0100
Received: by iwn8 with SMTP id 8so1194405iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=ReM6hy0RnOp/aM+1eF/gyExJdV9ud6WWua75tx/30sw=;
	b=G66+TgBfFv0SRH6H1tzXNAIUM9VnSzju1dpnxtcn4kSbPXC8IfPH5RH3K+xvdkHr5C
	8nkS+0W2TspAaqV3yUcImGVfu7BPI8eDH4AjY8sJFIzVpY3EUeqafK3biSGQEnIrv0XB
	J492vrspV85iVYDHZ+5ohnUL5OWmBIgz3gU/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rlDHxb8j37aeGctTN4g4baAk8PEQ5QUw/YprEJThctrGqFzToe7VHgddlGtB6thEQE
	XhXxDbW7qcJc+czIumGLY76DWJ2v+ufQ+A3el6Oa/OZc5ZdlhY0I0WDiTvcyYovbnaq7
	IvFLgSqzCYmaJv7m1nLtKqTlqkDc/KKQO+B1k=
MIME-Version: 1.0
Received: by 10.231.19.201 with SMTP id c9mr8602358ibb.183.1296066006550; Wed,
	26 Jan 2011 10:20:06 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Wed, 26 Jan 2011 10:20:06 -0800 (PST)
In-Reply-To: <ihmjum$vdq$2@dough.gmane.org>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> <ihmjum$vdq$2@dough.gmane.org>
Date: Wed, 26 Jan 2011 19:20:06 +0100
Message-ID: <AANLkTinig0aagQgX-11UzmNmAce=H5RvC+_eMnLMYTN+@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Jan 2011 18:20:54 -0000
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

Wanted to start testing but apparently this was already pushed 4 days
ago by Khem.
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/classes/insane.bb=
class?id=3D6aa31074adaccffcfd3080e8390065ab5abda2a6

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


