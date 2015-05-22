Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B93D741CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 23:15:39 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so1694790igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 16:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/jqtJQvqrmihEkLU29HAaLu5bZuwhXIPyhmZYqxWYm4=;
	b=V5EVCGNMFULMPBjUonqhOk/+MEMtoyITRbJ+LHSh0gklwEk7ChffIEjmdy3/zd6Kbm
	tQnBjkasYn+/wq1gNB3mrGX6xclQ2WMjff+s2uZmRotuGQMnu2s284IEQuF/hyWzlXEr
	NMy66b+7lnoaI2Pp3uCO1I+GZIKiUIhWOmNXOwOVPwDLdCn2xaBD0G4+kEwPq7KxjzAZ
	KkMp67R83uYlETNYQPMZs4qZh47Zrbt7qB6V8oTLgZEAVQNSMWWqsFtM//7OMUP+uqfY
	2fN40KaXReJX0mZJXV7goJtjzOV/4YJGfyCN5g4dZ8pDaFIhIXQ9PGJ3d5sG7vUpE8PZ
	87EA==
X-Received: by 10.50.36.72 with SMTP id o8mr5221209igj.16.1432336540315;
	Fri, 22 May 2015 16:15:40 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by mx.google.com with ESMTPSA id qt1sm237882igb.5.2015.05.22.16.15.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 16:15:39 -0700 (PDT)
Message-ID: <555FB899.9040301@gmail.com>
Date: Fri, 22 May 2015 19:15:37 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5548E485.6080505@gmail.com> <555E2359.3080509@gmail.com>
	<8824256D-28B9-48F4-8155-2185F236B4F2@gmail.com>
In-Reply-To: <8824256D-28B9-48F4-8155-2185F236B4F2@gmail.com>
Subject: Re: ODROID-C1 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 23:15:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/21/15 17:18, Khem Raj wrote:
>> On May 21, 2015, at 11:26 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>>
>> Why would someone include your layer and not build for odroidc1 or
>> wetekplay? Sometimes that's what people do ;-) (look at Angstrom, for
>> example). Besides, a BSP layer should be able to play nicely with other
>> layers even when its machines aren't being used :-)
> This is very much desirable, in todays times. In angstrom e.g. we want to generalize feeds across
> many machines for arm especially, so we can share common feeds across multiple armv7a machines
> so BSP maintainers have to start thinking that their BSP layer will be put along with other BSP layers
> and they not change common components mindlessly to fit for just one given machine.
>
> secondly more and more end users especially big companies have more than 1 machine tied into their useless
> so its desirable for them to use one distro across all the product lines and hence a requirement to have
> BSP layers play well with each others.

Shouldn't this be true of distro layers as well?

Simply included meta-angstrom in conf/bblayers.conf causes one's DISTRO
to be set to angstrom, even if they select poky in conf/local.conf.

