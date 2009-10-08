Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MvsyZ-0001mS-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 15:24:14 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8450C1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 13:31:19 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 Oct 2009 15:23:06 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.32-rc2; KDE/4.3.1; i686; ; )
References: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
In-Reply-To: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
MIME-Version: 1.0
Message-Id: <200910081523.06229.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert Request for linux -> linux-gnu changes
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
X-List-Received-Date: Thu, 08 Oct 2009 13:24:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 08 October 2009 14:53:02 Graeme Gregory wrote:
> Hi, I cannot actually carry out this request as I will be without net
> access for the eV meeting.
> 
> But it is becoming clear that the linux -> linux-gnu change is throwing
> up many issues for arches != linux-gnueabi. Partial fixes have been
> implemented but for every fix another issue seems to pop up.
> 
> I suggest these changes should be reverted, placed in a branch and
> properly merged at a later date after proper review.

As hard as it is. I agree that it should be backed out and put in a branch and 
tested on non EABI systems. We find new regressions every day.

The current list of today are:
          - insane.bbclass needs 'linux' and 'linux-gnu'. Linux for native 
            packages and the other for our one

          - bitbake meta-toolchain does not work due task-sdk-base, I think
            it is due the change but I don't know.

regards
	holger

PS: I'm willing to help by compile testing non ARM builds


