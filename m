Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NaaaL-0000d2-SI
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 21:03:28 +0100
Received: by fxm6 with SMTP id 6so871790fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 12:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=nky+k8L1Cd8eV7ovj4EjLbvnUlgnks1UUHsg0kcCrzk=;
	b=nq9+obJM+lT5gnfuLhLrStgPOvvMWEvc1m1s3XXr1CPFxY8rQyHuWU/4ewvsK+f4LY
	4GcIfoWsx5P8C8vl5hqO291HJwlotJG6gCURPHu6BX6/9eKonlGMs14yKGnh9o1kb8Zn
	LAeFP0vtjbC+l6R0dYMIm1Z08aJT06up3CG0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=suyDjKHbjq9EQ6ZS+l+HJ5p9ev80qb9u6BddwMxNlMmm2Mg9V+dL0X36nCPSD9mEPp
	O0q+pvNbPYjiMFdUFtVayka0FybOjWDz1BXDnaMeZtJOI9TPeTcdNy/gVQbsjK3lHPck
	sr5T7yA071fmfUZ1TtZKd1zTjh/AG4kEbArGg=
Received: by 10.87.68.15 with SMTP id v15mr277322fgk.64.1264708863007;
	Thu, 28 Jan 2010 12:01:03 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 3sm2459396fge.11.2010.01.28.12.01.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 Jan 2010 12:01:01 -0800 (PST)
Date: Thu, 28 Jan 2010 12:00:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100128200049.GA4958@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.214
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: update hook for git to check push commit message
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
X-List-Received-Date: Thu, 28 Jan 2010 20:03:29 -0000
X-Groupsio-MsgNum: 16273
Content-Type: multipart/mixed; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Attached is a small hook for updates that are pushed into repo.
Right now it only checks the first line of the commit and expects
module: summary

I have not tested it at all

Comments ?

Thanks
-Khem



--T4sUOijqQbZv57TR
Content-Type: text/x-python; charset=us-ascii
Content-Disposition: attachment; filename="update.py"

#!/usr/bin/env python
# usage update.py <oldrev> <newrev>
# currently it only checks for first line of the commit message
# which should look like e.g
# uclibc: <pretty summary>

import sys,os
from subprocess import *
oldrev = sys.argv[1]
newrev = sys.argv[2]
user = os.getenv('USER')
def ErrorOut(message):
    print "Please reformat the message per guidelines on http://wiki.openembedded.org/index.php/Commit_Policy"
    print "A sample is at http://wiki.openembedded.org/index.php/Commit_log_example"
    print "\nFaulty Commit Message:\n\n ", message
    sys.exit(1)

p = os.popen("git rev-list %s...%s" %(oldrev, newrev))
missed_revs = p.read()
for r in missed_revs.split():
    m1 = Popen(["git", "cat-file", "commit", r],stdout=PIPE)
    m2 = Popen(["sed", "1,/^$/d"], stdin=m1.stdout, stdout=PIPE)
    rev = m2.communicate()[0]
    first_word = rev.split()[0];
    if first_word[-1] is ':':
	print "Your message is not formatted according to commit poilicy"
	ErrorOut(rev)
    summary = rev.split(1)
    if summary is "":
	print "Commit Message does not have summary line"
	ErrorOut(rev)

--T4sUOijqQbZv57TR--
