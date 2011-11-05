Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RMoaI-0004Fw-SF
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Nov 2011 23:19:30 +0100
Received: by wwf4 with SMTP id 4so4183462wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Nov 2011 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=1N52bn2rvM/UOPq5r51OaDwyujJiETEmrox4NmGjCCQ=;
	b=gR5NNUv83lOo6aC/KRWmnmcoO9P5Hj8UsrIc45exvsVBV3Y6WsFAEiglFOuTTWCHPI
	gsajiCThxBAn5Efz6cR0KT8ev4uAu+tLhho3xfQNPdt8ZbN2aK1KtJXnaqhgeuVHrhL2
	VxPZr34I6eyDmqpvEu2eG8V2Imu1sTDFtpSOg=
MIME-Version: 1.0
Received: by 10.216.136.79 with SMTP id v57mr2298086wei.10.1320531197550; Sat,
	05 Nov 2011 15:13:17 -0700 (PDT)
Sender: pabigot@gmail.com
Received: by 10.216.22.81 with HTTP; Sat, 5 Nov 2011 15:13:17 -0700 (PDT)
Date: Sat, 5 Nov 2011 17:13:17 -0500
X-Google-Sender-Auth: cyctCxyjjQtf0sNbQp4qQRbCH48
Message-ID: <CAPOJ94McqGvz50v6oDkSjY1s5Lx+=x_L+k=wtPy9vor4pFcOmg@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: cloud9 patch incompatible with fedora patch utility
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
X-List-Received-Date: Sat, 05 Nov 2011 22:19:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

The patch in
http://comments.gmane.org/gmane.comp.handhelds.openembedded.scm/49645includes
/../ as a path component; as noted in
http://lists.linuxtogo.org/pipermail/openembedded-users/2011-March/001249.htmland
not resolved otherwise that I could find, this construct will not work
on Fedora 14 or 15 because a security patch prevents application of patches
that include up-directory components in the paths.

My bitbake skills are not presently up to cleanly creating and applying a
patch to a file outside the S directory; how should this be fixed?  (I'm
hoping for something other than "don't use Fedora".)

Peter

