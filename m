Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvGFe-0003Ui-Io
	for openembedded-devel@openembedded.org; Mon, 13 Sep 2010 23:07:47 +0200
Received: by gya6 with SMTP id 6so2396183gya.6
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Sep 2010 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=SU/+tnzOP2SJLYah4PLieuQXcKGq6Vo1DE+6Ehp3hO8=;
	b=miJj5+0I2ynypi1qUSFGrcYDfUOfgJhnukKt90y2g+gn0fGhS7KdUMMFq0HWGmfMD+
	pO1HeNJ47O6ix07h5obOOoiIi43AqWIUOJOUfUfH31MuVflurjfh6hqaj/qWmWFds5lj
	zGQn9vTIPXV8QCuGUa2S5p8T0Y1ZzrFMb4dLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gRnZqVnra+sJUbcaG1VpcGgtE0stKZllFN9oLq4hITZs50u7KMIgvyeJzXCxz8r5Qf
	4JbwNOjSvXCr+WAYbphCKtHRJXg+HWwBsjUtOQ8tEC8eoTB+i6+iPhyelxrE/VTDyx/K
	iQQeS/V2S9pSbTd2NEgULvyFGzd0iaS3bMBW4=
MIME-Version: 1.0
Received: by 10.151.49.12 with SMTP id b12mr152516ybk.139.1284412018382; Mon,
	13 Sep 2010 14:06:58 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 14:06:58 -0700 (PDT)
Date: Mon, 13 Sep 2010 23:06:58 +0200
Message-ID: <AANLkTi=TtH=_PpjNDT9sm+P7aS=AWeeseBguU7WCQXMY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: fftw question
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
X-List-Received-Date: Mon, 13 Sep 2010 21:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

For mythtv I need fftw with threads enabled.
There is a configure option for this: --enable-threads

Currently there are three variants of the recipe for different data types
fftw_3.2.2.bb  fftwf_3.2.2.bb  fftwl_3.2.2.bb

What would be the preferred way to add this?
Just add  --enable-threads to these recipes?
Or create three additional recipes that support threads?

Frans

PS: I could not identify the maintainer for this recipe. If there is
one, please voice your opinion (or make the patch)


