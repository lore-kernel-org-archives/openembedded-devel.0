Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HhB3N-0005As-6j
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 22:59:01 +0200
Received: by wx-out-0506.google.com with SMTP id t14so681619wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 13:50:09 -0700 (PDT)
Received: by 10.90.105.20 with SMTP id d20mr2892655agc.1177620609770;
	Thu, 26 Apr 2007 13:50:09 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Thu, 26 Apr 2007 13:50:09 -0700 (PDT)
Message-ID: <c384c5ea0704261350h1e63e73cx7475aa512a4e21e6@mail.gmail.com>
Date: Thu, 26 Apr 2007 22:50:09 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <c384c5ea0704261258j74fae9c0m5a764ab356b6e139@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<4630FBDF.2060004@dominion.kabel.utwente.nl>
	<c384c5ea0704261258j74fae9c0m5a764ab356b6e139@mail.gmail.com>
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 20:59:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

After some work, I couldn't get chrpath-native nor chrpath-cross to
deal with the target's ELF file (x86_64 host, i686 target):

./chrpath -l /home/leon/sandbox/e520/openembedded/build/tmp/work/i686-angstrom-linux/glibc-2.5-r5/install/glibc-dbg/usr/bin/.debug/localedef
`/home/leon/sandbox/e520/openembedded/build/tmp/work/i686-angstrom-linux/glibc-2.5-r5/install/glibc-dbg/usr/bin/.debug/localedef'
probably isn't a 64-bit LSB-first ELF file.
elf_open: Exec format error

although koen reported success with his host/target combo.

Now, for the moment, should we change insane.bbclass to indicate a
warning instead of an error on illegal RPATHs?

Leon.


