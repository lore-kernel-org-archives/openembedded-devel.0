Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1I0xg1-00020S-6q
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 12:44:41 +0200
Received: (qmail invoked by alias); 20 Jun 2007 10:40:58 -0000
Received: from dsl-62-220-14-162.berlikomm.net (EHLO [192.168.1.23])
	[62.220.14.162]
	by mail.gmx.net (mp052) with SMTP; 20 Jun 2007 12:40:58 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX18A9sJ64bwAakItzaaNFq0UtZ+eiX23kP1dhzoTTD
	zqrcOBizMlV3DU
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
Message-Id: <A7921DE0-7584-425F-B761-CD455252D3EC@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Wed, 20 Jun 2007 12:40:14 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: [RFC] locales
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2007 10:44:41 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 20.06.2007 um 12:14 schrieb Sergey Lapin:

>
> As for infrastructure, I see several questionable methods of  
> solving this:
>
> 1. each package RRECOMMENDS its locale packages for locales mentioned
> in local.conf variable, and additional ones, which are related.


This would open the PACKAGE_ARCH hell. _armebdeenengbjpkoru to get a  
package
built for ARM EB with DE, EN, EN_GB, JP, KO and RU locales

>
> 2. image RRECOMMENDS locale packages blindly for all normal packages
> for languages which are in a var mentioned in 1.

This will require too much space in most of the cases. I'm thinking  
here of non Glib based
systems.


>
> 3. all -locale packages generated during builds are written to some
> special lists, for each language. Then meta-packages are generated
> from these lists.

This could work but......

the fundamental question is what is OpenSUSE, Fedora, Ubuntu doing to  
select a language? E.g. in the case of Opie you want to have a  
language for Opie, in the case for GPE you want to have gettext files  
for the whole system and GPE. You don't want to install translations  
where you don't have the package installed but when you install the  
package you want to have the translations automatically installed.

I don't think this is in the scope of OE but in the scope of  
distributions working together with the environment (GPE, Opie) to  
find a proper solution. Everything to implement it is already there....


z.




