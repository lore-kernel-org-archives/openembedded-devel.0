Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chrisfriedt@gmail.com>) id 1KnZha-0000jw-3M
	for Openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 16:07:46 +0200
Received: by ug-out-1314.google.com with SMTP id y2so552916uge.4
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=qVJKMM84ld9n9J9wCtsElr89EvLWZjbnP67vtgS2aUA=;
	b=FuJMC/yqoSZcLb6PqkMs2zTa+DbS62ozyl8H/nZPwVF0MB8Dva8Y/H1NHPt3XidMhE
	q9NAxxp4O9qKXaeQv+wNR2ucolbwcqTIlO4Qjf9m3dM8qEDG0RRtS13fpYC3YvpxxKuN
	3q3HBLVpSQiiw/ju18XQ0cNRTNOI6pLnZLXDE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=NR1UqJgq5ADWVjgiWJMNKpuY3Kv3QW0wV4w4l8r46s9Da3CWR6CcmFY6RSAduxDEu4
	Hv9TLsldGWCq7Ke9oulqTYlyobu8Fzk/5VjCA6pfaKPogyhj1+l9bGNDtbHm1P2kdXVh
	g/AUJ/4G8NGsFPMSwLCUf4386sw0P51BQlZEo=
Received: by 10.86.68.2 with SMTP id q2mr7560276fga.43.1223474587884;
	Wed, 08 Oct 2008 07:03:07 -0700 (PDT)
Received: by 10.86.79.12 with HTTP; Wed, 8 Oct 2008 07:03:07 -0700 (PDT)
Message-ID: <3ea34a000810080703x5fa663a4h46e806b70fbf0af@mail.gmail.com>
Date: Wed, 8 Oct 2008 10:03:07 -0400
From: "Christopher Friedt" <chrisfriedt@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Re: Error building classpath-initial
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
X-List-Received-Date: Wed, 08 Oct 2008 14:07:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi list,

I just joined the list to follow up on a common error that I
encountered a while ago, where building classpath-initial-0.93 failed,
saying

"libtool: link: unsupported hardcode properties".

I needed to get this compiled pretty desperately, so just grepping resulted in

aclocal.m4: hardcode_direct="$acl_cv_hardcode_direct"

I modified classpath-initial-0.93.bb, very simply appending the following:

do_configure()
{
    export acl_cv_hardcode_direct="no"
    export hardcode_direct="no"

    oe_runconf
}

And that built classpath-initial-0.93 without any errors. However, I
later on ran into the same error with classpath-native-0.97.2 and the
same fix did not work.

Please post a solution, if one ever surfaces.

Cheers,

Chris

> Recently I stepped upon this problem too and began discussing this on
> the libtool mailing list. We do not have a concrete solution yet but
> there is a workaround for now.

> Edit the i686-linux-libtool file in your
> /home/kgilmer/dev/sandbox/oe-dev/tmp/work/i686-linux/classpath-initial-0.93/classpath-0.93

> and set the variable hardcode_direct to no. It should be empty before
> and that is causing the problem.


