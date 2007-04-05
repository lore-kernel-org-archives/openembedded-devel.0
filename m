Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HZS1J-00059D-2n
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2007 15:28:57 +0200
Received: by an-out-0708.google.com with SMTP id c5so618306anc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2007 06:28:55 -0700 (PDT)
Received: by 10.115.77.1 with SMTP id e1mr721999wal.1175779735004;
	Thu, 05 Apr 2007 06:28:55 -0700 (PDT)
Received: by 10.114.191.6 with HTTP; Thu, 5 Apr 2007 06:28:54 -0700 (PDT)
Message-ID: <f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
Date: Thu, 5 Apr 2007 09:28:54 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4611582F.8010203@openhardware.net>
MIME-Version: 1.0
References: <4611582F.8010203@openhardware.net>
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
X-List-Received-Date: Thu, 05 Apr 2007 13:28:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/2/07, Tom Walsh <tom@openhardware.net> wrote:
> I would like to know how others are handling this problem.   As you
> already know, versioning can be "interesting" with OE.  It is probably
> how I have approached the issue of keeping my list of files seperate
> from the OE bb filetree.
>
> In my project, I have a number of packages which needed specific changes
> to files so that they reflected the needs of the target.  A simple
> example is that of a list of /dev/devices.  initscripts controls the
> device creation through the device_table list.  So, I have a
> device_table file unique to my target.   No problem.
>
> What is a problem is controlling the changes that I make to the OE
> packages tree.  If I simply create a ${MACHINE_NAME} directory under
> packages/initscripts/initscripts-1.0/, then I have to remember that it
> is there.  As this target may never be in the mainstream OE database, I
> keep the uniqueness of my changes in a seperate bb filetree.  The
> local.conf names the BBFILES location of both the mainstream OE tree and
> my bb tree.
>
> This works, if I copy, in total, the packages/initscripts directory into
> my bb tree, then do the changes inside the copy.  I now know where my
> changes are and can distribute them without having people invasively
> patch the OE tree.  Where this breaks down is the in the "PR" variable
> (PR = "r88").  Bitbake will ignore my initscripts-1.0.bb totally, if the
> OE initscripts has a higher "PR" number than my local copy!

The solution is bbcollections.  If you set up bbcollections properly,
the package from the high priority tree will be used, even if the PR
is greater in the upstream tree.  I just tested this as I have a local
copy of tslib in my custom tree and it works.  I have been using
bbcollections for a number of projects and it works very well.  I can
check all my OE changes into SVN or whatever is used for the rest of
the project, and still track the upstream OE tree as needed.

BBFILES := "${TOPDIR}/openembedded/packages/*/*.bb
${TOPDIR}/openembedded.custom/packages/*/*.bb"
BBFILE_COLLECTIONS = "upstream custom"
BBFILE_PATTERN_upstream = "^${TOPDIR}/openembedded/packages/"
BBFILE_PATTERN_custom = "^${TOPDIR}/openembedded.custom/packages"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_custom = "10"

Does this work for you?

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


