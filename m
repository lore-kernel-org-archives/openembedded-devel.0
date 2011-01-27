Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holla.net@gmail.com>) id 1PiOiH-0004W3-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 11:04:25 +0100
Received: by wyb40 with SMTP id 40so1842637wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=um2fhCeFN6xXcA6udd0NtbNTXZpg1jrh6Ja36mnLPOI=;
	b=Yca0kcYbUO8p2MqKWEAWTfwXA4TvQREoqzEN7stdpID8VEtgWhhmXm2X/xNA8RGSQ/
	5LtcYQYCU7vkDmpGLgHpveQh75kgasU+Bh7aiAJuK0rCkVuV2y0u8fZQWjQAbPiT3nnP
	iYz6n8cj6Yz/qrUqbN8nMrriN5xb6KIDgdytg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=XeHE0ypL+IbUUu4Om+HkY1/M6r5X4v/te24lItgVtAfft4cNEgkQ+7MRpFEhUK+Y88
	S3ekuYaMpmUEE1BXIoF+x/ZgzZaL+1G+eFiRE77+MUniC4NsZ3OTMaRc5qccODNh8Cdo
	QyGwcP+sEyhZEz/tzuAWkeQJ/ucKa682iG+RE=
MIME-Version: 1.0
Received: by 10.227.155.73 with SMTP id r9mr787794wbw.63.1296122616027; Thu,
	27 Jan 2011 02:03:36 -0800 (PST)
Received: by 10.227.143.204 with HTTP; Thu, 27 Jan 2011 02:03:35 -0800 (PST)
Date: Thu, 27 Jan 2011 10:03:35 +0000
Message-ID: <AANLkTi=_AV4U5vnmZixacxsigMQmBHFVM+N-2hdXY6Op@mail.gmail.com>
From: Sathish Vasudevaiah <holla.net@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Recipe with multiple git/svn repositories
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
X-List-Received-Date: Thu, 27 Jan 2011 10:04:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

While building a custom version of mpalyer (http://intr.overt.org/blog/?p=117)
the mplayer tree had to be assembled from multiple repositories.
One problem I noticed was that when multiple git reposities are mentioned,
all of them check out into $WORKDIR/git. How do you prevent it ?

Finally I ended up doing something like this. Is there a better way ?


MPLAYER = "f4626fcddd2dab57129c"
FFMPEG_TAG = "dbfc60e186f143baba6b"
LIBSWSCALE_TAG = "d1a43021d9198868fa7a023a30e5ee9e09a907d3"

SRC_URI = " git://github.com/philipl/mplayer-crystalhd;protocol=git;tag=${MPLAYER}\
            git://github.com/philipl/ffmpeg-crystalhd;protocol=git;tag=${FFMPEG_TAG}\
            git://git.mplayerhq.hu/libswscale;protocol=git;tag=${LIBSWSCALE_TAG}\
            svn://git.ffmpeg.org/dvdnav/trunk/;proto=svn;module=libdvdread;rev=1219\
            svn://git.ffmpeg.org/dvdnav/trunk/;proto=svn;module=libdvdnav;rev=1219\
                  "


do_fetch_post() {
     cd ${WORKDIR}
     rm -rf git
     tar xvfz ${DL_DIR}/git_github.com.philipl.mplayer-crystalhd_${MPLAYER}.tar.gz
     mkdir tmp
     cd tmp
     tar xvfz ${DL_DIR}/git_github.com.philipl.ffmpeg-crystalhd_${FFMPEG_TAG}.tar.gz
     mv git ../git/ffmpeg
     tar xvfz ${DL_DIR}/git_git.mplayerhq.hu.libswscale_${LIBSWSCALE_TAG}.tar.gz
     rm -rf ../git/ffmpeg/libswscale
     mv git ../git/ffmpeg/libswscale
     cd ..
     mkdir git/libdvdread4
     mv libdvdread/src/* git/libdvdread4
     mv libdvdnav/src git/libdvdnav
}

addtask fetch_post before do_patch after do_unpack


