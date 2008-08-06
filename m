Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1KQblq-00055N-Dc
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 07:41:14 +0200
Received: by py-out-1112.google.com with SMTP id y77so1334040pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Aug 2008 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=/hkxju+o9xg3RuObku9bKq3pBX4e6OBuVk0vF/VMHLY=;
	b=q9B9W+Ekr6PHfEFk8F0Jcvtv/RGudgS60GQSwpW3rrNi7nNGoQPLiGS+3u0mWn8Ck3
	drEdH2ZYUxl+nvoXqe/plrLliFAOCRHB3QchvUz8Ak7I1SB0rx76tyGV5yx8tQsZuB0a
	NzhxymiKCi+JWN/vCsn/SP9Ndxj6arX2mlItQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=e47sK+K0eFekwJ/B+6CZaGDfs57HK7MvrBIbYG7fdrCUv90WiRBFWCXg8uWO0JWROl
	5I2Ij6kO1A+0EBrGL2sLJx4a/Y6q1nUHWRu+Cp2ljlAG/HPpcyD7MWgu3rs1KJILYs1f
	WGbhxVi02ec+41k2FntVbZNtQOemiurwqHXlw=
Received: by 10.65.234.18 with SMTP id l18mr2660657qbr.1.1218001270171;
	Tue, 05 Aug 2008 22:41:10 -0700 (PDT)
Received: from ?192.168.1.204? ( [68.188.71.196])
	by mx.google.com with ESMTPS id s35sm18892305qbs.13.2008.08.05.22.41.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Aug 2008 22:41:08 -0700 (PDT)
Message-ID: <48993971.6090103@gmail.com>
Date: Wed, 06 Aug 2008 00:41:05 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1205081794.8432.15.camel@localhost>
In-Reply-To: <1205081794.8432.15.camel@localhost>
Subject: Re: Perl modules: Cannot compile due to wrong dependency in Makefile
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
X-List-Received-Date: Wed, 06 Aug 2008 05:41:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2008 11:56 AM, Thomas Reitmayr wrote:
> Hi,
> I have a problem building perl modules which have their own recipe and
> are built outside of the original perl tree, eg. libwww-perl. It looks
> like there is a wrong dependency in the Makefile of such a module. The
> Makefile is created from Makefile.PL and includes the following:
> 
> [...]
> PERL_LIB = /usr/share/perl/5.8
> PERL_ARCHLIB = /usr/lib/perl/5.8
> [...]
> # Where is the Config information that we are using/depend on
> CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h
> [...]
> $(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
> 	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
> [...]
> 
> As there is no /usr/lib/perl/5.8 on my build host (a Gentoo system), the
> reported error in log.do_compile.ZZZ is
> 
> make: *** No rule to make target `/usr/lib/perl/5.8/Config.pm', needed
> by `Makefile'.  Stop.
> 
> The only Config.pm I can find
> is /home/nslu2/slugos/tmp/staging/i686-linux/usr/lib/perl/5.8.8/Config.pm, but I am not sure if it would be correct to just set the PERL_LIB to its directory path. I traced back the origin of PERL_LIB and found it is coming from a %Config setting 'archlibexp'. Its contents is read from tmp/staging/i686-linux/usr/lib/perl/5.8.8/Config_heavy-target.pl.
> 
> I am not sure whether the contents of the variable is wrong or its
> usage, and of course how to fix it.
> [My quick fix was to modify the MakeMaker (MM_Unix.pm) to not create
> this dependency.]
> 
> Has anyone an idea what's wrong?
> Regards,
> -Thomas
> 
> PS: The repository was updated yesterday, the ABI version is '1', host
> is an i686 Gentoo system, target is an Arm/BE (NSLU2).


should be fixed at least for the following two perl modules

libwww-perl: revision 2873796e006d11d27cf466d502a70c2800820342
liburi-perl: revision 8255feabebd04e228e5a0558f18f07b7e6c13dd9

Regards
Gordon


