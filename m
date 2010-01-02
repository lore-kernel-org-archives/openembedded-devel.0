Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NR11A-00022f-AS
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 11:15:35 +0100
Received: from [85.210.22.104] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NR0zF-0005SM-4q
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 10:13:33 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262424543-21993-1-git-send-email-camelguo@gmail.com>
References: <>  <1262424543-21993-1-git-send-email-camelguo@gmail.com>
Date: Sat, 02 Jan 2010 10:13:30 +0000
Message-ID: <1262427210.2553.74.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.22.104
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix the wrong setting in qemumips/uClibc.machine
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
X-List-Received-Date: Sat, 02 Jan 2010 10:15:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-01-02 at 17:29 +0800, Guo Hongruan wrote:
> -DO_C99_MATH=y
> +# DO_C99_MATH is not set

This part of the patch looks a bit weird, although I see that mipsel
does also turn C99 math support off.  Do you know what the reason for
that is?

Anyway, you're right that the previous qemumips file did seem to be an
exact copy of the qemux86 one, and almost anything must surely be better
than that.  So, I checked this in.  Thanks for the patch.

p.




