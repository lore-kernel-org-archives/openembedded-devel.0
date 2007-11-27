Received: from [64.233.170.184] (helo=rn-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Ix29h-0002x4-Ny
	for openembedded-devel@openembedded.org; Tue, 27 Nov 2007 16:15:22 +0100
Received: by rn-out-0102.google.com with SMTP id e24so681953rng
	for <openembedded-devel@openembedded.org>;
	Tue, 27 Nov 2007 07:12:30 -0800 (PST)
Received: by 10.150.91.20 with SMTP id o20mr843974ybb.1196172919253;
	Tue, 27 Nov 2007 06:15:19 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.91.6])
	by mx.google.com with ESMTPS id c4sm515929nfi.2007.11.27.06.15.16
	(version=SSLv3 cipher=OTHER); Tue, 27 Nov 2007 06:15:18 -0800 (PST)
Date: Tue, 27 Nov 2007 16:17:27 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1712551091.20071127161727@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1196172204.6780.37.camel@localhost.localdomain>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
	<1196172204.6780.37.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Tue, 27 Nov 2007 15:15:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, November 27, 2007, 4:03:23 PM, you wrote:

> On Tue, 2007-11-27 at 15:43 +0200, Paul Sokolovsky wrote:
>> Tuesday, November 27, 2007, 2:22:35 PM, you wrote:
>> > On Mon, 2007-11-26 at 17:55 +0100, Robert Schuster wrote:
>> > I commented on the bug but I will repeat here for wider exposure.
>> 
>> > "The real problem here is that virtual/libx11 should not be appearing in
>> > the package manager namespace. RPROVIDES = "virtual/libx11" is plain
>> > wrong and is the real bug."
>> 
>>   What exactly is wrong? RPROVIDES or "virtual/" or maybe "/" after
>> all?

> The whole idea. Using the virtual namespace in a runtime Provides is
> meaningless.

[]

> A proper use for RPROVIDES is for something like gtk+-directfb to
> RPROVIDE gtk+. If an app linked against one, it should be able to run
> against the other (I'm assuming thats the case, if its not there
> shouldn't be an RPROVIDES).

> Does that help explain things?

  Ok, in other words, you say that OE's, build-time, virtuals, are
completely different thing than package manager's Provides facilities,
also common called virtuals? And that then the easiest solution is to
make sure they are never mixed at all, instead of trying to do
mind-boggling and still very limited logic of converting OE's virtuals
to package-manager virtuals? Instead, package-manager virtuals should
be managed manually, based on the actual properties of packages?

  Makes sense. But with this ambiguity of "virtuals" such questions
would come up again and again, I guess. So I also wished we cut off
OE-virtual bleeding to package manager realm soon ;-).

> Cheers,

> Richard




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



