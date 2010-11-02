Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAd3-0002I1-AG
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:45:57 +0100
Received: by iwn42 with SMTP id 42so7653696iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KbjtQmT2YBK0JywRAKw1mVzeHOBlUWux0ITt0RvlMT0=;
	b=v2E7/L+ssEFQciazKl/FWiD48T6QLFB8JHzr9BbHJsTNuOWEyQM0LLKerb6qKRpssk
	dxX0ZE/ksCCKgeGP9/027CFbLKnXR4ib91tZybRczuWUJSH5J5BLpB7wPkMj7BH1kkPl
	9oczGzHUNbjOdv5j4xcqSPlE680iQE4y+pc5Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BQV98Ix2Xr5+/6HNOUVbI6OgG7SMiFKz7MtUA3mo7waM+rcCXWhntHtuVD8nEoDy79
	m2KyBtnP/m6HXO4nlWFOAnstSFkMnNPGzYmcjYW7QWbmRvsKsdlZr8tjIa49DVSvyHdi
	TNEjiLLHj0URSbqFEeylH99lc1ZMIadsZuXQ4=
MIME-Version: 1.0
Received: by 10.42.230.65 with SMTP id jl1mr1836601icb.134.1288680309097; Mon,
	01 Nov 2010 23:45:09 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:45:09 -0700 (PDT)
In-Reply-To: <AANLkTimu+7ZwbtYDggSa115V-ZvQU54kJ5+f8kyKEGzL@mail.gmail.com>
References: <4CCF64BD.4090500@gmail.com>
	<AANLkTi=s_Y6MVx9cVtqHyp5hfgJz9i=UdpoVb-4OhtyN@mail.gmail.com>
	<AANLkTimu+7ZwbtYDggSa115V-ZvQU54kJ5+f8kyKEGzL@mail.gmail.com>
Date: Tue, 2 Nov 2010 07:45:09 +0100
Message-ID: <AANLkTi=28J1jywh-ohxBR+tymVLZnodFt5XhKsZp43TS@mail.gmail.com>
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
Subject: Re: [PATCH] python-cython_0.13.bb: Add python-native to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 06:45:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/2 Graham Gower <graham.gower@gmail.com>:
> On 2 November 2010 15:13, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Nov 1, 2010 at 6:09 PM, Graham Gower <graham.gower@gmail.com> wrote:
>>>
>>> /mnt/oe/tmp/work/x86_64-linux/python-cython-native-0.13-r0/temp/run.do_compile.28826: line 927: /mnt/oe/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or directory
>>> FATAL: python setup.py build_ext execution failed.
>>
>> hmmm what happens if you just add python to DEPENDS instead of python-native ?
>>
>
> That would probably work too since python depends on python-native. Is
> this preferred? I can't tell if this app requires python itself, or if
> its just the build system that needs it.
>

Thanks for your contribution!

This might be trickier than it looks at first sight.
Adding python to depends seems the obvious way.
BBCLASSEXTEND = "native" will cause the depends on python to be
substituted in a depends on python-native (and you were building
python-cython-native, not python-cython), so there adding python to
DEPENDS is ok.

The real Q is when building python-cython (not -native ! ). Does this
need python to build or python-native (I expect the former, but I did
not test).
Suggestion is to bitbake -cclean python and python-native then build
python-cython without the depedendency and see if it fails on python
or on python-native.

And if the depends of python-cython is on python-native it might be
needed to add python to RDEPENDS (not fullty sure, I don't know too
much about python).
A run time test can tell this.

Frans.


