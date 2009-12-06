Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NHOQk-0001iY-VC
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:14:14 +0100
Received: from [85.210.162.25] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NHOP8-0005Aw-62
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 21:12:30 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0912061249g6201f0adwc6ff58ff20d68331@mail.gmail.com>
References: <c384c5ea0912061249g6201f0adwc6ff58ff20d68331@mail.gmail.com>
Date: Sun, 06 Dec 2009 21:12:18 +0000
Message-ID: <1260133938.6896.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.162.25
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] toolchain team question about libiberty.a
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
X-List-Received-Date: Sun, 06 Dec 2009 21:14:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2009-12-06 at 21:49 +0100, Leon Woestenberg wrote:
> can we safely remove this from gcc/gcc-configure-cross.inc?
> 
> do_stage_append () {
>         ...
>         # We use libiberty from binutils
>         rm -f ${CROSS_DIR}/lib/libiberty.a
>         ...

Yes, I think those two lines are bogus and can/should be deleted.

p.




