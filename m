Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MH0hv-0004cz-Gq
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:22:03 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP
	id A683619405; Wed, 17 Jun 2009 12:11:33 -0700 (PDT)
Message-Id: <005EAB22-A6E9-4C92-B91B-37537A60BFC8@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Wed, 17 Jun 2009 12:11:33 -0700
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 19:22:03 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


On Jun 17, 2009, at 12:07 PM, Leon Woestenberg wrote:

> Hello,
>
> On Wed, Jun 17, 2009 at 7:10 PM, Chris Larson<clarson@mvista.com>  
> wrote:
>> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
>>
> +1 for the idea, but "something other than the empty string" is a very
> bad user interface.
>
>
> If users see:
>
> IMAGE_KEEPROOTFS = "1"
>
> in most cases they'll do:
>
> IMAGE_KEEPROOTFS = "0"
>
> instead of
>
> #IMAGE_KEEPROOTFS = "1"
>
>
> Do we have more of these?? It never occured to me before.


We have this sort of thing all over the place.  It needs an audit.   
Some vars expect set/empty, some expect 0/1, some expect yes/no, some  
just have a *convention* of yes/no.. afaik, anyway.
-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com



