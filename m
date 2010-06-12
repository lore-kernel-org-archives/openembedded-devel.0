Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ONRtO-00040R-KU for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 16:41:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ONRp6-0001KT-UQ for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 16:36:37 +0200
Received: from dsl-189-160-90-125-dyn.prod-infinitum.com.mx
	([dsl-189-160-90-125-dyn.prod-infinitum.com.mx])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 16:36:36 +0200
Received: from jacintoa by dsl-189-160-90-125-dyn.prod-infinitum.com.mx with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 16:36:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Jacinto Alvarez <jacintoa@hotmail.com>
Date: Sat, 12 Jun 2010 14:36:23 +0000 (UTC)
Message-ID: <loom.20100612T163058-82@post.gmane.org>
References: <4BFE5402.8030607@mlbassoc.com>	<loom.20100528T112202-923@post.gmane.org>	<4BFFAC85.9000008@mlbassoc.com>
	<loom.20100612T143257-592@post.gmane.org>
	<4C13897C.3080603@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 189.160.90.125 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.3) Gecko/20100423 Ubuntu/10.04 (lucid) Firefox/3.6.3)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00, FORGED_HOTMAIL_RCVD2,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems building Angstrom images
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
X-List-Received-Date: Sat, 12 Jun 2010 14:41:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Gary Thomas <gary <at> mlbassoc.com> writes:

> What sort of problem are you seeing?
> 
> What I found was that the 'encodings*' packages seem to have been
> built (the stamps were there), but there were no .ipk packages
> for them.  I simply forced them to rebuild and all started working.
>    % bitbake encodings -c clean
>    % bitbake encodings
>    % bitbake beagleboard-linuxtag2010-demo-image
> 

This did it for me too. Many thanks! :)
I was getting the same log that you pasted on the first post.





