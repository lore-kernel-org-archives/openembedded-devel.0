Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NxN92-0005Vp-PU
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:21:25 +0200
Received: by pvc30 with SMTP id 30so452505pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=debyEbQ8uH6YuH07IlyoeoisTPndclFTToCYo+etTzY=;
	b=J9x8ypg4uh2zhPNA6IPPAIIKUFNFOQm7KBj0DLD1FG3M5pdmm+ljyB0sosatdb21N7
	9zIIgc/W989ca9V6MPT2T70URtVYtOCyqe1U+KuOyXXYq7stJrYdgpvTD4IgIavyeglh
	Htv7qusrd8QXj0toD/brBMMe2qoI7qmPIs4cY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Nv8oF2PBtO2g3A9keVlJyKYpHSdqEj94xdoC8gyWiP9kDDpnBUbhECkeI3yYrc7p1W
	QgcpX3i6jcitT+5ngwFk0vAkXtzfGBID/VWPKBgq3Ras74BmqbLCj3oVwXNf6+8QaSb6
	/AHvqGDDKO9tU/j98QPu7t4tQEbtO7luaF+7s=
MIME-Version: 1.0
Received: by 10.141.34.13 with HTTP; Thu, 1 Apr 2010 09:18:06 -0700 (PDT)
In-Reply-To: <1270138171.4993.141.camel@rex>
References: <1270135981.4993.128.camel@rex>
	<h2n19c1b8a91004010846u8f936157z252190a0f6a6b6e4@mail.gmail.com>
	<1270138171.4993.141.camel@rex>
Date: Thu, 1 Apr 2010 18:18:06 +0200
Received: by 10.140.251.3 with SMTP id y3mr662410rvh.227.1270138686733; Thu, 
	01 Apr 2010 09:18:06 -0700 (PDT)
Message-ID: <z2xd1b08f941004010918v6b58f2dducced0204ce8a9739@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 16:21:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

>I just looked and the eglib
-- sorry for jumping in --

RP, while you're there, pls look at klibc.

do_stage() {
        oe_runmake  install
        cp '${STAGING_DIR_TARGET}/bin/klcc'
'${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
}

How to properly install klcc ?

Regards

Andrea


