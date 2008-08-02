Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KPIqi-0003Lo-Fe; Sat, 02 Aug 2008 17:16:52 +0200
Received: from 88-110-124-15.dynamic.dsl.as9105.com ([88.110.124.15]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KPIop-0004vJ-5x; Sat, 02 Aug 2008 16:14:55 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g71idt$s09$1@ger.gmane.org>
References: <1216087105.10214.7.camel@isis>  <g71idt$s09$1@ger.gmane.org>
Date: Sat, 02 Aug 2008 16:14:53 +0100
Message-Id: <1217690093.25732.106.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC]: Toolchain build sequence alteration.
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
X-List-Received-Date: Sat, 02 Aug 2008 15:16:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-08-02 at 14:03 +0200, Koen Kooi wrote:
> -do_stage_prepend () {
> +do_stage_append () {
>   	# get rid of dummy libc.so
> 
> This fixes builds from scratch for me (tried with armv5te and armv7a), 
> but I haven't tested if it breaks iconv again since I value working 
> builds over working iconv atm. I'm fairly sure it doesn't break iconv, 
> because the bogus libc.so is gone before glibc gets built, but as I 
> said, I haven't tested it.

Iconv does still seem to be OK after this change.  However, the fact
that this was needed indicates that something in gcc-c-i's do_stage()
method is trying to link with the dummy libc.so, which might be causing
some other subtle breakage along the lines of the original iconv
problem.  Some scrutiny will be needed to figure out what exactly
gcc-c-i is doing with libc.so at this point and whether or not it is
safe to let it do so.

p.




