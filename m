Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1JYlyA-0002Ec-Rd
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Mar 2008 18:39:31 +0100
Received: by ug-out-1314.google.com with SMTP id i24so4998111ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 10:37:34 -0700 (PDT)
Received: by 10.67.102.6 with SMTP id e6mr4039595ugm.67.1205170654249;
	Mon, 10 Mar 2008 10:37:34 -0700 (PDT)
Received: by 10.67.25.4 with HTTP; Mon, 10 Mar 2008 10:37:34 -0700 (PDT)
Message-ID: <a7f8874a0803101037p1e156eedx32eddf87c45fb890@mail.gmail.com>
Date: Mon, 10 Mar 2008 10:37:34 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.170
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: [RFC]: Is MACHINE_TASK_PROVIDER still being used or should it be phased out?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Mar 2008 17:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(sorry for the repost, but I forgot the RFC tag the first time)

I am trying to fix http://bugs.openembedded.net/show_bug.cgi?id=3969.

I basicaly have two options here:

1) simply replace MACHINE_TASK_PROVIDER with task-base-extended in the
affected recipie

2) come up with a different solution that preserves MACHINE_TASK_PROVIDER
and adds a suitable definition

It seems that a lot of recent image recipies have used approach #1 and I was
wondering if MACHINE_TASK_PROVIDER  was still actively being used or if it
is mostly left over from the initial task-base switchover.

Also, if it is still in use, do any of the current users care about
opie-image in particular?

(I will use #1 if I don't hear back soon)

Thank you very much,

-- 
Henry von Tresckow (hvontres)

Poodle life support team

