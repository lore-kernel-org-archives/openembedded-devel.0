Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2gM4-0002Qi-6R
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 10:25:07 +0200
Received: by pwj1 with SMTP id 1so1013457pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TT1wcGHR/q0tJv2Vbjg+Q/Kf/SMcqQcGr/imjOyMwyA=;
	b=f96XnhrPbcXVRGt33VpMz0ASVWc7NqtGPR/JR0MplMdoYCnAMScsCsxKyvDAiKHT4b
	YlUuhJ/f2qNHVPv9TJgMnRsHXL2uu3oh9Dx7p88x+CsVeghdAOUXmXau0xVBFoL7hqd1
	Pegk0nmqYpO4UDmQaLBJeukddjEBPou7jzouU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dVdtOZai9A03mwee+0Jlt24i8quKSUJhw//yQjjd4AMgnHgVShchrClvA5mXT5DcaC
	4dKh0p4tjyYU3KpWh9CUi9QeDtzmn0Noe3MHZ47csX5L7LHg2BtSd7JjdTIhRiKzsw26
	mfTRuU7XkIGA+4WxDzcgyECLEIjxcpExw95Ow=
MIME-Version: 1.0
Received: by 10.142.133.11 with SMTP id g11mr7462817wfd.124.1286180685574;
	Mon, 04 Oct 2010 01:24:45 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 01:24:45 -0700 (PDT)
In-Reply-To: <4CA98CEF.3090604@nedap.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
Date: Mon, 4 Oct 2010 01:24:45 -0700
Message-ID: <AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Mon, 04 Oct 2010 08:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 1:14 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Thanks!
> That seems to work!!
> Something to be added to udev recipe...

Any chance you can post your recipe I am not sure if I am getting
where you added that in the recipe. Thanks

>
> On 10/04/2010 09:14 AM, Eric B=E9nard wrote:
>>
>> Hi,
>>
>> Le 04/10/2010 08:47, Jaap de Jong a =E9crit :
>>>
>>> a fresh rebuild failed in compiling udev.
>>> Any clues?
>>
>> if you are using gcc 4.5 =3D> add CFLAGS_append =3D " -Os"
>> =A0to udev recipe.
>>
>> Eric
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


