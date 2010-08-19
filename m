Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmAX3-0007OO-2h
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 21:12:13 +0200
Received: by iwn38 with SMTP id 38so2047175iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0kSLDDTJza7QMqut9lT1egmdjh+LzQftpT7MUv2VqH4=;
	b=P2uON0fh4KQeoibGncEGA5gelCYaYZPUBjNo2y5ispD6UX6FmG43sOzZ83Ox4nWL9S
	jVIOUdHQ89CSO7Rpkg3nSKgOf/OmbOPRyHTw7OoJddEr1avuqiOZKGhPUzm8smEmdD8b
	zuMsWlexf122RPw9e05Y9fNkvrYbmB3/u6h8Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g0pz5siWx/VYeC4zLD86baf/Cs+moyZ1N/D4X6eUhZvgUhecmV8C3vym0xJi/QdCIP
	Lz0g3jyfHarcuyZ2H8oISzH2aFjW7av8xx4NeL1B5Zs+JbmIOEfg2Mql175DtmfLeW4+
	f0CruowKGxL04//HMEh8u5ywpDYSF/IpONgng=
MIME-Version: 1.0
Received: by 10.231.15.70 with SMTP id j6mr274922iba.12.1282245092542; Thu, 19
	Aug 2010 12:11:32 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 12:11:32 -0700 (PDT)
In-Reply-To: <AANLkTinbLOK+FkKCKxkrA0pCQDD0O6DbimBUbDEv0dKZ@mail.gmail.com>
References: <AANLkTinbLOK+FkKCKxkrA0pCQDD0O6DbimBUbDEv0dKZ@mail.gmail.com>
Date: Thu, 19 Aug 2010 21:11:32 +0200
Message-ID: <AANLkTi=5ivJ0kYQ_H_-0fRUXnvXvD0eMX-5=OGf371mG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Creating a new recipe, how to fix config.log: CROSS COMPILE Badness /usr/include in INCLUDEPATH?
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
X-List-Received-Date: Thu, 19 Aug 2010 19:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/19 AJ ONeal <coolaj86@gmail.com>:
> I'm assuming that this "CROSS COMPILE Badness" is part of OE and not part=
 of
> the package.

Right
>
> What is it that I need to do to correct this error? Please point me in th=
e
> right direction.

see below
>
>
> NOTE: Running task 391 of 552 (ID: 8,
> /home/coolaj86/overo-oe/user.collection/recipes/nodejs/nodejs_0.1.104.bb,
> do_qa_configure)
> ERROR: This autoconf log indicates errors, it looked at host includes.
> Rerun configure task after fixing this.
>
>
>
>
> config.log:
> ----------------------------------------
> Checking for library execinfo
> =3D=3D>
>
> int main() {
> =A0return 0;
> }
>
> <=3D=3D
> [1/2] cxx: build/.conf_check_0/test.cpp ->
> build/.conf_check_0/testbuild/default/test_1.o
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
> cc1plus: internal compiler error: in add_path, at c-incpath.c:425
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> ['arm-angstrom-linux-gnueabi-g++', '-march=3Darmv7-a', '-mtune=3Dcortex-a=
8',
> '-mfpu=3Dneon', '-mfloat-abi=3Dsoftfp',
> '-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include',
> '-fexpensive-optimizations', '-frename-registers', '-fomit-frame-pointer'=
,
> '-O2', '-ggdb3', '-fpermissive', '-fvisibility-inlines-hidden',
> '-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include',
> '-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include',
> '-I/usr/local/include', '-I/usr/include', '../test.cpp', '-c', '-o',

The line above contains the bad guys. -I/usr/include and
-I/usr/local/include point to dirs on your host system, not to cross
include dirs.
You might have to redefine an env var (e.g. INCDIR) or you need to
patch the makefile it it contains a hard-coded path.

Good luck with your recipe.
Frans


