Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 9C897719ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 16:10:08 +0000 (UTC)
Received: (qmail 28123 invoked by uid 1003); 24 Oct 2016 16:10:09 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.14.165)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Oct 2016 16:10:09 -0000
To: openembedded-devel@lists.openembedded.org
References: <1477052056-14472-1-git-send-email-philip@balister.org>
	<36CFFABF-F18A-405E-BA43-08713EC46478@gmail.com>
	<f831f9a9-d2e3-9fd3-41f9-d8479a933a1a@balister.org>
	<CA+chaQd09rwPViw9bwaXT3cpNqhGPE3k_4=Ud3cFOxPWi6E4Uw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <f3695312-ab60-e5f8-3d99-77c880bd8cb0@balister.org>
Date: Mon, 24 Oct 2016 12:10:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQd09rwPViw9bwaXT3cpNqhGPE3k_4=Ud3cFOxPWi6E4Uw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] fftw: Allow an empty package for fftw.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2016 16:10:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 10/24/2016 11:43 AM, Martin Jansa wrote:
> RDEPENDS_${PN}-dev_remove = “${PN}”

I'll give it a whirl, thanks!

Philip

> 
> doesn't work?
> 
> On Sat, Oct 22, 2016 at 1:05 AM, Philip Balister <philip@balister.org>
> wrote:
> 
>> On 10/21/2016 01:08 PM, Khem Raj wrote:
>>>
>>>> On Oct 21, 2016, at 5:14 AM, Philip Balister <philip@balister.org>
>> wrote:
>>>>
>>>> The fftw-dev package RDEPENDS on the fftw package. Let the recipe
>> create an
>>>> empty one to satisfy this requirement.
>>>>
>>>> Signed-off-by: Philip Balister <philip@balister.org>
>>>> ---
>>>> meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
>>>> 1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>> b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>>>> index 0faaea1..0bb6cc2 100644
>>>> --- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>>>> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>>>> @@ -69,4 +69,6 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
>>>> FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
>>>> FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
>>>>
>>>> +ALLOW_EMPTY_${PN}= “1"
>>>
>>> as Martin said
>>>
>>> RDEPENDS_${PN}-dev = “”
>>>
>>> should be done.
>>
>> It also RDEPENDS on libfftw libfftwf and libfftwl.
>>
>> Is there a way to remove just one entry in the RDEPENDS line? Need to
>> think through exactly what is going on.
>>
>> Philip
>>
>>>
>>>> +
>>>> BBCLASSEXTEND = "native"
>>>> --
>>>> 2.5.5
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

