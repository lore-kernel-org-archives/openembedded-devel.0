Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6Yop-0003tM-W6
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 03:11:27 +0200
Received: by wwe15 with SMTP id 15so290323wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 18:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Rjqpf5RQEaekh2+QwjXCJ0f11R9GoPdiL38keVRuMko=;
	b=BYvCgd2Zz4Qb38vrpD5UHwbDVRyBBnUQfQQKBAd8B6/8V8DhrRf/AhL2KjqGW8+g4B
	kIME+ky6hODbjxcN0SiKHN8XPI0HaQ+AVwscnVaFaQaW0OS+4XnAYlMhx9x6+ZgbwGDW
	vvzS63QBo/htMnHGkFFjftVCw4J7EYg+xQjbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=BZAWwIOdf6SmNXttHJUWGuxrShJcZAVkW+keIAa8qRe3TuecYZVrOMW0sMXLZ6Dm0Z
	7n70G8ytKx3Q7UxhrdSGfVXcrtmpwoZurdvM4a8UBtHXYNLyLgMcOfRdXO31RLu1+i0X
	6f3Guq1P9wyg2yTXTArUV8BQnwrdjihXVR4DI=
Received: by 10.216.232.32 with SMTP id m32mr38405weq.4.1287105018300; Thu, 14
	Oct 2010 18:10:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 18:09:57 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 18:09:57 -0700
X-Google-Sender-Auth: SAeiu8EyLfR8RHCyceJZjP6UYxY
Message-ID: <AANLkTinEFsqLJX70P6OTSOo6tPR2Hr+=3nwpttHPt3gD@mail.gmail.com>
To: bitbake-dev <bitbake-dev@lists.berlios.de>, 
	Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [ANNOUNCE] BitBake 1.10.1
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
X-List-Received-Date: Fri, 15 Oct 2010 01:11:44 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

There is a new 1.10 bugfix release available: 1.10.1.
As usual, there is a tag in the git repository, as well as pristine-tar
metadata, and of course the release tarball is available on berliOS:

http://download.berlios.de/bitbake/bitbake-1.10.1.tar.gz

Changes in Bitbake 1.10.1:
       - Fix IndexError encountered when a 'depends' flag references a
         nonexistant task. (from master)
       - Fix clean of the environment. (from master)
       - Fix bug where a failed fetch could result in a "local file does not
         exist" error, rather than the real error. (from master)

Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

