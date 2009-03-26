Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lmn8v-0003dc-Nx
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 11:49:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lmn7J-0006Vk-4g
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 10:47:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Mar 2009 10:47:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Mar 2009 10:47:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 26 Mar 2009 11:47:07 +0100
Message-ID: <gqfmfb$3al$1@ger.gmane.org>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>	<20090322172416.GA16899@denix.org>	<d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>	<d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>	<20090323000542.GL14278@smtp.west.cox.net>	<d1b08f940903260147n5fa49a1bxda7506b14bab20b7@mail.gmail.com>	<gqfi0r$l4o$1@ger.gmane.org>
	<d1b08f940903260323y4660a2abj53c9738e3562d3aa@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <d1b08f940903260323y4660a2abj53c9738e3562d3aa@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Thu, 26 Mar 2009 10:49:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-03-09 11:23, Andrea Adami wrote:
>> that breaks packaged-staging, so no, it isn't a fix.
>
> FWIW packaged-staging *is* already broken wrt these few recipes.

Only if you put deploy outside TMPDIR, which isn't the default and known 
to cause other issues. Your patch makes to go for "working, but broken 
for corner-cases" to "completely broken".

regards,

Koen



