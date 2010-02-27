Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NlOaW-0006Da-Fl
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 16:28:21 +0100
Received: by ywh1 with SMTP id 1so499698ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=V8KXbkYsHt2rV5ndKdGWKsb1+C4JzjPWCn6uNaHX/EA=;
	b=cRe14ZXtvb5P4zXAR6cgU99UC7kcAvogU0LzDTt17IrJdkbLVmg0Sxmrz/KDG6GUAu
	R72RPOKAZ2HvCjEvyM+OZ23vROoDfw6I17kR7rrlsU3ZkmOuhnQiqu6DgG/Umw1rFgxw
	kWDekDHpRjNxe8V+P6Oe+jVFuEgJBV/8qBojg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=aShDuZ7jAM2qz4nSRzUIYwBTvfmaOF9tgwDlyiFG2kUsbzYvazjM4wraFuIAiXbKxN
	HtUUPfgAC1TbIAOMcNMcbxD103KUpxbI/wQJ0vg1o85WMuQh86QPQf11TuyXMfQRt/MV
	7JXQen3tux01AkA14ba/7I2huY9qN8HJg+TtY=
MIME-Version: 1.0
Received: by 10.100.245.38 with SMTP id s38mr346849anh.197.1267284327549; Sat, 
	27 Feb 2010 07:25:27 -0800 (PST)
Date: Sat, 27 Feb 2010 16:25:27 +0100
Message-ID: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 15:28:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I  think some restructuring is needed wrt distro's and images
I did some counting and we currently have 32 distro's (ls
conf/distro/*.conf | wc
There are a few semi-dups (micro, minimal and oplinux have regular and
uclibc versions, angstrom has angstrom-2008.1-legacy.conf  and
angstrom-2008.1.conf, slugos has slugos, slugos-native and ucslugc)

also we have 94 images (ls recipes/images/*.bb | wc)
For some of these it is quite obvious for which distro's they are.
Mostly because they are prefixed with the distro name (e.g.nylon,
slugos, openmoko)
but for several others it is less clear. grep -i -l angstromg
recipes/images/*.bb | wc gives 30 but not all of them are angstrom
specific.
E.g. nas-server-image.bb mentions angstrom in the comment but is
distro agnostic.

Also sometimes the names are confusing. We have a minimal distro but
minimal-image.bb is not an image for the minimal distro, but is an
angstrom image.

My proposal is to create distro specific subdirs and move all images
from a distro to that specific subdir
That makes it more insightful what belongs to what.

(alternatively if creating an additional level within images is
considered to be "not a good thing" we could either create directories
like images_${distro} or maybe even just ${distro} where a distro can
keep its stuff).
(or yet alteratively we could prefix the distro specific images with
the name of the distro)

Your opinion is appreciated (and please do express your preference (if
any) for an option (ofc keep-as-is is also possible) or coin another
option)

Frans.


