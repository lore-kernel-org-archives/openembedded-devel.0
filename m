Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Q7zye-0003OD-Ma
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 02:55:08 +0200
Received: by fxm19 with SMTP id 19so2371474fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 17:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=xdib1eueUHV8dczDiBDFYqVPE7bVT+0B/cLDV+khu5I=;
	b=Khk/nmgNMgYkSkrYvkaAWqWsRTXb0Burc4ru/p0GwPm8RDh9ulj+JDA/Gpw9gsfxx3
	zX1mmszMShKYaGO0EgHmE2vCJJxu2Si62llSpXZq9Zl9AnPSKwjdk6W4tVESX6/u4dqg
	bKa2za20Qs11rMdMHF1EL+CgPiON71jPrW4pk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CrfoNLnZ19xQShhpm43TSeL7U0t9nhJdQf5B4niYR4sNm87lPD3CEBGuyUZPQ2erHp
	sOUPWD3ilBQo1WTdJFW+ZdYBpwWEGUoBtQTdZUHbbS9ppfzzIzFSIEHZ+Wt18sdHCEyo
	CqMU/54tK23R2knK8YDiAYL/WsLYuBc/6tX3w=
MIME-Version: 1.0
Received: by 10.223.97.196 with SMTP id m4mr1559036fan.105.1302223980357; Thu,
	07 Apr 2011 17:53:00 -0700 (PDT)
Received: by 10.223.75.202 with HTTP; Thu, 7 Apr 2011 17:53:00 -0700 (PDT)
In-Reply-To: <BANLkTimdVLseS5y=VvMmZoy5F62S4y4TwA@mail.gmail.com>
References: <BANLkTimXZfFJORrAqT9JO1hHVGWenjAfAA@mail.gmail.com>
	<BANLkTimdVLseS5y=VvMmZoy5F62S4y4TwA@mail.gmail.com>
Date: Fri, 8 Apr 2011 12:53:00 +1200
Message-ID: <BANLkTi=+XNv7QM+9cbb2tZ7o6-DTaYkGxQ@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 08 Apr 2011 00:55:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks

What's the story with org.openembedded.dev/contrib/python/generate-manifest=
*

Do I have to modify that?

--Charles


On Fri, Apr 8, 2011 at 12:07 PM, Robert Foerster <robert@erafx.com> wrote:
> On Thu, Apr 7, 2011 at 7:51 PM, Charles Manning <cdhmanning@gmail.com>wro=
te:
>
>> Hi
>>
>> I have a project which uses python as part of the building process to
>> generate some C code from some XML which is then later compiled.
>>
>> The python script uses the python lxml module.
>>
>> My recipe has a do_compile as follows:
>>
>> do_compile() {
>> =A0 =A0 =A0 =A0cd ${S}/
>> =A0 =A0 =A0 =A0make -f Gencode.mk
>> =A0 =A0 =A0 =A0make
>> }
>>
>> During the make -f Gencode.mk, the python script which imports lxml
>> fails to do so and fails.
>>
>> Question: How do I instruct OE to set up the lxml module and make it
>> available here?
>>
>>
> I don't see a recipe for python-lxml-native, so you'll likely have to mak=
e
> one (and then make your recipe depend on it to ensure it's built and
> available).
>
> There are several other python-*-native modules in OE, take a look at wha=
t
> they're doing.
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/python
>
>
>
>
>> Thanks
>>
>> Charles
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


