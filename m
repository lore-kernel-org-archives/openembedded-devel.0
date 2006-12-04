Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1GrKWy-0006NN-Re
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 21:35:16 +0100
Received: by py-out-1112.google.com with SMTP id n39so2335638pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Dec 2006 12:34:27 -0800 (PST)
Received: by 10.35.126.7 with SMTP id d7mr16041997pyn.1165264467480;
	Mon, 04 Dec 2006 12:34:27 -0800 (PST)
Received: by 10.65.230.8 with HTTP; Mon, 4 Dec 2006 12:34:27 -0800 (PST)
Message-ID: <c384c5ea0612041234u5fd7e6d6w5de1efc385cacbd7@mail.gmail.com>
Date: Mon, 4 Dec 2006 21:34:27 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1165238625.15272.3.camel@localhost.localdomain>
MIME-Version: 1.0
References: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
	<1165238625.15272.3.camel@localhost.localdomain>
Subject: Re: Recent OBJDUMP changes
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
X-List-Received-Date: Mon, 04 Dec 2006 20:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 12/4/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2006-12-04 at 00:00 +0100, Leon Woestenberg wrote:
>
My assumption was wrong, the correct (cross-toolchain) objdump is used.

However, the shlibs system seems to fail elsewhere, this is what I see
if I disable the objdump command error redirection "2>/dev/null" in
package.bbclass:

NOTE: SITE files
/home/leon/sandbox/ixp4xx/openembedded/../../openembedded/org.openembedded.dev/site/endian-big
/home/leon/sandbox/ixp4xx/openembedded/../../openembedded/org.openembedded.dev/site/armeb-linux
NOTE: Couldn't find shared library provider for libncurses.so.5
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libc.so.6

I am looking into that now.

Leon.


