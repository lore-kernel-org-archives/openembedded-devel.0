Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OtR4t-0006gT-JX
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:17:08 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o88KGJms013219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Sep 2010 22:16:20 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1OtR47-0005lB-5t
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:16:19 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>
	<lybp88kr5j.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4C87E05A.6050004@mentor.com>
Date: Wed, 08 Sep 2010 22:16:19 +0200
In-Reply-To: <4C87E05A.6050004@mentor.com> (Tom Rini's message of "Wed, 08 Sep
	2010 12:13:30 -0700")
Message-ID: <ly39tkkn3g.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libtermcap
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
X-List-Received-Date: Wed, 08 Sep 2010 20:17:09 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <tom_rini@mentor.com> writes:

>> I added 9e58422868a03eeafa72781477174850d1c5abe7 some hours ago so
>> that '-ltermcap' should work again.  Patch does not break my builds
>> but I do not know whether it unbreaks the problematic ones ;)
>>
>> Things are too different across the distributions (some have the
>> ncurses-config binconfig tools, other the .pc files, some have
>> libtinfo, some not) to find *the* correct solution.
>
> Maybe I'm jumping in too late here.  Why is the correct solution not
> "make our ncurses-native build and install what's required by other
> recipes, fix broken recipes that look for the wrong thing" ?  

the "wrong" and "right" thing is difficultly to define for libtermcap.
Generally, patches should be in a manner that they can be accepted by
upstream.  That's not the case for 's!-ltermcap!-ltinfo!'


> IMHO, if you ASSUME_PROVIDED and things break, thats not our problem,
> its your problem (Doctor, it hurts when I do *this*.  Don't do *that*
> !)

OE has still the ncurses-5.4 receipt which will break packages depending
on hardcoded -ltinfo.



Enrico


