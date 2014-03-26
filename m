Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D93EB60DFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:08:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2Q87u90003209; Wed, 26 Mar 2014 08:07:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6mAe-Glde8h6; Wed, 26 Mar 2014 08:07:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2Q87rJW003205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 26 Mar 2014 08:07:54 GMT
Message-ID: <1395821266.24890.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 26 Mar 2014 08:07:46 +0000
In-Reply-To: <CAFeBWL7xAbqbsAZhJGaPBrL9DCdctfdau828WzE-Bojynodnsw@mail.gmail.com>
References: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
	<CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
	<CAFeBWL7xAbqbsAZhJGaPBrL9DCdctfdau828WzE-Bojynodnsw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: exo build fail on master and master-next
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
X-List-Received-Date: Wed, 26 Mar 2014 08:08:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-25 at 17:46 -0700, Adam Lee wrote:
> exo-native (one of xfce4-taskmanager deps) was the point of failure.
> More specifically, exo-native was failing during configuration time. I
> discovered that, on master-next, exo-native build finishes by
> reverting this commit in autoconf.bbclass. This commit was new this
> year in Yocto Project 1.6. I have no idea how this commit breaks
> exo-native build. So I can't discern if the commit has errors. This
> still could very be a configuration issue in my build machine. 
>
> Can anyone take a look at the commit one more time?
>
>On Mon, Mar 24, 2014 at 2:29 PM, Adam Lee <adam.yh.lee@gmail.com>
wrote:
>         The error is occurring on master-next (and master I presume)
>         when building xfce4-taskmanager (as part of XFCE4 Extended
>         package group). I confirmed it on both qemuarm and on Gumstix
>         Overo as build targets. This tells me it's a bug, but there
>         still might be something unique about my setup. 
>
>         Can anyone verify if xfce4-taskmanager can be built
>         successfully?
>
>         On Fri, Mar 21, 2014 at 2:08 PM, Adam Lee
>         <adam.yh.lee@gmail.com> wrote:
>                 Good day everyone, 
>                 On both master and master-next, I get build fail on
>                 exo like below: 
>                         configure.ac:112: error: possibly undefined macro: AC_PROG_INTLTOOL
>                               If this token and others are legitimate, please use m4_pattern_allow.
>                               See the Autoconf documentation.


That commit makes the system more strict about dependencies and they're
probably incorrect in your recipe. The above error suggests you're
missing a dependency on intltool-native.

Cheers,

Richard




