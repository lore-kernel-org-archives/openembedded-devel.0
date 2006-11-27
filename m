Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GoUu4-0000mk-Ua
	for openembedded-devel@openembedded.org; Mon, 27 Nov 2006 02:03:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAR13MIN007252
	for <openembedded-devel@openembedded.org>; Mon, 27 Nov 2006 01:03:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07021-06 for <openembedded-devel@openembedded.org>;
	Mon, 27 Nov 2006 01:03:19 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAR13ITx007239
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 27 Nov 2006 01:03:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1164576168.5554.22.camel@localhost.localdomain>
References: <1164377635.26934.25.camel@localhost.localdomain>
	<1164576168.5554.22.camel@localhost.localdomain>
Date: Mon, 27 Nov 2006 01:03:21 +0000
Message-Id: <1164589401.5554.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: STAGING_BINDIR
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
X-List-Received-Date: Mon, 27 Nov 2006 01:03:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I now have two rough patches:

http://www.rpsys.net/openzaurus/temp/stage-bindir1.patch

which just renames variables. Should be safe to apply with a change to
add the new names to bitbake.conf. I will probably apply this soon
(Monday evening?) unless anyone objects. I don't fancy having this lying
around for long.

http://www.rpsys.net/openzaurus/temp/stage-bindir2.patch

These are the more invasive changes or need special handling.

Of all the references to STAGING_BINDIR I filtered, these were the two
I didn't like the look of or understand:

These look totally wrong:
./packages/qte/qtopia-core_4.2.0.bb:    install -m 0755 ${STAGE_TEMP}/${bindir}/rcc ${STAGING_BINDIR}
./packages/qte/qtopia-core_4.2.0.bb:    install -m 0755 ${STAGE_TEMP}/${bindir}/moc ${STAGING_BINDIR}
./packages/qte/qtopia-core_4.2.0.bb:    install -m 0755 ${STAGE_TEMP}/${bindir}/uic ${STAGING_BINDIR}
./packages/qte/qtopia-core_4.2.0.bb:    install -m 0755 ${STAGE_TEMP}/${bindir}/qmake ${STAGING_BINDIR}

And I have no idea what this is doing but it looks wrong:
./packages/uqm/uqm_0.3.bb:      ./build-opts.sh ${STAGING_DIR} ${STAGING_BINDIR} ${STAGING_LIBDIR}
./packages/uqm/uqm_0.5.0.bb:    ./build-opts.sh ${STAGING_DIR} ${STAGING_BINDIR} ${STAGING_LIBDIR}

If anyone fancies trying a build from scratch with both patches applied
for their favourite packages/images, particularly e-image, feedback
would be appreciated.

Cheers,

Richard



