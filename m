Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1QKOc5-00048z-2s
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 07:39:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id E6AEB3EF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 07:36:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 8e6sVsEMjhj3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 07:36:10 +0200 (CEST)
Received: from [192.168.1.189] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPSA id 91AC8254
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 07:36:10 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTik19x9evsK+6uZ73FXyjyJKB1O-vA@mail.gmail.com>
References: <BANLkTik19x9evsK+6uZ73FXyjyJKB1O-vA@mail.gmail.com>
Organization: DoreDevelopment ApS
Date: Thu, 12 May 2011 07:36:06 +0200
Message-ID: <1305178566.2166.2.camel@eha.ulstruplund.dk>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Another race failure, not sure if this is a hard dependency or an inflight staging which races with another configure??
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
X-List-Received-Date: Thu, 12 May 2011 05:39:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-12 at 01:58 +0200, Leon Woestenberg wrote:
> Hello,
> 
> I think I found another build race here (must love multi-core machines).
> 
> perl-native is still being staged while file-native tries to run perl
> stuff resulting in "| perl: error while loading shared libraries:
> libperl.so: cannot open shared object file: No such file or
> directory".
> 
> Restarting bitbake continues the build (note that perl native sysroot
> staging finishes just after file-native failing).
> 
> Now, I have been thinking about these races; even though we might not
> have a dependency on perl, a configure stage may probe for perl, and
> if it exists, starts to run tests against it.
> So either perl must be present, or not at all. I.e. atomicly staged in sysroot.
> 
> Of course, could be this IS a hard dependency after all.
> 
> I'll investigate later, here is a small piece of log for your eyes.

I know I am kind of repeating myself, but these kind of problems do not
arise when using a per-recipe staging as I have proposed (and doing in
OE-lite).

I for one, always prefer to design out race-conditions instead of having
a continous (and always up-hill) battle with them.

/Esben



