Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQyWL-00033U-Pv
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 10:07:53 +0200
Received: by bwz14 with SMTP id 14so1477769bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 01:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=O0QeNQRNqOlXq+3gFGlWEF6fm/SRoZ5tijfIvh6yBAU=;
	b=WZ8Prc+XUIdDP3nwXdy2/3gm9/5fgUgR7rVblkWxtB5ydU3XEbPM86050F9VWx4q9J
	mjhDAVTiU9xP7jM6k070UAFI0SdBoGemYJUM4vVuPnAQmiT6Rr2kWArHCsNMm1/9qFFR
	K9q5Acvc9V53VI0bKByBOM88seDAAnkHQIpiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=S484cf0ATOImh7pnVCwEwnFYKqz2u3Z9dZqJkatK1+cGHV8/NMZnbPCI/FhGFQRNcJ
	U9NDDQ0tAt2H7DfOVJgenT7n6gqg/Ynt7T5vMrILg5yR3jc1ERji/oufy1rY38DhLTnY
	1jPWP9hBnzn/x4WXJQzRuTI4gPLqRz3T60GII=
MIME-Version: 1.0
Received: by 10.204.83.221 with SMTP id g29mr3872473bkl.124.1277193796398; 
	Tue, 22 Jun 2010 01:03:16 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Tue, 22 Jun 2010 01:03:16 -0700 (PDT)
In-Reply-To: <201006220930.31306.marcin@juszkiewicz.com.pl>
References: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
	<201006220930.31306.marcin@juszkiewicz.com.pl>
Date: Tue, 22 Jun 2010 10:03:16 +0200
Message-ID: <AANLkTin-J4RXc-qW5uBEelky53O_kvYbYQDx3IfnXYvg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] patch file location
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
X-List-Received-Date: Tue, 22 Jun 2010 08:07:54 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/6/22 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia wtorek, 22 czerwca 2010 o 09:03:43 Frans Meulenbroeks napisa=B3(a):
>> I'd like to draw the attention to the location of patch files.
>> My original understanding was that these should be in either the files
>> dir (if they apply to all), or in a dir with the name of the recipe
>> (replacing the _ with a - ).
>>
>> And I kind-a assumed that if a patch is in a recipe dir it would have
>> priority above a version in the files dir.
>
> This is controlled by FILESPATHPKG and OVERRIDES.
>
>> Frankly speaking I have no clue at all which version of the patch will
>> be used by the 2.10.1 recipe.
>
> glibc-2.4/ one - check FILESPATHPKG setting in glibc_2.10.1.bb recipe.
>
>> The only ways to find out is to study the class code that does the patch=
 or
>> to actually build the package (in the hope it selects the patch in a
>> deterministic way).
>
> I did "grep FILES glibc/*" to find out.
>
>> I don't think it is good that if someone is debugging a problem that the=
y
>> should have such a hard time to find out what version of a file is
>> actually used
>
>> My proposal:
>> - only apply patches (seek for patches) in the recipe dir (e.g. in the
>> example for glibc_2.10.1.bb this would be glibc-2.10.1) and in the
>> files directory
>
> It is not only patches. It is everything in SRC_URI. And we have this
> mechanism since beginning.
>
>> (optionally we might allow for a mechanism that allows specifying
>> patches for higher level recipes; e.g. glibc_2.10.1 could look in
>> glibc-2.10.1, glibc-2.10, glibc-2, glibc and files).
>
> We have such mechanism already - it is FILESPATHPKG and related vars.
>
>> How do people feel about this? Any implementation hints?
>
> Why implement when it is already implemented?
>

hrw thanks for your clarification.
Guess the confusion is caused because FILESPATHPKG does not seem to be
documented, so I was unaware of its existence and meaning.

http://docs.openembedded.org/usermanual/html/recipes_directories.html#recip=
es_filespath_dir
does not mention it but does explain the standard structure.
Guess something could be added there

BTW: I feel referring to patches in dirs of other versions (like
2.10.1 referring to 2.4) is not too clear and somewhat more
error-prone, and should be discouraged.

Did a quick grep. On 47 places there is a FILESPATHPKG.
Some just do things like: :FILESPATHPKG .=3D ":gcc-$PV (actually
shouldn't that be gcc-${PV} )
That might be added to the default search path.

(actually even found a forward reference:
recipes/gcc/gcc-4.1.0.inc:FILESPATHPKG .=3D ":gcc-4.1.1") :-)

Frans.


