Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nl6RY-0008CL-Fx
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 21:05:53 +0100
Received: by fxm20 with SMTP id 20so459890fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 12:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=T8DOEH2zePDg5ByEwFHXfQoJUP9LlNz77I9VvxS9I3s=;
	b=oDmuMzTzWCTMq1TNVALIHExfUMo68KpOlxOXPr0/oqcGJsnspf+JXe0iXYzoczI9Ni
	q9UPq9cJ9Y4yaPNFCUWMR/t1A7c26BOIe313qHcnRdNorgcHRanRw3h220dpmKD5HF67
	/KzhqLiihBRPv+GaADXF7vqvR10N17SM2pi8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=t8gyXw61CpvoDjtGJgm4b7hvSL1MoiZTlJ3RRT47/ELuvZI5v9rbgMQN57gNIvd3oV
	hZVQiSSLD22tTtSZ8t585i7SD8U48AANIcKsk9SstjnDVrTut/1VsCrKXPmBXGDccr0U
	gnkKnlceeScW2ErV+d3PyHZLiUemaKZFueR38=
Received: by 10.223.82.1 with SMTP id z1mr1024923fak.101.1267214581236;
	Fri, 26 Feb 2010 12:03:01 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm396814fxm.8.2010.02.26.12.02.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 12:03:00 -0800 (PST)
Date: Fri, 26 Feb 2010 12:01:31 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226200131.GE25079@gmail.com>
References: <ad82c8891002250654r42248855x6b0a871b6b9acee1@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ad82c8891002250654r42248855x6b0a871b6b9acee1@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error while building minimo web browser
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
X-List-Received-Date: Fri, 26 Feb 2010 20:05:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/02/10 20:24), vivek tambakad wrote:
> Hi.
>       I am building minimo web browser for compulab Em-x270 board.
> It is giving  following error while building "bitbake minimo"
> 
> me/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/include/orbit-2.0
> -I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/include/dbus-1.0
> -I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include
> -I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/include/glib-2.0
> -I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
> *| checking MOZ_GCONF_LIBS...   -lgconf-2 -lglib-2.0
> | checking for libgnome-2.0 >= 2.0... configure: error: iconv() not found.
> Cannot enable native uconv support.
> | *** Fix above errors and then restart with               "make -f
> client.mk build"
> | make: *** [configure] Error 1
> | FATAL: oe_runmake failed*
> NOTE: Task failed:
> /home/vivek/development/em-x270/stuff/build/oetmp/work/armv5te-angstrom-linux-gnueabi/minimo-1_0.02+cvs20070626-r1/temp/log.do_configure.9520
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
> minimo_cvs.bb do_configure failed
> ERROR: Task 5
> (/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
> minimo_cvs.bb, do_configure) failed
> NOTE: Tasks Summary: Attempted 1710 tasks of which 1710 didn't need to be
> rerun and 1 failed.
> ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
> minimo_cvs.bb' failed
> 
> Please help me in building minimo web browser.
> 


post the config.log from build.



> with regards
> vivek tambakad
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


