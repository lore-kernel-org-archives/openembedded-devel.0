Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OJuo2-0006tY-Q5
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:44:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 80E9A6E100C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jun 2010 16:40:38 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00829-02 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  2 Jun 2010 16:40:38 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9C8F46D49B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jun 2010 16:40:37 -0400 (EDT)
Message-ID: <4C06C1C5.4030405@cbnco.com>
Date: Wed, 02 Jun 2010 16:40:37 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinnks0kTFkPqkwLR-TvvzzAvOsfTVaO521fgBMs@mail.gmail.com>
In-Reply-To: <AANLkTinnks0kTFkPqkwLR-TvvzzAvOsfTVaO521fgBMs@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: srctree status
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
X-List-Received-Date: Wed, 02 Jun 2010 20:44:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> 13:42 < kergoth_> if you aren't using a native or cross version of the
> recipe, then you can confidently say you don't need it to do it
> 13:44 < kergoth_> take a look at the class, the merge_tasks function

Another handy thing about merge_tasks is that it mostly prevents 
interleaving of configure/compile for builds for different 
architectures. i.e. it stops this from silently producing broken 
executables:

MACHINE=mach1 bitbake pkg -c configure
MACHINE=mach2 bitbake pkg
MACHINE=mach1 bitbake pkg


... but you'd almost have to be trying to shoot yourself in the foot to 
do that by accident.

Mike


