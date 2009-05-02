Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M0LOU-0004BC-GT
	for openembedded-devel@openembedded.org; Sat, 02 May 2009 22:01:06 +0200
Received: from [209.242.7.139] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M0LJ2-00049H-Im
	for openembedded-devel@openembedded.org; Sat, 02 May 2009 14:55:28 -0500
Message-ID: <49FCA524.10102@dls.net>
Date: Sat, 02 May 2009 14:55:16 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net>
In-Reply-To: <20090429161224.GB18788@smtp.west.cox.net>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Sat, 02 May 2009 20:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Mike Westerhof <mwester@dls.net>

(Tested fine for the SlugOS distro)

Tom Rini wrote:
> On Mon, Apr 27, 2009 at 07:19:43AM -0700, Tom Rini wrote:
> 
>> Hey all.  I've created a new branch, trini/add-libc-overrides which does
>> the following:
>> - Make every distro declare PREFERRED_LIBC, either outright or
>>   overridable.
>> - For Angstrom/foonas have DISTROVAR ?= ${PREFERRED_LIBC},
>>   PREFERRED_LIBC ?= default
>> - Add conf/distro/include/{eglibc,glibc,uclibc}.inc that have:
>>   - Add 'glibc' to OVERRIDES for eglibc/glibc and 'uclibc' for
>>     uclibc.inc
>>   - Default providers.
>>   NOTE: ${TARGET_PREFIX} includes ${TARGET_VENDOR} so ...
>> - Switch all distros to have:
>>   require conf/distro/include/${PREFERED_LIBC}.inc
>>   - Clean up distro-specific includes, and sane-toolchain.inc a little
>>     bit by removing all of the PREFERRED_PROVIDER stuff it no longer
>>     needs.
>> - For glibc*.bb older than 2.5, add in some missing RPROVIDES.
> 
> I've pushed a trini/add-libc-overrides-2 branch with the following
> changes:
> - Change PREFERRED_LIBC to LIBC
> - Fold fixing up minimal/minimal-uclibc into the commit that brings in
>   the libc inc file.
> - Re-order commits so that everything is functional from commit to
>   commit.
> 
> I'm now looking for ack's to pull this branch into .dev
> 


