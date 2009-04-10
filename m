Received: from [76.96.27.243] (helo=QMTA13.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Ls7IZ-00064D-LF
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 05:21:02 +0200
Received: from OMTA07.emeryville.ca.mail.comcast.net ([76.96.30.59])
	by QMTA13.emeryville.ca.mail.comcast.net with comcast
	id dQ4u1b0071GXsucADfHlbq; Fri, 10 Apr 2009 03:17:45 +0000
Received: from edshome ([71.198.120.50])
	by OMTA07.emeryville.ca.mail.comcast.net with comcast
	id dfHk1b00915LFXK8TfHkJP; Fri, 10 Apr 2009 03:17:45 +0000
From: "ed nelson" <enelson1000@comcast.net>
To: <openembedded-devel@lists.openembedded.org>
References: <26925465C0D24F9AAA4610C4CD411DE3@edshome>
	<49DEB0E7.3060304@balister.org>
Date: Thu, 9 Apr 2009 20:17:45 -0700
Message-ID: <9ED1B47457D3489ABE797F3DBF800929@edshome>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <49DEB0E7.3060304@balister.org>
Thread-Index: Acm5hX3aL/4thzMbRyaVTJZ3+ZlRnAABVU+Q
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-SA-Exim-Connect-IP: 76.96.27.243
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What is the best approach when defconfig is changed
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
X-List-Received-Date: Fri, 10 Apr 2009 03:21:02 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Philip

Thanks, That did it and saved lots of time.

Ed

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Philip Balister
Sent: Thursday, April 09, 2009 7:37 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] What is the best approach when defconfig is changed

ed nelson wrote:
> I built a console-image without any failures.  I now want to use a
different
> defconfig file (made minor change). Do I need to delete the tmp dir and do
a
> new console-image build or is there a better way to handle this.

Do bitbake -c clean virtual/kernel then bitbake console-image.

That should do the trick.

Philip

> 
>  
> 
> Thanks
> 
> ed
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



