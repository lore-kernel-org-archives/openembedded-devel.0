Received: from [64.233.162.234] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HbGnq-0002Xa-Se
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 15:54:35 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1229756nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 06:54:33 -0700 (PDT)
Received: by 10.115.17.1 with SMTP id u1mr2809172wai.1176213273546;
	Tue, 10 Apr 2007 06:54:33 -0700 (PDT)
Received: by 10.114.191.6 with HTTP; Tue, 10 Apr 2007 06:54:33 -0700 (PDT)
Message-ID: <f96d234e0704100654p5389c8c5s72c89aa339b37b13@mail.gmail.com>
Date: Tue, 10 Apr 2007 09:54:33 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <461AE55E.6020301@openhardware.net>
MIME-Version: 1.0
References: <4611582F.8010203@openhardware.net>
	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>
	<461972D6.1060901@openhardware.net>
	<461A6F08.3020904@openhardware.net>
	<f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>
	<461AE55E.6020301@openhardware.net>
Subject: Re: versioning madness
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
X-List-Received-Date: Tue, 10 Apr 2007 13:54:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/9/07, Tom Walsh <tom@openhardware.net> wrote:

> When the two recipe trees are specified within
> $projdir/build/conf/local.conf as BBFILES :=
> "$projdir/zipitbbfiles/*/*.bb
> $projdir/org.openembedded.dev/packages/*/*.bb", still no problem.
>
> The problem comes up later when someone edits the recipe for
> $projroot/org.openembedded.dev/packages/sysvinit/sysvinit_2.86.bb and
> changes the PR = "rX" to a value larger than the one contained inside
> $projdir/zipitbbfiles/sysvinit_2.86.bb.  Guess what happens now?  The
> undesired recipe now takes precedence over the private recipe copy as PR
> gets asserted in the numerical version vote!

Actually if you use bbcollections, and set the priority higher in the
zipitbbfiles, it will take precedence no matter what the PR is.  Try
something like the following in your local.conf -- replace
openembedded.custom w/ zipitbbfiles ....

BBFILES := "${TOPDIR}/openembedded/packages/*/*.bb
${TOPDIR}/openembedded.custom/packages/*/*.bb"
BBFILE_COLLECTIONS = "upstream custom"
BBFILE_PATTERN_upstream = "^${TOPDIR}/openembedded/packages/"
BBFILE_PATTERN_custom = "^${TOPDIR}/openembedded.custom/packages"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_custom = "10"

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


