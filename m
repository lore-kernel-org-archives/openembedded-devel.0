Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1O2KoX-0001pJ-AD
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 10:52:46 +0200
Received: from tamarin.localnet (123-192-184-230.dynamic.kbronet.com.tw
	[123.192.184.230])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6060B1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 08:54:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Apr 2010 10:48:41 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc3-00389-ga376b40; KDE/4.4.2; i686; ; )
References: <201004150018.52834.afalls@qvxlabs.com>
In-Reply-To: <201004150018.52834.afalls@qvxlabs.com>
MIME-Version: 1.0
Message-Id: <201004151048.42034.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Using patchfiles with bitbake
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
X-List-Received-Date: Thu, 15 Apr 2010 08:52:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 15 April 2010 09:18:52 Ardavon Falls wrote:
> Every time I try and add my own patchfiles to a bitbake recipe it fails
> with the following error...
> 
> No file to patch.  Skipping patch.
> 3 out of 3 hunks ignored
> Patch unifdef-native_2.6.18.patch does not apply (enforce with -f)
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
> Output:
> Applying patch unifdef-native_2.6.18.patch
> 
> I'm creating the patch with the following command line
> 
> diff -crB unifdef.c.orig unifdef.c > unifdef-native_2.6.18.patch


Hi,

two things. The first one is you should consider using quilt as it makes your 
life more easy and you would avoid running into this problem.

The other part is when you compare your patch with other patches in OE, most 
of them start with "--- a/...", "+++ b/" and by default we invoke the patch 
command with "-p1" from the source directory. With your patch this does not 
work as you have no additional slashes that could be removed.

The way out is to either add this context (e.g. by using quilt) or to use 
;pnum=0 behind your ;patch=1.

i hope this helps
	z


