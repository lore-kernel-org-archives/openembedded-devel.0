Received: from mail-yw0-f193.google.com ([209.85.211.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <df6.626@gmail.com>) id 1O9JvD-0004IS-Lm
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 17:20:33 +0200
Received: by ywh31 with SMTP id 31so1505141ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=decTfUF4wgd399vf9mZLHSRWbAlHu1kmUNs7n8rSLaU=;
	b=nnNGXYtEY8e3p7viLQ9A6PIUeIaitC4NFMlZusLXawwlFnuRUOmYgPphtcdyqeogS9
	pa/qTZiCdZ1AWlQ2FCl+vrmGwWNw+0kQikZCbwIFqxBW7f9KYAMfeRxq+e9reWCRC0en
	5QY5BffQu4bXUZasBzuizPn4i0AUzdRlwKKYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xzB4XZFIY3vcKUBj/3JWW9Qu15NVVvOaWb0YyqdSYWKZJgaDnwrsDOeLLza+5FZnEN
	5voxCYp9Sq/Ahy7I+QkpCak+U1Q5mXgopA2p9QBlkTuq2vBTjok2cZo1/1EbXIAEz4AW
	60Dj/64xWiJSfITkWNE179Hz8XVwLoRzQM6fY=
MIME-Version: 1.0
Received: by 10.150.247.23 with SMTP id u23mr12675287ybh.150.1272986202326; 
	Tue, 04 May 2010 08:16:42 -0700 (PDT)
Received: by 10.150.139.5 with HTTP; Tue, 4 May 2010 08:16:42 -0700 (PDT)
Date: Tue, 4 May 2010 21:16:42 +0600
Message-ID: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
From: Dmitry Vinokurov <df6.626@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.193
X-SA-Exim-Mail-From: df6.626@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Build uncompressed kernel
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
X-List-Received-Date: Tue, 04 May 2010 15:20:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Is there any way to cancel compression stage of kernel build and get
uncompressed uImage using OE? I've measured uncompressing time (using
stopwatch actually, so it could be +-0.1-0.2 seconds or even more) -- it's
about 0.8-0.9 seconds, and boot time is much more critical for my system
than image size, so even 0.5 seconds is really important. Bootloader is
Uboot, board is ARM9 Phytec lpc3250.

Also I've read http://elinux.org/About_Compression and it states about
decompress time about 50ms, so looks like either I should measure boot time
using more precise tools (like from inside of Uboot) or my board is not so
fast as those which used by authors. Perhaps anybody could share their
experience in this issue, is it worth at all to try to build uncompressed
kernel?

Thanks in advance.

--
Best Regards,
Dmitry Vinokurov
<df6.626@gmail.com>

