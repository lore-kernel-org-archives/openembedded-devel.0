Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYcgY-0008O9-CB
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:53:45 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 810351B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 09:50:14 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 10:51:06 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1264239367-26057-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1264239367-26057-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <201001231051.06864.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: fix circular dependency between do_package and do_deploy
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
X-List-Received-Date: Sat, 23 Jan 2010 09:53:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 10:36:07 Guo Hongruan wrote:
> * 'addtask deploy' sentence in linux-storcenter_2.6.27.7.bb conflicts with
>  the same one in kernel.bbclass and causes circular dependency between
>  do_package and do_deploy

Could you please grep through recipes/linux and see how many more issues we 
have of the same kind?


