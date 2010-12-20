Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1PUotz-0007BA-Ba
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 00:12:23 +0100
Received: by wwi17 with SMTP id 17so3406029wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 15:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=sxRwX7f2ColOTGs5q2LsB3ziLmxZ2FZ5DoAxqmGXkLI=;
	b=VUt6Bbix0XpmW0XDk3GGLPTgddlKixFeBcXxDuaQQARSZDA6FvM+NSMPI195FAF2Zl
	ZB28SBoZEi1UZBSpi42P0h9vufgP6jW/TGpA+NR77ARdrx+y8b5W7gUzXpxHH+Ubxxxa
	xnJ1JYaLBE4f1vqaK8lxC3e4RdS8O4zmYl4t4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=C0OyEfbsCcPzrGbSQBbfH/TD6D4TOocx8n1otmpUH9tZvfw1DB+oAHNHSQBD3IlEYE
	+zjZ24xTZDZQU+PfePOOHKM2z/LZFczBuaIIeGV3vz1dXO/88m0oHNupACD4g5X6/xmm
	Td2ByM+smajfHejxNwEMFBqHQe2VMQzJwDoxg=
Received: by 10.216.180.76 with SMTP id i54mr8920861wem.33.1292886734502;
	Mon, 20 Dec 2010 15:12:14 -0800 (PST)
Received: from [192.168.1.103] (243.204-242-81.adsl-dyn.isp.belgacom.be
	[81.242.204.243])
	by mx.google.com with ESMTPS id t5sm2174609wes.9.2010.12.20.15.12.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 15:12:13 -0800 (PST)
Message-ID: <4D0FE2CC.5050003@gmail.com>
Date: Tue, 21 Dec 2010 00:12:12 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101213 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D0FB245.90008@gmail.com> <20101220213243.GD17904@gmail.com>
In-Reply-To: <20101220213243.GD17904@gmail.com>
Subject: Re: qemu-native_0.13.0 do_compile fails
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
X-List-Received-Date: Mon, 20 Dec 2010 23:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/20/10 22:32, Khem Raj wrote:
> On (20/12/10 20:45), Jan Paesmans wrote:
>> Hi,
>>
>> After hacking the problem with openssl-native, the following happens for
>> qemu-native.
>> I found a reference describing the same problem with the new gold linker.
>> Any advice?
>>
>> |   LINK  alpha-linux-user/qemu-alpha
>> | /usr/bin/ld: error: address of section '.tbss' moves backward from
>> 0x6018e440 to 0x6018e260
>> | collect2: ld returned 1 exit status
>> | make[1]: *** [qemu-alpha] Error 1
>> | make: *** [subdir-alpha-linux-user] Error 2
>> | FATAL: oe_runmake failed
>> | ERROR: Function do_compile failed
>> NOTE: package qemu-native-0.13.0-r2: task do_compile: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.bb do_compile
>> failed
>> ERROR: Task 947
>> (virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.bb,
>> do_compile) failed with 256
> Well 0.13 has some more issues as it turns out. May be you can DP it to -1 
> and use 0.12.5 instead you will end up in better situation.
>
Same thing with the 0.12.5 version. Could it be that it is the new
linker and is there a way in ubuntu to use the old one?


