Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LITv4-000631-Ol
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 21:13:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n01K7jT7018781
	for <openembedded-devel@openembedded.org>; Thu, 1 Jan 2009 20:07:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18610-03 for <openembedded-devel@openembedded.org>;
	Thu,  1 Jan 2009 20:07:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n01K7c1X018775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 1 Jan 2009 20:07:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gjj11d$3ne$1@ger.gmane.org>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<gjj11d$3ne$1@ger.gmane.org>
Date: Thu, 01 Jan 2009 20:07:58 +0000
Message-Id: <1230840478.5320.51.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Thu, 01 Jan 2009 20:13:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-01-01 at 19:11 +0100, Koen Kooi wrote:
> How is the above different from the BPN used in OE?
> 
> # Base package name
> # Automatically derives "foo" from "foo-native", "foo-cross" or 
> "foo-initial"
> # otherwise it is the same as PN and P
> BPN = "${@base_package_name(d)}"
> BP = "${BPN}-${PV}"
> 
> [..]
> 
> S = "${WORKDIR}/${BP}"
> B = "${S}"

Heh, I could have sworn I'd seen that done before, OE is obviously
where. 

The rest still stands though and is the interesting bit :)

Cheers,

Richard



