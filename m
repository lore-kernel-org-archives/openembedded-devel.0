Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SUHzl-0005A1-N4
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 15:40:57 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3E43BF811F1; Tue, 15 May 2012 07:30:58 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4106EF811EE;
	Tue, 15 May 2012 07:30:48 -0600 (MDT)
Message-ID: <4FB25A88.3000100@mlbassoc.com>
Date: Tue, 15 May 2012 07:30:48 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<4FB2575C.3070407@mlbassoc.com>
	<CAOHjBZtfhFoZN=Hva3W_0yf7sRNS0xymrj1MHER9yHEeW=RHyw@mail.gmail.com>
In-Reply-To: <CAOHjBZtfhFoZN=Hva3W_0yf7sRNS0xymrj1MHER9yHEeW=RHyw@mail.gmail.com>
Subject: Re: [oe-core] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:40:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-05-15 07:19, Giuseppe Condorelli wrote:
> For example building git-1.7.7 fails fetching the source.

Works fine for me:

   $ wget http://git-core.googlecode.com/files/git-1.7.7.tar.gz
   --2012-05-15 07:29:43--  http://git-core.googlecode.com/files/git-1.7.=
7.tar.gz
   Resolving git-core.googlecode.com... 209.85.225.82
   Connecting to git-core.googlecode.com|209.85.225.82|:80... connected.
   HTTP request sent, awaiting response... 200 OK
   Length: 3475448 (3.3M) [application/octet-stream]
   Saving to: =93git-1.7.7.tar.gz=94

   100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D>] 3,475,448    477K/s   in 7.3s

   2012-05-15 07:29:50 (466 KB/s) - =93git-1.7.7.tar.gz=94 saved [3475448=
/3475448]

What error/problem are you having?

> 2012/5/15 Gary Thomas<gary@mlbassoc.com>
>
>> On 2012-05-15 07:02, Giuseppe Condorelli wrote:
>>
>>> Hi All,
>>>
>>> there are a number of packages having a broken SRC_URI, for example g=
it.
>>> Has someone met this issue?
>>> For sure we can correct those links adding a dedicated .bbappend file=
 for
>>> each failing package but
>>> I think we could also update the main package fixing the errors.
>>>
>>
>> Details?  People build using oe-core all the time, so providing
>> more info on the problems _you_ are having would go a long way
>> towards finding&  fixing them.

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


