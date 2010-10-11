Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1P59GG-0003mU-Aj
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 05:41:17 +0200
Received: by wwd20 with SMTP id 20so1827836wwd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 20:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=DuY3JkjY3ILOS7y4paiy9P8AwF/5Erbz/2OohvmgKYs=;
	b=jLz0j8tzQCDRPLRTv9+7xz5Fg+NbPkzBAh/u+CFK5AzTYZBhfE7qi7l7IsfmqEYWB9
	mBdh2qAeDnMQk7IiMuCbBwPM0LpccAK1lLEV6UqUXXVlprf4rxFc07LcZYFmQlQz/Mlf
	vAalfcWMIXjHItWWPRZ2nn/GHiOJ4PhZ2YLqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Fxf8+RxaHMdaQKwBFx3scpqJdquHTCcLixO4xI9VlwB1MYr+Ozl7BxQ0GxO7hPxMEt
	5y/3WyXAszUNgu7b1bsuMBb7FiD2m9mO3upp/AohNHuvj0C2VyUzoV64mpTbn8X3pI6H
	5KfRGLgHysOA9BRisiLYBPIfc6PpxXzD/VQrc=
MIME-Version: 1.0
Received: by 10.216.168.202 with SMTP id k52mr4882161wel.105.1286768441961;
	Sun, 10 Oct 2010 20:40:41 -0700 (PDT)
Received: by 10.216.72.199 with HTTP; Sun, 10 Oct 2010 20:40:41 -0700 (PDT)
Date: Sun, 10 Oct 2010 20:40:41 -0700
Message-ID: <AANLkTikN5UjQfK=AvKV8YeqxFb1U7bq7ZZYuvxE5MHbq@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: openjade-native build fails
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
X-List-Received-Date: Mon, 11 Oct 2010 03:41:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

After commit fdf02c61607acb5046afaa11c5c682ab99f4d508 openjade-native
is failing on a clean build:

http://build.sakoman.com/public/logs/task/114486.txt

Any ideas on how to fix this? I've reverted the commit on my local
tree so I can keep working, but I'm sure others will run into this
too.

Steve


