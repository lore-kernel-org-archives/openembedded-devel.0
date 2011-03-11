Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Py44Y-0005TR-GH
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 16:16:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 36B4CA4710;
	Fri, 11 Mar 2011 15:14:29 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FkJKS4mk-u+5; Fri, 11 Mar 2011 15:14:26 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 79DEDA470B;
	Fri, 11 Mar 2011 15:14:26 +0000 (GMT)
Message-ID: <4D7A3CA3.4040808@xora.org.uk>
Date: Fri, 11 Mar 2011 15:15:47 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1299805412.5437.31.camel@computer>	
	<1299837657.4137.23.camel@mattotaupa>
	<1299855298.4137.51.camel@mattotaupa>
In-Reply-To: <1299855298.4137.51.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] transmission: add recipe for 2.22 version
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
X-List-Received-Date: Fri, 11 Mar 2011 15:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2011 14:54, Paul Menzel wrote:
> Dear Graeme,
>
>
> Am Freitag, den 11.03.2011, 11:00 +0100 schrieb Paul Menzel:
>
>> Am Freitag, den 11.03.2011, 02:03 +0100 schrieb Lukas-David Gorris:
>>> Depends on the the previously sent libevent bump.
>> Using `git format-patch -2 -s` you can create patches where the
>> dependencies are shown in the subject, e. g. [PATCH 1/2] and [PATCH
>> 2/2].
>>
>>> From: Lukas-David Gorris <lukas.gorris@gmail.com>
>>> Date: Fri, 11 Mar 2011 02:00:56 +0100
>>> Subject: [oe] [PATCH] transmission: add recipe for 2.22 version
>> As already written in another thread, your MUA mangled the patches.
>> Please turn off automatic line wrapping (normal to preformatted) or
>> using `git send-email`.
>>
>> Your Signed-off-by line is also missing as demanded by the commit policy
>> [1].
>>
>> Secondly, I would appreciate if you could add to the commit message,
>> what build configuration you tested your new recipe/patch with and if
>> all operations worked when running it.
>>
>>> ---
>>>  recipes/transmission/transmission_2.22.bb |    9 +++++++++
>>>  1 files changed, 9 insertions(+), 0 deletions(-)
>>>  create mode 100644 recipes/transmission/transmission_2.22.bb
>>>
>>> diff --git a/recipes/transmission/transmission_2.22.bb
>>> b/recipes/transmission/transmission_2.22.bb
>>> new file mode 100644
>>> index 0000000..e9a7891
>>> --- /dev/null
>>> +++ b/recipes/transmission/transmission_2.22.bb
>>> @@ -0,0 +1,9 @@
>>> +require transmission.inc
>>> +
>>> +DEPENDS += "libevent"
>>> +
>>> +PR = ${INC_PR}.1
>> You should start at 0.
>>
>>> +SRC_URI[archive.md5sum] = "6499986bf769276310b00bda1090090d"
>>> +SRC_URI[archive.sha256sum] = "5a4079194f45260c143f21ea6f33ce2660d89fca02ad8f1e65169968d365e4d4"
> why did you commit in e124c44f [1] without my remarks being addressed?
> Also the things you put into the commit message could have been left
> out.
>
>
I got your comments long after I had already done the commits. Im
getting a lot of OE emails seriously delayed today.

I used pw-am as per the process recomended.

Graeme



