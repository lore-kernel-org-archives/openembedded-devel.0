Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OcGjV-0006T8-GD
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 13:48:08 +0200
Received: by fxm12 with SMTP id 12so5048195fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Astv2d3GUCuA6y9F2p3lqvAAs6fiKTQkvPYBLVtExaU=;
	b=YgJ7b6wRK5WvIwagDIVWNV6DwSxJRjw0xM3ml0vahrYjTkv3kUnkmj3w1Fdp9gIHYW
	SWGYvLwoZjtb0NL7pCT9KzBQQ8aqJSVCug828FmRezEyyqwqvBpnJRsyDww/q0JmTaqh
	1aUSLQyzLiWD1DgLtoJWnxTMC8jWaTDLlVLLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NXicefEg9/Q4cHmicGX4oBingEiVijwq/mrFll4DWT58zH/Vb/K47ZL08b62TV5C8m
	r9pL2KEC7PWz7AlQdcCFCKl3dvsth1WcbJTPf+rYjXaes/Zf57klhtOHx6d+jfMECIc2
	8m+dAKxGAf35F2aGXWYGezUySaZUrRZxsk+Q0=
Received: by 10.86.84.2 with SMTP id h2mr2608091fgb.47.1279885672701;
	Fri, 23 Jul 2010 04:47:52 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id y2sm57065fau.36.2010.07.23.04.47.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 23 Jul 2010 04:47:51 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OcGjC-0006Sz-PX; Fri, 23 Jul 2010 13:47:46 +0200
Date: Fri, 23 Jul 2010 13:47:46 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100723114746.GA19734@mx.loc>
References: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
	<1279317776.7632.15.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279317776.7632.15.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][CFT 1/3] libmpc: bump version and cleanup staging
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
X-List-Received-Date: Fri, 23 Jul 2010 11:48:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 17, 2010 at 12:02:56AM +0200, Paul Menzel wrote:
>Dear Bernhard,

>> --- a/recipes/libmpc/libmpc_0.8.1.bb
>> +++ b/recipes/libmpc/libmpc_0.8.1.bb
>> @@ -1,13 +1,12 @@
>>  require libmpc.inc
>>  
>>  DEPENDS = "gmp mpfr"
>> -
>> -SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
>>  S = "${WORKDIR}/mpc-${PV}"
>> +NATIVE_INSTALL_WORKS = "1"
>> +BBCLASSEXTEND = "native"
>> +PR = "1"
>>  
>> -do_stage() {
>> -	autotools_stage_all
>> -}
>> +SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
>
>Maybe you can put `SRC_URI` also in `libmpc.inc`?

mpc seems to be only available as .tar.gz (you even get a .tar.gz if you
ask their server for a .tar.xz ATM, apache anti-typo module,
apparently), so yes, i'll do that as a follow-up once these 3 are in,
ok?

>Otherwise it looks fine.
>
>Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

ping these three (mpc, mpfr, gmp)

Please, somebody with write privs for oe, install.
TIA,


