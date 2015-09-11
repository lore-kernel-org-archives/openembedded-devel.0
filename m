Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C52676420
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 07:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8B7tuCv010653; Fri, 11 Sep 2015 08:55:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9IgpM_vVpbbl; Fri, 11 Sep 2015 08:55:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8B7thOU010644
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Sep 2015 08:55:55 +0100
Message-ID: <1441958143.24871.377.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Sep 2015 08:55:43 +0100
In-Reply-To: <CAP9ODKrt7jhFtN6JWFqqbSnJxyX4kAc77CkigOCChkV4gz=-Cw@mail.gmail.com>
References: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>
	<55E009D2.6010106@skidata.com>
	<CAP9ODKrt7jhFtN6JWFqqbSnJxyX4kAc77CkigOCChkV4gz=-Cw@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 07:56:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-28 at 14:29 -0300, Otavio Salvador wrote:
> On Fri, Aug 28, 2015 at 4:12 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
> > On 08/28/2015 03:14 AM, Vinay K. Awasthi wrote:
> >> Rebased it again with latest change-set and tested it on oe-core master with latest mate-openembedded.
> >>
> >> There is no change in recipe.
> >>
> >> This enables OpenJDK-8 jre/jdk for x86 and ARM.
> >>
> >> This recipe is tested for arm (zero VM) and x86 (hotspot vm).
> >>
> >> To build just use bitbake openjdk-8.
> >
> > I successfully compiled and tested it for/on an ARMv7 Cortex A9 CPU:
> > # /usr/lib/jvm/java-8-openjdk/jre/bin/java -version
> > openjdk version "1.8.0-internal"
> > OpenJDK Runtime Environment (build 1.8.0-internal-leri_2015_08_28_08_47-b00)
> > OpenJDK Zero VM (build 25.60-b23, interpreted mode)
> >
> > Also X11/awt/swing works fine! Only problem for me is that ZeroVM is
> > running in "interpreted mode". Therefore my programs are running really
> > slow.
> >
> > Was the "mixed mode" available/working in your tests?
> >
> > IMHO a working JIT (=> mixed-mode) is a must-have for merging this patch
> > upstream. What do you think Otavio?
> 
> Yes, I agree. There are other people working in OpenJDK 8 here[1] (at
> ml) it seems so maybe we could share some ideas on how to fix it.

I'm hearing there is a little frustration about moving forward with
this. I'd like to suggest that a staged approach might be better in this
case, for example if OpenJDK-8 is working on IA, how about adding it
with:

# mixed-mode isn't working on ARM yet
COMPATIBLE_HOST = '(i.86|x86_64).*-linux'

With a large change like this, I think its perhaps ok to take a staged
approach, as long as its clear what is/isn't expected to work?
If/as/when the ARM people have time to make it work there, patches can
be sent to change that? This way it unblocks people and doesn't hold
keen contributors back.

Cheers,

Richard



