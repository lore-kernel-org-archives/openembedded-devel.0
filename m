Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 41B717305E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:26:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170302132629232_0685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 05:26:29 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=19791 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjQkR-0005jq-BF for openembedded-devel@lists.openembedded.org;
	Thu, 02 Mar 2017 08:26:23 -0500
Date: Thu, 2 Mar 2017 08:26:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703020815110.14308@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: PYPI_PACKAGE for (blacklisted) python[3]-ndg-httpsclient is incorrect
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Mar 2017 13:26:38 -0000
Content-Type: text/plain; charset=US-ASCII


  in my wanderings, i noticed the following line in the include file
recipes-devtools/python/python-ndg-httpsclient.inc:

  PYPI_PACKAGE = "ndg_httpsclient"

however, that appears to be incorrect -- the correct name over at
pypi.python.org is, in fact, "ndg-httpsclient" (making the assignment
to PYPI_PACKAGE superfluous, yes?)

  https://pypi.python.org/pypi/ndg-httpsclient/0.4.2

one would think that would cause problems; however, the python3
version of the recipe is blacklisted for the following reason:

  http://errors.yoctoproject.org/Errors/Details/130615/

so one would never get the opportunity to see the build error. still,
wouldn't that cause the python2 version of the recipe to fail? that
one isn't blacklisted.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


