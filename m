Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P46ZO-0000mN-O6
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 08:36:44 +0200
Received: by mail-iw0-f175.google.com with SMTP id 5so321197iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 23:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iVu09g+rmvCJscSxFmk4ejNB7aORTro/rwaH+PPC7xg=;
	b=yArSFYEIA/J3aal7qTpSXfQsAkbHXZDoeR5/epAk5K5XQFjoGFpnsZL5F+7tmnhPyU
	n8psTrZQ8mE2TeH2qvz9sg/8w4LAyXqJrbnbtoPFcq1pC9geLDOIybTKZxL9QsUIIlrb
	m7KyacVYBsMJVo91cdyN9ZcZHUlS3sZGeFFpw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aVnBqIY0Z76C32sR9AJodL3FBzCA4+ER/5b4dYkFG+3hDPyivs3bJlB9IHehZ3K5fk
	sDR44w43JecZZWE7JzyEcX1wbhamot4qb7mLibxdhXZqBfnFPeIUzK7byJNpp1lG/W8j
	dnKEGhMWenpcvQrsVBvm7OCIv9fhohJqfGbVc=
MIME-Version: 1.0
Received: by 10.231.13.201 with SMTP id d9mr1869744iba.152.1286519782880; Thu,
	07 Oct 2010 23:36:22 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 23:36:22 -0700 (PDT)
In-Reply-To: <AANLkTinDviTOfaSFktW0iKJPrjsT3QSHWiYLaw4WrX5K@mail.gmail.com>
References: <3ADCCD33-6EA5-43FA-84EE-31D6B7C5A005@mac.com>
	<4CAE4F92.5080107@mlbassoc.com>
	<AANLkTinDviTOfaSFktW0iKJPrjsT3QSHWiYLaw4WrX5K@mail.gmail.com>
Date: Fri, 8 Oct 2010 08:36:22 +0200
Message-ID: <AANLkTin-CW9Pszpyts4mp0ye=O3-xP3BA5DT_K8H-QqB@mail.gmail.com>
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
Subject: Re: How to modify /etc/network/interfaces file in a OE recipe
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
X-List-Received-Date: Fri, 08 Oct 2010 06:36:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/8 Khem Raj <raj.khem@gmail.com>:
> On Thu, Oct 7, 2010 at 3:54 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 10/07/2010 03:11 PM, Elvis Dowson wrote:
>>>
>>> Hi,
>>> =A0 =A0 =A0 =A0Would someone be able to help me with modifying an
>>> omap3-console-image recipe, such that in the final image, the
>>> /etc/network/interfaces file gets edited as follows
>>>
>>> #auto eth0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<=
- remove # sign ( auto eth0 )
>>> #iface eth0 inet dhcp =A0 =A0 =A0 =A0 =A0 <- remove # sign ( iface eth0=
 inet dhcp )
>>> #iface eth1 inet dhcp
>>>
>>> I am using a Gumstix Overo + Chestnut43 expansion board, which has an
>>> inbuilt wired ethernet interface. I have to make this modification manu=
ally,
>>> to enable this interface each time. However, if I can modify the OE rec=
ipe
>>> somehow to do this it would be great. I know it can be done, but I don'=
t
>>> know where to start and which file to modify.
>>
>> Add the file the way you like it to
>> .../openembedded/recipes/netbase/netbase/overo
>> and rebuild netbase. =A0Use the beagleboard as an example.
>
> or use bblayers and bbappend.

Actually if you use an overlay you can just put your patch file in the
files dir of your overlay.
If I recall correctly files will be first fetched in the FILESPATHPKG
in the overlay before looking in the oe dir (assuming your layer
priorities are ok)

Have fun! Frans


