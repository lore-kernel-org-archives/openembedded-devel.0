Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1P7wYT-0005rh-GA
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 22:43:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C43098CCCEF;
	Mon, 18 Oct 2010 16:43:04 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05043-07; Mon, 18 Oct 2010 16:43:04 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9D9C910836A;
	Mon, 18 Oct 2010 16:43:04 -0400 (EDT)
Message-ID: <4CBCB158.2050500@cbnco.com>
Date: Mon, 18 Oct 2010 16:43:04 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=DtXf+VnB3LPzbzDD57LNSxgUaeeTM6=ohGstK@mail.gmail.com>
In-Reply-To: <AANLkTi=DtXf+VnB3LPzbzDD57LNSxgUaeeTM6=ohGstK@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 20:43:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> 
> but with a minor improvement suggestion.
> What aboout elimiating one os.system call by combining the two into one:
> 
> os.system('rm -rf %s/*;cp -pPR %s/. %s/' % (pkgcopy, installdest, pkgcopy))

Hi Frans,

Thanks for the SOB. I like it better as two separate lines. I would have 
preferred shutil.rmtree() if shutil.copytree() worked, actually - but 
since it doesn't, no point using shutil for one line and not the other.

Mike


