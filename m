Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OxlMN-00074v-VA
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 20:45:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 641E58A4EC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 14:45:02 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07848-03 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 20 Sep 2010 14:45:02 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 22C5687C19A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 14:45:02 -0400 (EDT)
Message-ID: <4C97ABAD.8050609@cbnco.com>
Date: Mon, 20 Sep 2010 14:45:01 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <4C93B8D6.7080604@cbnco.com>
In-Reply-To: <4C93B8D6.7080604@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: util-linux-ng 2.17 do_install fails (setarch manpage links)
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
X-List-Received-Date: Mon, 20 Sep 2010 18:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael Smith wrote:
> util-linux-ng fails to build:
> 
> ...tmp/sysroots/x86_64-linux/usr/bin/install -c -m 644 ctrlaltdel.8 
> cytune.8 setarch.8 ldattach.8 tunelp.8 rtcwake.8 pivot_root.8 
> switch_root.8 .8 linux32.8 linux64.8 i386.8 .8 
> '...tmp/work/i486-oe-linux/util-linux-ng-2.17-r29.2/image/usr/share/man/man8' 
> 
> 
> .../install: will not overwrite just-created 
> `...tmp/work/i486-oe-linux/util-linux-ng-2.17-r29.2/image/usr/share/man/man8/.8' 
> with `.8'

> automake 1.11.1 expands this to:
> 
> SETARCH_LINKS = linux32 linux64 $(am__append_19) $(am__append_20) \
>         $(am__append_21) $(am__append_22) $(am__append_23) \
>         $(am__append_24) $(am__append_25) $(am__append_26)
> SETARCH_MAN_LINKS = $(SETARCH_LINKS:=.8)
> 
> Since am__append_21..26 are empty, SETARCH_MAN_LINKS is set to:
> 
> linux-32.8 linux-64.8 i386.8 .8

I'm using ancient GNU make 3.80 from SLES10 SP2. Slightly less ancient 
make 3.81 does not have this problem. I've worked around it by building 
make-native (3.82).

Mike


