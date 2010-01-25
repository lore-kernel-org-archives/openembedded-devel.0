Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NZJLE-0000WW-5f
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 08:26:35 +0100
Received: by yxe5 with SMTP id 5so2568611yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 23:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=euLD85K6iJOOjfU3rIBbLeczP/Ns+3y8cQ+0amJTwQo=;
	b=DE9AgYmiPQDeQTgchp9wBEUpqDSK/cVHgyAS7SZ/2XsEdR6M60Nvv9ymmdqMFzqLge
	V9KoL7QYdZKIpXODUimsMpaIKR5ehYe94DLVIvXHJcugGk1TmYaubzK3vYIjZtRtiL01
	AdsA9w7k6BKUCjBAww/JLVYBZ2sSDnIR7K5vw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MFpndgM459ucw6SlqvQhdXLlC5qsV3cIjy4PLRdW0b/7AVPBsER13145q7fnWd6vcD
	KB3NqoFFljpF9BM2xIRX/yW8B48LcQX7qNsRtfnPwQUUxHDqPDnMpVfkYvLv/a9BY85U
	1siLQ90Bn1lQbRk56nqlsi5GgRI/H2eSCY7yo=
MIME-Version: 1.0
Received: by 10.101.213.34 with SMTP id p34mr6396415anq.1.1264404251833; Sun, 
	24 Jan 2010 23:24:11 -0800 (PST)
In-Reply-To: <19c1b8a91001242318y24f120a4s55d5fc17a5d70def@mail.gmail.com>
References: <20100125015636.GA9855@denix.org>
	<1264384785-30439-3-git-send-email-denis@denix.org>
	<19c1b8a91001242318y24f120a4s55d5fc17a5d70def@mail.gmail.com>
Date: Mon, 25 Jan 2010 08:24:11 +0100
Message-ID: <ac9c93b11001242324g4ef5a426td517f965ffde8720@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] base.bbclass: don't pre-generate checksums.ini entries any longer
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
X-List-Received-Date: Mon, 25 Jan 2010 07:26:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/25 Khem Raj <raj.khem@gmail.com>:
> On Sun, Jan 24, 2010 at 5:59 PM, Denys Dmytriyenko <denis@denix.org> wrot=
e:
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> ---
>> =A0classes/base.bbclass | =A0 15 +--------------
>> =A01 files changed, 1 insertions(+), 14 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index 8465286..8e14636 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -140,18 +140,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpat=
h, data):
>> =A0 =A0 except OSError:
>> =A0 =A0 =A0 =A0 raise Exception("Executing shasum failed")
>>
>> - =A0 =A0if no_checksum =3D=3D True: =A0 =A0# we do not have conf/checks=
ums.ini entry
>> - =A0 =A0 =A0 =A0try:
>> - =A0 =A0 =A0 =A0 =A0 =A0file =3D open("%s/checksums.ini" % bb.data.getV=
ar("TMPDIR", data, 1), "a")
>> - =A0 =A0 =A0 =A0except:
>> - =A0 =A0 =A0 =A0 =A0 =A0return False
>> -
>> - =A0 =A0 =A0 =A0if not file:
>> - =A0 =A0 =A0 =A0 =A0 =A0raise Exception("Creating checksums.ini failed"=
)
>> -
>> - =A0 =A0 =A0 =A0file.write("[%s]\nmd5=3D%s\nsha256=3D%s\n\n" % (src_uri=
, md5data, shadata))
>> - =A0 =A0 =A0 =A0file.close()
>> -
>> + =A0 =A0if no_checksum =3D=3D True: =A0 =A0# we do not have SRC_URI che=
cksums
>> =A0 =A0 =A0 =A0 from string import maketrans
>> =A0 =A0 =A0 =A0 trtable =3D maketrans("", "")
>> =A0 =A0 =A0 =A0 uname =3D src_uri.split("/")[-1].translate(trtable, "-+.=
_")
>> @@ -168,8 +157,6 @@ def base_chk_file(parser, pn, pv, src_uri, localpath=
, data):
>> =A0 =A0 =A0 =A0 ufile.close()
>>
>> =A0 =A0 =A0 =A0 if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
>> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("This package has no entry in checksums=
.ini, please add one")
>> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("\n[%s]\nmd5=3D%s\nsha256=3D%s" % (src_=
uri, md5data, shadata))
>> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("This package has no checksums in corres=
ponding recipe, please add")
>> =A0 =A0 =A0 =A0 =A0 =A0 bb.note("SRC_URI =3D \"%s;name=3D%s\"\nSRC_URI[%=
s.md5sum] =3D \"%s\"\nSRC_URI[%s.sha256sum] =3D \"%s\"\n" % (src_uri, uname=
, uname, md5data, uname, shadata))
>> =A0 =A0 =A0 =A0 =A0 =A0 return True
>> --
>
> OK
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Do we want to do this at this point? Or say in a week (or two) after
people got acquainted  to the new format.

Btw: I'm not really a script kiddie, but I guess it should not be too
difficult to cook up a script to update the recipes so we can abandon
checksums.ini
(two mechanisms does not seem to be the right way).
Any takers?

Frans


