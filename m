Received: from smtp.net4india.com ([202.71.129.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sagarj@oriolesoftware.com>) id 1NrTHn-000122-AY
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 10:42:08 +0100
Received: from [59.95.237.103] (helo=proxy)
	by smtp.net4india.com with esmtp (Exim 4.69)
	(envelope-from <sagarj@oriolesoftware.com>) id 1NrTEx-0005eO-5d
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 15:09:07 +0530
From: "Sagar Jariwala" <sagarj@oriolesoftware.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Mar 2010 15:09:04 +0530
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
In-Reply-To: <201003161032.33070.marcin@juszkiewicz.com.pl>
Thread-Index: AcrE6/wjrDTr4C1nT+etTFeVi7e95QAAHzLg
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-SA-Exim-Connect-IP: 202.71.129.68
X-SA-Exim-Mail-From: sagarj@oriolesoftware.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,MISSING_MID
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Need info how to build image and filesystem for SMDk6410
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
X-List-Received-Date: Tue, 16 Mar 2010 09:42:08 -0000
Message-ID: <MADEUP.15FE1AF2F5BAF218.14572@groups.io>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thank you for sharing the information.

-SJ

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Marcin Juszkiewicz
Sent: Tuesday, March 16, 2010 3:03 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Need info how to build image and filesystem for SMDk6410

Dnia wtorek, 16 marca 2010 o 10:09:44 Tejas napisal(a):

> I would like to build filesystem and uImage for SMDK6410. I have
downloaded
> fresh openembedded and bitbake on ubuntu machine.
> 
> I am trying to run bit bake for SMDK-6410 board config.
> 
> Can anyone please guide me what shall be the local.conf contents?

BBFILES = "PATH-TO-OPENEMBEDDED/recipes/"
DISTRO = "angstrom-2008.1"
MACHINE = "smdk6410"

Nothing more is needed.

in shell do:

$ export BBPATH=PATH-TO-BUILDDIR:PATH-TO-OPENEMBEDDED
$ bitbake console-image

> It would be nice if someone can guide me through the exact steps to use
> smdk6410 in open-embedded.


Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




