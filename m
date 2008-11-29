Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L6Vs3-0000Np-6q
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2008 20:52:51 +0100
Received: by qw-out-1920.google.com with SMTP id 5so392548qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2008 11:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=R8Xrg3Jma6VYpunRosUDZgUNTLmGcmQh027HwxgsbF0=;
	b=HxEwe0ddlY2rJ2SQgT95HVYjLi6XvuyL72Be0eSk6of92lwm19JUehNYa/ck68HyO/
	fZgZNeyttlAnHrvAmOqopBqsEXwjmB4/sybO1RY07o6V8HJh612SOMWghvbR9U9AhsdM
	neqshOE6H+/55FA+B3J2/9bIF9PGgWedNToDI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=LbDws8rx9swT5l1jeaentRS7fThE34Xx95bzsc1DqOgUqy+qz71jFH/2gsd2d3N74s
	mmFFW0sFv6tO7lflSuz10BVtsSZVRdvS98Ygz180MUZ1kWVCnCmJMQ2LTjjOhvISqN8O
	Bq8jDIM6pLp2O4n2nDZ0l7ad/9mNJJea3DA6A=
Received: by 10.214.114.10 with SMTP id m10mr8659048qac.306.1227988177273;
	Sat, 29 Nov 2008 11:49:37 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Sat, 29 Nov 2008 11:49:37 -0800 (PST)
Message-ID: <c384c5ea0811291149s5c02d3c8haad5995ce1ad1522@mail.gmail.com>
Date: Sat, 29 Nov 2008 20:49:37 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Building u-boot images in both kernel.bbclass:do_deploy() and linux.inc:do_compile_append()
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
X-List-Received-Date: Sat, 29 Nov 2008 19:52:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Building u-boot images using mkimage is present in both
kernel.bbclass:do_deploy() as well as in
linux.inc:do_compile_append().

Which one has preference in the long run, and why?

Regards,
-- 
Leon


