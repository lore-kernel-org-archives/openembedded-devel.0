Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ORzOr-0006id-O7
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 05:16:18 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2074835fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=qoHq8FjyLdN8hPLnv3tt/ZtsECe//5sdeXiL1JbrGes=;
	b=lEEJuSePhBY6r6/x4Eh6pP78TZcTHMHgFGjYkLHe8JWNTljJnsv4Aq1YJatP7HEn4E
	DlqGqBd6wgJfzhUSIK3iDBIgQsafZMnxqdnB3fDH8Af/k9L67Avn4QKEvSJKNJD5I7OX
	B5CcT1482jXeYd+RmwJdWhgtIRUSN0gNzkfA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=itVaAhgaLn+A22941g0Y893hCRyrK/6iRAa0NGX/38pqUj/xGkuufkjcoejk9gRhRK
	FkfOSWSkfepvfsUnFIM4n878jth1jWTaNeMfLmXqI4joU9Tj8cecw3LlUxlx2cMputxH
	JfbeYqKQNbm3edumFKJ0sv1CnUrt06jokKtcs=
Received: by 10.223.20.218 with SMTP id g26mr9824fab.18.1277435501714;
	Thu, 24 Jun 2010 20:11:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 28sm16642828fkx.6.2010.06.24.20.11.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 20:11:40 -0700 (PDT)
Date: Fri, 25 Jun 2010 05:11:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100625031129.GA17650@jama>
References: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
	<20100624151848.GD28292@gmail.com>
	<B4EAD150EF8844DDB3676A4A9B08C120@rhonda.vtc.ru>
	<20100625004612.GB27649@gmail.com>
	<6A7B7034B0CC4B568C76BC153107D499@rhonda.vtc.ru>
MIME-Version: 1.0
In-Reply-To: <6A7B7034B0CC4B568C76BC153107D499@rhonda.vtc.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to select specific version of dependant component
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
X-List-Received-Date: Fri, 25 Jun 2010 03:16:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 25, 2010 at 02:03:17PM +1100, Andrew Tverdohlebov wrote:
> >its an override. if you want to know what overrides are read the manual.
> >and in future don't top post its not readable flow.
> 
> If you look into the OpenEmbedded User Manual yourself smart guy,
> you will probably find that the section "overrides" is a stub.
> There is also nothing usefull regarding purpose of  '_local'

description in bitbake.conf

# Overrides are processed left to right, so the ones that are named later take precedence.
# You generally want them to go from least to most specific.
# 
# This means that an envionment variable named '<foo>_arm' overrides an
# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
# an environment variable '<foo>_ramses' overrides '<foo>' but doesn't override
# '<foo>_arm' when ${MACHINE} is 'ramses'. 
# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' will override 
# '<foo>_arm' and then '<foo>' will be overriden with that value from '<foo>_arm'.
# And finally '<foo>_local' overrides anything, but with lowest priority.
#
# This works for  functions as well, they are really just environment variables.
# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
# Alternative OVERRIDES definition without "fail fast", usually only for native building and Scratchbox toolchains.
#OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}"

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


