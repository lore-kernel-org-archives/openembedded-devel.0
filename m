Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nu90L-0003MY-HR
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 19:39:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id CC885A5096
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 18:35:57 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 9qluo08YNb+W
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 18:35:56 +0000 (GMT)
Received: from xora-eee.xora.org.uk (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id AF757A5092
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 18:35:56 +0000 (GMT)
Received: by xora-eee.xora.org.uk (Postfix, from userid 500)
	id DEC872220F; Tue, 23 Mar 2010 18:36:15 +0000 (GMT)
Date: Tue, 23 Mar 2010 18:36:15 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323183615.GE3249@xora-eee.xora.org.uk>
References: <201003231901.24017.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201003231901.24017.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Removal of e2fsprogs-libs
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
X-List-Received-Date: Tue, 23 Mar 2010 18:39:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2010 at 07:01:23PM +0100, Marcin Juszkiewicz wrote:
> 
> During last days I spent a bit of time on e2fsprogs* and util-linux-ng 
> recipes. They are cleaner now but there is still some work to do.
> 
> We have many recipes which depends on 'e2fsprogs-libs' when they want 
> 'libblkid' or 'libuuid' which are provided by 'e2fsprogs-libs' and 
> 'util-linux-ng' recipes. I checked how Debian solves that and got into point 
> where there is no 'e2fsprogs-libs' recipes in my tree and everything is 
> building.
> 
> What needs to be changed?
> 
> 1. git rm -r recipes/e2fsprogs-libs
> 2. check each recipe which depends on 'e2fsprogs-libs' which library it really
>    wants
> 3. change each recipe which wants 'libblkid' or 'libuuid' to depend on 
>    'util-linux-ng'
> 4. change each recipe which wants 'libcom_err' or 'libss' to depend on 
>    'e2fsprogs'
> 5. add "--with-elf-shlibs" to 'e2fsprogs' to get 'libcom_err' and 'libss'
> 6. fix packaging of 'e2fsprogs' to get separate packages for libraries.
> 
> I can work on that in next days but want to inform everyone that such change 
> will be done.
> 
Hrw thanks for cleaning this up, feel free to add my ack to your completed
worked.

Graeme
 


