Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SHxJq-00025B-G8
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 15:10:42 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 11 Apr 2012
	15:01:19 +0200
X-TM-IMSS-Message-ID: <a4704f3700187955@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id a4704f3700187955 ;
	Wed, 11 Apr 2012 15:01:22 +0200
Message-ID: <4F85809F.3000100@nedap.com>
Date: Wed, 11 Apr 2012 15:01:19 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.28) Gecko/20120313 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <005901cd17e1$3b9a2290$b2ce67b0$@st.com>
	<955126867133468181@unknownmsgid>
In-Reply-To: <955126867133468181@unknownmsgid>
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 13:10:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

There is no file named: myfile.tar.gz
That it can't be found by bitbake is pretty clear then...


On 04/11/2012 02:49 PM, Giuseppe Condorelli wrote:
>> I'm obtaining this error trying to rebuild the poky-edison repository
>> (http://downloads.yoctoproject.org/releases/yocto/yocto-1.1.1/poky-ediso=
n-6.
>> 0.1.tar.bz2)
>> and the error is happening trying to build quilt-native package (indeed =
I'm
>> running ../script/bitbake -k core-image-sato), where I passed the tar.gz
>> directly using the instructions below.
>>
>> This is the output of tree meta-yocto (snipped)
>>
>> meta-yocto
>>      recipes-devtools
>>           quilt
>>                files
>>         quilt-0.48.tar.gz
>>     quilt-native_0.48.bbappend
>>
>> Best Regards,
>> Giuseppe
>>
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Gary
>> Thomas
>> Sent: mercoled=EC 11 aprile 2012 13:06
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [oe-core] THISDIR usage
>>
>> On 2012-04-11 04:52, Giuseppe Condorelli wrote:
>>> Many thanks for the reply, I tried the suggestion but I obtained this:
>>>
>>> "Unable to fetch URL file://myfile.tar.gz from any source"
>>>
>>> What's happening?
>> Does your layer look like the pseudo tree quoted below?  Can you send th=
e
>> results of 'tree meta-giuseppe'?
>>
>> One way to get a glimpse of where bitbake is looking for your file is to=
 use
>> strace (GIANT hammer) like this:
>>    % strace -o /tmp/xx.bb -f bitbake some-recipe
>>    % grep myfile.tar.gz /tmp/xx.bb
>> This way you can see the paths being searched.
>>
>>> Il giorno mercoled=EC 11 aprile 2012, Gary Thomas ha scritto:
>>>
>>>> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>>>>
>>>>> Hi, I moved to OE-Core (working on stable version dowloaded as tar
>>>>> file from cgit.openembedded.org).
>>>>> I'm in trouble trying to include a source through .bbappend file,
>> located
>>>>> under my meta-<personal>    subtree.
>>>>>
>>>>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>>>>> SRC_URI +=3D "file://myfile.tar.gz"
>>>>>
>>>>> results in a no such file or directory. Please can you tell me if
>>>>> I'm missing anything?
>>>>>
>>>> Assuming your tree looks something like this [partial]:
>>>>
>>>>   meta-giuseppe:
>>>>     recipes:
>>>>       some-recipe:
>>>>         some-recipe_1.2.3.bbappend
>>>>         files:
>>>>           myfile.tar.gz
>>>>
>>>> Try using this instead
>>>>   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


