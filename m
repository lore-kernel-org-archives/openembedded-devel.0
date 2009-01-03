Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LJFS7-0004Qw-IP
	for openembedded-devel@openembedded.org; Sat, 03 Jan 2009 23:58:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n03MqsRf005248
	for <openembedded-devel@openembedded.org>; Sat, 3 Jan 2009 22:52:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04737-09 for <openembedded-devel@openembedded.org>;
	Sat,  3 Jan 2009 22:52:50 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n03MqkkE005242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 3 Jan 2009 22:52:47 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gjof7h$1hd$1@ger.gmane.org>
References: <gjof7h$1hd$1@ger.gmane.org>
Date: Sat, 03 Jan 2009 22:53:12 +0000
Message-Id: <1231023192.5337.4.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: autotools.bbclass question
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
X-List-Received-Date: Sat, 03 Jan 2009 22:58:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2009-01-03 at 19:44 +0000, Dmitry Eremin-Solenikov wrote:
> While trying to fix staging for net-snmp, I got a question regarding
> autotools.bbclass. autotools_stage_all uses oe_runmake for installation
> while autotools_stage_includes just issues make directly. Isn't it
> a misfeature? Shouldn't both of them be changed to use the same approach?

Yes, both should probably use oe_runmake.

Cheers,

Richard


-- 
Richard Purdie
Intel Open Source Technology Centre



