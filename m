Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5GmC-0007P1-W1
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:42:46 +0200
Received: by iwn7 with SMTP id 7so2576998iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JwDA8OIC1NX32SYJwk10Q0pjrFGtMFUlHRXcNDc+H6Q=;
	b=uszAUssuon9o+w3+DmCO6ogHzuNJN3J2FGE3fZS+uD9h1xbRvyPRv7xbmcJqO8YOkp
	AzWYvkNNn/XBaQ8PRc/ixIMCkkZRHDajzg64qoZaYJtdGrN4aU4JyQUG17YQT8V8+KCd
	GrHbQyzixSK3ZmCBYmtwwsReLPo8cnUzbLdc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dAFGNu1TS5iNhJo5FFSVtmiKzN0JawzTStMAMnrZXpBWdRttGzrSWeL0BFymsM+JNs
	5xAzpHoiuJmZKtyARi7zjl9PqKwAaYUE9scs9OSDMYOOIZ+BTk82kZzFnrKEFITJYpig
	Zw1duxfmb45dD2kO4Unak+P2tDE2QZjB237hI=
MIME-Version: 1.0
Received: by 10.231.169.149 with SMTP id z21mr4611705iby.11.1286797337501;
	Mon, 11 Oct 2010 04:42:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:42:17 -0700 (PDT)
In-Reply-To: <1286796051.3835.78.camel@mattotaupa>
References: <1286796051.3835.78.camel@mattotaupa>
Date: Mon, 11 Oct 2010 13:42:17 +0200
Message-ID: <AANLkTi=WmoGiADa+MSxgepq4PhtpjXS7qOaD76vK6A2q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+-native: depends somehow on cups-native: `ERROR: Required build target 'gtk+-native' has no buildable providers.`
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
X-List-Received-Date: Mon, 11 Oct 2010 11:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE folks,
>
>
> =A0 =A0 =A0 =A0$ bitbake evince
>
> fails with the following error for `angstrom-2010.x` for `MACHINE =3D
> "beagleboard"`.
>
> =A0 =A0 =A0 =A0ERROR: Required build target 'evince' has no buildable pro=
viders.
> =A0 =A0 =A0 =A0Missing or unbuildable dependency chain was: ['evince', 'g=
nome-keyring', 'gtk+-native', 'cups-native']
> =A0 =A0 =A0 =A0Command execution failed: Traceback (most recent call last=
):
> =A0 =A0 =A0 =A0 =A0File "/home/paul/oe/bitbake/lib/bb/command.py", line 8=
8, in runAsyncCommand
> =A0 =A0 =A0 =A0 =A0 =A0commandmethod(self.cmds_async, self, options)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/command.py", line 174, in bui=
ldTargets
> =A0 =A0 =A0 =A0 =A0 =A0command.cooker.buildTargets(pkgs_to_build, task)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/cooker.py", line 784, in buil=
dTargets
> =A0 =A0 =A0 =A0 =A0 =A0taskdata.add_unresolved(localdata, self.status)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 556, in ad=
d_unresolved
> =A0 =A0 =A0 =A0 =A0 =A0self.remove_buildtarget(targetid)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 510, in re=
move_buildtarget
> =A0 =A0 =A0 =A0 =A0 =A0self.fail_fnid(fnid, missing_list)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 490, in fa=
il_fnid
> =A0 =A0 =A0 =A0 =A0 =A0self.remove_buildtarget(target, missing_list)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 510, in re=
move_buildtarget
> =A0 =A0 =A0 =A0 =A0 =A0self.fail_fnid(fnid, missing_list)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 490, in fa=
il_fnid
> =A0 =A0 =A0 =A0 =A0 =A0self.remove_buildtarget(target, missing_list)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 510, in re=
move_buildtarget
> =A0 =A0 =A0 =A0 =A0 =A0self.fail_fnid(fnid, missing_list)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 490, in fa=
il_fnid
> =A0 =A0 =A0 =A0 =A0 =A0self.remove_buildtarget(target, missing_list)
> =A0 =A0 =A0 =A0 =A0File "/oe/bitbake/lib/bb/taskdata.py", line 519, in re=
move_buildtarget
> =A0 =A0 =A0 =A0 =A0 =A0raise bb.providers.NoProvider
> =A0 =A0 =A0 =A0NoProvider
>
> `gtk+.inc` `DEPENDS` on `cups` [1]. Is this converted to `cups-native` fo=
r `gtk+-native`?

Yes.
see native.bbclass, around line 118:

        for dep in deps:
            if dep.endswith("-cross"):
                newdeps.append(dep.replace("-cross", "-native"))
            elif not dep.endswith("-native"):

                newdeps.append(dep + "-native")
            else:
                newdeps.append(dep)
>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/gtk+/=
gtk+.inc
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


