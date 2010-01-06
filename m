Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NSNDI-0002Dx-UC
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 05:09:43 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9C4481B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2010 04:05:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jan 2010 05:07:31 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201001060507.31754.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 04:09:44 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

mostly inspired by Guo's last mail about buildbot. In one way I agree with 
Guo, we need more QA and also an attitute to not commit when the tree is 
somehow broken...


Here is my list of short term goals and it would be cool if people sign up for 
it:


	*) Does bitbake world work? If not it would be cool if someone could take
            a look?

        *) Fix compile errors of bitbake world for a set of configurations?

	*) Koen reported that dependency loop reporting is not working anymore..
            anyone cares to invest thes five minutes to fix that?

	*) Sometimes we have pretty embarassing issues like some images switching
            from mdev back to udev and we don't notice for months(!!!)
            It would totally rock if one could change the rootfs.bbclass (or
            such) class and count the size of the image on the first run, store 
            it in the temp directory and report the diff's back to the 
            tinderbox and then we could have a view on the tinderbox?

            Inside the build summary we should see the new size of the image
            and the growth compared to the first built?

            The idea would be to have people look at the waterfall and go OMG 
            why did "minimal-image" grow by 2MB?

          *) The next step would be to transfer packet sizes as well

	  *) Integrate some testing into recipes. E.g. attempt to boot the console-
             image and grep the Serial Console for the "Loging:" prompt..
             Test the toolchain to compile binaries...



anyone feels like helping?
	z.







