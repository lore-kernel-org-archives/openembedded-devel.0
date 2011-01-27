Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@vdm-design.de>) id 1PiOSE-0008GE-6r
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 10:47:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 1511C37D2081
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 10:38:35 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id CgWJuVlVe9nK
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 10:38:19 +0100 (CET)
Received: from rikrok.localnet (rikrok.physik.uni-bonn.de [131.220.167.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id E34EA37D2080
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 10:38:19 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 10:38:18 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27.45-0.1-default; KDE/4.1.3; i686; ; )
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com>
In-Reply-To: <4D403D6F.3040800@mentor.com>
MIME-Version: 1.0
Message-Id: <201101271038.18945.ml@vdm-design.de>
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Thu, 27 Jan 2011 09:47:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 26 January 2011 16:27:43 Tom Rini wrote:
> I believe, from talking with Chris Larson about this before, in 1.8.x
> the error wasn't being populated upwards, but that got fixed.  At heart
> the problem is that QA errors aren't throwing a "kill the build" type
> error.  This should be changeable (and would cause 1.8.x to fail too, if
> someone backported this change to a 1.8.x using OE) to insane.bbclass.

I don't think that a QA error should "kill the build" because then no build 
from scratch would be possible.
We have a QA error in coreutils-native because it doesn't inherit gettext. But 
adding this inherit would result in a dependencie loop.

So if a QA error would stop build we would need something for those 
situations.

And additionally i think that most QA errors aren't fatal because most of them 
are for non-standard .desktop files.


