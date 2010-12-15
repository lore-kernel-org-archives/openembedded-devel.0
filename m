Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PSoL4-0005m1-Ui
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 11:12:05 +0100
Received: by iwn8 with SMTP id 8so1976987iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=cR8DZ3xhmRd5ga79hg2hY/IMrb5EbWMX+FZpV/JQziE=;
	b=Pvb74or3W97LPqPF+7lKVBxtE7PszUSW60lLsw7JUdEOg/gIrTg3luLyzlR3FVrqhy
	fISI4lB/YcmnSH77KTAlpRskRCMJWxs2z0slTcr/fNhhnC+mf60qsMItMl2QvrTriTgR
	uUBwqQa9hfIPhpXC0so+fiPD29ZZETfsuqJAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wxMUGF9PN8zgIKYL8gbgBA/xaMFHRdYiJVX4HGFs+VPBhI03TTRUf3OzRg8a+Rtg30
	bmmku0YGmC3SB9jKAW4Txq/E3zLqTbGWngWB/KJ/+WNPOIPOe7Tap2rrbavykHetaI7W
	NIXG8hJ4Ytf9iR3cpOa1nGYVNbVDDKXHV/h6M=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr4637119ibb.57.1292407826597;
	Wed, 15 Dec 2010 02:10:26 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 15 Dec 2010 02:10:26 -0800 (PST)
In-Reply-To: <AANLkTinQRHzSyLwso9MBC2JDRd76056_T2Nutfedtrn_@mail.gmail.com>
References: <AANLkTimMz5m27fxSGVw-YyOAH2=Wbye2Ug71mZ9t+py1@mail.gmail.com>
	<AANLkTinQRHzSyLwso9MBC2JDRd76056_T2Nutfedtrn_@mail.gmail.com>
Date: Wed, 15 Dec 2010 11:10:26 +0100
Message-ID: <AANLkTin5G7ObMsQAE-DZEi8K4hA=gDcHs1gDRaKG_-yJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stop Libtool relinking against host's /usr/lib (file format not recognised)
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
X-List-Received-Date: Wed, 15 Dec 2010 10:12:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/15 Martin Panter <vadmium+floss@gmail.com>:
> On 15/12/2010, Martin Panter <vadmium+floss@gmail.com> wrote:
>> So far in my attempt to build Angstrom for my Beagle board I've found
>> two instances where Libtool is trying to "relink" against host
>> libraries.
>>
>> The first looks like it's already been fixed in the past with a patch
>> to Libtool (recipes/libtool/libtool-2.2.6b/cross_compile.patch), but
>> at least for me that fix is being bypassed. The patch changes the
>> ltmain.m4sh source file but in the Libtool tarball there is already an
>> ltmain.sh generated file which seems to be used instead.
>>
>> It looks like running Libtool's "bootstrap" script regenerates
>> libtool.sh, and I've changed my code to do this according to the
>> attached "libtool-bootstrap.diff.txt".
>>
>> The second instance is with SDL which seems to provide its own Libtool
>> script. It looks like Git commit
>> a23202736001afe7f520ef64e2431d9f994130b8 (2010-11-14) removed a patch
>> that previously fixed my problem, so I restored the relevant bit
>> according to the attached "sdl-libtool-host-dir.diff.txt".
>>
>> The original problem that led me to this was that it was failing at a
>> Free type "install" step. (And then later for the SDL install step.)
>> For reference, the Free type messages were something like this,
>> paraphrased to remove the ridiculously long path names:
>>
>> NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool DESTDIR=${IMAGE}
>> install
>> . . .
>> arm-angstrom-linux-gnueabi-libtool --mode=install
>> ${SYS}/usr/bin/install -c ${OBJS}/libfreetype.la ${IMAGE}/usr/lib
>> arm-angstrom-linux-gnueabi-libtool: install: warning: relinking
>> `${OBJS}/libfreetype.la'
>> arm-angstrom-linux-gnueabi-libtool: relink:
>> arm-angstrom-linux-gnueabi-gcc . . . -L${SYS}/usr/lib
>> -L${IMAGE}/usr/lib -L/usr/lib -lz . . .
>> /usr/lib/libgcc_s.so: file not recognized: File format not recognized
>>
>> It turned out that on my host computer (Arch linux x68_64) I indeed
>> have this /usr/lib/libgcc_s.so file. I temporarily moved it out of the
>> way and the relink and install worked fine. The linker seemed to be
>> trying to use that file because of the -L/usr/lib option passed to it,
>> and one of the changes in cross_compile.patch removes that -L/usr/lib
>> option.
>
> PS: I think the same issue might be the cause of the problem mentioned
> in the "gettext libtool ARM issue" thread. It also looks like it's
> running a local version of Libtool, a -L/usr/lib option gets passed to
> GCC, and then the "File format not recognized" error.
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027797.html
>

Thanks.
As the reporter of the gettext problem it at least gives me a
suggestion on where to look.

Frans


