Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sinestado@gmail.com>) id 1MmUgV-0005i8-5r
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Sep 2009 17:38:46 +0200
Received: by ewy19 with SMTP id 19so1903618ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2009 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=0kEYkwVOm4jS0Rgw4UmAiu2Rc8FWs70U43GOoc44r4Q=;
	b=w5wnHJAAJyysUe3UdQ0PTlLxhbSNuAAlQgyA7b41KCwQSbouFQvDuRt+c90gm1C9uL
	vlj4hy/oXb01E+FoPavfSm+q19B8A6W1Y5yc1kyj5gaTQaTT9GL6b8J8HerXQ75vad20
	bX+87CeB9gx4N2gvm7h75dVjTXvx4WxxorQQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=VbOYxh4keaFXz4mX1MQP6fJqwSxoLxaVlVz96oboCUrHetG1ClylX71V2eYKplSIvS
	Y+fYHyVkPZeLZ6efLlUC0nDPZ9jD0X0vriMuPTwXCS/v7ijXBCSKqALFvjGdPMXybQvR
	tvFV71lYcql+O0wxuunYdNTK09bvgbTdgM3rM=
MIME-Version: 1.0
Received: by 10.216.51.143 with SMTP id b15mr386434wec.89.1252769893352; Sat, 
	12 Sep 2009 08:38:13 -0700 (PDT)
Date: Sat, 12 Sep 2009 12:38:13 -0300
Message-ID: <a63ecaf0909120838m51a6fbd1w333d902441bcab5f@mail.gmail.com>
From: Sushi Sensei <sinestado@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.219
X-SA-Exim-Mail-From: sinestado@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Slow bitbake, maybe can be compiled some part!
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
X-List-Received-Date: Sat, 12 Sep 2009 15:38:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

When I try to rebuild a distro bitbake rebuild the cache and then try to
resolve any missing task queue dependencies.

This moment is the big bottleneck in the process.

I've founded this project :
http://shed-skin.blogspot.com/2009/07/shed-skin-02.html

Is a C++ traducer for python to compile native a program.

I've consulted to the programmer about the posibility of "traduce" bitbake
with this program. This is his answer:

"I'm afraid it's way too big and dynamic (as described in the tutorial). it
might be possible to compile some time-critical part as an extension module,
but I wouldn't know which part.. :)"

Sombody can help to the shed-skin developer to accelerate some critical
modules in Bitbake?

(I'm not a python programmer!)


------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------

