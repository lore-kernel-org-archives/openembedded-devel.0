Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZMV0-0004NO-R5
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 09:39:52 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZMT2-0000CJ-44
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 09:37:44 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2008 09:37:40 +0100
User-Agent: KMail/1.9.9
References: <200803120827.29003.zecke@selfish.org>
	<fr828g$l2n$1@ger.gmane.org> <fr82hj$l2n$2@ger.gmane.org>
In-Reply-To: <fr82hj$l2n$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803120937.40769.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Wed, 12 Mar 2008 08:39:52 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 12 March 2008 08:59:47 Koen Kooi wrote:

Likely to be broken Makefile:
./packages/directfb/directfb-examples_1.0.0.bb:    find ${S} -type f | xargs sed -i 's:/usr/include:${STAGING_INCDIR}:'
./packages/directfb/++dfb_1.0.0.bb:    find ${S} -type f | xargs sed -i 's:/usr/include:${STAGING_INCDIR}:'
./packages/gphoto2/gphoto2_2.4.0.bb:        find ${S} -name Makefile | xargs sed -i 's:/usr/include:${STAGING_INCDIR}:'
./packages/fltk/efltk_2.0.7.bb: sed -i s,/usr/include,${STAGING_INCDIR}, makeinclude
./packages/fltk/efltk_2.0.7.bb: sed -i s,/usr/include/freetype2,, makeinclude
./packages/tcpdump/tcpdump_3.9.7.bb:        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
./packages/php/php_5.1.4.bb:    find ${S} -type f | xargs sed -i 's:/usr/include:${STAGING_INCDIR}:' (php_5.2.0.bb is doing it better)

Likely to be broken configure but need investigation, e.g. other path's get patched too
./packages/xaos/xaos_3.2.3.bb:    sed -i 's~/usr/include~${STAGING_INCDIR}~' ${S}/configure.in
./packages/esound/esound_0.2.36.bb:     sed -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' configure.ac
./packages/mplayer/mplayer_svn.bb:      sed -i 's|/usr/include|${STAGING_INCDIR}|g' ${S}/configure
./packages/mplayer/mplayer_0.0+1.0rc1.bb:       sed -i 's|/usr/include|${STAGING_INCDIR}|g' ${S}/configure
./packages/mplayer/mplayer_0.0+1.0rc2.bb:       sed -i 's|/usr/include|${STAGING_INCDIR}|g' ${S}/configure


Stupid:
./packages/smpeg/smpeg_0.4.4+0.4.5cvs20040311.bb:        cat smpeg-config | sed -e "s,-I/usr/include/SDL,-I${STAGING_INCDIR}/SDL," \
./packages/smpeg/smpeg_0.4.4+0.4.5cvs20040311.bb:                         | sed -e "s,-I/usr/include/smpeg, ," \
this looks like a case for binconfig?


./packages/opensync/libsyncml_svn.bb:        sed -i s:-I/usr/include/:-I/foo/:g Makefile 
./packages/opensync/libsyncml_svn.bb:        sed -i s:-I/usr/include/:-I/foo/:g */Makefile
./packages/opensync/libsyncml_svn.bb:   sed -i s:-I/usr/include/:-I/foo/:g */*/Makefile
./packages/opensync/libsyncml_0.4.0.bb:        sed -i s:-I/usr/include/:-I/foo/:g Makefile
./packages/opensync/libsyncml_0.4.0.bb:        sed -i s:-I/usr/include/:-I/foo/:g */Makefile
./packages/opensync/libsyncml_0.4.0.bb: sed -i s:-I/usr/include/:-I/foo/:g */*/Makefile

-I/foo? wy not :: as replacement?



Other but still broken:

./packages/perl/perl_5.8.8.bb:                sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
./packages/perl/perl_5.8.8.bb:            sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' ext/Errno/Errno_pm.PL
./packages/perl/perl_5.8.7.bb:  sed -i -e "s%/usr/include/%${STAGING_INCDIR}/%g" config.sh-${TARGET_ARCH}-${TARGET_OS}
./packages/perl/perl_5.8.7.bb:          sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
./packages/gdal/gdal_1.3.2.bb:          sed -i s:/usr/include:${D}${includedir}: GDALmake.opt


now doing this for /usr/lib...



