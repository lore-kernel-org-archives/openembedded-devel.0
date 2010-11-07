Received: from usps2.crhc.illinois.edu ([130.126.143.231]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PFBvA-0000q6-Ke
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 21:33:02 +0100
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 3F57D34000A7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Nov 2010 14:32:05 -0600 (CST)
Received: from [192.168.1.198] (unknown [63.252.64.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id 1463E340008F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Nov 2010 14:32:05 -0600 (CST)
Message-ID: <4CD70CC5.7030103@crhc.illinois.edu>
Date: Sun, 07 Nov 2010 14:32:05 -0600
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=Kp6Ydc_HR0apO3abN7Zokd6SHazYQYY4vNkdo@mail.gmail.com>
In-Reply-To: <AANLkTi=Kp6Ydc_HR0apO3abN7Zokd6SHazYQYY4vNkdo@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.231
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake goes crazy when ...
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
X-List-Received-Date: Sun, 07 Nov 2010 20:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Also, if BBFILES is not set or set incorrectly.

On 11/07/2010 02:26 PM, Yury Bushmelev wrote:
> Hello!
>
> Bitbake fails without any end-user readable diagnosting (just a lot of
> strange errors and tracebacks) when:
> 1) specifying non-existent DISTRO (I've mistyped and specified
> 'angsrom-2008.1' instead of 'angstrom')
> 2) specifying non-absolute path to TMPDIR (i.e. you can't use './tmp' as TMPDIR)
>
> I've found this when playing with my testbuilder script.
>
> Can/should we catch that errors and produce user-readable messages about this?
>
>    

-- 
Matt Johnson
Graduate Student
University of Illinois at Urbana-Champaign, Dept. of ECE
Coordinated Science Lab, Rm. 213



