Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCreC-0007Ua-9c for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 11:57:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCraO-0001A1-VQ for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 11:53:40 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 11:53:40 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 11:53:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 14 May 2010 11:53:30 +0200
Message-ID: <hsj6iq$n0r$1@dough.gmane.org>
References: <hs0mk7$rst$2@dough.gmane.org>	<1273330086.23460.11.camel@desktop.maison.net>	<w2v19c1b8a91005081025l9688a5b8wc6eff5bc15496513@mail.gmail.com>	<AANLkTimJm8aWxNlkEK0eYJhbjtGwt6ZHWtKhdJ_mipbF@mail.gmail.com>
	<20100513103139.07200c76.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <20100513103139.07200c76.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: meta-toolchain doesn't build due to gdb-cross-sdk
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
X-List-Received-Date: Fri, 14 May 2010 09:57:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Another ping :)

On 13-05-10 10:31, Antonio Ospite wrote:
> On Tue, 11 May 2010 23:39:29 +1000
> Angus Lees <alees@google.com> wrote:
> 
>> It looks like the do_stage() removal was good, but the "inherit cross"
>> refactor broke task-sdk-host and all the SDKs that depend on it.  I suggest
>> reverting most of 4cf6a6bf83ccb13e7238927d72e77c4612fe6543 (but I'm hardly
>> an expert).
>>
>>  - Gus
>>
> 
> Ping.
> 
> meta-toolchain still does not build in org.oe.dev, but Angus' workaround
> worked for me too, thanks.
> 
> Regards,
>    Antonio
> 
>> On Sun, May 9, 2010 at 03:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Sat, May 8, 2010 at 7:48 AM, Thomas Jourdan <thomas.jourdan@yaeld.fr>
>>> wrote:
>>>> Hi
>>>>
>>>> The problems seems to come from the conversion to new staging mode in
>>>> GDB.
>>>
>>> right
>>>
>>> Now, gdb-cross-sdk inherits from sdk and cross whereas before it
>>>> only inherited from cross.
>>>>
>>>> Reverting Khem Raj GDB patches fixes the build for me (meta-toolchain
>>>> works again).
>>>
>>> thats because gdb 7.1 is then not using new staging and hence it builds
>>> again.
>>>
>>>>
>>>> Regards,
>>>> Thomas
>>>>
>>>> Le vendredi 07 mai 2010 à 11:30 +0200, Koen Kooi a écrit :
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> Hi,
>>>>>
>>>>> Currently meta-toolchain is unbuildable:
>>>>>
>>>>> Missing or unbuildable dependency chain was: ['gdb-cross-sdk']
>>>>> NOTE: Runtime target 'task-sdk-host' is unbuildable, removing...
>>>>> Missing or unbuildable dependency chain was: ['task-sdk-host',
>>>>> 'gdb-cross-sdk']
>>>>> ERROR: Required build target 'meta-toolchain' has no buildable
>>> providers.
>>>>> Missing or unbuildable dependency chain was: ['meta-toolchain',
>>>>> 'task-sdk-host', 'gdb-cross-sdk']
>>>>> Command execution failed: Traceback (most recent call last):
>>>>>   File "/OE/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
>>>>>     commandmethod(self.cmds_async, self, options)
>>>>>   File "/OE/bitbake/lib/bb/command.py", line 174, in buildTargets
>>>>>     command.cooker.buildTargets(pkgs_to_build, task)
>>>>>   File "/OE/bitbake/lib/bb/cooker.py", line 757, in buildTargets
>>>>>     taskdata.add_unresolved(localdata, self.status)
>>>>>   File "/OE/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
>>>>>     self.remove_runtarget(self.getrun_id(target))
>>>>>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
>>>>>     self.fail_fnid(fnid, missing_list)
>>>>>   File "/OE/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
>>>>>     self.remove_runtarget(target, missing_list)
>>>>>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
>>>>>     self.fail_fnid(fnid, missing_list)
>>>>>   File "/OE/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
>>>>>     self.remove_buildtarget(target, missing_list)
>>>>>   File "/OE/bitbake/lib/bb/taskdata.py", line 519, in remove_buildtarget
>>>>>     raise bb.providers.NoProvider
>>>>> NoProvider
>>>>>
>>>>> The weird thing is that 'bitbake gdb-cross-sdk' *DOES* work. Any ideas?
>>>>>
>>>>>
>>>>> regards,
>>>>>
>>>>> Koen
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL7R2aMkyGM64RGpERAn+nAKCTIwCY+L56utAGCSdmSLGT4qpNCACgpZq5
SknHmREBe1MPGDNCrxCMH1A=
=vUQQ
-----END PGP SIGNATURE-----



