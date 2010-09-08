Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OtQsU-0006Nc-6m
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:04:21 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o88K3Ybd011118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Sep 2010 22:03:35 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1OtQrl-0005kj-Io
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:03:34 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4C874458.3060101@nedap.com>
	<lytym0e69l.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4C87D8FD.9050709@mentor.com>
Date: Wed, 08 Sep 2010 22:03:33 +0200
In-Reply-To: <4C87D8FD.9050709@mentor.com> (Tom Rini's message of "Wed, 08 Sep
	2010 11:42:05 -0700")
Message-ID: <ly7hiwknoq.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: cmake-native trouble making
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
X-List-Received-Date: Wed, 08 Sep 2010 20:04:22 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <tom_rini@mentor.com> writes:

>>> | /usr/bin/ld: cannot find -ltinfo
>>
>> no, 'DEPENDS = "ncurses-native"'; BUT:
>>
>> * it will cause problems on (host)distributions which do not have libtinfo
>>   (e.g. RHEL5) and have ncurses-native in their ASSUME_PROVIDED
>
> Isn't the whole point of ASSUME_PROVIDED that user be aware?

Would be too arbitrary in this case because it forces people to check by
trial & error whether ASSUME_PROVIDED are working.  A raw guideline for
adding an entry to ASSUME_PROVIDED should be, whether a corresponding,
recent -devel package has been installed on the host.

imo, packages should not have so strict requirements on the actual
provider but check in their configure task what to use (this includes
autodetection of libtinfo vs. libtermcap vs. libncurses).


For cmake, problem above can by solved by an initial configuration
script having

| SET (BUILD_CursesDialog OFF CACHE BOOL "" FORCE)


>> * some hours ago I added a libtermcap.so compatibility symlink to
>>   ncurses(-native) so that 5ea3047995421d99f7f3537cb8f9ae23f3185a9f
>>   might not be needed anymore
>
> Um, is there a reason this wasn't just done as a ln within the recipe?

It's a mix of personal preference, following Fedora's packaging of this
file and the hope to use some more of the power of linker scripts (giving
out a deprecated warning, add AS_NEEDED, linking against multiple files).
There was no opposition when I wrote about linker scripts neither.

Perhaps I should have made it inline by 'echo INPUT(-ltinfo) > ...' but
I did not saw this when I committed the patch.



Enrico


