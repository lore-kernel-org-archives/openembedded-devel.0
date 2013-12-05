Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 1A09A6DF6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 09:47:28 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id BD86218411E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 10:47:26 +0100 (CET)
Message-ID: <52A04BAC.7040706@herbrechtsmeier.net>
Date: Thu, 05 Dec 2013 10:47:24 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
	<20131205005501.GB3724@jama>
In-Reply-To: <20131205005501.GB3724@jama>
Subject: Re: [OE-core] [RFC][PATCH] cmake: respect ${S} and ${B}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 09:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.12.2013 01:55, schrieb Martin Jansa:
> On Thu, Dec 05, 2013 at 12:38:57AM +0000, Ross Burton wrote:
>> Hi,
>>
>> This is a Request For Comments because it changes behaviour of the cmake class
>> and I'm not entirely knowledgeable in cmake.
> Neither am I, but patch looks reasonable and I like it, because I was
> planing to do something similar.
Maybe you should add a warning if OECMAKE_BUILDPATH is not "" as 
otherwise the package behaviour will change without any note.

>> For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead has it's
>> own variables OECMAKE_SOURCEPATH ("." by default) and OECMAKE_BUILDPATH ("" by
>> default).  Those defaults meant that the build happened in the source directory,
>> which conveniently was ${S}.  Unless ${B} was also set, in which case it all
>> broke.
>>
>> I don't see a good reason for cmake.bbclass having it's own special versions of
>> ${S} and ${B}, so this patch drops them and replicates some of the logic in
>> autotools.bbclass: specifically the part where if ${S} and ${B} are different,
>> delete ${B} before building.
I think deleting ${B} before building is wrong. If the build directory 
makes problem you should have the same problems when ${S} and ${B} are 
same or you should remove the ${B} directories when you remove the build 
files from ${S}.

>>   This ensures that switching machine doesn't re-use
>> the same build directory, which was the cause of me going back to look at this
>> (libproxy trying to use the nuc sysroot when I'm building for qemux86-64).
>>
>> Some open questions:
>>
>> 1) As I understand it cmake has more reliable support for out-of-tree builds
>> than autotools.  If this is the case should cmake.bbclass set B ?=
>> "${WORKDIR}/build", or leave setting of B to separatebuilddir.inc?  Are there
>> known recipes using cmake that fail with out-of-tree builds?
>>
>> 2) Is dropping OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH acceptable?  Nothing in
>> oe-core uses them and there's three (IIRC) recipes in meta-oe that use them.
>> Assuming the answer to (1) is "separatebuilddir.inc" then the only fallout
>> should be these recipes using in-tree builds until OECMAKE_BUILDPATH is replaced
>> with B.
As you more or less only rename the variables it should be acceptable 
but I would proposed to add a warning or error if some recipe use the 
old variables.


