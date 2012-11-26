Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Td7bc-0004hZ-2k
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 23:56:48 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1Td7Nu-002Afq-04>; Mon, 26 Nov 2012 23:42:38 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1Td7Nt-000pgZ-RJ>; Mon, 26 Nov 2012 23:42:37 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1Td7Ns-0003s4-Ob
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 23:42:36 +0100
Date: Mon, 26 Nov 2012 23:42:36 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121126224236.GA24526@mi.fu-berlin.de>
References: <50AF6C63.6080208@nedap.com>
	<20121123143224.GB31470@mi.fu-berlin.de>
	<50B333B6.8020901@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50B333B6.8020901@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: openjdk-7-vm-jamvm
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
X-List-Received-Date: Mon, 26 Nov 2012 22:56:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 26, 2012 at 10:17:42AM +0100, Jaap de Jong wrote:
> 
> On 11/23/2012 03:32 PM, Henning Heinold wrote:
> >On Fri, Nov 23, 2012 at 01:30:27PM +0100, Jaap de Jong wrote:
> >>Hi,
> >>how can I build openjdk-7-vm-jamvm?
> >>If I bitbake openjdk-7 it is not added, while openjdk-7-vm-zero is added.
> >>I'm building for arm.
> >>Thanks!
> >>Jaap
> >Add it to your image.
> >
> bitbake openjdk-7-vm-jamvm fails:
> 
> ERROR: Nothing PROVIDES 'openjdk-7-vm-jamvm'
> 
> And so fails adding it to my images as well...
> 
> |  * opkg_install_cmd: Cannot install package openjdk-7-vm-jamvm.
> 
> Jaap

Hi Jaap,

I found two problems for building openjdk-7 with additional vms.
They are now fixed in master.

Bye Henning


