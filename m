Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SHxPB-0002J4-SA
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 15:16:14 +0200
Received: by iaag37 with SMTP id g37so1299059iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=6VtoLvUQGWcupr/XvZPtDV11UqwzwFzg0gYnceJ2n2M=;
	b=Mj0BEZBNHrn11p8AN+ePU2e+7d3QXlZW4DOtkV30XqUfxX0BNTC2dXeIpQGtSmAITP
	iWHouKoCxp+KyzwEu0nAMYW9eK/kCPcK9M4yf+X04K4NE0iCfBxZZzAxUGsNU32gllA5
	isiVI0xdNlEfhKq6eTVLnPNc1YRjqpGc61iyW8cMQEI6aTHwPivCl/wPr6SfBn4hUrFG
	j/7suxNlLThtdUApORigGuPibNR2QDcKom7IGwwkSEMdEvrrlbU41z6/gzBDklFYRBm0
	8IPN9q4ftRCttQWkdi6XpgjSt4/O3gMHaXRHDMYVpGj4oCbJuzhyfib7jpYf/qqj6Slr
	WPhw==
Received: by 10.43.68.132 with SMTP id xy4mr9350965icb.54.1334149614493; Wed,
	11 Apr 2012 06:06:54 -0700 (PDT)
References: <005901cd17e1$3b9a2290$b2ce67b0$@st.com>
	<955126867133468181@unknownmsgid> <4F85809F.3000100@nedap.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
In-Reply-To: <4F85809F.3000100@nedap.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 11 Apr 2012 15:06:49 +0200
Message-ID: <4735586165635099347@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 11 Apr 2012 13:16:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

No no, myfile.tar.gz was a dummy name I used in this mail tree to
avoid deep explanation. As said in previous mail, I'm trying to build
quilt and I'm in trouble with its tar.gz source put into the directory
the tree shows. I've downloaded it by hand and put under files
directory, then I set FILESEXTRAPATHS inside the bbappend.

Il giorno 11/apr/2012, alle ore 15:02, Jaap de Jong
<jaap.dejong@nedap.com> ha scritto:

> There is no file named: myfile.tar.gz
> That it can't be found by bitbake is pretty clear then...
>
>
> On 04/11/2012 02:49 PM, Giuseppe Condorelli wrote:
>>> I'm obtaining this error trying to rebuild the poky-edison repository
>>> (http://downloads.yoctoproject.org/releases/yocto/yocto-1.1.1/poky-edis=
on-6.
>>> 0.1.tar.bz2)
>>> and the error is happening trying to build quilt-native package (indeed=
 I'm
>>> running ../script/bitbake -k core-image-sato), where I passed the tar.g=
z
>>> directly using the instructions below.
>>>
>>> This is the output of tree meta-yocto (snipped)
>>>
>>> meta-yocto
>>>     recipes-devtools
>>>          quilt
>>>               files
>>>        quilt-0.48.tar.gz
>>>    quilt-native_0.48.bbappend
>>>
>>> Best Regards,
>>> Giuseppe
>>>
>>>
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=
 Gary
>>> Thomas
>>> Sent: mercoled=EC 11 aprile 2012 13:06
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [oe-core] THISDIR usage
>>>
>>> On 2012-04-11 04:52, Giuseppe Condorelli wrote:
>>>> Many thanks for the reply, I tried the suggestion but I obtained this:
>>>>
>>>> "Unable to fetch URL file://myfile.tar.gz from any source"
>>>>
>>>> What's happening?
>>> Does your layer look like the pseudo tree quoted below?  Can you send t=
he
>>> results of 'tree meta-giuseppe'?
>>>
>>> One way to get a glimpse of where bitbake is looking for your file is t=
o use
>>> strace (GIANT hammer) like this:
>>>   % strace -o /tmp/xx.bb -f bitbake some-recipe
>>>   % grep myfile.tar.gz /tmp/xx.bb
>>> This way you can see the paths being searched.
>>>
>>>> Il giorno mercoled=EC 11 aprile 2012, Gary Thomas ha scritto:
>>>>
>>>>> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>>>>>
>>>>>> Hi, I moved to OE-Core (working on stable version dowloaded as tar
>>>>>> file from cgit.openembedded.org).
>>>>>> I'm in trouble trying to include a source through .bbappend file,
>>> located
>>>>>> under my meta-<personal>    subtree.
>>>>>>
>>>>>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>>>>>> SRC_URI +=3D "file://myfile.tar.gz"
>>>>>>
>>>>>> results in a no such file or directory. Please can you tell me if
>>>>>> I'm missing anything?
>>>>>>
>>>>> Assuming your tree looks something like this [partial]:
>>>>>
>>>>>  meta-giuseppe:
>>>>>    recipes:
>>>>>      some-recipe:
>>>>>        some-recipe_1.2.3.bbappend
>>>>>        files:
>>>>>          myfile.tar.gz
>>>>>
>>>>> Try using this instead
>>>>>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>>> --
>>> ------------------------------------------------------------
>>> Gary Thomas                 |  Consulting for the
>>> MLB Associates              |    Embedded world
>>> ------------------------------------------------------------
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


