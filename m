Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1Mgdz7-00038D-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 14:21:45 +0200
Received: by ewy19 with SMTP id 19so1299896ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=/zNU/tsmEWF+zUotiH3BFU6hqy57BS4dhfMfzTmlZH0=;
	b=UcKcMdd96d12N9/5DOrIwEoqJ3zgvSdj4rRA+jaMRN9hjV8w7xF+YafavGiXjPXQQx
	nf1eXHl5wLPxDomJRTfoGELncpTdBJaclQTd60esjnp68WYMAb8PKD0pPgP4SGFWGWLN
	GRLrE/cCfFOchw2YQcqkcBp53KJuRG9v4RFio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=F0AI4jncs5W9EWVb17ivUa4FOwtA+iwZeRLercGNeUnqkuPozRuXqEYEAzaGbBRLFD
	qBnE4dV6fb7V+4KmrmqNKQN+oxB69KVcaIrsnN4li/QsmnWOl2ev2TxdFgkzdOzdehrd
	9TE0BJtU/ouajm6BFHLyI3woPgqikMCg0HmR0=
Received: by 10.210.7.16 with SMTP id 16mr245610ebg.14.1251374616970;
	Thu, 27 Aug 2009 05:03:36 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.143.120])
	by mx.google.com with ESMTPS id 7sm348774eyg.32.2009.08.27.05.03.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 Aug 2009 05:03:36 -0700 (PDT)
Message-ID: <4A967643.7050503@gmail.com>
Date: Thu, 27 Aug 2009 18:04:19 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A9539AA.3070306@gmail.com>
	<1251301150.4493.12.camel@conroy-linux>
In-Reply-To: <1251301150.4493.12.camel@conroy-linux>
Subject: Re: Strange do_patch behaviour
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
X-List-Received-Date: Thu, 27 Aug 2009 12:21:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Chris Conroy wrote:
> On Wed, 2009-08-26 at 19:33 +0600, Dmitry Vinokurov wrote:
>   
>> ------------
>> And looks like bitbake did nothing except patching, but actually it does 
>> (diff between manually and bitbake patched dirs is ~30000 strings, and I 
>> decided not to attach it:)) and as a result builded kernel fails with 
>> kernel panic. Diff shows, that '.pc' dir is created (and some files in 
>> it are forbidden for any access (0000 rights)) and not only it -- some 
>> other files like in arch/arm or sound/soc/lpc3xxx/ differs too. Tried to 
>> remove tmp/ and rebuild -- same result.
>>
>> Could anybody explain this strange behaviour? I thought that patch task 
>> should only execute 'patch' command.
>>
>>     
>
> Bitbake uses a tool called 'quilt' in order to do the patching, and
> quilt creates the .pc directory. Basically, quilt lets you deal with
> patches as a stack. If you go into the linux work directory, you should
> be able to run quilt commands to manually figure out what OE is patching
> here.
>
> 'quilt applied' to see what patches are applied
> 'quilt pop' to pop a patch off the stack
> 'quilt push' to push a patch onto the stack.
>
> Some Quilt Links:
> Very helpful presentation: http://www.coffeebreaks.org/blogs/wp-content/archives/talks/2005/quilt/quiltintro-s5.html
> Overview PDF: http://www.suse.de/~agruen/quilt.pdf
> Savannah page: http://savannah.nongnu.org/projects/quilt
>   
Thanks, refs and information was really helpful. Actually the only 
differences were in .pc and patches/, the only one applied patch was my 
phy3250. I just was inattentive and confused strings with differences in 
files and strings with file names.

--
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



