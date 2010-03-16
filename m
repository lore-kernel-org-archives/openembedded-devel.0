Received: from smtp.net4india.com ([202.71.129.67])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sagarj@oriolesoftware.com>) id 1NrWDn-0005nx-2I
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 13:50:13 +0100
Received: from [59.96.147.176] (helo=proxy)
	by smtp.net4india.com with esmtp (Exim 4.69)
	(envelope-from <sagarj@oriolesoftware.com>) id 1NrWAx-0006BJ-DF
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 18:17:12 +0530
From: "Sagar Jariwala" <sagarj@oriolesoftware.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Mar 2010 18:17:10 +0530
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
In-Reply-To: <20100316123408.GD21604@sirena.org.uk>
Thread-Index: AcrFBSzDcOw2etCZTESxE/1qgB+hywAAU41A
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-SA-Exim-Connect-IP: 202.71.129.67
X-SA-Exim-Mail-From: sagarj@oriolesoftware.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MISSING_MID,RCVD_IN_SORBS_WEB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Need HELP :: Samsung SMDK6410 root file systemusing	open-embedded
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
X-List-Received-Date: Tue, 16 Mar 2010 12:50:13 -0000
Message-ID: <MADEUP.15FE1AF36C90DDDE.13558@groups.io>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Mark,
 
I have downloaded fresh OE and bitbake. I am running bitbake and facing
difficulties.
 
Following is the erro log.
 
--2010-03-16 23:34:00--  ftp://ftp.gnu.org/gnu/m4/m4-1.4.14.tar.bz2
Connecting to 192.168.0.5:22... sh:
/home/sagar/KIT6410/OE/angstrom-dev/staging/i686-linux/usr/bin/oe_sha256sum:
cannot execute binary file
NOTE: The SHA256 Sums do not match. Wanted:
'264d7c1c0e268bc77fbe0f308e085545535edfe73f33e27c80219cc0c9c71246' Got: ''
NOTE: Task failed: Checksum of
'ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.63.tar.bz2' failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/sagar/KIT6410/OE/openembedded/recipes/autoconf/autoconf
_2.63.bb do_fetch failed
sh:
/home/sagar/KIT6410/OE/angstrom-dev/staging/i686-linux/usr/bin/oe_sha256sum:
cannot execute binary file
NOTE: The MD5Sums did not match. Wanted: '427c2914d3eab956f317c9ec6a45e62a'
and Got: '08f9ec630dd4fd92b6d11ffb51110687'
NOTE: Task failed: Checksum of
'ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz' failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/sagar/KIT6410/OE/openembedded/recipes/coreutils/coreutils-native_7.2.b
b do_fetch failed
sh:
/home/sagar/KIT6410/OE/angstrom-dev/staging/i686-linux/usr/bin/oe_sha256sum:
cannot execute binary file
NOTE: The MD5Sums did not match. Wanted: 'f77adda60039ffa753f3c584a286f12b'
and Got: '2f0fb9b4c445c00aaeefcf63b184bd55'
NOTE: Task failed: Checksum of
'http://download.savannah.gnu.org/releases/quilt/quilt-0.48.tar.gz' failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/sagar/KIT6410/OE/openembedded/recipes/quilt/quilt-native_0.48.bb
do_fetch failed
ERROR: Task 98
(/home/sagar/KIT6410/OE/openembedded/recipes/coreutils/coreutils-native_7.2.
bb, do_fetch) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1:
/home/sagar/KIT6410/OE/openembedded/recipes/quilt/quilt-native_0.48.bb,
do_fetch (29529)
NOTE: 2: /home/sagar/KIT6410/OE/openembedded/recipes/m4/m4-native_1.4.14.bb,
do_fetch (29530)
NOTE: 3:
virtual:native:/home/sagar/KIT6410/OE/openembedded/recipes/autoconf/autoconf
_2.63.bb, do_fetch (29531)
ERROR: Task 636
(virtual:native:/home/sagar/KIT6410/OE/openembedded/recipes/autoconf/autocon
f_2.63.bb, do_fetch) failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1:
/home/sagar/KIT6410/OE/openembedded/recipes/quilt/quilt-native_0.48.bb,
do_fetch (29529)
NOTE: 2: /home/sagar/KIT6410/OE/openembedded/recipes/m4/m4-native_1.4.14.bb,
do_fetch (29530)
ERROR: Task 33
(/home/sagar/KIT6410/OE/openembedded/recipes/quilt/quilt-native_0.48.bb,
do_fetch) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/sagar/KIT6410/OE/openembedded/recipes/m4/m4-native_1.4.14.bb,
do_fetch (29530)
 
How to fix above errors?
 
Thanks,
Sagar
 
-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Mark
Brown
Sent: Tuesday, March 16, 2010 6:04 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Need HELP :: Samsung SMDK6410 root file systemusing
open-embedded
 
On Tue, Mar 16, 2010 at 01:12:50PM +0100, Paul Menzel wrote:
> Am Dienstag, den 16.03.2010, 11:56 +0000 schrieb Mark Brown:
> > On Tue, Mar 16, 2010 at 12:52:38PM +0100, Paul Menzel wrote:
 
> > > What did not work for you?
 
> > Quite :/
 
> ???
 
It's difficult to help without knowing the problem that the original
poster is experiencing.
 
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

