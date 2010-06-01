Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OJRiC-0003IE-B6
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 15:40:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9BF4A57BC71
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 09:36:41 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23573-04 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  1 Jun 2010 09:36:41 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 94863256232
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 09:36:40 -0400 (EDT)
Message-ID: <4C050CE8.4080102@cbnco.com>
Date: Tue, 01 Jun 2010 09:36:40 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>	<A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>	<AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com>
	<A24693684029E5489D1D202277BE894455A0F458@dlee02.ent.ti.com>
In-Reply-To: <A24693684029E5489D1D202277BE894455A0F458@dlee02.ent.ti.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Tue, 01 Jun 2010 13:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ambrose, Martin wrote:
> On Sun, May 30, 2010 at 14:49:32, Chris Larson wrote:
>> Aside: the way it does so is quite the hack, we need to figure out
>> a better way to manipulate the task graph like this.
 >
> Maybe that explains the problem I'm seeing with the dependency graph when using srctree.

> Then it goes straight to the configure phase without ensuring the dependencies are present.

Yes, I see similar things. I'm still on an ancient tree with 
do_populate_staging(). If memory serves, the prerequisite packages are 
unpacked, compiled and installed, but do_stage isn't run before the 
srctree recipe's do_configure.

As long as you're not doing parallel builds it's easy enough to work 
around: just put the libraries you need in your IMAGE_INSTALL before the 
srctree packages.

Mike


