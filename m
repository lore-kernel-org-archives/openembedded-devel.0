Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1ROcwi-0003yp-IJ for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 23:18:10 +0100
Received: by faat2 with SMTP id t2so3573622faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 14:11:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.75.150 with SMTP id y22mr14589056faj.29.1320963111697;
	Thu, 10 Nov 2011 14:11:51 -0800 (PST)
Received: by 10.223.93.203 with HTTP; Thu, 10 Nov 2011 14:11:51 -0800 (PST)
In-Reply-To: <D1FB05D7-71E3-4B22-8A8B-594B38FE09D1@microbee-systems.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1389840.j5gWQFZ9u1@helios>
	<D1FB05D7-71E3-4B22-8A8B-594B38FE09D1@microbee-systems.com>
Date: Thu, 10 Nov 2011 16:11:51 -0600
Message-ID: <CALJpqJx6SVr8TRPDaZFSvEWfs-uyjN_OMsrLxVfYo+RrLtCQcg@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Thu, 10 Nov 2011 22:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have tried every possible way, 8 hours so far, to get this file to
process these patches. I got the patches, I have set up local
repositories, ad nasium and same response, unable to fetch from any
source.

I have tired every combination, I have tried every possible link, url,

SRC_URI = "git:///home/twoods/local;protocol=file;branch=master"

git://git.yoctoproject.org/matchbox-keyboard;protocol=git;file://smallscreen-fontsize.patch;patch=1

and on and on. Every single project I have seen references the same


SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \

I am at the point of hurling this machine out a window. How could this
be so cryptic and difficult?

Does anyone have a idea?

DESCRIPTION = "Matchbox virtual keyboard for X11"
LICENSE = "GPL"
DEPENDS = "libfakekey expat libxft"
RCONFLICTS = matchbox-keyboard-inputmethod
RPROVIDES_${PN} = matchbox-keyboard-inputmethod
SECTION = "x11"
PV = "0.0+svnr${SRCPV}"
PR ="r7"

SRC_URI = "https://git.gitorious.org/cm-t3530/cm-t3530.git;protocol=git \
           file://smallscreen-fontsize.patch;patch=1 \
           file://2-Add-new-modifier--layout--Used-to-cycle-thru-all-available-layouts.patch;patch=1
\
           file://3-Changes-to-improve-layout-rendering--especially-after-adding-support-for.patch;patch=1
\
           file://4-Add-rendering-debug-logging.patch;patch=1 \
           file://5-Add-support-for-loading-multiple-independent-layouts.patch;patch=1
\
           file://6-Add-layout-switch-key-to-all-layouts.patch;patch=1 \
          "


S = "${WORKDIR}/${PN}"

inherit autotools pkgconfig gettext

EXTRA_OECONF = "--disable-cairo"

FILES_${PN} = "${bindir}/* \
	       ${datadir}/applications \
	       ${datadir}/pixmaps \
	       ${datadir}/matchbox-keyboard"

On Thu, Nov 10, 2011 at 6:35 AM, David Thomas
<david.thomas@microbee-systems.com> wrote:
> I appreciate the response. Yes, I found this but it would seem this is related to the patches listed in that file I included.
>
> I will press on.
>
> Dave
>
>
> On Nov 10, 2011, at 3:58 AM, Paul Eggleton wrote:
>
>> On Wednesday 09 November 2011 16:32:48 David Thomas wrote:
>>> Since svn.o-hand.com is dead does anyone have a different repository?
>>
>> Most if not all o-hand repositories have been converted to git and moved to
>> git.yoctoproject.org. A list of what's available:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/
>>
>>> SRC_URI = "git://git.yoctoproject.org/matchbox-keyboard;protocol=git \
>>
>> This works for me... ?
>>
>>> I am unable to find any source for these. It sure seems to me that OE
>>> is overly dependent upon links that come and go.
>>
>> It is if you don't use a mirror. Realistically with the wide range of software
>> from hundreds of different providers built in OE there's no way you can expect
>> all of them to not change their download locations, remove old versions, etc.
>> over time. That's why we have mirror support, and both Angstrom and the Yocto
>> Project provide mirrors already.
>>
>> If you really want to ensure long-term support you may want to consider
>> setting up your own local mirror; it's fairly easy to do.
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
>



-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


