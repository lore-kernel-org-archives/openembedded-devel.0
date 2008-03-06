Received: from [64.233.178.248] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JXN7S-0002A6-Cp
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Mar 2008 21:55:21 +0100
Received: by hs-out-0708.google.com with SMTP id 23so57529hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2008 12:53:40 -0800 (PST)
Received: by 10.100.205.9 with SMTP id c9mr569524ang.97.1204836819602;
	Thu, 06 Mar 2008 12:53:39 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Thu, 6 Mar 2008 12:53:39 -0800 (PST)
Message-ID: <c384c5ea0803061253p467a1afdw123c41d4dff82aaa@mail.gmail.com>
Date: Thu, 6 Mar 2008 21:53:39 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080305215110.GB30267@ibawizard.net>
MIME-Version: 1.0
References: <20080305215110.GB30267@ibawizard.net>
X-SA-Exim-Connect-IP: 64.233.178.248
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Broken linux_2.6.24
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
X-List-Received-Date: Thu, 06 Mar 2008 20:55:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Petr,

On Wed, Mar 5, 2008 at 10:51 PM, Petr Stetiar <ynezz@true.cz> wrote:
>
>  commit with revision e59bb6421b1fc172baaf3ce9670eead297e0ad5d probably done by
>  Koen broke linux_2.6.24 package. It adds four patches to global SRC_URI, which
>  are missing in repository.
>
Please do not blame the wrong people. Use tools like "mtn" or
"monotone-viz" to easily see who added or broke stuff.

>  Pls can somebody explain me, why are those patches needed for all platforms? I
>
Let me see:

           http://kamikaze.waninkoko.info/patches/2.6.24/kamikaze1/broken-out/squashfs-lzma-2.6.24.patch;patch=1
\
           file://powerpc-clockres.patch;patch=1 \
           file://leds-cpu-activity.patch;patch=1 \
           file://leds-cpu-activity-powerpc.patch;patch=1 \

1. The first one is machine independent and architecture independent.
It should work for everyone, but only if they enable the filesystem in
the kernel configuration.
2. The second is machine independent but architecture dependent. It
unbreaks things if you build for powerpc, does nothing if you build
for other architectures.
3. The third one is machine independent and architecture independent.
You need a architecture dependent patch to make this work.
4. The  fourth patch is machine independent and architecture depedent.

>  think, that these patches are machine specific and shouldn't be aplied to all
>
None of the patches are machine specific.

However, adding them here did break the build, and that was *my*
mistake, for which I am truly sorry.

I committed the patches to linux-rt-2.6.24 (the hard real-time
scheduling kernel), but not 2.6.24.

I'll try to fix this mess,
-- 
Leon


