Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MHT4I-0000Jb-MQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 03:39:02 +0200
Received: by an-out-0708.google.com with SMTP id b6so661523ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 18:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GV+v44nHOhnF2Y1iORK0adp7tG9QIPBBf85J5QGIcBY=;
	b=ozMFg3iymXve6PLLUdHFV3vkpVMfkPXvHDpQcmbXSa1IomDn5p+wR/vGoWGzdIWr3d
	vs0l/9j79fvp7P8/cyVQSfl4VKN++x8mzheAQ4u3Umyl9hgA9lRn/6US7ThnItcJpVYC
	tsBz4N5QWK+VcGYMbZQhkGxSpmqJSIBZl8MVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jwRhAWLYy6SxTIVML1r01h/XTq0GYwMd2WTiZ+pk7sk0ioUowPPNRi5BE/JfP1CJ+U
	7zRh/f76roDCSi7qw7P9tG7bv+VODgMDSpqQuseI+Gpo8rH55MsDFmTPQusDrsXEj60I
	Dus0grxvXVFO+/od6PY0D1HvD0jAClbEGypLA=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.209.14 with SMTP id h14mr3050123ang.139.1245374907171; 
	Thu, 18 Jun 2009 18:28:27 -0700 (PDT)
In-Reply-To: <20090618230514.GP15477@smtp.west.cox.net>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h19s8q$jd7$1@ger.gmane.org>
	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>
	<h1dr55$nue$1@ger.gmane.org>
	<be7a9f3d0906180952v1bbb0611kd7079d5d947f83b8@mail.gmail.com>
	<h1dusl$4lp$1@ger.gmane.org> <4A3A8348.8080502@balister.org>
	<h1e0ot$bjn$1@ger.gmane.org>
	<20090618230514.GP15477@smtp.west.cox.net>
Date: Thu, 18 Jun 2009 22:28:27 -0300
X-Google-Sender-Auth: bdf75406dcaf2c24
Message-ID: <be7a9f3d0906181828t54ef2823k5c9ec010f215d403@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Fri, 19 Jun 2009 01:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Full support for your proposal Tom :-)

On Thu, Jun 18, 2009 at 8:05 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Thu, Jun 18, 2009 at 08:24:29PM +0200, Koen Kooi wrote:
>> On 18-06-09 20:11, Philip Balister wrote:
>>> Koen Kooi wrote:
>>>> On 18-06-09 18:52, Otavio Salvador wrote:
>>>>> Hello Koen,
>>>>>
>>>>> On Thu, Jun 18, 2009 at 1:48 PM, Koen Kooi<k.kooi@student.utwente.nl>
>>>>> wrote:
>>>>>>> PR =3D "r01"
>>>>>>
>>>>>> Don't set PR to that.
>>>>>
>>>>> I believe that most people prefer to always have PR field included;
>>>>> obviously it ought to be PR =3D "r1" or PR =3D "r0" but it is harder =
to
>>>>> forget to update it when it shows in the recipe.
>>>>
>>>> That's nonsense. Not setting PR =3D "r0" in recipes makes maintenance =
a
>>>> lot easier, e.g. forcing rebuild or all xorg libs. If every recipe was
>>>> already using INC_PR, I might agree with you, but since that isn't the
>>>> case adding PR =3D "r0" is creating more work.
>>>
>>> Can you explain this a little clearer? I know a number of people on the
>>> list feel like Otavio and it would be really helpful for people to
>>> understand what the downside is to starting with PR =3D "r0" instead of
>>> leaving it out.
>>
>> Suppose you want to bump PR on every xorg lib recipe, do you want to
>> edit 70 recipes or do you only want to edit 1 .inc file and 3 recipes?
>> If you're in the 'edit 70 recipes' crowd, add PR =3D "r0" to all recipes
>> in OE. If not, leave it out, bitbake defaults to it anyway.
>> Also, does anyone remember how much pain we had when adding ${PN}-dbg
>> into the default PACKAGES only to discover that lots of recipes were
>> needlessly copying defaults?
>
> But there's no .inc file here. =A0How about saying:
> - Adding an .inc file MUST switch all the recipes now using it to INC_PR
> - If you're modifying recipes that really should be INC_PR, make them
> =A0INC_PR while you're in there (the 70 xorg lib recipes not using INC_PR
> =A0today for example).
> - New recipes that also create a .inc must set INC_PR =3D "r0" / PR =3D
> =A0"${INC_PR}.0"
> - New recipes that are just a single .bb must set PR =3D "r0"
>
> The arguement against "leave it out, bitbake defaults to it anyway." is
> that "once you make a change it's easier to forget to bump PR/INC_PR if
> it's not staring you in the face".
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


