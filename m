Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PFXJK-0004Ea-R8
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 20:23:40 +0100
Received: by gyf3 with SMTP id 3so3889349gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 11:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=X626F2KhWTTksrvVk+vzqypGBMURoFU1G7xP0vjZDJg=;
	b=v47Jj5PA31Ku5K2dN9xjLBni4Uu9qDdUo7gAi9qSGnDQrsDYrJLM2NxaG/dhM0p4hY
	9wRrqsGz1Kc709E6RPjVZztfmas10V/NmPtEmpJbbyWBzAhaytBNZL8d48+P7tDeHAQG
	rA8eDRI1IKqEtN1ESiHfrHexVXs+zsdcqcWxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=j9FFfbY2f1jQkXqRcKAU7Tz8GsarZ6zl2rKAgJHXw/i+xQ8ptAnsPjBeH+4jetE+u2
	3EVdBvAIgrylvGwM8PVkrRXg11UIeK3KXZ6Zi3Gkq/K5MWY6F7w+AZ2ltnNR8yxBPPcq
	8ESKIH7C5WGgUpjmjkDjizvWEDG8kzRLjUQLM=
Received: by 10.91.153.10 with SMTP id f10mr5714893ago.172.1289244145313; Mon,
	08 Nov 2010 11:22:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 8 Nov 2010 11:22:05 -0800 (PST)
In-Reply-To: <4CD731A8.3020809@gmail.com>
References: <4CD731A8.3020809@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Nov 2010 11:22:05 -0800
Message-ID: <AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake weirdness during -k world
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
X-List-Received-Date: Mon, 08 Nov 2010 19:23:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 7, 2010 at 3:09 PM, Graham Gower <graham.gower@gmail.com> wrote=
:
> I have a 1gb world.log file after running:
> bitbake -k world | tee world.log
>

I have this very same problem too and its recent enough. We should be
able to find which commit is causing it (bisect bitbake)
I am using bitbake master are you using same too ?

> The build appears to have gotten about half way through (compared with
> previous builds) and then begun infinitely repeating the following messag=
e.
>
> Traceback (most recent call last):
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/server/none.py", line 128, in id=
le_commands
> =C2=A0 =C2=A0retval =3D function(self, data, False)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/cooker.py", line 716, in buildTa=
rgetsIdle
> =C2=A0 =C2=A0retval =3D rq.execute_runqueue()
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 877, in execu=
te_runqueue
> =C2=A0 =C2=A0self.execute_runqueue_internal()
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 992, in execu=
te_runqueue_internal
> =C2=A0 =C2=A0self.build_pipes[pipe].read()
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 1227, in read
> =C2=A0 =C2=A0bb.event.fire_from_worker(self.queue[:index+8], self.d)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/event.py", line 137, in fire_fro=
m_worker
> =C2=A0 =C2=A0event =3D pickle.loads(event[7:-8])
> =C2=A0File "/usr/lib64/python2.6/pickle.py", line 1374, in loads
> =C2=A0 =C2=A0return Unpickler(file).load()
> =C2=A0File "/usr/lib64/python2.6/pickle.py", line 858, in load
> =C2=A0 =C2=A0dispatch[key](self)
> =C2=A0File "/usr/lib64/python2.6/pickle.py", line 966, in load_string
> =C2=A0 =C2=A0raise ValueError, "insecure string pickle"
> ValueError: insecure string pickle
>
>
> I identified the location where the message begins and it is not possible
> to link it to any other errors nor to a particular recipe. Context looks =
like this:
>
> NOTE: Unpacking ../oe/sources/libAppleWM-1.4.0.tar.bz2 to /mnt/oe/tmp/wor=
k/mipsel-oe-linux/libapplewm-1_1.4.0-r9.0/
> NOTE: package dhcpcd-1.3.22-pl4-r1: task do_install: Succeeded
> NOTE: =C2=A0 /usr/share/ti/ti-biosutils-tree/packages/xdoc/external.png
> NOTE: =C2=A0 /usr/share/ti/ti-biosutils-tree/packages/xdoc/Bullet.png
> Traceback (most recent call last):
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/server/none.py", line 128, in id=
le_commands
> =C2=A0 =C2=A0retval =3D function(self, data, False)
> =C2=A0File "/home/grg/oe2/bitbake/lib/bb/cooker.py", line 716, in buildTa=
rgetsIdle
> =C2=A0 =C2=A0retval =3D rq.execute_runqueue()
>
>
>
> FYI, i do have this stupidity in my local.conf:
> PARALLEL_MAKE =3D "-j 12"
> BB_NUMBER_THREADS =3D "12"
>
>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


