Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ime0W-0003ea-Am
	for openembedded-devel@openembedded.org; Tue, 30 Oct 2007 00:26:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9TNQtf2002125
	for <openembedded-devel@openembedded.org>; Mon, 29 Oct 2007 23:26:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02009-04 for <openembedded-devel@openembedded.org>;
	Mon, 29 Oct 2007 23:26:48 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9TNQkqL002114
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 29 Oct 2007 23:26:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1193675175.6161.60.camel@localhost.localdomain>
References: <1193675175.6161.60.camel@localhost.localdomain>
Date: Mon, 29 Oct 2007 23:26:46 +0000
Message-Id: <1193700406.6161.107.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Staging changes
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
X-List-Received-Date: Mon, 29 Oct 2007 23:26:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-29 at 16:26 +0000, Richard Purdie wrote:
> The next step is to go through the metadata doing one of two things:
> 
> * correcting things where we have variables we can use
> * listing problem areas (e.g. gcc configure options)
> 
> Bad references which can be grepped for are:
> 
> ${STAGING_DIR}/${BUILD_SYS}

As an update, I've now dealt with all of the above references in OE.dev.

> ${STAGING_DIR}/${HOST_SYS}

~116 of these which probably really should mostly be:

${STAGING_DIR_HOST}${layout_exec_prefix}

(or ${STAGING_DIR_HOST}${layout_prefix} if its a prefix etc. but
exec_prefix is most likely if its specifying where to find a library)

> ${STAGING_LIBDIR}/.. (anything with a .. in is likely to cause problems)

~179 references of ${STAGING_*}/.. to check, most of which should
probably be "${STAGING_DIR_HOST}${layout_exec_prefix}"

${STAGING_DIR}/${TARGET_SYS} (~90 references) can become
"$(STAGING_DIR_TARGET}${layout_exec_prefix}"

or

${STAGING_DIR}/${TARGET_SYS}/lib
becomes
${STAGING_DIR_TARGET}/${layout_libdir}
(as used in LDFLAGS)

> ${STAGING_DIR}

No point in looking at this until the above is done but it should have
very few direct users when we're finished.

In case anyone doesn't understand the point of this, it means when we
change ${layout_libdir} from "/lib" to "/usr/lib", in theory nothing
breaks :).

Cheers,

Richard






