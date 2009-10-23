Received: from [76.76.67.137] (helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1N18GM-0006QI-Um
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 02:44:18 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 6523A16606DF; Thu, 22 Oct 2009 18:43:14 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 277F216606C3;
	Thu, 22 Oct 2009 18:43:14 -0600 (MDT)
Message-ID: <4AE0FC22.4030805@mlbassoc.com>
Date: Thu, 22 Oct 2009 18:43:14 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE0BEFA.4020905@mlbassoc.com> <4AE0C0AE.20305@eukrea.com>
	<200910230209.42692.holger+oe@freyther.de>
In-Reply-To: <200910230209.42692.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 00:44:18 -0000
X-Groupsio-MsgNum: 13566
Content-Type: multipart/mixed; boundary="------------080704080003090002020800"

--------------080704080003090002020800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/22/2009 06:09 PM, Holger Hans Peter Freyther wrote:
> On Thursday 22 October 2009 22:29:34 Eric B=E9nard wrote:
>
>> same thing here. Following an advice on IRC, I tried to switch to egli=
bc
>> without success (eglibc didn' build) and still haven't found a solutio=
n
>> to generate a working QT SDK for a Cortex A8.
>
> In both cases post your config. What version of gcc, glibc, binutils we=
re used?

Stright forward BeagleBoard config - attached

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------080704080003090002020800
Content-Type: text/plain;
 name="local.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="local.conf"

# Where to store sources
DL_DIR = "${OETREE}/downloads"

INHERIT += " rm_work "

# Make sure you have these installed
ASSUME_PROVIDED += "gdk-pixbuf-csource-native imagemagick-native librsvg-native"

# Which files do we want to parse:
#BBFILES := "${OETREE}/org.openembedded.dev/recipes/*/*.bb"
BBFILES := "${OETREE}/openembedded/recipes/*/*.bb"
BBMASK = ""
 
# What kind of images do we want?
IMAGE_FSTYPES += " tar.bz2 "

# Set TMPDIR instead of defaulting it to $pwd/tmp
#TMPDIR = "${OETREE}/${DISTRO}-dev"

# Make use of SMP and fast disks
PARALLEL_MAKE = "-j4"
BB_NUMBER_THREADS = "4"

#tinderbox
#INHERIT += "oestats-client"
OESTATS_BUILDER      = "myname"

DISTRO = "angstrom-2008.1"
MACHINE = "beagleboard"


--------------080704080003090002020800--
