Received: from [64.233.184.228] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HNpgU-00064i-4U
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 13:19:26 +0100
Received: by wr-out-0506.google.com with SMTP id i21so1037645wra
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2007 04:19:25 -0800 (PST)
Received: by 10.114.194.1 with SMTP id r1mr919863waf.1173010764612;
	Sun, 04 Mar 2007 04:19:24 -0800 (PST)
Received: by 10.114.61.2 with HTTP; Sun, 4 Mar 2007 04:19:24 -0800 (PST)
Message-ID: <74d0deb30703040419g6dcea098x755583ab163317ab@mail.gmail.com>
Date: Sun, 4 Mar 2007 13:19:24 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45EA8629.8080804@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1172977637.29516@gatekeeper.stellarwerx.com>
	<45EA8629.8080804@dominion.kabel.utwente.nl>
Subject: Re: Fixing QA Errors?
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
X-List-Received-Date: Sun, 04 Mar 2007 12:19:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 3/4/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Mark Gollahon schreef:
> > A question for the insane.bbclass developers - how do I go about fixing these errors?  Do we have any generalized information about what they mean (I can't find any on the wiki or via google...)?
>
> There's not one definitive doc I can point you too. I can however show you an example on
> how to solve the errors you are seeing.
>
> > ERROR: QA Issue: non -dev package contains symlink .so: libqtaux2 path '/work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/libqtaux2.so'
>
> FILES_${PN}-dev += "/opt/QtPalmtop/lib/*.so"
>
> > ERROR: QA Issue: non debug package contains .debug directory: libqtaux2 path /work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/.debug/libqtaux2.so.1.0.0
>
> FILES_${PN}-dbg += "/opt/QtPalmtop/lib/.debug"
>
> I'm not sure if the first FILES statement is correct, since I don't know about qtopia
> details, but the second one is correct.

Could we have FILES_${PN}-dbg default to something that works like a
".*/\.debug/.*" regexp? That way we wouldn't have to special-case
every package that has binaries in non-standard locations...

regards
Philipp


