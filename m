Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NsN5M-0002QN-VA
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 22:17:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2ILDqJd008615
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 21:13:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08377-05 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 21:13:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2ILDine008605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 21:13:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BA291BB.7040106@tait.co.nz>
References: <4BA1B29B.8040704@tait.co.nz>
	<ac9c93b11003180018u761e78f6l67b3f76869a95612@mail.gmail.com>
	<4BA291BB.7040106@tait.co.nz>
Date: Thu, 18 Mar 2010 21:13:42 +0000
Message-ID: <1268946822.8697.71.camel@rex>
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
Subject: Re: [PATCH 4/4] Renamed prefix_native, bindir_native, etc using 	hyphens
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
X-List-Received-Date: Thu, 18 Mar 2010 21:17:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-03-19 at 09:48 +1300, Douglas Royds wrote:
> Any renaming of base_prefix, exec_prefix, base_bindir, target_datadir, 
> &c is a separate matter. Note that some of these names are imposed on us 
> by Autotools convention. This is why these variables are in lower case 
> in the first place:
> 
>     http://www.gnu.org/prep/standards/html_node/Directory-Variables.html#Directory-Variables

Exactly, this is why they are as they are and I don't think changing
this is practical.

It would in fact be more feasible to switch to a "new" character for
overrides in bitbake...

Cheers,

Richard




