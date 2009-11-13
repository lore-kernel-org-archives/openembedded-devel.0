Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N8vtZ-0001dY-3E for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 14:09:00 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id B372F87
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 13:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id mGcg1UmpKDjC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 14:07:36 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 4EF8682
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 14:07:36 +0100 (CET)
Message-ID: <4AFD5A18.6090606@cs.put.poznan.pl>
Date: Fri, 13 Nov 2009 14:07:36 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130555020.3622@localhost>
	<4AFD3F42.5010309@eukrea.com>
In-Reply-To: <4AFD3F42.5010309@eukrea.com>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to remove all traces of a previous package build?
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
X-List-Received-Date: Fri, 13 Nov 2009 13:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Eric B=E9nard wrote:
> Hi Robert,
>=20
> Robert P. J. Day a =E9crit :
>>   surely a dumb question, but what's the recipe for deleting every
>> trace of a single previous package build, so i know i'm rebuilding it
>> absolutely from step one?  i'll use that to test a rebuild of the
>> packages that are failing for me.
>>
> I think bitbake -c clean package does what you want.

Or '-c distclean' if you also want to remove source. :)

Przemek



