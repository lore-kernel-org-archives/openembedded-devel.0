Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M2C2R-0006Ex-0n
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 00:26:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7F6B84A2E92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 18:19:50 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12799-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  7 May 2009 18:19:50 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 501F847E698
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 18:19:50 -0400 (EDT)
Message-ID: <4A035E86.6020105@cbnco.com>
Date: Thu, 07 May 2009 18:19:50 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A03277B.1090402@cbnco.com>	<1241720835-17998-1-git-send-email-msmith@cbnco.com>	<1241720835-17998-2-git-send-email-msmith@cbnco.com>	<1241720835-17998-3-git-send-email-msmith@cbnco.com>
	<b6ebd0a50905071202l6d595de3v66d2ac043a84a2af@mail.gmail.com>
In-Reply-To: <b6ebd0a50905071202l6d595de3v66d2ac043a84a2af@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 3/3] grub: split menu.lst into a separate package, grub-config.
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
X-List-Received-Date: Thu, 07 May 2009 22:26:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> I'm not sure if you realize, but you can let your overlay override
> file:// files by manipulating FILESPATH.  You don't need to split up
> all the recipes.

Hi Chris,

That's awesome. I didn't know that. I've added this to my local.conf:

FILESPATHBASE =. "${@ \
     ':'.join([os.path.join(recipedir, \
                         os.path.basename(os.path.dirname( \
                                             d.getVar('FILE', 1)))) \ 

	for recipedir in d.getVar('COLLECTIONS', 1).split()])}:"

Problem solved. I have no need to split a separate grub-config package.

Mike


