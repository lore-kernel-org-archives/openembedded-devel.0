Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S6j4C-00064M-Al
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 14:44:08 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S6ivZ-0005c1-PT
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 13:35:13 +0000
Message-ID: <4F5CAA16.3090209@dynamicdevices.co.uk>
Date: Sun, 11 Mar 2012 13:35:18 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1331464418-6339-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<CACW_hTaHRCEGf5YqdCAh549KVquJJ8H6YUKNK5084ObURdRLQA@mail.gmail.com>
In-Reply-To: <CACW_hTaHRCEGf5YqdCAh549KVquJJ8H6YUKNK5084ObURdRLQA@mail.gmail.com>
Subject: Re: [PATCH] Replaced libpng 1.2.47 recipe with 1.2.48 as source tarball no longer available from SRC_URI
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
X-List-Received-Date: Sun, 11 Mar 2012 13:44:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>Pushed, thanks.

No problem Frans. Out of interest I thought the build environment was 
supposed to
fall back to an OE/Angstrom caching server to ensure this type of thing 
didn't happen
when the primary sources disappeared?

Rgds,

Alex

On 11/03/2012 12:26, Frans Meulenbroeks wrote:
> 2012/3/11 Alex J Lennon<ajlennon@dynamicdevices.co.uk>:
>> From: Alex J Lennon<ajlennon@gmail.com>
>>
>> Signed-off-by: Alex J Lennon<ajlennon@gmail.com>
>> ---
>>   recipes/libpng/libpng_1.2.47.bb |    6 ------
>>   recipes/libpng/libpng_1.2.48.bb |    6 ++++++
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>   delete mode 100644 recipes/libpng/libpng_1.2.47.bb
>>   create mode 100644 recipes/libpng/libpng_1.2.48.bb
>>
>> diff --git a/recipes/libpng/libpng_1.2.47.bb b/recipes/libpng/libpng_1.2.47.bb
>> deleted file mode 100644
>> index 8d594f1..0000000
>> --- a/recipes/libpng/libpng_1.2.47.bb
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -require libpng.inc
>> -
>> -PR = "${INC_PR}.0"
>> -
>> -SRC_URI[libpng.md5sum] = "4389dab9fcd2f9d57ac14701b9115f59"
>> -SRC_URI[libpng.sha256sum] = "f0bfa4a33b419a61cf97935cd6a15f5cbda84d116c72fa4b3489b0605a00a7a2"
>> diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.48.bb
>> new file mode 100644
>> index 0000000..50a3c03
>> --- /dev/null
>> +++ b/recipes/libpng/libpng_1.2.48.bb
>> @@ -0,0 +1,6 @@
>> +require libpng.inc
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +SRC_URI[libpng.md5sum] = "7612af5660cd4b5e8c433ce53bea01a7"
>> +SRC_URI[libpng.sha256sum] = "f6db51aff81b6920203678b29e8c68a5e3703cf5b39ae5e9e56370d17f31b1c4"
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> Pushed, thanks.
>
> I have this one pending for the maintenance branch too, but had
> connectiivty problems yesterday
>
> will submit that later
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



