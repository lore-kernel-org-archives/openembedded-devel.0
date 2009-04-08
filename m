Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LrYcq-0005VU-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 16:19:39 +0200
Received: by an-out-0708.google.com with SMTP id b2so208081ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 07:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=i4ae75KiedcrKYhz9IkuMaNo0nVfYhS8HP3fb7R9mtk=;
	b=LkzZNlK6ofeIBOxe6WMka0wpSe36keOqHPHdw/0s00dpECS4+VNxE3JtqGYeeK0ON0
	JZ6iy+yu0BFUl8sy3ORw6Fc/pFdyDwEPrXeqBe2TJGO6IQ3m3cTDIqYmQMGjCEX5jqY3
	90iIZuM22M5ejEJxplCE13Ei9UJRkcetYh5ow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ncef4tQm4bNudatR1UXcsobNyiYjsxR2/cE854nZRIt/uF76TbyfibpvWAbuf+eu+B
	uHkfnsCpGZyKNmBUCdF5AZsCQunX5SmhKeqgdC/NaZIWvdXqtOZ7YIBVa2KoreT4Ju+/
	oeR1BGj2TYeronH1NMzU2OplhWgVU8i6/xTao=
MIME-Version: 1.0
Received: by 10.100.125.9 with SMTP id x9mr3159008anc.35.1239200193235; Wed, 
	08 Apr 2009 07:16:33 -0700 (PDT)
In-Reply-To: <20090407165123.GE2195@smtp.west.cox.net>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
	<20090407165123.GE2195@smtp.west.cox.net>
Date: Wed, 8 Apr 2009 16:16:33 +0200
Message-ID: <d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.250
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 14:19:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2009 at 6:51 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Tue, Apr 07, 2009 at 09:16:28AM +0200, Esben Haabendal wrote:
>
> [snip]
>> +[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
>> +md5=3Dad3f2b5fdcd599a772ad75fec2c384d8
>> +sha256=3D2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2=
e7
>
> You need to run the 'contrib/source-checker/oe-checksums-sorter.py'
> after adding a new checksum. =A0Roughly
> /contrib/source-checker/oe-checksums-sorter.py conf/checksums.ini > t &&
> mv t conf/checksums.ini.

Ok.

>> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>> b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>> new file mode 100644
>> index 0000000..130dea5
>> --- /dev/null
>> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>> @@ -0,0 +1,10 @@
>> +require mingw-binutils_${PV}.bb
>> +require binutils-canadian-cross.inc
>> +
>> +DEFAULT_PREFERENCE_sdk-mingw32 =3D "1"
>
> This should just be DEFAULT_PREFERENCE_mingw32 =3D "1". =A0Or just left o=
ut
> as we aren't setting this to -1 for anything else.

Well, as you suggest later on, I have now set DEFAULT_PREFERENCE to
-1, so I will be keeping in this, but of-course using _mingw32 instead
of the (now) defunct _sdk-mingw32

>> diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb
>> b/recipes/binutils/mingw-binutils_2.19.1.bb
>> new file mode 100644
>> index 0000000..19d1077
>> --- /dev/null
>> +++ b/recipes/binutils/mingw-binutils_2.19.1.bb
>> @@ -0,0 +1,12 @@
>> +PR =3D "r1"
>
> First PR should be r0, and the PR line left out in this case.

Ok, I failed to find any information on this earlier.

So I just decided, based on what I think would make sense, that the first
version shoul dbe r1, and r0 being left as an indication that no PR
were set.

> This also
> looks a whole lot like the older one, so perhaps the best thing to do
> here would be to rename the old one to mingw-binutils.inc and just
> include that in mingw-binutils_version.bb (which iirc does need to
> exist).

Well, it looks a lot like, but is not identical.
But I've created a common mingw-binutils.inc, and require'd this by the two
mingw-binutils_version.bb files.

>> +DEFAULT_PREFERENCE =3D "0"
>
> Then drop this, or set to -1. =A0I forget off the top of my head if
> something will go wrong and try and use this for non-canadian stuff if
> we don't have a -1 here..

I will not guarantee that that it won't go wrong and use this for anything
else than MinGW canadian stuff, and as such, it seems really silly
to risk fucking up things just to save a few bytes in a recipe.

> Finally, the way Stable works, as I read it, is that the patch goes into
> dev first then stable. =A0Not at the same time.

Ok.

Then, please someone apply this to .dev.  But then how are we supposed
to remember which patches should also be moved to stable, and when?

Let's not make it to complicated to maintain stable, so that it will die
from us again :-(

Of-course, this approach will not work generally, as .dev will and must
diverge from stable, and more and more fixes will be specific to stable.

/Esben


