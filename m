Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PPxxt-0005s4-3Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 14:52:21 +0100
Received: by fxm17 with SMTP id 17so9912058fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=1tzvinaxIgs6bUc032KMAhrGPLDVKd1MyGvwdFeZLME=;
	b=e1YtDFKKRlzosMW1x+53a+OfuBq0yjFj8dSO6yeI4G/ckws0Fj4LumIC8hCYVDAt/l
	3t7Y7yVnqwBkr6iDJILVLisKTxjp9pPbiylzMVY+AUGyeA8cdY1ua4XHtZICj2AIToPP
	FzsUFqL018TQn2XPJ7xyj17TebPjTcuoiFI9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=A8FGRhljEVSMTFSwyZ11AIIjcQj+IekgCFGoJCQSNPfgzat7RW5O6hdNTc/kPPYoJb
	HD78NwDxE5xuuhWKUTDY4ZtdaaaT722WY+fb0Qn0iAZB+OalCFOuvZjYGQtskx6ZJR8p
	z/OYYF9+OvE+zwlS4VXPYLw5iM916xgDyPbUw=
Received: by 10.223.87.16 with SMTP id u16mr7100508fal.138.1291729852815;
	Tue, 07 Dec 2010 05:50:52 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm1913181fam.16.2010.12.07.05.50.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 05:50:51 -0800 (PST)
Date: Tue, 7 Dec 2010 14:50:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101207135047.GA3186@jama>
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
	<1291133947.3599.16.camel@mattotaupa>
	<AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>
	<4CF56767.3050007@freyther.de>
	<AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
	<AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
	<4CFAE2EB.6080901@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4CFAE2EB.6080901@freyther.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package request for Phonon-VLC backend
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
X-List-Received-Date: Tue, 07 Dec 2010 13:52:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Dec 05, 2010 at 01:55:07AM +0100, Holger Freyther wrote:
> On 12/01/2010 02:57 PM, Sylvain Paré wrote:
> > Ok I made some progress!
> > Automoc build now ( attached my recipe for it)
> > but qt4-plugin-phonon-backend-vlc failed =>
> > http://tinderbox.openembedded.org/packages/1159577/
> > 
> 
> # OE lacks some native qt4 tools, so we use the ones form the host :/

I think this misunderstanding is because I've actually meant qt4 headers

there is
bitbake@jama ~/dev/recipes $ cat ./kde4/automoc-native_svn.bb
require kde4.inc
require kde4-native.inc
inherit native

...

and 
bitbake@jama ~/dev/recipes $ cat kde4/kde4-native.inc

# Ugly, use qt4 from the buildhost till someone adds a qt4-native recipe

EXTRA_OECMAKE = "-DQT_LIBRARY_DIR=/usr/lib \
                 -DQT_INSTALL_LIBS=/usr/lib \
                 -DQT_INCLUDE_DIR=/usr/include/qt4 \
                 -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
                 -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
                 -DQT_UIC3_EXECUTABLE=${OE_QMAKE_UIC3} \
                 -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
                 -DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                 -DQT_QTCORE_INCLUDE_DIR=/usr/include/qt4/QtCore \
                 "

that's why Sylvain was trying to extend qt4-tools-native to stage also
headers and then making kde4/kde4-native.inc less ugly by using staged
native headers.

Problem is that headers are "processed" before installing so simple cp
in do_install_append won't be enough.

> i hope this is helping

same here :)

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


