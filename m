Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I11eW-0001GU-RT
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 16:59:25 +0200
Received: by wx-out-0506.google.com with SMTP id h29so200381wxd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 07:55:41 -0700 (PDT)
Received: by 10.90.63.16 with SMTP id l16mr457114aga.1182351341184;
	Wed, 20 Jun 2007 07:55:41 -0700 (PDT)
Received: from cube ( [82.193.98.14])
	by mx.google.com with ESMTP id 24sm238828nzn.2007.06.20.07.55.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2007 07:55:40 -0700 (PDT)
Date: Wed, 20 Jun 2007 17:55:41 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1988388622.20070620175541@gmail.com>
To: "Sergey Lapin" <slapinid@gmail.com>
In-Reply-To: <48239d390706200725xfceb517o8faf1e8bb88aaa9f@mail.gmail.com>
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
	<A7921DE0-7584-425F-B761-CD455252D3EC@gmx.net>
	<48239d390706200725xfceb517o8faf1e8bb88aaa9f@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 20 Jun 2007 14:59:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Sergey,

Wednesday, June 20, 2007, 5:25:34 PM, you wrote:

[]

>> select a language? E.g. in the case of Opie you want to have a
>> language for Opie, in the case for GPE you want to have gettext files
>> for the whole system and GPE. You don't want to install translations
>> where you don't have the package installed but when you install the
>> package you want to have the translations automatically installed.
>>
>> I don't think this is in the scope of OE but in the scope of
>> distributions working together with the environment (GPE, Opie) to
>> find a proper solution. Everything to implement it is already there....
> big distros don't require so much space economy, so they package
> translations inside packages, so the problem is solved. I personally
> like RRECOMMENDS solution, like
> reciepe foo generates foo, foo-locale, foo-doc, foo-dev.
> we have var IMAGE_LOCALES="en_GB en_US"
> then RRECOMMENDS_foo will be = "${PN}-locale-en-gb ${PN}-locale-en-us"

        This will lead to contamination of package metadata and
consequently to errors, hard to track for many people (for example, if
you change IMAGE_LOCALES later, previously built packages will still
pull old locale set). L19n really needs special handling.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



