Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KGwm5-0001aG-Vd
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2008 16:05:34 +0200
Received: from 88-110-175-47.dynamic.dsl.as9105.com ([88.110.175.47]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KGwlq-0004mH-Qy
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2008 15:05:19 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48761569.4080304@gmx.net>
References: <48761569.4080304@gmx.net>
Date: Thu, 10 Jul 2008 15:05:31 +0100
Message-Id: <1215698731.21138.278.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: prevent -O0 for glibc builds?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 10 Jul 2008 14:05:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-07-10 at 15:58 +0200, Robert Schuster wrote:
> Hi,
> recently I set the (debug) optimization flags to "-g -O0" (= really
> no-optimization and full debug infos) and got an error from the glibc
> builds because glibc's configury told me that it cannot be compiled with
> no optimization.
> 
> Would it be possible that the glibc recipes replace -O0 with something
> else and print a note about this instead of failing? The reason is that
> the current behavior prevents me from compiling a whole image without
> optimization.
> 
> The reason I want -O0 in the first place is that while debugging an
> executable gdb told me that certain variables where optimized out.

I think you'd be better off just setting SELECTED_OPTIMIZATION_glibc =
"-O -g" or some such.

p.




