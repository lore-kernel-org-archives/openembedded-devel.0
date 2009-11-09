Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1N7V17-0002Bz-1Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 15:14:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C64A35BE275
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2009 09:13:32 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06223-04 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  9 Nov 2009 09:13:32 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D3B975B4429
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2009 09:13:30 -0500 (EST)
Message-ID: <4AF82389.7070705@cbnco.com>
Date: Mon, 09 Nov 2009 09:13:29 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257771017.19063.3.camel@nvc0624>
In-Reply-To: <1257771017.19063.3.camel@nvc0624>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Precision Time Protocol (PTP) as defined by the IEEE 1588 standard
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
X-List-Received-Date: Mon, 09 Nov 2009 14:14:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Jaap de Jong wrote:
> Hi there,
> 
> attached a proposal for a recipe for building the 
> Precision Time Protocol daemon (ptpd).

Hi Jaap,

The recipe looks good, although I think either your mailer or editor did 
something very strange to the line after "do_install() {".

Could you check the file and try to send it again using git send-email?

http://morefedora.blogspot.com/2009/02/configuring-git-send-email-to-use-gmail.html

http://felipec.wordpress.com/2009/10/25/git-send-email-tricks/

You are also missing the addition to checksums.ini, and maybe a line to 
install the manpage so the doc package gets built.

Also, from the README it looks like this package can't actually be used 
without obtaining a patent license from the IEEE, but I guess that's 
someone else's problem. :)

Mike


