Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SP9PA-0007Wq-KO
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 11:29:56 +0200
Received: by wera1 with SMTP id a1so2571433wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=9TkEII/7BKB9ULnYFTGjuktYXsISpLw7gzQ4yiJHntI=;
	b=fXYXyj+uYH7ULBDaWJdivYVhT2IRbpZ5N7R/fL0XJ87mQ+hVfuTm25JeC11bYstpiF
	hZBNEIVSBpwY9OunUzZwdnl7HoeKl1xyK4WiJnHnzApUCEXCcyHzdNgR7p48KrkvE2e1
	OfQDjD/BafI5k8m6g7U7aSFUj6/MgjayIlFQUx5QM/YE+EHgkHX9At13ehrBEOp0ph61
	DwdfZrW/Mjo1L3TwWwT3CFxCLVQJ/Ws33AWLQBLhT8X8QSAYBDlxc0SaM5NshHRerChU
	Y95ABcLa2ImF78oznErm10Geqq/FRwlNXz5kS1EKfWeBwfC1Zpjr0r8NVAy9ZGAREd9B
	u6fQ==
Received: by 10.216.132.229 with SMTP id o79mr6492329wei.64.1335864013279;
	Tue, 01 May 2012 02:20:13 -0700 (PDT)
Received: from [192.168.1.33] (240.Red-88-6-19.staticIP.rima-tde.net.
	[88.6.19.240])
	by mx.google.com with ESMTPS id n20sm55496820wiw.5.2012.05.01.02.20.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 02:20:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <DB8F1B3EEF94C3439BFFE674EB05E3CC014CB5@HKNPRD0204MB116.apcprd02.prod.outlook.com>
Date: Tue, 1 May 2012 11:20:09 +0200
Message-Id: <BF50FEBF-0916-4B94-B200-FB76DE687D7E@gmail.com>
References: <DB8F1B3EEF94C3439BFFE674EB05E3CC014CB5@HKNPRD0204MB116.apcprd02.prod.outlook.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1257)
Subject: Re: cannot download elftosb-10.12.01.tar.gz
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
X-List-Received-Date: Tue, 01 May 2012 09:29:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Craig,

On May 1, 2012, at 9:57 AM, Craig McQueen wrote:

> NOTE: Running task 1299 of 4060 (ID: 844, =
virtual:native:/home/craigm/openembedded/stuff/openembedded/recipes/freesc=
ale/elftosb_10.12.01.bb, do_fetch)
> NOTE: package elftosb-native-10.12.01-r0: task do_fetch: Started
> --2012-05-01 15:12:26--  =
http://foss.doredevelopment.dk/mirrors/imx/elftosb-10.12.01.tar.gz
> Resolving foss.doredevelopment.dk... 62.95.78.42
> Connecting to foss.doredevelopment.dk|62.95.78.42|:80... failed: =
Connection timed out.
> Retrying.

The problem you are facing is because those files are not available.

There are a couple of options, you can=20

a. modify the elftosb_10.12.01.bb recipe and make sure that it points to =
a valid location.

or=20

b. if you already have a downloaded source package =
elftosb-10.12.01.tar.gz, from somewhere in your iMX SDK, modify the =
recipe so that it looks for a file, rather than a URL.

Best regards,

Elvis Dowson=


