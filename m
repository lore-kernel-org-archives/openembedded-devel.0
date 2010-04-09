Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O0Gl1-0007t5-Am
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 18:08:35 +0200
Received: by wyf23 with SMTP id 23so467480wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=0DH/bqRJ9NwDwp8KXCfZrvBOycGkoZdzZZvndI+U3uU=;
	b=RVOn9Qn2FE063rKxBqjsu+/eiYSyEMGNSL2FkZKnPVyfORpiYHV5opndRFsbz/tB7A
	TWJzhPmOfTHVIKpPwTPKGJ6wyvjC2c0o2yrW1RUajkRH07gDKnd1y4uIBASDuJyRR1ga
	ZlUrRPlOA8jTXbCx/i3AtbOR/rcB8PNNwcFKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Ywrid4xgH0lRkYW0+PNDbXBuFvfHZSOsKh9sasT3/2m6644U3ZyhrFbN7u2xeoYd0U
	DGc44TQg2d+aynn9/UHSFTLiQqPQJMtKD67TAOFxW42IqdZXX1muGUUo+Unda0BHa8Ii
	u9pzVQY2gGRskdC0/4gxf4MrTsysQtQ8V/Mvs=
MIME-Version: 1.0
Received: by 10.216.169.77 with HTTP; Fri, 9 Apr 2010 09:05:11 -0700 (PDT)
Date: Fri, 9 Apr 2010 20:05:11 +0400
Received: by 10.216.87.134 with SMTP id y6mr152501wee.20.1270829111369; Fri, 
	09 Apr 2010 09:05:11 -0700 (PDT)
Message-ID: <m2w48239d391004090905gc4fbe5b1g38e4a6ebe1a08c41@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: opkg-cl ... install in ROOTFS_POSTPROCESS_COMMAND
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
X-List-Received-Date: Fri, 09 Apr 2010 16:08:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

I need to install additional package to image (which is inpossible
using IMAGE_INSTALL due to conflicts.
That's because I do it in ROOTFS_POSTPROCESS_COMMAND.
so I first remove conflicting package, then install one which is
needed. Removing works perfectly,
but installing doesn't, since opkg can't find a package. opkg-cl ..
update doesn't work because connects
to external repositories. How could I install a package from
ROOTFS_POSTPROCESS_COMMAND, then?
specifying a file directly seems too insane for me.

Thanks a lot,
S.


