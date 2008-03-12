Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZN81-0003n4-CB
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 10:20:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2C9I2QD019244
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 09:18:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19051-05 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 09:17:58 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2C9HtXd019235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 09:17:55 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803120918.09502.zecke@selfish.org>
References: <200803120827.29003.zecke@selfish.org>
	<fr828g$l2n$1@ger.gmane.org> <fr82hj$l2n$2@ger.gmane.org>
	<200803120918.09502.zecke@selfish.org>
Date: Wed, 12 Mar 2008 09:17:54 +0000
Message-Id: <1205313475.4530.4.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging ABI changes and broken idium
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 09:20:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-03-12 at 09:18 +0100, Holger Freyther wrote:
> On Wednesday 12 March 2008 08:59:47 Koen Kooi wrote:
> > Koen Kooi schreef:
> 
> > | (from gimp.inc)
> > | do_configure_append() {
> > | ~    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
> > | }
> >
> > Switching on my brain, the above isn't needed anymore, right?
> 
> -I/usr/include is still bad (assuming it holds your system headers).

We want the -I/usr/include removed since we must not use system headers
but we don't need any such include since sysroot or our standard CFLAGS
will pick up staging. s:'-I$(includedir)'::g should therefore be ok.

Cheers,

Richard





