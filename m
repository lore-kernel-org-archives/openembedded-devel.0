Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SHx8c-0001UG-S0
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 14:59:07 +0200
Received: by iaag37 with SMTP id g37so1280293iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:mime-version:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=xemW2hh3vxd7mdUiuJVtAvQyKb30JbgREzM+iTTnkaw=;
	b=SAZUqqt7ING16Eaf1oMgv0xlUMnh9kCVDEBT4XKkLdxtl+JRdP4tRxidif+EjfacBA
	rlxuSNLya3fWgd2ytU7x14TDm/8UUyNG+SS8Zyq104kTCGkk+gE8lu2OXd6ctwaUy6hJ
	wdl7G70wn0PCHsgF/D/Cr+H35UDNdBabHU+n5rgjzfDN+NqWFBMX5qv9VHvTIMi68+UW
	SlVgrkiK2Svizny7NvHohLcIYVl/H7+8xDriV4GmcoJTfyBkdgsaHx4CmIu1LjO1WzZT
	yma9proiVn8h/FHaO1ojp5ZdEGn/AmPBpJ7ykfPU0ZtTJt+H1HQN2rweMxd4v/rtbCyu
	RQcg==
Received: by 10.50.192.228 with SMTP id hj4mr5385354igc.65.1334148584072; Wed,
	11 Apr 2012 05:49:44 -0700 (PDT)
References: <005901cd17e1$3b9a2290$b2ce67b0$@st.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 11 Apr 2012 14:49:43 +0200
Message-ID: <955126867133468181@unknownmsgid>
To: openembedded-devel@lists.openembedded.org
Subject: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 12:59:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> I'm obtaining this error trying to rebuild the poky-edison repository
> (http://downloads.yoctoproject.org/releases/yocto/yocto-1.1.1/poky-edison=
-6.
> 0.1.tar.bz2)
> and the error is happening trying to build quilt-native package (indeed I=
'm
> running ../script/bitbake -k core-image-sato), where I passed the tar.gz
> directly using the instructions below.
>
> This is the output of tree meta-yocto (snipped)
>
> meta-yocto
>     recipes-devtools
>          quilt
>               files
>        quilt-0.48.tar.gz
>    quilt-native_0.48.bbappend
>
> Best Regards,
> Giuseppe
>
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of G=
ary
> Thomas
> Sent: mercoled=EC 11 aprile 2012 13:06
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [oe-core] THISDIR usage
>
> On 2012-04-11 04:52, Giuseppe Condorelli wrote:
>> Many thanks for the reply, I tried the suggestion but I obtained this:
>>
>> "Unable to fetch URL file://myfile.tar.gz from any source"
>>
>> What's happening?
>
> Does your layer look like the pseudo tree quoted below?  Can you send the
> results of 'tree meta-giuseppe'?
>
> One way to get a glimpse of where bitbake is looking for your file is to =
use
> strace (GIANT hammer) like this:
>   % strace -o /tmp/xx.bb -f bitbake some-recipe
>   % grep myfile.tar.gz /tmp/xx.bb
> This way you can see the paths being searched.
>
>> Il giorno mercoled=EC 11 aprile 2012, Gary Thomas ha scritto:
>>
>>> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>>>
>>>> Hi, I moved to OE-Core (working on stable version dowloaded as tar
>>>> file from cgit.openembedded.org).
>>>> I'm in trouble trying to include a source through .bbappend file,
> located
>>>> under my meta-<personal>   subtree.
>>>>
>>>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>>>> SRC_URI +=3D "file://myfile.tar.gz"
>>>>
>>>> results in a no such file or directory. Please can you tell me if
>>>> I'm missing anything?
>>>>
>>>
>>> Assuming your tree looks something like this [partial]:
>>>
>>>  meta-giuseppe:
>>>    recipes:
>>>      some-recipe:
>>>        some-recipe_1.2.3.bbappend
>>>        files:
>>>          myfile.tar.gz
>>>
>>> Try using this instead
>>>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


