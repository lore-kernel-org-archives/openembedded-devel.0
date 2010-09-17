Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OwdOx-0001QL-U2
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 18:03:05 +0200
Received: by ywa8 with SMTP id 8so847836ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Ljku07dOtxpIIVwZUKZ7T5/+Ak31OlEbxBdUjT3BoeE=;
	b=GJXnIftuoNOQkrd0CtFYU3O5xQX4jtgo4DmECbmwmw+Vj3WGvqvmg62UGjm3iFFBtE
	dV3UdKlSm6i5cHGas/ahlyWG8welxhNGYr6RkhQhXFzBUGfWJkRN1/ezT9yvMWCQnCvq
	/cUzQWej/CbxHU2D2I9G7gIbMi78tE/eTwVZ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gwOUtb4d07POBxwi4n8lLnz8qs7Ee5KzwenmQd6MqYWC/V+SPl9rGKqJcyZuumYsey
	QvuteP2u7UV11bmoVF0TT07zDPzlpYJNM+ExrwKbJWkMEtY/GFBBfWotG6oLRQ1hP9iQ
	Pg3ziR+CpRxEqCV/CWCaWFqT8nMiVeUk1VusI=
Received: by 10.101.209.13 with SMTP id l13mr5682227anq.238.1284739331482;
	Fri, 17 Sep 2010 09:02:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Fri, 17 Sep 2010 09:01:51 -0700 (PDT)
In-Reply-To: <4C92BC90.3090900@gmail.com>
References: <4C92BC90.3090900@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Sep 2010 09:01:51 -0700
Message-ID: <AANLkTi=N4_SyEcLZViP-9ae8+KHetqZdD7UUeRVmxx47@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openmoko-theme-standard2_svn.bb and openmoko_two_get_license() wrong SECTION
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
X-List-Received-Date: Fri, 17 Sep 2010 16:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2010 at 5:55 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> I saw a strange failure in bitbake- k world logs for mipsel/qemumipsel,
> so I added a print statement to openmoko_two_get_license().
>
> def openmoko_two_get_license(d):
> =C2=A0 =C2=A0print "~~~~~~~~~~~"
> =C2=A0 =C2=A0print "SECTION=3D%s" % bb.data.getVar('SECTION', d, 1)
> =C2=A0 =C2=A0print "~~~~~~~~~~~"
> =C2=A0 =C2=A0openmoko, section =3D bb.data.getVar('SECTION', d, 1).split(=
"/")
> =C2=A0 =C2=A0return "LGPL GPL".split()[section !=3D "libs"]
>

 I have fixed it already. update to latest master.

>
> grg@eye7:~/oe2$ bitbake -b openembedded/recipes/openmoko2/openmoko-theme-=
standard2_svn.bb
> NOTE: oestats: error starting build, disabling stats
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> ~~~~~~
> SECTION=3Ddevel
> ~~~~~~~~~~~
> ERROR: Task 17 (/home/grg/oe2/openembedded/recipes/openmoko2/openmoko-the=
me-standard2_svn.bb, do_package_write_ipk) failed with exit code '1'
> NOTE: Running task 11 of 19 (ID: 17, /home/grg/oe2/openembedded/recipes/o=
penmoko2/openmoko-theme-standard2_svn.bb, do_package_write_ipk)
> NOTE: package openmoko-theme-standard2-0.1.1+svnr4338-r6: task do_package=
_write_ipk: Started
> ERROR: Error evaluating '${@openmoko_two_get_license(d)}'
> Traceback (most recent call last):
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 84, in expa=
nd
> =C2=A0 =C2=A0s =3D __expand_python_regexp__.sub(python_sub, s)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 71, in pyth=
on_sub
> =C2=A0 =C2=A0value =3D utils.better_eval(codeobj, {"d": self})
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 357, in better_e=
val
> =C2=A0 =C2=A0return eval(source, _context, locals)
> =C2=A0File "LICENSE", line 1, in <module>
> =C2=A0File "openmoko2.bbclass", line 5, in openmoko_two_get_license
> ValueError: need more than 1 value to unpack
>
> ERROR: Error executing python function in 'do_package_ipk'
> Traceback (most recent call last):
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 334, in better_e=
xec
> =C2=A0 =C2=A0exec(code, _context, context)
> =C2=A0File "do_package_ipk", line 175, in <module>
> =C2=A0File "do_package_ipk", line 103, in do_package_ipk
> =C2=A0File "do_package_ipk", line 93, in pullData
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/data.py", line 87, in getVar
> =C2=A0 =C2=A0return d.getVar(var, exp)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 226, in get=
Var
> =C2=A0 =C2=A0return self.expand(value, var)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 84, in expa=
nd
> =C2=A0 =C2=A0s =3D __expand_python_regexp__.sub(python_sub, s)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 71, in pyth=
on_sub
> =C2=A0 =C2=A0value =3D utils.better_eval(codeobj, {"d": self})
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 357, in better_e=
val
> =C2=A0 =C2=A0return eval(source, _context, locals)
> =C2=A0File "LICENSE", line 1, in <module>
> =C2=A0File "openmoko2.bbclass", line 5, in openmoko_two_get_license
> ValueError: need more than 1 value to unpack
>
> ERROR: Printing the environment of the function
> ERROR: =C2=A00001:def do_package_ipk(d):
> ERROR: =C2=A00002: =C2=A0 import re, copy
> ERROR: =C2=A00003:
> ERROR: =C2=A00004: =C2=A0 workdir =3D bb.data.getVar('WORKDIR', d, 1)
> ERROR: =C2=A00005: =C2=A0 if not workdir:
> ERROR: =C2=A00006: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error("WORKDIR n=
ot defined, unable to package")
> ERROR: =C2=A00007: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> ERROR: =C2=A00008:
> ERROR: =C2=A00009:
> ERROR: Logfile of failure stored in: /mnt/oe/tmp/work/all-oe-linux/openmo=
ko-theme-standard2-0.1.1+svnr4338-r6/temp/log.do_package_ipk.13541
> Log data follows:
> | ~~~~~~~~~~~
> | SECTION=3Ddevel
> | ~~~~~~~~~~~
> NOTE: package openmoko-theme-standard2-0.1.1+svnr4338-r6: task do_package=
_ipk: Failed
> ERROR: Function 'do_package_ipk' failed (see /mnt/oe/tmp/work/all-oe-linu=
x/openmoko-theme-standard2-0.1.1+svnr4338-r6/temp/log.do_package_ipk.13541 =
for further information)
>
>
>
> Clearly, openmoko-theme-standard2_svn.bb has SECTION=3D"openmoko/base".
> Where does "devel" come from?
>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


