Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAisT-00083i-W8
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 14:11:30 +0200
Received: by fxm11 with SMTP id 11so1373746fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=AZzUEYv8HAFLQKTkqNRs5iMNhIA9eS9DwSksfTbOfKE=;
	b=stCX5WQ4smyFJRfhuEGheDTh0N+4jGPyPQM2oGVxi6hl7mOVWF1QzNeEZudaJS4IlK
	Ov09Z4uLJVI/aa1IU3fvYzQeGcGIskkwq5kV+5VHoJHq12w26kLo18hZ9OJPwiFgu+Up
	271JjI11goyLyuP/AeKP1rrNYZo9Jlk0tjSyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=k3FULFTNNMaVJ8ynuFd/ZxpBHcXrW4TwJAY3VStz6i7pfqn27EPLKlwb9WRC7PyGZO
	eH7PxfASL8sCj1ErzCHSNKAwWEq/ia6X+qasE1RkMjzcmWIgEqZ5q3XKUoeyeCNTFw39
	dlsuXnl0fiFrpT1w1nL5L1Vh8bjEv8gH4GO+c=
MIME-Version: 1.0
Received: by 10.239.173.205 with SMTP id g13mr121580hbf.145.1273320459559; 
	Sat, 08 May 2010 05:07:39 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Sat, 8 May 2010 05:07:39 -0700 (PDT)
Date: Sat, 8 May 2010 14:07:39 +0200
Message-ID: <t2ld1b08f941005080507ue8b8d7e1jfe61e941de10db29@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [bitbake] tasks repeated
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
X-List-Received-Date: Sat, 08 May 2010 12:11:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm using bitbake 1.10.0 I've noticed some tasks appears twice in /tmp
of each package:

run.base_do_fetch
run.do_fetch

run.read_subpackage_metadata
run.staging_helper


I don't think this is normal...

Regards

Andrea


