Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RU7B9-0000cP-Mg
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 02:35:43 +0100
Received: by qadc10 with SMTP id c10so3189140qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 17:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/a+XwjHambXdPqz5aqEkufd+VZJb39aoUjPcSfcVqU0=;
	b=WpdbxX8n3XOoKhDvwLTBWXafoIPUOcFJ3C5RQCC3vl6POgkCSlEqdTdseUGqQGi7mh
	BG79Deb9wxftd4FAITKhEwpsODfEMEPXtMmz6O0H0e0FYUmnMBkENXkZtoYnCMxxruV1
	eolYBxP7BmoL1ZrZyC5Oi4Y1gDyXU7yv13Qto=
MIME-Version: 1.0
Received: by 10.224.18.69 with SMTP id v5mr16061675qaa.31.1322270948094; Fri,
	25 Nov 2011 17:29:08 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Fri, 25 Nov 2011 17:29:08 -0800 (PST)
In-Reply-To: <CAEsOVNchsOnDwZhadFHUHDz98oLrXm0fk-gV=WHWf-iWCS2xGA@mail.gmail.com>
References: <1322247176.91444.YahooMailRC@web5703.biz.mail.ne1.yahoo.com>
	<CAEsOVNchsOnDwZhadFHUHDz98oLrXm0fk-gV=WHWf-iWCS2xGA@mail.gmail.com>
Date: Fri, 25 Nov 2011 18:29:08 -0700
Message-ID: <CA+M6bXkH28ymg+CC+6bffS-KDHgpwaCneDZ_ezeThs7=ku7xNw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Mac OS X & redhat-lsb
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
X-List-Received-Date: Sat, 26 Nov 2011 01:35:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 25, 2011 at 12:19 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Fri, Nov 25, 2011 at 12:52 PM, Brett McMillian
> <brett.mcmillian@crossfieldtech.com> wrote:
>> Here are the steps I have run successfully so far.
>> 1) ./scripts/rhel5-oe.sh
>> 2) Edited the first line of ./scripts/create-config.py to read:
>> #!/usr/bin/python2.7
>> 3) ./scripts/create-config.py --config-file=fsl-p1022ds/sample-create-config.ini
>> --features="native-development" -j 4 -t 2
>> 4) source build_p1022ds_release/bitbake.rc
>> 4) bitbake devel-image
>
> Just for everyone's information, some of this stuff is specfic to the
> Freescale SDK. But, I think the rest should be valid.

OS X isn't a supported (nor functional) build environment today nor in
the snapshot that SDK is built from.  The first bit of problems sound
like a "well, try python 2.6 instead" but once you overcome that,
other things will fail.

-- 
Tom


