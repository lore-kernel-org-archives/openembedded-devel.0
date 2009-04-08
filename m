Received: from [194.158.229.47] (helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1LrXVf-0006zP-E2
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 15:08:16 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	n38D56Vv001795; Wed, 8 Apr 2009 15:05:06 +0200
Message-ID: <49DCA192.90905@vollmann.ch>
Date: Wed, 08 Apr 2009 15:07:30 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SUBJECT_FUZZY_TION autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Splitting an image into multiple partitions
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
X-List-Received-Date: Wed, 08 Apr 2009 13:08:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

splitting your systems into different partitions often makes sense.
So this means you have to create a number of different images,
each comprising of a specific part of the full filesystem.

Doing that for one specific project is actually pretty easy,
but then you loose all the flexibility of image.bbclass.

Adding an additional variable to image.bbclass and calling
bbimage with an '-r' argument is also not a big deal, but
this way you have to do all the work to put together the
rootfs several times.

With only two partitions, you could just build the separate
partition first (e.g. '/mnt1'), then delete that part from
IMAGE_ROOTFS, and then build the rootfs.
But this doesn't work for more than two partitions.

IMHO an optimum solution would be to add an '--exclude'
option to bbimage that you can give several times, then
image.bbclass could just go through a list of partitions
and create one after the other.

But maybe I just look into the wrong direction, and there's
a much easier way for doing what I try to do.
Any hints are appreciated.

   Detlef



