Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LkaRC-0000Uq-AU
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 09:50:46 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LkaQ9-0003DW-Gq
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 08:49:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 08:49:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 08:49:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Mar 2009 09:49:28 +0100
Message-ID: <gpvlao$cps$1@ger.gmane.org>
References: <80a0c20d0903191458m2c450cb3se2ed0c2ef2680c78@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <80a0c20d0903191458m2c450cb3se2ed0c2ef2680c78@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: packaged-staging not working properly
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
X-List-Received-Date: Fri, 20 Mar 2009 08:50:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-03-09 22:58, Matthieu Poullet wrote:
> Hi,
>
> I'd like to use the packaged-staging capability of OE.
> I'm building the console-image for the BB using the dev branch.

> DEPLOY_DIR_PSTAGE = "${OE_HOME}/archives"

Here you save *only* the pstage packages

> touch: cannot touch `/home/mpoullet/oe/tmp/deploy/glibc/ipk/Packages':
> No such file or directory

And here it wants to use something from deploy outside of PSTAGE.

This intented behaviour, you need to save the complete DEPLOY_DIR if you 
want packaged-staging to work as you expect.

regards,

Koen



