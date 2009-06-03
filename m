Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MBwcj-0001md-AG
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 21:59:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3B7764CEF45
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2009 15:50:46 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08159-03 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  3 Jun 2009 15:50:46 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D19DD4CD8E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2009 15:50:45 -0400 (EDT)
Message-ID: <4A26D415.7020206@cbnco.com>
Date: Wed, 03 Jun 2009 15:50:45 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>	<1243309454-9877-1-git-send-email-msmith@cbnco.com>
	<1244054649.5049.56.camel@lenovo.internal.reciva.com>
In-Reply-To: <1244054649.5049.56.camel@lenovo.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] busybox: allow building when prefix is "", not	"/usr".
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
X-List-Received-Date: Wed, 03 Jun 2009 19:59:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Mon, 2009-05-25 at 23:44 -0400, Michael Smith wrote:
>> There was code to handle this, but it needed a tweak to prevent copying
>> a directory on top of itself. Other prefixes (besides /usr) may also
>> work now, but this is untested.
>>
>> busybox will also build when base_sbindir is "/bin" instead of "/sbin".
>>
>> Also correct possible typo: "cp -dPr" to "cp -pPR", to match the usage
>> a few lines above. -d implies -P.
> 
> I've checked this in now.  Thanks for the patch.

Heh... I actually did up a new series this morning with a simpler fix. 
Was going to send it in tonight. :)

I don't know if you want to revert it, or I can just rebase.

Mike


