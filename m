Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PIsKr-0000V0-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 01:26:46 +0100
Received: by qyk7 with SMTP id 7so698425qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 16:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=4/cEGLt7kI2r/5BVDHjsRo8WERl2hMj7pzgTfNt5HTI=;
	b=WmBMwoq4LmlYctUGLWnLuFX5jrQYOFK2d+Sy2tZ1HkoDx0HknHm+WBTxT01Szx9/Wg
	UR9X2+n729kcMcPpy5EcIean5sfDp/WHhrUQ2yq/F2BNZD9jPH4gMn98C0Cjeye7mVC1
	2h5Ru4yaSbffQM8Q98zfeYgoifYIZw09RycIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=Z+s32idV27W9g141dXXq4TiDsK25buQoqRa7XJtI6TSzgh+xFOnqN2uQrDgxDxauZ0
	FtoQsd9U4h9MOTB47TVYWwFQ49rrkTYMIDLCJP/ut2LH3+SUwcUhakAJ01+9d2OPWs2n
	njK44S2lJ/uJf695d55aWzJX2mPdmNzQryAGQ=
MIME-Version: 1.0
Received: by 10.229.224.212 with SMTP id ip20mr7974711qcb.278.1290039935563;
	Wed, 17 Nov 2010 16:25:35 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.220.112.210 with HTTP; Wed, 17 Nov 2010 16:25:35 -0800 (PST)
Date: Thu, 18 Nov 2010 00:25:35 +0000
X-Google-Sender-Auth: Ml2KjUVshVbv1AJPgtLveKCWlIg
Message-ID: <AANLkTimWbWjmbVOm_X_KwXw9tKmd6u51seGVWd2JaRzM@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: starting with qt4 embedded (recent) builds
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
X-List-Received-Date: Thu, 18 Nov 2010 00:26:46 -0000
Content-Type: text/plain; charset=UTF-8

hi folks,

i gave up on gtk-directfb for various sensible reasons and am instead
focussing on qt4 embedded.  i need to get python-qt4 compiled (and
then patched - don't ask).  even getting qt4-embedded up-and-running
is proving problematic due to the existence of 4 different versions of
qmake (qmake-native which downloads the older qt "free" version from 4
years ago, qmake2 which isn't native but somehow appears to be but it
downloads qt4-embedded-linux-4.4.3) roughly the same number of
versions of sip and in amongst this there's half a dozen versions of
qt4.

what i _need_ is a recent version of qt4 - i've spent money on the 3G
connection downloading 150mb of qt-everywhere-opensource-4.6.3.tar.gz,
more money on downloading python-qt4-4.7.3.tar.gz so assuming that
those are reasonable how the heck do i even begin, when qmake-native
gets installed (version 0.10 from 4 years ago), qmake2 wants
qt4-embededded-linux-4.4.3.tar.gz, and the python-qt4 recipe is for
qt4x11 not qt4e?  oh, and python-sip is off on a wild one, too,
presently at python-sip-4.7.9-ml10,

some advice and help getting through this so that i can create free
software released tried and tested bitbake recipes so that nobody else
has to wade through hell and brimstone to get anything working would
be great! :)

so, starting with something simple:  qt4-embedded-4.6.3-r25.1 is
compiled and installed as an ipkg: how do i now actually get to
compile python-qt4-4.7.3?

here's what i've done so far:

* created python-qt4-embedded-4.7.3 based on python-pyqt4-4.4.3
changing X11 to embedded and changing sip-native to
sip-embedded-native

* created sip-embedded-native_4.11.2 using
SRC_URI = "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/sip-${PV}.tar.gz"

* created a python-sip-embedded to match the above sip-embedded-native

that's as far as i've got... "how's my driving" as they say - this is
_big_ compilations soo.... i'd rather i knew i was roughly along the
right lines :)

l.


