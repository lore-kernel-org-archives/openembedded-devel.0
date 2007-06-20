Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1I11BO-0006ZV-Ha
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 16:29:18 +0200
Received: by wa-out-1112.google.com with SMTP id l24so141494waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 07:25:34 -0700 (PDT)
Received: by 10.114.120.1 with SMTP id s1mr359067wac.1182349534597;
	Wed, 20 Jun 2007 07:25:34 -0700 (PDT)
Received: by 10.114.210.2 with HTTP; Wed, 20 Jun 2007 07:25:34 -0700 (PDT)
Message-ID: <48239d390706200725xfceb517o8faf1e8bb88aaa9f@mail.gmail.com>
Date: Wed, 20 Jun 2007 18:25:34 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A7921DE0-7584-425F-B761-CD455252D3EC@gmx.net>
MIME-Version: 1.0
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
	<A7921DE0-7584-425F-B761-CD455252D3EC@gmx.net>
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
X-List-Received-Date: Wed, 20 Jun 2007 14:29:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > 3. all -locale packages generated during builds are written to some
> > special lists, for each language. Then meta-packages are generated
> > from these lists.
>
> This could work but......
>
> the fundamental question is what is OpenSUSE, Fedora, Ubuntu doing to
IIRC they do not package translations separately.

> select a language? E.g. in the case of Opie you want to have a
> language for Opie, in the case for GPE you want to have gettext files
> for the whole system and GPE. You don't want to install translations
> where you don't have the package installed but when you install the
> package you want to have the translations automatically installed.
>
> I don't think this is in the scope of OE but in the scope of
> distributions working together with the environment (GPE, Opie) to
> find a proper solution. Everything to implement it is already there....
big distros don't require so much space economy, so they package
translations inside packages, so the problem is solved. I personally
like RRECOMMENDS solution, like
reciepe foo generates foo, foo-locale, foo-doc, foo-dev.
we have var IMAGE_LOCALES="en_GB en_US"
then RRECOMMENDS_foo will be = "${PN}-locale-en-gb ${PN}-locale-en-us"

so, like this. I think of it as simplest solution. Actually, if
package have some additional locale-dependant files, they could be
added to their corresponding -locale-x-y-z packages.
as for z component I think like en_US.ISO8859-1 will be -locale-en-us-iso8859-1.

All the best,
S.


