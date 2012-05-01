Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPCPu-0002Sv-4f
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 14:42:54 +0200
Received: by lagw12 with SMTP id w12so2442414lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ORD3y9kB8oM4WeeJDA219mBdhM+TqpOD8BCInTXlbEY=;
	b=tlStgeDquV9VE3Kq9H0nem3hyssOR7Ui7EIaavX0Z234Y3y4jQaSlP5Rj71uv2Xhg9
	OvzVTrGNqw0h9y2Jf4ljyVj/8jsV4xsK9UJqhchxBeIp3tBntSdtIhHZ1y7adG5mV7Ip
	zmHsDHPH20dlb1TZr0xOYL6YmQPZ2thj0f6+xfNozn9/QQ8EeOWpIE8p7xVB9S19JBMM
	SDc2+66V+ERybJeBN3aZKv8nkjFU1SRzWZfYxO5jdolxTQEHjhkhfucNgFmH36BOlx+y
	kBBqF7YLbb77HcfwHmQ2Bs+oWflHhoScZXy91mbGUIC/svawX99DSc4L2/B0WdtDReSw
	ePWw==
Received: by 10.152.111.198 with SMTP id ik6mr23091325lab.38.1335875590953;
	Tue, 01 May 2012 05:33:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Tue, 1 May 2012 05:32:40 -0700 (PDT)
In-Reply-To: <4F9F8630.3070901@gmail.com>
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 May 2012 05:32:40 -0700
Message-ID: <CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Tue, 01 May 2012 12:42:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2012 at 11:44 PM, Martin Erts=C3=A5s <martiert@gmail.com> w=
rote:
> On 05/01/12 00:05, Khem Raj wrote:
>>
>> On Fri, Apr 27, 2012 at 5:38 AM, Martin Erts=C3=A5s<martiert@gmail.com> =
=C2=A0wrote:
>>>
>>> I'm working on a pandaboard with OMAP4460. Were trying to use the newes=
t
>>> PVR drivers, which conforms to the result that arose from
>>> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>>>
>>> We have applied the patch at the bottom of that page gcc, and also a
>>> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
>>> instead of ld-linux. Problem is, this gives us a kernel panic when it
>>> tries to run init.
>>
>> interesting bits are why kernel panics ?
>> what error do you get from kernel ?
>> is it some illegal instruction or something like that ?
>> Do you have VFP enabled
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> Found out the problem why kernel panics. The patches I posted were the
> correct ones, but before this I used
>
> SYSLIB_PATH or something before "/lib/ld-linux-armhf.so.3", so the output
> actually was /lib/lib/ld-linux-armhf.so.3
>

ok good. I would be interested if you test the patchset i posted
it will help a lot


