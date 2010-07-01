Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUE6k-0004fy-Bg
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 09:22:52 +0200
Received: by iwn34 with SMTP id 34so1765119iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 00:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fESWPfKUKEeYxKNU2H8yJh299bVpLT3b0dedQw/mqwk=;
	b=mrxLzsnLR5SLQtXqrDqdsULlUxU1bv346axJ5XdzL6HcQrvVFNYpJbZDcGt8eLjx0+
	iYzv4PeXvX07sP9Ifp4Kgs0y/JFhak1xVJ8I0VtW9oz+TstEjQ5fgGrbi0ixu0phSOux
	aUdwTf2C5LFmluI7NX1QgVczppHrEALX5R8fk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BNwWwXJ+iheIx7oPawG1vxXJfpjrfVOmENly8brl1U+SXOIYKJCNuNYSwS3sZSAwiK
	TaObWQ8IcEYKV8SvyfKU+vxK9N5jEMUxIIAdF65VACCd9r1RGVDZFQ7frVlPtiBvLAOg
	NYtRblJXaydXscaMy4ejsG4kVa89JRC1IDv0Q=
MIME-Version: 1.0
Received: by 10.231.16.76 with SMTP id n12mr9366138iba.189.1277968687447; Thu, 
	01 Jul 2010 00:18:07 -0700 (PDT)
Received: by 10.231.144.21 with HTTP; Thu, 1 Jul 2010 00:18:07 -0700 (PDT)
In-Reply-To: <AANLkTimFH9gYI7fWz3QUmjBegcBmr0dfoJLwPYbyU3Xy@mail.gmail.com>
References: <4C2AC6F3.3090603@gmail.com>
	<AANLkTimFH9gYI7fWz3QUmjBegcBmr0dfoJLwPYbyU3Xy@mail.gmail.com>
Date: Thu, 1 Jul 2010 16:48:07 +0930
Message-ID: <AANLkTil6WKZ0agzQoSrTCnukVufve8enpKvtM2HjGqPA@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dbus: fix building for mipsel.
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
X-List-Received-Date: Thu, 01 Jul 2010 07:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 1 July 2010 16:32, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 29, 2010 at 9:24 PM, Graham Gower <graham.gower@gmail.com> wr=
ote:
>> Mipsel lives in a bizarro world where the following error happens:
>>
>> | =A0 CCLD =A0 dbus-daemon-launch-helper
>> | /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../=
../mipsel-oe-linux/bin/ld: can not make stub section: File format not recog=
nized
>> | /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../=
../mipsel-oe-linux/bin/ld: failed to set dynamic section sizes: File format=
 not recognized
>> | collect2: ld returned 1 exit status
>>
>> Fix as noted by the openwrt folks:
>> https://dev.openwrt.org/changeset/18308
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>> ---
>> =A0recipes/dbus/dbus.inc | =A0 =A03 +++
>> =A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
>> index ec66960..41ec9d1 100644
>> --- a/recipes/dbus/dbus.inc
>> +++ b/recipes/dbus/dbus.inc
>> @@ -38,6 +38,9 @@ EXTRA_OECONF =3D "\
>> =A0do_compile_prepend_mipsel() {
>> =A0 =A0 =A0 =A0sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' b=
us/Makefile
>> =A0}
>> +do_configure_prepend_mipsel() {
>> + =A0 =A0 =A0 sed -i -e 's/-Wl,--gc-sections/--gc-sections/' ${S}/config=
ure
>> +}
>
> this changes this to be a compiler option instead of
> gcc driver passing it to link step and gcc does not
> have such option so it should error out. I wonder how
> does this work. just removing it fully would be
> understandable if say gc-sections does not work in ld.

Hmmm. Right you are.

Digging further, I see the configure script checks if gcc compiles a
dummy program with those options and uses them if it succeeds. Gcc
does indeed error out in this case, causing the configure script to
not use --gc-sections.

-Graham


