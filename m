Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SKFuj-0000ui-LP
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 23:26:17 +0200
Received: by qcso7 with SMTP id o7so4163945qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2012 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wY0v9jS1sQSR/6/A8j1i+hLrdKIEAY3cVTWyCwRMOTs=;
	b=yO9zFZ0Dr78L3kwIaTlEnpEo6X4zRtNJVByWnOhB6Lfu8c3AMM5wCujLO7l5wOO1Hr
	0C9kRGY3HxCWP/0OeAklJMwts41TGx1ZMwxzO6ufHhUIx3sXis+mwT6p7DiXRlJIZOJQ
	4S8wTpIuIkSoP1lvCuGrmIpoHlX4fx5mWlg5lEMBfulz6JH8G9+/bvHzamxvRa2GCaDx
	XuSpUM2hVN0WYzTbeprFqUkw+m+EnrMpQPqCfctbyJRUT7H5bm3ngYxKEPBv4fky8yr0
	UYaEy7fhgRNWvldzDFnavcdeizpFSZSZB3SIYlUQDv7FrIZo1GdLUDajfzcDV4ondant
	HN6Q==
Received: by 10.224.178.135 with SMTP id bm7mr330222qab.51.1334697410710;
	Tue, 17 Apr 2012 14:16:50 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id i8sm42280885qah.4.2012.04.17.14.16.45
	(version=SSLv3 cipher=OTHER); Tue, 17 Apr 2012 14:16:49 -0700 (PDT)
Message-ID: <4F8DDDB7.5010605@gmail.com>
Date: Tue, 17 Apr 2012 14:16:39 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
In-Reply-To: <4F8DCFC4.9010508@gmail.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Tue, 17 Apr 2012 21:26:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 01:17 PM, j wrote:
> On 04/17/2012 12:49 PM, j wrote:
>> On 04/17/2012 12:34 PM, Mark Hatle wrote:
>>> On 4/17/12 2:09 PM, j wrote:
>>>> On 04/17/2012 09:13 AM, J. L. wrote:
>>>>> <snip>
>>>>>
>>>>>
>>>>> <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel> 
>>>>>
>>>>>
>>>>>
>>>>>
>>>> I went for a build on the borrowed machine again but this time I 
>>>> did not
>>>> go into X just stayed in RL3. Then ran bitbake perl, on a clean build
>>>> dir. It is just about to finish building a few steps away but where I
>>>> normally get the segfaults, it has not spit those out. There are no QA
>>>> logs being generated either. So looks like it had/has something to do
>>>> with running X, both systems are running nvidia graphics cards. The
>>>> laptop has a new mobile one, borrowed an old one that is nouveau
>>>> compatible. So both open and closed nvidia drivers were tried. But
>>>> something when in the graphical environment is giving the segfault
>>>> issues I have been seeing. I have not yet verified if killing X on the
>>>> laptop builds and eliminates the issues as well.
>>>>
>>>> Will post back once I have built the kernel on both machines with no X
>>>> running.
>>>
>>> There is a known issue w/ nvidia drivers, segfaulting and QEMU.  Is 
>>> something in perl (or elsewhere) trying to run qemu to finish up a 
>>> task?
>>>
>>> --Mark
>> Not that I can tell, but that does not mean it is not (still learning 
>> things), but possible one of threads is working on something perl 
>> related when it happens and I am not seeing it or realizing it. If 
>> you are willing to post the commands I could run to check, I can post 
>> the results. But when I do just a bitbake -c compile perl on a clean 
>> build dir all I would see was the segfault in dmesg and the results 
>> in QA log. Nothing would show up on the command line that was not in 
>> the QA log, after doing each step one by one.
>>
>> But it must be related to this known issue with nvidia. Should be a 
>> couple hours before both machines finish building the kernel and 
>> perl, will post the results after. But looks promising for my laptop 
>> so far as no segfaults yet. Borrowed machine is on to building the 
>> kernel now and nothing posted yet.
>>
>> Thank you for your response very appreciated. I will also read more 
>> about the issue you stated.
>>
>>
> From what I am reading about this is its related to libgl. But on the 
> machine I borrowed I used nouveau driver's which uses the libgl that 
> is expected not the nvidia's supplied version. So maybe that is not 
> fully it. But still all seems related to being in an X environment for 
> me when building. Which is at least easy to work around.
>
> Will post if it segfaults again on either machine once they are done.

My borrowed machine segfaulted while finishing building perl. So I guess 
that had nothing to do with the segfault issues. I ended up with the 
same qa.log output and same type of output on dmesg relating to libc and 
ld again.

Laptop no X on that segfaulted in the normal places

Should I try installing Ubuntu 10.04 on the borrowed machine and seeing 
if the OS works on that machine? I am still lost as nothing seems to 
really be telling me what is segfaulting. The rest of the logs basically 
look the same as the series I posted earlier.



