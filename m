Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUKA1-0008OW-AU
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 16:27:27 +0100
Received: by qadc10 with SMTP id c10so3340081qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 07:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bEVIVp1RJD14i9kRKoMLCfqGTW9c2zTpCRgKf6fKmsw=;
	b=tR0pKAn49Z48o1EYAgiJotWtN0bX+n53WileIKudp+niMB5RcsBm0ptgsFNNbFOY8W
	c77R8F3K8BlBdaczZYJql8Yme0jENmG7i/CT+7uo4O0WB4q0xEf+Jss5m2GIezD7Zlky
	xpaUtrLr/rqQn5mQVMw1Kib7uQoXJKsT0ZtMs=
MIME-Version: 1.0
Received: by 10.224.189.129 with SMTP id de1mr16951778qab.18.1322320849351;
	Sat, 26 Nov 2011 07:20:49 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 07:20:49 -0800 (PST)
In-Reply-To: <4ED0C603.9020900@telia.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
	<CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>
	<4ED0C603.9020900@telia.com>
Date: Sat, 26 Nov 2011 08:20:49 -0700
Message-ID: <CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 15:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 26, 2011 at 3:57 AM, Ulf Samuelsson
<ulf_samuelsson@telia.com> wrote:
> On 2011-11-25 23:04, Tom Rini wrote:
>>
>> On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> =A0wrote:
>>
>>> After all, isn't one of the purposes of OE to promote information
>>> sharing,
>>> cooperation and the use of openembedded technology (and not make things
>>> harder).
>>
>> One of the points of making master read-only would be to ensure that
>> changes aren't lost.
>>
>> Perhaps the transition needs to be:
>> - master is as it is today
>> - master becomes oe-core backport || master-only bugfixes only
>> - master becomes read only.
>>
>> And we go from the first step to the second step sometime sooner
>> rather than later. =A0The top of my head date would be before the
>> paid-developers go on end of year breaks to try and make sure all the
>> hobbyist folks start their hacking with oe-core+etc rather than master
>> and risk getting caught later. =A0I'm open to arguments on why that's
>> exactly backwards...
>>
>
> Won't it be a problem for existing projects, if you cannot add fixes to c=
ope
> with new host OS versions.
>
> At the moment, openembedded-classic does not build properly with Ubuntu
> 11.10 .

Won't what be a problem?  Either oe-core+meta-oe+etc fails on 11.10
(so, fix it there first then backport changes) or it's fine and you
can either find the relevant changes there and move them or it's a
oe.dev-only bug and just needs to be fixed, under my proposal (until
we reach the point where everyone is OK calling it r/o).

And part of this is to say that yes, existing projects external to
oe.dev need to move to oe-core(+meta-oe+whatever else) (where layers
should be making their life easier or again, there's problems we're
unaware of and need to be made aware of) or explain why they can't
ever move (and are forking the project?).

--=20
Tom


