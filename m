Received: from llsb708-a03.servidoresdns.net ([82.223.190.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaume@fqingenieria.es>) id 1NUd1N-000426-1e
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 10:26:44 +0100
Received: from [127.0.0.1] (ip24258.vig.altecom.net [212.121.242.58])
	by smtp-03.servidoresdns.net (Postfix) with ESMTP id 61C47429678
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 10:14:35 +0100 (CET)
Message-ID: <4B4C3D79.5070206@fqingenieria.es>
Date: Tue, 12 Jan 2010 10:14:33 +0100
From: FQ | Jaume Ribot <jaume@fqingenieria.es>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1262986639.11887.8.camel@fred.uchi.de>	<20100108223915.GA29981@gmail.com>	<1263057308.6614.7.camel@fred.uchi.de>
	<19c1b8a91001092224j569793dfla5f7d33effa5e2ca@mail.gmail.com>
In-Reply-To: <19c1b8a91001092224j569793dfla5f7d33effa5e2ca@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.223.190.29
X-SA-Exim-Mail-From: jaume@fqingenieria.es
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Remote Debugging
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
X-List-Received-Date: Tue, 12 Jan 2010 09:26:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Khem Raj escribi=F3:
> On Sat, Jan 9, 2010 at 9:15 AM, Joerg Eesmann <jeesmann@gmx.de> wrote:
>  =20
>> Hi again,
>> sometimes one can`t see the obvious, but thanks for help.
>> I connected gdb remote. But I got following message:
>>
>> warning: The current binary is a PIE (Position Independent Executable)=
,
>> which
>> GDB does NOT currently support.  Most debugger features will fail if
>> used
>> in this session.
>>
>> Reading symbols
>> from /home/joerg/prj/OpenMoko/shr/shr-build/shr-unstable/tmp/work/armv=
4t-oe-linux-gnueabi/bluez4-4.59-r5.0/bluez-4.59/src/.libs/bluetoothd...do=
ne.
>> (gdb) target remote 192.168.0.202:3333
>> Remote debugging using 192.168.0.202:3333
>> warning: Unable to find dynamic linker breakpoint function.
>> GDB will be unable to debug shared library initializers
>> and track explicitly loaded dynamic code.
>>
>> and I cannot set breakpoints or whatever.
>> I thought, gdb 7.0 is supporting PIE.
>> Is there any possibility to compile bluez4 not as PIE, would it work?
>>    =20
>
> you could add -nopie to ldflags
>
>  =20
>> While googeling, I found some patches for gdb, which may help.
>> Any ideas?
>>    =20
>
> they could if you send the pointers.
>
>  =20
>> (by the way, is there a usable graphical frontend for gdb for this cas=
e:
>> remote-debugging wit cross gdb)?
>>    =20
>
> I have used ddd its decent. You can also use eclipse CDT they are other=
s too
> http://sourceware.org/gdb/wiki/GDB%20Front%20Ends
>  =20
I also used eclipse (galileo) with CDT extensions. It's a good idea, as
you can compile/debug the application with the same tool.

>  =20
>> I only managed to get it running (until the message) textbased.
>>
>> Thank you for supporting me,
>> best regards,
>> Joerg
>>
>>
>> On Fri, 2010-01-08 at 14:39 -0800, Khem Raj wrote:
>>    =20
>>> On (08/01/10 22:37), Joerg Eesmann wrote:
>>>      =20
>>>> Hi there,
>>>> I am trying to remote debug my Openmoko freerunner.
>>>> I already installed succesfully gdbserver, and can attach it to the
>>>> progem I am going to debug.
>>>> The question is, what to do on host side?
>>>> I bitbaked gdb-cross-sdk, I bitbaked my changed package (bluez4)
>>>> So I will install a debug version of the package, and attach to the
>>>> bluetoothd-demon.
>>>> On host side, I guessed I needed a gdb, that can handle ARM-processo=
r,
>>>> therefore gdb-cross-sdk.
>>>> Now I should have everything... but a few questions left.
>>>> GDB ist only ipk-package, what to do with this?
>>>>        =20
>>> you need gdb-cross once you build that you should be able to use it
>>> from same place as cross gcc.
>>>
>>>      =20
>>>> Where do I find the arm-compiler bluetoothd on my host (I guess in w=
ork,
>>>> but will this be the strippded version or not, because also stripped
>>>> package has been made).
>>>> Am I on the right way? Is there any howto or something like that
>>>> availlable, where you could point me?
>>>>
>>>>        =20
>>> if you build it then the non stripped version should be there in
>>> your workdir (where the package was built)
>>>
>>> -Khem
>>>      =20
>>>> thank you for your help in advance,
>>>> best regards,
>>>> Joerg
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>>>>        =20
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>>      =20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>    =20
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>  =20


--=20
Jaume Ribot Caner
R&D Engineer

FQ Ingenier=EDa Electr=F3nica, SA
Avda. de les Roquetes, 9
Pol. Industrial Vilanoveta
08812 Sant Pere de Ribes ( SPAIN )
www.fqingenieria.es

Tf  + 34 93 208 02 58
Fx  + 34 93 459 28 93
E-mail: jaume@fqingenieria.es




