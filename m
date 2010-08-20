Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OmTpK-00018V-Gr
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 17:48:29 +0200
Received: by eyb7 with SMTP id 7so2104730eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=iaYxZvIdP26JDMIqd3eEAG0GF6T3ymUohfdl4CmQAhI=;
	b=Hk/2FK0gvRHy1nRgMXGLIu4ApE1Su8G8m251+fXKLa+93lUnjdW8O1BAx9vT/dcwUV
	fC9F8MDqM+Q6De3F3AyYabrU2fpcpPAkHSGXieceGj80bwOQ+i3TmZnSKfidDQc3/u6s
	Cf7+FyutvnwQZvXpE1E5R2EzMRK8unOAjTd9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=AS7SpVjeMi0IRI4hK9/K8TrKKhClEMvZ4+9V0IVOEgEiZ6Dmuk91wW432x6UdRQebd
	sNWf2JiqfR9/zQzql1L5FbFqrldCRXpHDYj+JeifonjXhBdB5Zf30s6hQ3mR/Bh6oabd
	2gcewcSfkhxXxiXVT/YGTQgwsNvoxorJRB2CQ=
Received: by 10.216.193.195 with SMTP id k45mr1380038wen.32.1282319273226;
	Fri, 20 Aug 2010 08:47:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Fri, 20 Aug 2010 08:47:33 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 Aug 2010 08:47:33 -0700
X-Google-Sender-Auth: znk9Dp2Rswc5VcQFsxwyqIYC-aQ
Message-ID: <AANLkTi=XbuCHHMnBq+iQJ-xQPxXAsfyFx4i-ewzx_Z_9@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [RFC] Glibc vs tzdata
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
X-List-Received-Date: Fri, 20 Aug 2010 15:48:30 -0000
Content-Type: text/plain; charset=UTF-8

As far as I can tell, both the main glibc package and the main tzdata
package provide the same core set of ${datadir}/zoneinfo files.  I've seen
opkg complain about this when creating images that want both recently.  I've
also noticed that eglibc's recipe explicitly rm -rf's
${D}${datadir}/zoneinfo so that it doesn't provide it.  I suspect that
tzdata's information is going to be newer than any given glibc's zone info.
Is there any reason to not just remove them from glibc, or remove them and
rrec on tzdata?  Thoughts?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

