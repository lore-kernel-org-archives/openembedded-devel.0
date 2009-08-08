Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MZgKY-0005OD-FL
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 09:27:06 +0200
Received: by fxm12 with SMTP id 12so1682199fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2009 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=JxxbN459ETwnKdxO/BuJPKDLoUoTuBKJWf7j+KEPiHA=;
	b=w5l8nVaiVF26Hvg7Q9ZOjSNhaRf/WiwYDgcpnZ2YRKCgnewggaSS0+0hX/U9vmi0QD
	PqjqY6J3JwwlR8K7GCy9GTVEVsvSkxJQt5DtHnlJq9G2xBSjL5cAhutWB4lHZkN2xU/t
	sAF7rsjtWT+LAZ1UmBhXtjA5NW2pfixaFHrZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AQgarpwQTGU/skdTnMsC7RG1e7irIUR+4qU57AzgVJXUhmMfDRSefkMCKwZcUGRYZ7
	0exMm0dEPmQ/4pbIFpHu4jnqwz/itB0G0dqHnSTOYdpA+VeYX64t2Z5UQqxPIDbjvCxy
	D8ALL5NpYA465I/1O0WNOXPCy87Y6oPUrqUwc=
MIME-Version: 1.0
Received: by 10.204.114.9 with SMTP id c9mr3890000bkq.161.1249715467654; Sat, 
	08 Aug 2009 00:11:07 -0700 (PDT)
Date: Sat, 8 Aug 2009 08:11:07 +0100
Message-ID: <91283b620908080011k650f76f2w297e40b333f9b4e3@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: lighttpd - compile but the install does not seem to be correct
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
X-List-Received-Date: Sat, 08 Aug 2009 07:27:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I have added the package for lighttpd to my omap3-comsole-image bitbake file
and re-built my image. This all works fine, but when I boot my Gumstix Overo
I get an error stating that it cannot open the "/usr/lib/mod_"  files. I do
not have the full file names, but on checking what is built in my
tmp/arm7a..../...../lighttpd/image/usr/lib directory there are all of the
mod_*.so files and some others.

When I look at the /usr/lib folder on the device none of these files have
been installed.

Does anyone have any experience on getting this webserver to work.

Sorry for the patchy information I am working away from home at present and
do not have access to my machine on which I am building.

Thanks,
Stuart

