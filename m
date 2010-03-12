Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1Npvv0-0003NX-Ap
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 04:52:16 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 141DA46754
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 16:49:29 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 040CF46752
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 16:49:29 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZ500801D1DY400@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Fri,
	12 Mar 2010 16:49:10 +1300 (NZDT)
Received: from [172.25.116.17] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZ5005DYH9R8060@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Mar 2010 16:49:03 +1300 (NZDT)
Date: Fri, 12 Mar 2010 16:49:03 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <BAY127-W28EEC160A639A50A862129D8320@phx.gbl>
To: openembedded-devel@lists.openembedded.org
Message-id: <4B99B9AF.9070301@tait.co.nz>
MIME-version: 1.0
References: <BAY127-W28EEC160A639A50A862129D8320@phx.gbl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Boost library version
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
X-List-Received-Date: Fri, 12 Mar 2010 03:52:16 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

The short answer is that yes, that should work. It's certainly worth a 
crack.

The long answer is definitely maybe. Building Boost is non-trivial. You 
will observe several patch files in boost_1.36.0.bb, and quite a lot of 
intelligence in boost-36.inc, that may or may not all work with 1.37.

Good luck,
Douglas.


saleh usman wrote:
> I am  bitbaking OSSIE image which requires boost library.Openembedded  doesn't contain recipe of boost version 1.37 and I want to use that version during my build.Which code I need to edit of the existing recipes say of boost_1.36.0.bb  for this.Will simply changing name of recipe to boost_1.37.0 work?
>
> Saleh
>  		 	   		  
> _________________________________________________________________
> Hotmail: Trusted email with powerful SPAM protection.
> https://signup.live.com/signup.aspx?id=60969
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> ______________________________________________________________________
> This email has been scanned by the MessageLabs Email Security System.
> For more information please visit http://www.messagelabs.com/email 
> ______________________________________________________________________
>   


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



