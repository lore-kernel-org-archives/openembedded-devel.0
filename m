Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NsNAw-0001BC-Mk
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 22:22:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2ILJcuL008685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 21:19:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08390-06 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 21:19:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2ILJUQY008679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 21:19:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BA293E5.9030705@tait.co.nz>
References: <4BA1825F.9080405@tait.co.nz> <1268933342.8697.43.camel@rex>
	<4BA293E5.9030705@tait.co.nz>
Date: Thu, 18 Mar 2010 21:19:28 +0000
Message-ID: <1268947168.8697.77.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] Renamed prefix_native, bindir_native, etc using camelCaps
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
X-List-Received-Date: Thu, 18 Mar 2010 21:22:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-03-19 at 09:58 +1300, Douglas Royds wrote:
> Richard Purdie wrote:
> > On Thu, 2010-03-18 at 04:37 +0100, Holger Hans Peter Freyther wrote:
> >   
> >> On Thursday 18 March 2010 02:31:11 Douglas Royds wrote:
> >>     
> >>>     - Avoids clashing with the machine override when MACHINE=native
> >>>     - bindir_cross similarly renamed for consistency
> >>>       
> >> Thank you for that much work. I think we established the usage of '-' instead 
> >> of '_' to avoid clashes with the override detection though.
> >>     
> >
> > I just noticed this problem. It makes me very very nervous to introduce
> > yet another variable naming convention, particularly one we don't use
> > anywhere else :/.
> >
> > Might it be simpler to rename the native machine? Using "native" in the
> > override namespace is asking for trouble :(.
> 
> I have no objection to renaming the native machine, but I think we 
> should also ensure that we never use _thing variable names (in lower 
> case). We have a weak distinction between overrides and underscored 
> variable names. By convention, BitBake variables are entirely in 
> uppercase, and overrides in lower case, but this convention fails when 
> the variable names are externally imposed (by the Autotools), 
> exec_prefix being a case in point.
> 
> I propose that we rename prefix_native and friends to avoid any risk of 
> clashing with the overrides.

I think the better way to fix this long term is to change the override
character in bitbake itself. We've been around in circles on this issue
and its the only sane way as _ does make a logical separator in variable
names, rightly or wrongly.

> Separately, if we wish, we can rename the native machine. I suggest 
> "buildhost". This would also help to clarify that the following two 
> builds have quite different intentions, though the result is similar:
> 
>     bitbake thing-native
>     MACHINE=native bitbake thing

Agreed.

Cheers,

Richard



