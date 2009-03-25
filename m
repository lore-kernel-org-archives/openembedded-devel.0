Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LmTJB-0003cR-VB
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 14:38:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2PDahTo010720
	for <openembedded-devel@openembedded.org>; Wed, 25 Mar 2009 13:36:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10169-10 for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 13:36:39 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2PDaY7w010704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 25 Mar 2009 13:36:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gqd31s$5vk$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<49C92CC7.2080801@gmail.com>
	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
	<49C93237.7010205@gmail.com> <49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
	<49C94647.2040401@gmail.com>
	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org>
Date: Wed, 25 Mar 2009 13:36:55 +0000
Message-Id: <1237988215.5328.40.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 13:38:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Having given this some further thought, I think the problem is we need
to do something different.

We've tried MAINTAINERS in recipes, it wasn't a success.

The current Maintainers file is ok and roughly current but doesn't have
as much visibility as we'd ideally like.


I don't think the Maintainers file is wrong as such, I think whats
missing are scripts to do something with the data. It would be useful if
we had a program which could tell us:

* Who maintains file X (be it a class/recipe/conf/sitefile etc)?
* Who last changed file X?
* Who are the contributors to file X?
* Can we easily create a subset of the metadata which is "maintained"?

If we have scripts to do this which is possible with a combination of
the Maintainers file and the SCM, maybe with some tweaks to file formats
as needed such as adding the git commit IDs I think people will start to
maintain the files more and we might get more people registering their
maintainership.


I should also mention one big reason we dropped the MAINTAINER fields
from recipes - they make no sense outside of OE. As soon as you move a
recipe into something like Poky, you don't want your name there.
Dropping the Maintainers file is easy, editing several hundred recipes
is a pain for syncing between the trees. We do want to support
initiatives like Poky, right? :)

Cheers,

Richard




