Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MeCqZ-0002Ab-4K
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 20:58:51 +0200
Received: by ewy21 with SMTP id 21so125419ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=FLc7/MMhowCujpOsaVKWZfPlippO1XxH6O9UFrAAZOE=;
	b=YTAFImMnRm0LfB/OaR4hRl5uSNlcW+4wv72VM/f+EM1CDqEFv6F3A1S6V2//Ug2wWZ
	ZOe5kAJaLhTowgLAJZTvnj5IZl3UK7mG90ZqRHFV+idKCc8xA4OlB19mNAxpf3IrpZZq
	Cu4Xpbt3Q8qdnb7rRXChsnxuZFEtngh6atSjo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=UnZXHFZgPoPHDhunZwfCJ3H/6RadMtR8uPqWyMqivIMPd57YcwpyHe6pD/eQUKse06
	jt7holtbAfGGMfb7v1g8UZ0Zw2iRxwP3AG0B4cW4fMMd2LFR3i4VrQ7ECuw3JMTqyB6O
	q0j++YD4UPQLJye1HN9UcYaWnkNAshR8PWxE0=
Received: by 10.210.140.11 with SMTP id n11mr403017ebd.88.1250793690478;
	Thu, 20 Aug 2009 11:41:30 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.146.220])
	by mx.google.com with ESMTPS id 7sm200011eyg.35.2009.08.20.11.41.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Aug 2009 11:41:30 -0700 (PDT)
Message-ID: <4A8D98FB.5000400@gmail.com>
Date: Fri, 21 Aug 2009 00:42:03 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D4947.5030108@gmail.com>
	<200908201526.46349.holger+oe@freyther.de>
In-Reply-To: <200908201526.46349.holger+oe@freyther.de>
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Thu, 20 Aug 2009 18:58:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:

> I think you should explore using the external-toolchain. This way you will 
> have to set the PATH to the toolchain and make "external-toolchain" the 
> default provider...
> 
> And for the old way have you seen this: 
> http://docs.openembedded.org/usermanual/html/commonuse_prebuilt_toolchain.html?
> 
> z.

Yes, I've seen manual and seems like I did everything that was told
there. By the way I meant that I want to use exactly external toolchain.
I used LTIB building system earlier and wanted to use toolchain from there.

> On Thursday 20 August 2009 15:01:59 Dmitry Vinokurov wrote:
>
>   
>> By the way, I don't understand why bitbake build gcc-cross-initial when
>> I use external toolchain. Maybe I've configured something wrong and OE
>> tries to build it's own toolchain, but seems like config is correct
>> according to manual.
>>     
>
> To figure out why OE is building the toolchain you can do
>
> bitbake -g helloworld
>
> and then look at the generated depends.dot. Looking at slugos.inc you will 
> need to set more ASSUMED_PROVIDED or go the external-toolchain route (which 
> sadly has not much documentation...)
>
> z.
>   

I've tested it (removed tmp dir and built from scratch): 'bitbake
helloworld' doesn't try to build toolchain, looks like it use toolchain
that I pointed. At least at the build log (I used -D) I can see
'CC=/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc', 


build commands with this compiler and similar. Configure scripts found
toolchain too. But the way how toolchain is used is really strange,
strings like following are in many packages (binutils-cross-2.18-r8.1, 
gcc-cross-initial-4.2.4-r7.1 and maybe some other, that I haven't seen):
--------
checking for i686-linux-ar... ar
checking for i686-linux-strip...
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-strip
checking for i686-linux-ranlib... ranlib
--------
or
--------
checking for i686-linux-gcc... 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
--------

I.e. some utils are X86-native, other are cross. In the first example 
above configure use ARM strip, though I've got strip on my Debian system.

This mess lead to error, that I described in first letter of this chain:
--------
checking for i686-linux-gcc... 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... configure: error: cannot run C 
compiled programs.
--------

--
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>






