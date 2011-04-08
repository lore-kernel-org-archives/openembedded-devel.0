Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Q80T7-0004Jm-K0
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 03:26:37 +0200
Received: by fxm19 with SMTP id 19so2384618fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 18:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aFcIIA5yVxKqjdT38dzM3cAT+j+UQkmU+eEXBDXEsd8=;
	b=SYZJ8oweKmYMM7kjD3SY/AQdL/3l/3sBZsa90wmg3AAtPjIY8+HF22LySXH7hzBUNJ
	BFgNoUbYWB58LRgN3CXhmMzky6oHErtPLE37EpdTCFR8o9unMECUbdCOEqFRXtfOqjMQ
	C1rPS5iSuDKq4YfLp7gxGdMDjPq2tTIEcfHLI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=j0zARnFO9PhYFzf+zyPBUJTEGPFgsbk8+GZRTX5FQuVEVxOggV1oIZBzTmrWybtQzW
	L4FvKZNhuQI/Qvisbpl+l0RA2b+9tXtlaBZWNprZKwjOIZy+7yz6+7zVP+/t1/gJsrHf
	4q3FCTiv7zT4YTgxqWeNZCluyKgwrtocjcUZo=
MIME-Version: 1.0
Received: by 10.223.24.72 with SMTP id u8mr1615836fab.10.1302225868228; Thu,
	07 Apr 2011 18:24:28 -0700 (PDT)
Received: by 10.223.75.202 with HTTP; Thu, 7 Apr 2011 18:24:28 -0700 (PDT)
In-Reply-To: <4D9E5E41.7040400@mlbassoc.com>
References: <BANLkTimXZfFJORrAqT9JO1hHVGWenjAfAA@mail.gmail.com>
	<BANLkTimdVLseS5y=VvMmZoy5F62S4y4TwA@mail.gmail.com>
	<BANLkTi=+XNv7QM+9cbb2tZ7o6-DTaYkGxQ@mail.gmail.com>
	<4D9E5E41.7040400@mlbassoc.com>
Date: Fri, 8 Apr 2011 13:24:28 +1200
Message-ID: <BANLkTi=9g6zQGg-3=TmStzwG6NP3G4CNOw@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How do I install python modules for use within recipes?
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
X-List-Received-Date: Fri, 08 Apr 2011 01:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 8, 2011 at 1:00 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 04/07/2011 06:53 PM, Charles Manning wrote:
>>
>> Thanks
>>
>> What's the story with
>> org.openembedded.dev/contrib/python/generate-manifest*
>>
>> Do I have to modify that?
>
> No, that's for the internal Python modules.
>
> n.b. don't top post :-)
>

Sorry I don't usually use gmail web interface...

So by Internal Python modules what do you mean? If that's just the
stuff used in cranking bitbake and OE then why does it need to
generate the manifest in the recipes?

Building some python modules from scratch looks ugly. Is there
anything stopping me from just using easy-install? ... Or would that
be even harder? Seems odd that native recipes don't use easy-install
unless there is a good reason not to.


-- Charles


>> On Fri, Apr 8, 2011 at 12:07 PM, Robert Foerster<robert@erafx.com> =A0wr=
ote:
>>>
>>> On Thu, Apr 7, 2011 at 7:51 PM, Charles
>>> Manning<cdhmanning@gmail.com>wrote:
>>>
>>>> Hi
>>>>
>>>> I have a project which uses python as part of the building process to
>>>> generate some C code from some XML which is then later compiled.
>>>>
>>>> The python script uses the python lxml module.
>>>>
>>>> My recipe has a do_compile as follows:
>>>>
>>>> do_compile() {
>>>> =A0 =A0 =A0 =A0cd ${S}/
>>>> =A0 =A0 =A0 =A0make -f Gencode.mk
>>>> =A0 =A0 =A0 =A0make
>>>> }
>>>>
>>>> During the make -f Gencode.mk, the python script which imports lxml
>>>> fails to do so and fails.
>>>>
>>>> Question: How do I instruct OE to set up the lxml module and make it
>>>> available here?
>>>>
>>>>
>>> I don't see a recipe for python-lxml-native, so you'll likely have to
>>> make
>>> one (and then make your recipe depend on it to ensure it's built and
>>> available).
>>>
>>> There are several other python-*-native modules in OE, take a look at
>>> what
>>> they're doing.
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/python
>>>
>>>
>>>
>>>
>>>> Thanks
>>>>
>>>> Charles
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> ------------------------------------------------------------
> Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the
> MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world
> ------------------------------------------------------------
>


