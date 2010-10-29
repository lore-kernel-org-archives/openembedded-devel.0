Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <james.ronald@gmail.com>) id 1PBqlA-0001V7-Oe
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 17:20:56 +0200
Received: by bwz10 with SMTP id 10so2619190bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5MAAP3Bi3c/rKuSjjwyBg350rlPwOYv8nTa4T1NpCEE=;
	b=fu2ppo9Z1dywmUkr3Yv+guhnVAh258hEeQ6+2HGYTGPJ8y7kul+P+uLsAecpBpOIO+
	fbu5gO0EAX/gOop4WuZ6GNcwUpUXbU9Pe9SMo9ziWolUUj7l7Uo4J8vt4Ml7iK1k+Nme
	0qviDBX0BzZDSSs8nVmDkagO9f80ybGpjJI/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HDyrQnCftf51ykZVHv7pyJCIW0t1Nh0G85l3jRjmZRPUFqe5gglLYMwMjpOjUSl0BL
	0sfhNKKZpG465Lf2QSD0No0jNe9pIamCG+nBjSIC3gHJz4p+Npjlii7RdEx1OHXEckC5
	aE2LGvoEXD/ITUaFvZ+E+vSV7tG3DPsYxITvY=
MIME-Version: 1.0
Received: by 10.204.117.199 with SMTP id s7mr10079503bkq.15.1288365606832;
	Fri, 29 Oct 2010 08:20:06 -0700 (PDT)
Received: by 10.204.25.7 with HTTP; Fri, 29 Oct 2010 08:20:06 -0700 (PDT)
In-Reply-To: <4CCA94CC.3080302@phoenixsoftware.it>
References: <4CC97820.5090808@nedap.com>
	<loom.20101029T033738-284@post.gmane.org>
	<4CCA94CC.3080302@phoenixsoftware.it>
Date: Fri, 29 Oct 2010 11:20:06 -0400
Message-ID: <AANLkTimpAJJUoDkY=JvH6o39kssgWdGkgWs_fHa4q-Gd@mail.gmail.com>
From: James Ronald <james.ronald@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: james.ronald@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error?
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
X-List-Received-Date: Fri, 29 Oct 2010 15:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Pierluigi,

Thanks! Installing bitbake-1.10.1 fixed my problem.

- Jim

On Fri, Oct 29, 2010 at 5:33 AM, Pierluigi Passaro
<pierluigi.passaro@phoenixsoftware.it> wrote:
>
> Not sure this is the best solution, but I solved same issue using latest =
bitbake 1.10.1 downloaded from
>
> http://download.berlios.de/bitbake/bitbake-1.10.1.tar.gz
>
>
> James Ronald wrote:
>>
>> Jaap de Jong <jaap.dejong <at> nedap.com> writes:
>>
>>
>>>
>>> I'm probably totally stupid...
>>> What am doing wrong?
>>> (I'm working on a fresh unstable branch)
>>> When I bitbake I get:
>>>
>>> MACHINE=3Dat91sam9263ek =A0bitbake u-boot
>>> Traceback (most recent call last):
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 143, =
in <module>
>>> =A0 =A0 main()
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 123, =
in main
>>> =A0 =A0 cooker.parseConfiguration()
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line =
68, in parseConfiguration
>>> =A0 =A0 self.parseConfigurationFile( os.path.join( "conf", "bitbake.con=
f" ) )
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line =
402, in parseConfigurationFile
>>> =A0 =A0 bb.fetch.fetcher_init(self.configuration.data)
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/fetch/__init__.py=
", line 93, in fetcher_init
>>> =A0 =A0 pd =3D persist_data.PersistData(d)
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/persist_data.py",=
 line 52, in __init__
>>> =A0 =A0 bb.mkdirhier(self.cachedir)
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", lin=
e 133, in mkdirhier
>>> =A0 =A0 debug(3, "mkdirhier(%s)" % dir)
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", lin=
e 103, in debug
>>> =A0 =A0 bb.msg.debug(lvl, None, ''.join(args))
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/msg.py", line 100=
, in debug
>>> =A0 =A0 bb.event.fire(MsgDebug(msg, None))
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/event.py", line 6=
7, in fire
>>> =A0 =A0 if tmpHandler(event) =3D=3D Handled:
>>> =A0 File "tmpHandler(e)", line 8, in tmpHandler
>>> NameError: global name 'msg' is not defined
>>>
>>>
>>
>> I'm getting the exact same error. I'm new to OE and just going through t=
he Getting started wiki entry. Ubuntu 10.04 installing bitbake via apt-get =
install bitbake.
>>
>> bitbake --version BitBake Build Tool Core version 1.8.18, bitbake versio=
n 1.8.18
>> =A0OE is current as of a few minutes ago.
>>
>> jr@ubuntu-xpc:~/oe/build$ bitbake nano
>> Traceback (most recent call last):
>> =A0File "/usr/bin/bitbake", line 143, in <module>
>> =A0 =A0main()
>> =A0File "/usr/bin/bitbake", line 123, in main
>> =A0 =A0cooker.parseConfiguration()
>> =A0File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 67, in parseCo=
nfiguration
>> =A0 =A0self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf"=
 ) )
>> =A0File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 401, in parseC=
onfigurationFile
>> =A0 =A0bb.fetch.fetcher_init(self.configuration.data)
>> =A0File "/usr/lib/pymodules/python2.6/bb/fetch/__init__.py", line 93, in=
 fetcher_init
>> =A0 =A0pd =3D persist_data.PersistData(d)
>> =A0File "/usr/lib/pymodules/python2.6/bb/persist_data.py", line 52, in _=
_init__
>> =A0 =A0bb.mkdirhier(self.cachedir)
>> =A0File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 133, in mkdi=
rhier
>> =A0 =A0debug(3, "mkdirhier(%s)" % dir)
>> =A0File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 103, in debu=
g
>> =A0 =A0bb.msg.debug(lvl, None, ''.join(args))
>> =A0File "/usr/lib/pymodules/python2.6/bb/msg.py", line 100, in debug
>> =A0 =A0bb.event.fire(MsgDebug(msg, None))
>> =A0File "/usr/lib/pymodules/python2.6/bb/event.py", line 67, in fire
>> =A0 =A0if tmpHandler(event) =3D=3D Handled:
>> =A0File "tmpHandler(e)", line 8, in tmpHandler
>> NameError: global name 'msg' is not defined
>>
>> - Jim
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


