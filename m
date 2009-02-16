Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LZ42C-0001sK-8r
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 15:01:20 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LZ40M-000P7c-FE
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 16:59:26 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2009 16:59:09 +0300
User-Agent: KMail/1.9.9
References: <34765.AFRWCldXDSo=.1234790540.squirrel@webmail.no-log.org>
In-Reply-To: <34765.AFRWCldXDSo=.1234790540.squirrel@webmail.no-log.org>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902161659.09894.khimov@altell.ru>
Subject: Re: bzip2-full-native_1.0.5.bb problem and possible fix
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
X-List-Received-Date: Mon, 16 Feb 2009 14:01:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

GNUtoo:
> I've:
> >| cp: will not overwrite just-created
>
> `/home/embedded/oetmp_openmoko/work/i686-linux/bzip2-full-native-1.0.5-r0
>/bzip2-1.0.5/install-sh' with
> `/home/embedded/oetmp_openmoko/staging/i686-linux/usr/share/automake-1.9/
>install-sh'

Most probably you've worked with automake 1.9, then switched to automake 
1.10 (or reverse way) and got two automakes in staging directory, then 
this:

> cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/

which should expand as (for example)

cp ${STAGING_DATADIR_NATIVE}/automake-1.10/install-sh ${S}/

expands as

cp ${STAGING_DATADIR_NATIVE}/automake-1.10/install-sh \
	${STAGING_DATADIR_NATIVE}/automake-1.9/install-sh ${S}/

Boom.

Had this on automake switch too, not sure how to fix it better, but it's not 
a problem when you only use one automake (and you can clean up stale 
version manually if you switched from one version to another).


