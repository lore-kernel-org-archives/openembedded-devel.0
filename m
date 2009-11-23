Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCdjN-0008Di-MY
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 19:33:48 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANISxvl014686 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 18:29:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Fe6Sp9JVyCwE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 18:28:59 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANISssX014641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 18:28:56 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
References: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
Date: Mon, 23 Nov 2009 18:32:13 +0000
Message-Id: <1259001133.10321.140.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what is the expected STAGING_INCDIR for cross packages?
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
X-List-Received-Date: Mon, 23 Nov 2009 18:33:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 18:25 +0100, Leon Woestenberg wrote:
> what is the expected STAGING_INCDIR for -cross packages?
> 
> 
> Our STAGING_INCDIR for -cross packages contains two concatenated absolute paths,
> one based of CROSS_DIR, one based of STAGING_DIR.
> 
> Both are absolute, based against TMPDIR.
> 
> Is that correct?

Cross recipes are tricky. Half the time variables refer to the "host"
and half the time they refer to the "target". This sounds like a case
where the two have combined in a rather unfortunate way.

Where is this used and what kind of problem is occurring?

> CROSS_DIR = ${TMPDIR}/cross/$BASE_PACKAGE_ARCH
> prefix = ${CROSS_DIR}
> exec_prefix = ${prefix}
> includedir = ${exec_prefix}/include

These all look correct. Cross packages are installed into "/" under
${prefix} which puts them in the correctly place

> STAGING_DIR = ${TMPDIR}/staging
> BASEPKG_HOST_SYS=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}
> STAGING_DIR_HOST=${STAGIG_DIR}/$BASEPKG_HOST_SYS}
> 
> which are then concatenated for -cross packages as:
> 
> STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"

So I'd guess that cross.bbclass should be setting STAGING_DIR_HOST = "/"
like native.bbclass does and then ${includedir} will map to the correct
place.

I have to wonder what other side effects that would have of course
(although there aren't that may -cross recipes to break comparatively
speaking).

Cheers,

Richard





