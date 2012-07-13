Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SpfAs-0001CF-5g
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 14:40:46 +0200
Received: by pbbrq2 with SMTP id rq2so5059058pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=A7JYGYOOjC0wLe2f0jw9AbyET2HEHH0lvfg2ANnjDxY=;
	b=rZBkQVJ/BIxNFwqGj3wzvp+kzb+B+UCH05wtMkThXCleqtFj/h7Is7BeP7XU/LIUoC
	HSgLMkt1p77oG7dIsaLTBP6M3Tlty6B3gnWrVzA/0ABjppPpe1M25scM210BRMW4eWUn
	rN0e2vKdayfd1v6rzm+P47UfRLq2sOD7SPHXXscMRBnzXFCsgqwtU9u895/IonUCdkrP
	SJbH5ap1zbxjj8whx3QRtLf0fn4LdDrZoKmGOyBjcOwShVrz83kejOdLeBvY1mp9JXWv
	8A3i3Pko5ZnSyRgh/3ZCXb8yVCD0xGpQqGXOK1PcoU0vU67tnfxGD6NM3V/YQi/GZqJ+
	5LCg==
Received: by 10.68.227.198 with SMTP id sc6mr2996380pbc.138.1342182570883;
	Fri, 13 Jul 2012 05:29:30 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id nv6sm5937870pbc.42.2012.07.13.05.29.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 05:29:29 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 13 Jul 2012 16:29:24 +0400
Message-Id: <6CA856D9-0187-4920-80E7-8F34FDBFAD9F@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: Getting yocto to build a linux kernel uImage and zImage simultaneously
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
X-List-Received-Date: Fri, 13 Jul 2012 12:40:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      Is simultaneous generation of both uImage and zImage supported for =
linux kernels? I tried it a couple of weeks back, but then noticed that =
it would build either a uImage or a zImage, alone, but failed when both =
were specified.

Best regards,

Elvis Dowson=


