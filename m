Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thomas.jourdan@yaeld.fr>) id 1OAlUH-0001Rs-4z
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 16:58:41 +0200
Received: (qmail 20776 invoked by uid 503); 8 May 2010 14:55:26 -0000
Received: from b9.ovh.net (HELO mail182.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 8 May 2010 14:55:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 May 2010 14:48:11 -0000
Received: from unknown (HELO ?192.168.0.132?)
	(thomas.jourdan@yaeld.fr@78.120.125.167)
	by ns0.ovh.net with SMTP; 8 May 2010 14:48:10 -0000
From: Thomas Jourdan <thomas.jourdan@yaeld.fr>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hs0mk7$rst$2@dough.gmane.org>
References: <hs0mk7$rst$2@dough.gmane.org>
Date: Sat, 08 May 2010 16:48:06 +0200
Message-ID: <1273330086.23460.11.camel@desktop.maison.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Ovh-Tracer-Id: 8766819626639237705
X-Ovh-Remote: 78.120.125.167 ()
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: thomas.jourdan@yaeld.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Sat, 08 May 2010 14:58:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi

The problems seems to come from the conversion to new staging mode in
GDB. Now, gdb-cross-sdk inherits from sdk and cross whereas before it
only inherited from cross.

Reverting Khem Raj GDB patches fixes the build for me (meta-toolchain
works again).

Regards,
Thomas

Le vendredi 07 mai 2010 à 11:30 +0200, Koen Kooi a écrit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Currently meta-toolchain is unbuildable:
> 
> Missing or unbuildable dependency chain was: ['gdb-cross-sdk']
> NOTE: Runtime target 'task-sdk-host' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['task-sdk-host',
> 'gdb-cross-sdk']
> ERROR: Required build target 'meta-toolchain' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-toolchain',
> 'task-sdk-host', 'gdb-cross-sdk']
> Command execution failed: Traceback (most recent call last):
>   File "/OE/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
>     commandmethod(self.cmds_async, self, options)
>   File "/OE/bitbake/lib/bb/command.py", line 174, in buildTargets
>     command.cooker.buildTargets(pkgs_to_build, task)
>   File "/OE/bitbake/lib/bb/cooker.py", line 757, in buildTargets
>     taskdata.add_unresolved(localdata, self.status)
>   File "/OE/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
>     self.remove_runtarget(self.getrun_id(target))
>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
>     self.fail_fnid(fnid, missing_list)
>   File "/OE/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
>     self.remove_runtarget(target, missing_list)
>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
>     self.fail_fnid(fnid, missing_list)
>   File "/OE/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
>     self.remove_buildtarget(target, missing_list)
>   File "/OE/bitbake/lib/bb/taskdata.py", line 519, in remove_buildtarget
>     raise bb.providers.NoProvider
> NoProvider
> 
> The weird thing is that 'bitbake gdb-cross-sdk' *DOES* work. Any ideas?
> 
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFL493HMkyGM64RGpERAsfeAJ4+dAGLxl374iYexNPvF7aOl1L9jwCdEvTu
> mKxwdYeXXCsZzQ0H8yocaBw=
> =uhtx
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




