Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TRRxB-0005RG-M8
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 20:14:49 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so828008bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=g4jtSrdhZC6AV7do5fG3g5wWaAMWQ1osAcCFZ2/aAJs=;
	b=lJ9gMHJ96B7o+teOhTGR0EpBW0tREc9Ztq2uZDvo8k7qWh8EZErbAhOfBnrQrCdSL/
	YPf7fymJHsafEBXJ4Y6Dte1vKR+EWKHDFgtP0idg2MpRGV6L7yAjWMf1RYZEBJa0JRuD
	HZst2zhTAUn+jL16aC/BSRlgKQwp49I5IrOgjgtZB70z2JDeVkKAOwJwdSZcRnzOQUP1
	AyY4/GfV79hF/MBDZ6UC6jc13bhxqpH8iw2FeziWFz1HQgBHE9WjOfUsQ07ojsW0ivvJ
	vZ0mjRz8SvFxQ0W2vaH9+BYt//mQnyOzCF48bWeVKDwl0jzmt6rlwY5Bti1SAzniK2Pk
	KhCg==
Received: by 10.112.29.9 with SMTP id f9mr8136287lbh.22.1351188080410; Thu, 25
	Oct 2012 11:01:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Thu, 25 Oct 2012 11:01:00 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 25 Oct 2012 11:01:00 -0700
X-Google-Sender-Auth: SU7Wpl505FBFpvpVR8mZdX-8mGM
Message-ID: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: [meta-browser] Question regarding status of chromium recipes
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
X-List-Received-Date: Thu, 25 Oct 2012 18:14:49 -0000
Content-Type: text/plain; charset=UTF-8

Greetings,

I'm wondering if the chromium recipes in this layer have ever been
build tested. As far as I can tell, both 19 and 20 are missing
dependencies on udev (libudev), gtk+, and gconf, and 20 also wants the
openssl headers. 19 also fails due to an attempt to build/link a
native tool requiring libxi, so it seems it can't be built without x11
headers on the build machine (along with the odd ld.gold requirement).
 Given these issues, I figured I'd throw out a contact email and try
to determine if perhaps the OSSystems folks have local changes that
never made it into the public layer, or if the recipes just didn't get
a great deal of testing.

Thanks, I'd appreciate any input on their status :)
-- 
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics


