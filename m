Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O2t0A-000681-NW
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 23:23:05 +0200
Received: by fg-out-1718.google.com with SMTP id 19so1243593fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=JjiiamhzEmk5/naj87u+BTYrAVn2I/UPIDbxiJ/DoMw=;
	b=gyAyWvx/OTM1YgxMAk1m36MQkS0gtpAbq7FcFRq/IFgIsZb+M6/XdyFNZT3I/blxIm
	tlCnVrEh1Oo2Zqq/1gqgAO55ZJbEWJhc3IcK32cEt9qU9tGHNVio029tDBxlNW31sa1+
	k1ecgona1IJ0syAWy6fXXQgNi2B6uC8TADR8U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=RaMlK9mqGfgm1duhAnDYxKTLPT9VQHsXuMiZghO9nW7YpO5Bs1MtVIme0I5hJaUG7/
	J3lY0y6dfo3M+JmtX/+IDRhnEiF7YOefOEXALU3AK4MnACJ5WTrl1G+D7dhXIpA7SgFW
	wCCUWOHwddA8WKzjXFOqzKZKplixQjt/wFumc=
Received: by 10.223.5.89 with SMTP id 25mr965354fau.87.1271452774536;
	Fri, 16 Apr 2010 14:19:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 31sm4820360fkt.49.2010.04.16.14.19.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Apr 2010 14:19:34 -0700 (PDT)
Date: Fri, 16 Apr 2010 23:19:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100416211935.GD3323@jama>
References: <20100416123920.GB3323@jama>
	<j2o48239d391004160639p87e47f6enf6f096140c9ecd20@mail.gmail.com>
	<1271451606.5774.8.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1271451606.5774.8.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [OT] bootchart (was: Do we really want shared Xserver script for all machines?)
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
X-List-Received-Date: Fri, 16 Apr 2010 21:23:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 16, 2010 at 11:00:06PM +0200, Paul Menzel wrote:
> Am Freitag, den 16.04.2010, 17:39 +0400 schrieb Sergey Lapin:
> 
> […]
> 
> > Sorry to bother with off-topic post, but how these boot charts are
> > built? Really nice thing to have...
> 
> Use bootchart [1]?

yes,

and to be OE specific I used
recipes/bootchart-lite/bootchart-lite_svn.bb

and for freerunner slightly changed Qi bootloader to pass it as init.
http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/03c69b54cf1675a30e2d71d36e4662611982a5c6

then tar and scp resulting files back to computer and run bootchart to
generate graph.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


