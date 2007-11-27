Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Ix1Bn-0006Fm-36
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 15:13:27 +0100
Received: by ug-out-1314.google.com with SMTP id i24so299010ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 06:10:36 -0800 (PST)
Received: by 10.150.12.5 with SMTP id 5mr828199ybl.1196170915540;
	Tue, 27 Nov 2007 05:41:55 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.91.6])
	by mx.google.com with ESMTPS id f4sm105083nfh.2007.11.27.05.41.52
	(version=SSLv3 cipher=OTHER); Tue, 27 Nov 2007 05:41:53 -0800 (PST)
Date: Tue, 27 Nov 2007 15:43:57 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <157949636.20071127154357@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1196166155.6780.11.camel@localhost.localdomain>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: python skills and bug 2412
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
X-List-Received-Date: Tue, 27 Nov 2007 14:13:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, November 27, 2007, 2:22:35 PM, you wrote:

> On Mon, 2007-11-26 at 17:55 +0100, Robert Schuster wrote:
>> Hi
>> Rodigo and me are suffering from bug 2412[0]. We talked a bit about the
>> issue and I provided an idea on how to fix it. Unfortunately I lack the
>> python experience to do it. I do not understand how the name conversion
>> in debian.bbclass is actually done and where I could add code to replace
>> slashes with hyphens.
>> 
>> Can anyone who has a better understanding of this help us out?
>> 
>> Regards
>> Robert
>> 
>> [0] - http://bugs.openembedded.org/show_bug.cgi?id=2412

> I commented on the bug but I will repeat here for wider exposure.

> "The real problem here is that virtual/libx11 should not be appearing in
> the package manager namespace. RPROVIDES = "virtual/libx11" is plain
> wrong and is the real bug."

  What exactly is wrong? RPROVIDES or "virtual/" or maybe "/" after
all?

> I've discussed this on the mailing list in the past, virtual/* shouldn't
> ever be ending up in the runtime namespaces :/.

  And why is this? Virtual packages aka services aka facilities are
core feature of flexible package management. IMHO, they are heavily
underused in the current OE, which disallows creation of flexible,
adaptable, and at the same time, consistent systems.

> Cheers,

> Richard


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



