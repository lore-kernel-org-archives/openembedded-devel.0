Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SCyrc-0000kZ-3a
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 21:49:00 +0200
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SCyiF-0007g7-8j
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 19:39:19 +0000
Message-ID: <4F7368F3.9050705@dynamicdevices.co.uk>
Date: Wed, 28 Mar 2012 20:39:31 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
In-Reply-To: <CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
Subject: Re: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Wed, 28 Mar 2012 19:49:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans,

>Guess we might want to mirror a version and pull from the mirror.

I don't mind putting a mirrow up at the Dynamic Devices wbesite with a
SRC_URI link to it there.

That''s a bit of a patchy solution though isn't it? Ideally (imho) as I 
suggested the
other day there would be an official OE mirror that the standard OE 
framework
fell back to when it couldn't find the primary source material, but then 
somebody
has to pay for that of course :)

>PS: thinking of it: we might be able to resolve the latter issue by

I'm not sure if that would help us though, as (presumably) the point of 
the MD5
is to notify us that "something" is wrong with the file that has been 
pulled down,
whether because it is incomplete or the developers are being naughty.

Cheers,

Alex

On 28/03/2012 09:34, Frans Meulenbroeks wrote:
> 2012/3/28<ajlennon@dynamicdevices.co.uk>:
>> From: Alex J Lennon<ajlennon@gmail.com>
>>
>> Signed-off-by: Alex J Lennon<ajlennon@gmail.com>
>> ---
>>   recipes/libpng/libpng_1.2.48.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.48.bb
>> index 50a3c03..534962d 100644
>> --- a/recipes/libpng/libpng_1.2.48.bb
>> +++ b/recipes/libpng/libpng_1.2.48.bb
>> @@ -2,5 +2,5 @@ require libpng.inc
>>
>>   PR = "${INC_PR}.0"
>>
>> -SRC_URI[libpng.md5sum] = "7612af5660cd4b5e8c433ce53bea01a7"
>> -SRC_URI[libpng.sha256sum] = "f6db51aff81b6920203678b29e8c68a5e3703cf5b39ae5e9e56370d17f31b1c4"
>> +SRC_URI[libpng.md5sum] = "74c8c261bdf9a75274e22875183fda07"
>> +SRC_URI[libpng.sha256sum] = "b4c92df11eadf3e81705a58253dbffc4b95169186899e28abdfc8aada8a20fcc"
>> --
>> 1.7.5.4
>>
> You mean upstream changed their source tarball (or whatever) without
> updating the version number.
> Yuk.
>
> Guess we might want to mirror a version and pull from the mirror.
> (changing the checksum alone creates issues because other people might
> already have the version with the old checksum in their downloads.
>
> Frans
>
> PS: thinking of it: we might be able to resolve the latter issue by
> forcing the removal of a file from downloads (and trigger a refetch)
> if the .md5 does not match the md5 in the recipe.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



