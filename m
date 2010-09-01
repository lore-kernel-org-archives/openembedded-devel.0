Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oqvux-0000Bu-8K
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 00:36:36 +0200
Received: by iwn2 with SMTP id 2so7030204iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wKBcNkVd2cXT/89USSrADHjQl9wlo6OOluCKJVrTIlA=;
	b=izt1LxAwps+MikqX7BbNmbN6l8JkD7qFEYy90/ih7+eEP1BFyVWF/XL+5PnF+c+Mbb
	jsvVvUd4+fskQJgeBxUf4V2VbYhB0jid8oasv9JTWpv15OdIT8uw66k3LX4DvZEnNV7d
	cijNXzRlz+7OwEBlIE/ianXv4dMJ86T/In6bA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PWimG0FqlJUht6jJgNh8uU1ZP7l6iS//Zlj5lK2j0GisLMcGO7ynU0/o5AbC2YTPtb
	bhSBX+UkC5BVQX2LKXUc4nZV2+Pi907Irzp/2GitY4d+rbRNtP5jr/EU5OxugqrCqriL
	AQxVnmbStzGZDYj2xBSsjBhB/AkCAFQ9/I7GQ=
MIME-Version: 1.0
Received: by 10.231.59.212 with SMTP id m20mr9414797ibh.130.1283380557544;
	Wed, 01 Sep 2010 15:35:57 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Wed, 1 Sep 2010 15:35:57 -0700 (PDT)
In-Reply-To: <20100901192510.GA24544@denix.org>
References: <10034543.559431283349469680.JavaMail.defaultUser@defaultHost>
	<AANLkTi=U33a2xMK4SWWmF8c6hPi18vnedSaoTARuMwPn@mail.gmail.com>
	<20100901192510.GA24544@denix.org>
Date: Thu, 2 Sep 2010 08:05:57 +0930
Message-ID: <AANLkTim=he3n7LUhmOJh2zJGJXymZvnv8kviGSAPnC3p@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg vs dpkg/rpm
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
X-List-Received-Date: Wed, 01 Sep 2010 22:36:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 September 2010 04:55, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Sep 01, 2010 at 07:43:38AM -0700, Chris Larson wrote:
>> In addition to package writing, there's the IMAGE_PKGTYPE varaible which
>> controls which of the rootfs_<pkgtype> bbclasses is used to construct th=
e
>> root filesystem. =A0You can inherit multiple packaging formats, resultin=
g in
>> multiple formats being emitted, but one has to be selected specifically =
for
>> the filesystem. =A0If you only inherit one packaging class (i.e. package=
_ipk)
>> it will automatically set the image packaging type to match. =A0So, to s=
witch:
>>
>> 1) INHERIT +=3D "package_rpm"
>> 2) IMAGE_PKGTYPE =3D "rpm"
>
> Just a small clarification for Chris' excelent explanation - the change o=
f the
> above variables will require a complete rebuild/repackage of all the pack=
ages
> and the filesystem image. And it's not possible to make the switch for an
> existing image or add another package manager to an existing image w/o lo=
sing
> the database of installed packages...
>
> --
> Denys

It would be trivial to write a script to convert the package database
from one package manager's format to another. Surely someone has
already done this?

-Graham


