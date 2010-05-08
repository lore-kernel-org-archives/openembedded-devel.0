Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OAnps-0000LP-EH
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 19:29:09 +0200
Received: by gya1 with SMTP id 1so1153291gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KbiNRLMCUlhNrm3o7V7+EofcBXjWP+XtFaR+SeTz9Qo=;
	b=ah8MifgIhrGJXKt2rtBsYF2BpcA5KjNPvWvM5xv64vBMNENsJzX+Hss3ijpe/RAMaE
	TjNMNNA2QU570g1WgXaX9S7F4y2JNA2jzRdQfWOeduTE+TyW4+p5+t84QcFoVFCChQp+
	Ghcdh9em6RfIut3+awQcRggvNq8XntF6kRasU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PU+5hK1jZvcMZUuidjQMUUUrnEWEEI44jh6oJoFJVi5SINUrjT1OPBtiqq+p2Ah99F
	JXWA7bOMZR2ZFMlNIWHbjvX4hL4aNpr44x4LATujSlWDAfQKoRzZoE7sF58lohnVyd3/
	RU8cBp03MElhKBkLxFhH6HPfNO4OLpE8wPzmg=
MIME-Version: 1.0
Received: by 10.231.148.1 with SMTP id n1mr463419ibv.96.1273339517037; Sat, 08 
	May 2010 10:25:17 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Sat, 8 May 2010 10:25:16 -0700 (PDT)
In-Reply-To: <1273330086.23460.11.camel@desktop.maison.net>
References: <hs0mk7$rst$2@dough.gmane.org>
	<1273330086.23460.11.camel@desktop.maison.net>
Date: Sat, 8 May 2010 10:25:16 -0700
Message-ID: <w2v19c1b8a91005081025l9688a5b8wc6eff5bc15496513@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sat, 08 May 2010 17:29:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 8, 2010 at 7:48 AM, Thomas Jourdan <thomas.jourdan@yaeld.fr> wr=
ote:
> Hi
>
> The problems seems to come from the conversion to new staging mode in
> GDB.

right

Now, gdb-cross-sdk inherits from sdk and cross whereas before it
> only inherited from cross.
>
> Reverting Khem Raj GDB patches fixes the build for me (meta-toolchain
> works again).

thats because gdb 7.1 is then not using new staging and hence it builds aga=
in.

>
> Regards,
> Thomas
>
> Le vendredi 07 mai 2010 =E0 11:30 +0200, Koen Kooi a =E9crit :
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Currently meta-toolchain is unbuildable:
>>
>> Missing or unbuildable dependency chain was: ['gdb-cross-sdk']
>> NOTE: Runtime target 'task-sdk-host' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['task-sdk-host',
>> 'gdb-cross-sdk']
>> ERROR: Required build target 'meta-toolchain' has no buildable providers=
.
>> Missing or unbuildable dependency chain was: ['meta-toolchain',
>> 'task-sdk-host', 'gdb-cross-sdk']
>> Command execution failed: Traceback (most recent call last):
>> =A0 File "/OE/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
>> =A0 =A0 commandmethod(self.cmds_async, self, options)
>> =A0 File "/OE/bitbake/lib/bb/command.py", line 174, in buildTargets
>> =A0 =A0 command.cooker.buildTargets(pkgs_to_build, task)
>> =A0 File "/OE/bitbake/lib/bb/cooker.py", line 757, in buildTargets
>> =A0 =A0 taskdata.add_unresolved(localdata, self.status)
>> =A0 File "/OE/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
>> =A0 =A0 self.remove_runtarget(self.getrun_id(target))
>> =A0 File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
>> =A0 =A0 self.fail_fnid(fnid, missing_list)
>> =A0 File "/OE/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
>> =A0 =A0 self.remove_runtarget(target, missing_list)
>> =A0 File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
>> =A0 =A0 self.fail_fnid(fnid, missing_list)
>> =A0 File "/OE/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
>> =A0 =A0 self.remove_buildtarget(target, missing_list)
>> =A0 File "/OE/bitbake/lib/bb/taskdata.py", line 519, in remove_buildtarg=
et
>> =A0 =A0 raise bb.providers.NoProvider
>> NoProvider
>>
>> The weird thing is that 'bitbake gdb-cross-sdk' *DOES* work. Any ideas?
>>
>>
>> regards,
>>
>> Koen
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFL493HMkyGM64RGpERAsfeAJ4+dAGLxl374iYexNPvF7aOl1L9jwCdEvTu
>> mKxwdYeXXCsZzQ0H8yocaBw=3D
>> =3Duhtx
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


